<?php  include "fetch_youtube.php"; ?>
<?php
include "db.php"; // Fetch all videos ordered by published date
$videos_result = $conn->query("SELECT * FROM youtube_videos ORDER BY published_at DESC");
$channel_videos = [];
$channel_latest_video = [];
$channel_latest_time = [];
while ($row = $videos_result->fetch_assoc()) {
    $channel = $row["channel_name"];
    $channel_videos[$channel][] = $row;
    $published_time = strtotime($row["published_at"]);
    if (!isset($channel_latest_time[$channel]) || $published_time > $channel_latest_time[$channel]) {
        $channel_latest_time[$channel] = $published_time;
        $channel_latest_video[$channel] = $row;
        // Full row including slug
    }
} // Sort channels by latest video publish time
uasort($channel_videos, function ($a, $b) {
    return strtotime($b[0]["published_at"]) - strtotime($a[0]["published_at"]);
});
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>YouTube Resources</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    body {
        padding-top: 80px;
      
    }
    .channel-name {
      font-size: 1.3rem;
      font-weight: 600;
      color: #fff;
      background: #212529;
      padding: 8px 16px;
      display: inline-block;
      border-radius: 8px;
      cursor: pointer;
      margin-bottom: 10px;
      word-wrap: break-word;
    }
    .video-entry {
      padding: 10px 15px;
      background: #ffffff;
      border: 1px solid #e0e0e0;
      border-radius: 6px;
      margin-bottom: 8px;
    }
    .video-entry:hover {
      background-color: #f1f1f1;
    }
    .video-title {
      font-size: 1rem;
      font-weight: 500;
      color: #333;
      text-decoration: none;
    }
    .video-time, a {
      font-size: 0.8rem;
      color: #888;
      text-decoration: none;
    }
  </style>
</head>
<body>
    <?php include "nave.php"; ?>
      <div class="container text-center mb-4">
    <h1 class="mt-4">
      <i class="bi bi-book-half"></i> <i class="bi bi-shield-lock"></i> UP Police Computer Programmer Grade-2 & <br> <i class="bi bi-mortarboard"></i> UP LT Grade Teacher YouTube Video
    </h1>
  </div>
<div class="container mt-4">

  <?php foreach ($channel_videos as $channel => $videos): ?>
    <?php $latest_video = $channel_latest_video[$channel]; ?>
    
    <!-- Channel Title - Clickable -->
    <a href="watch/<?= htmlspecialchars($latest_video["slug"]) ?>" class="channel-name mb-2 d-block">
      🎥 <?= htmlspecialchars($channel) ?>
    </a>

    <!-- Videos List -->
    <?php foreach ($videos as $video): ?>
      <div class="video-entry">
        <div class="d-flex justify-content-between align-items-center flex-wrap">
          <a class="video-title" href="watch/<?= htmlspecialchars($video["slug"]) ?>">
            <?= htmlspecialchars($video["title"]) ?>
          </a>
          <a class="video-time ms-2" href="watch/<?= htmlspecialchars($video["slug"]) ?>">
            <?= date("d M Y, h:i A", strtotime($video["published_at"])) ?>
          </a>
        </div>
      </div>
    <?php endforeach; ?>

    <hr class="my-4">
  <?php endforeach; ?>
</div>
<?php include "footer.php"; ?>
</body>
</html>
