<?php
include "db.php";

$topic_id = $_POST['topic_id'] ?? null;
$is_ready = isset($_POST['is_ready']) ? intval($_POST['is_ready']) : null;
$comment = $_POST['comment'] ?? null;

if (!$topic_id) {
    http_response_code(400);
    echo "Invalid topic_id";
    exit;
}

// Escape comment if set
$comment_val = $comment !== null ? $conn->real_escape_string($comment) : null;

// Check if entry already exists
$check_stmt = $conn->prepare("SELECT id FROM topic_status WHERE topic_id = ?");
$check_stmt->bind_param("i", $topic_id);
$check_stmt->execute();
$check_result = $check_stmt->get_result();

if ($check_result->num_rows > 0) {
    // Prepare dynamic update
    $update_parts = [];
    $params = [];
    $types = "";

    if ($is_ready !== null) {
        $update_parts[] = "is_ready = ?";
        $params[] = $is_ready;
        $types .= "i";
    }

    if ($comment !== null) {
        $update_parts[] = "comment = ?";
        $params[] = $comment_val;
        $types .= "s";
    }

    if (!empty($update_parts)) {
        $sql = "UPDATE topic_status SET " . implode(", ", $update_parts) . " WHERE topic_id = ?";
        $params[] = $topic_id;
        $types .= "i";

        $update_stmt = $conn->prepare($sql);
        $update_stmt->bind_param($types, ...$params);
        $update_stmt->execute();
        $update_stmt->close();
    }

} else {
    // Insert new
    $sql = "INSERT INTO topic_status (topic_id, is_ready, comment) VALUES (?, ?, ?)";
    $insert_stmt = $conn->prepare($sql);
    $insert_stmt->bind_param("iis", $topic_id, $is_ready, $comment_val);
    $insert_stmt->execute();
    $insert_stmt->close();
}

$check_stmt->close();
$conn->close();

echo "Saved";
