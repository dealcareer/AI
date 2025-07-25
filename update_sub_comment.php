<?php
include "db.php";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $topic_id = $_POST['topic_id'] ?? null;
    $exam_type = $_POST['exam_type'] ?? '';
    $sub_comment = trim($_POST['sub_comment'] ?? '');

    if (!$topic_id || !$exam_type || $sub_comment === '') {
        http_response_code(400);
        echo "Invalid input.";
        exit;
    }

    // Map exam_type to column name
    $column_map = [
        'LT' => 'lt_comment',
        'POLICE' => 'police_comment',
        'COMMON' => 'common_comment'
    ];

    if (!array_key_exists($exam_type, $column_map)) {
        http_response_code(400);
        echo "Invalid exam type.";
        exit;
    }

    $column = $column_map[$exam_type];

    // Check if row exists
    $check_sql = "SELECT id FROM topic_status WHERE topic_id = ?";
    $stmt = $conn->prepare($check_sql);
    $stmt->bind_param("i", $topic_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $exists = $result->fetch_assoc();
    $stmt->close();

    if ($exists) {
        // Update existing comment
        $update_sql = "UPDATE topic_status SET $column = ? WHERE topic_id = ?";
        $stmt = $conn->prepare($update_sql);
        $stmt->bind_param("si", $sub_comment, $topic_id);
    } else {
        // Insert new row
        $update_sql = "INSERT INTO topic_status (topic_id, $column) VALUES (?, ?)";
        $stmt = $conn->prepare($update_sql);
        $stmt->bind_param("is", $topic_id, $sub_comment);
    }

    if ($stmt->execute()) {
        echo "Success";
    } else {
        http_response_code(500);
        echo "Database error: " . $stmt->error;
    }

    $stmt->close();
    $conn->close();
} else {
    http_response_code(405);
    echo "Only POST requests are allowed.";
}
