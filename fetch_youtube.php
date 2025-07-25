<?php
include "db.php";

// ✅ Slug generator with videoId suffix for uniqueness
function generateSlug($string, $videoId = '') {
    $slug = preg_replace('/[^A-Za-z0-9-]+/', '-', strtolower(trim($string)));
    $slug = preg_replace('/-+/', '-', $slug);
    $slug = trim($slug, '-');

    if (!empty($videoId)) {
        $slug .= '-' . substr($videoId, -5); // Last 5 characters of videoId
    }

    return $slug;
}

// 🔑 YouTube API Setup

// ✅ Fetch API Key from `youtube_api` table
$API_KEY = '';
$result = $conn->query("SELECT api FROM youtube_api ORDER BY RAND() LIMIT 1");

if ($result && $row = $result->fetch_assoc()) {
    $API_KEY = $row['api'];
} else {
    //die("❌ YouTube API Key not found in database!");
}

// अब $API_KEY को use करें

$API_KEY;
$base_keywords = [
    // UP LT Grade Computer Science
    "UP LT Grade Computer Science",
    "UP LT Computer Teacher Preparation",
    "LT Grade Computer Science Previous Year Paper",
    "LT Grade Computer Science Paper 2022",
    "LT Grade Computer Science Practice Paper",
    "LT Grade Computer MCQ Hindi",
    "UP LT Grade Computer Notes",
    "UP LT Grade Computer Book",
    "LT Grade Teacher Computer Science 2025",
    "UP LT Grade Computer Theory",

    // UP Police Programmer
    "UP Police Computer Programmer 2024",
    "UP Police Computer Programmer Practice Paper",
    "UP Police Computer Programmer Exam Preparation",
    "UP Police Programmer Previous Year Questions",
    "UP Police Programmer Paper 2024",
    "UP Police Programmer MCQ Hindi",
    "UP Police Programmer Practice Set",
    "UP Police Computer Programmer Previous Paper",
    "UP Police Programmer Vacancy 2024",
    "UP Police Programmer Hindi Book",
    "UP Police Computer Programmer Syllabus in Hindi",
    "UP Police Programmer Exam Strategy",

    // Computer Teacher / General
    "Computer Teacher Exam Preparation",
    "Computer Science Crash Course Hindi",
    "Computer Science MCQ Hindi",
    "Computer Science Practice Set Hindi",
    "Computer Fundamentals in Hindi",
    "Computer Science Basics for Beginners Hindi",
    "Computer Science Teaching Techniques",
    "Computer Networking Hindi",
    "Operating System Hindi Lecture",

    // Computer Science Topics
    "DBMS Hindi Lecture",
    "Operating System Hindi Notes",
    "Computer Architecture Hindi",
    "Compiler Design Hindi",
    "Data Structure Hindi",
    "Software Engineering Hindi",
    "Computer Organization Hindi",
    "Web Technology in Hindi",
    "Digital Logic in Hindi",
    "Boolean Algebra in Hindi",

    // Programming in Hindi
    "C Programming Hindi",
    "Java Programming in Hindi",
    "Python Programming in Hindi",
    "C++ Programming for Beginners Hindi",
    "C++ Programming in Hindi",
    "OOPs Concept in Hindi",
    "Function in C Hindi",
    "Array in C Language Hindi",
    "Loops in C Language Hindi",

    // Practice & Strategy
    "Computer Science MCQ in Hindi",
    "Computer Science Quiz in Hindi",
    "LT Grade Computer Practice Set",
    "UP Computer Teacher Mock Test",
    "Computer Science Model Paper",
    "Computer Science Model Paper in Hindi",
    "Computer Science Objective Questions in Hindi",
    "Computer Teacher Quiz in Hindi",
    "Computer Science Mock Test Hindi",
    "LT Grade Computer Practice Paper",

    // Study Plan / Tips
    "Computer Science Short Tricks Hindi",
    "Computer Theory Hindi Notes",
    "LT Grade Computer Important Questions",
    "Computer Science PYQ Solution Hindi",
    "UP Computer Science Exam Tips"
];


$maxResults = 30;
$inserted = false;

// 🔄 Try each keyword until new videos are found and inserted
foreach ($base_keywords as $search_query) {
    //echo "<h4>🔍 Searching: $search_query</h4>";
    
    $url = "https://www.googleapis.com/youtube/v3/search?part=snippet&q=" . urlencode($search_query) . "&type=video&key=$API_KEY&maxResults=$maxResults";

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $response = curl_exec($ch);
    curl_close($ch);

    $data = json_decode($response, true);

    if (empty($data['items'])) continue;

    foreach ($data['items'] as $item) {
        $videoId = $item['id']['videoId'];
        $title = $conn->real_escape_string($item['snippet']['title']);
        $channel = $conn->real_escape_string($item['snippet']['channelTitle']);
        $publishedAt = date('Y-m-d H:i:s', strtotime($item['snippet']['publishedAt']));
        $video_url = "https://www.youtube.com/watch?v=" . $videoId;

        $thumbnail_url = $item['snippet']['thumbnails']['high']['url']
            ?? $item['snippet']['thumbnails']['medium']['url']
            ?? $item['snippet']['thumbnails']['default']['url'];
        $thumbnail_url = $conn->real_escape_string($thumbnail_url);

        $slug = $conn->real_escape_string(generateSlug($title, $videoId));

        // ✅ Check for duplicate
        $check = $conn->query("SELECT id FROM youtube_videos WHERE video_id = '$videoId'");
        if ($check->num_rows === 0) {
            // 🚀 Insert
            $insert_sql = "
                INSERT INTO youtube_videos 
                (video_id, title, channel_name, video_url, published_at, summary, notes, topic_tags, thumbnail_url, slug)
                VALUES 
                ('$videoId', '$title', '$channel', '$video_url', '$publishedAt', NULL, NULL, NULL, '$thumbnail_url', '$slug')
            ";
            if ($conn->query($insert_sql)) {
                //echo "<p>✅ Inserted: $title</p>";
                $inserted = true;
            }
        } else {
            //echo "<p>⚠️ Already exists: $title</p>";
        }
    }

    if ($inserted) break; // ✅ Stop if at least one video was inserted
}

if (!$inserted) {
    echo "<h3>❌ No new videos found for any keywords.</h3>";
}
?>
