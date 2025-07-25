<?php
include "db.php";

function generateSlug($string) {
    return strtolower(trim(preg_replace('/[^a-z0-9]+/i', '-', $string), '-'));
}

// Accept slug or video_id from URL
$slug = $_GET['slug'] ?? null;
$video_id = $_GET['video_id'] ?? null;

// Fetch video by slug or ID
if ($slug) {
    $stmt = $conn->prepare("SELECT * FROM youtube_videos WHERE slug = ?");
    $stmt->bind_param("s", $slug);
} elseif ($video_id) {
    $stmt = $conn->prepare("SELECT * FROM youtube_videos WHERE id = ?");
    $stmt->bind_param("i", $video_id);
} else {
    echo "Video not found";
    exit;
}

$stmt->execute();
$video = $stmt->get_result()->fetch_assoc();
if (!$video) { echo "Video not found"; exit; }

$channel = $conn->real_escape_string($video['channel_name']);
$watch_next = $conn->query("SELECT * FROM youtube_videos WHERE channel_name = '$channel' ORDER BY published_at DESC");
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title><?= htmlspecialchars($video['title']) ?></title>
   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    body {padding: 40px; background-color: #f8f9fa; }
    .video-container { position: relative; width: 100%; padding-top: 56.25%; border-radius: 10px; overflow: hidden; background: #000; }
    .video-container iframe { position: absolute; top: 0; left: 0; width: 100%; height: 100%; border: none; }
    .watch-next .card:hover { transform: scale(1.02); box-shadow: 0 2px 8px rgba(0,0,0,0.2); }
    .summary-box { background: #fff; padding: 15px; border-radius: 8px; box-shadow: 0 2px 6px rgba(0,0,0,0.1); margin-top: 20px; }
    .card-title { font-size: 0.95rem; font-weight: 600; }
    .show-more { cursor: pointer; color: #007bff; }
  </style>
</head>
<body>
  <!-- Navbar -->
  <?php include "nave.php" ?>

  <!-- Welcome Section -->
  <div class="container text-center mb-4">
    <h1 class="mt-4">
      <i class="bi bi-play-circle-fill text-danger"></i> <?= htmlspecialchars($video['title']) ?>
    </h1>
  </div>
<div class="container mt-4" id="main-content">
  <div class="row">
    <!-- Main Video -->
    <div class="col-lg-8 mb-4">
      <div class="video-container mb-3">
        <iframe src="https://www.youtube.com/embed/<?= $video['video_id'] ?>?autoplay=1&rel=0&modestbranding=1&showinfo=0" allowfullscreen></iframe>
      </div>
      <h4><?= htmlspecialchars($video['title']) ?></h4>
      <div class="d-flex justify-content-between align-items-center mt-2">
        <div>
          <strong>📺 <?= htmlspecialchars($video['channel_name']) ?></strong><br>
          <small>📅 <?= date("d M Y", strtotime($video['published_at'])) ?></small>
        </div>
        <div>
          <button class="btn btn-danger btn-sm">🔔 Subscribe</button>
          <button class="btn btn-outline-secondary btn-sm">🔗 Share</button>
        </div>
      </div>
      <div class="summary-box mt-3">
        <h5>📝 Summary</h5>
        <?php if (!empty($video['summary'])):
          $isLong = strlen($video['summary']) > 400;
          $short = substr($video['summary'], 0, 400);
        ?>
          <p id="summary-text"><?= nl2br(htmlspecialchars($isLong ? $short . '...' : $video['summary'])) ?></p>
          <?php if ($isLong): ?>
            <span class="show-more" onclick="toggleSummary()">Show More</span>
          <?php endif; ?>
        <?php else: ?>
          <div class="alert alert-warning mb-0">
            No summary available.
            <a href="generate_summary.php?video_id=<?= $video['id'] ?>" class="btn btn-sm btn-dark ms-2">Generate via API</a>
          </div>
        <?php endif; ?>
      </div>
    </div>

    <!-- Watch Next -->
    <div class="col-lg-4">
      <h5 class="mb-3">▶ Watch Next</h5>
      <div class="watch-next" id="watch-next-videos">
        <?php $watch_next->data_seek(0); while ($next = $watch_next->fetch_assoc()): ?>
          <?php if ($next['id'] != $video['id']): ?>
            <a href="/up_job/watch/<?= $next['slug'] ?>" class="text-decoration-none text-dark">
            <div class="card mb-3">
              <div class="row g-0">
                <div class="col-5">
                <img src="https://img.youtube.com/vi/<?= $next['video_id'] ?>/hqdefault.jpg" class="img-fluid rounded-start" alt="<?= htmlspecialchars($next['title']) ?>">
                </div>
                <div class="col-7">
                  <div class="card-body p-2">
                    <h6 class="card-title mb-1"><?= htmlspecialchars($next['title']) ?></h6>
                    <p class="card-text"><small class="text-muted"><?= date("d M Y", strtotime($next['published_at'])) ?></small></p>
                  </div>
                </div>
              </div>
            </div>
          </a>
          <?php endif; ?>
        <?php endwhile; ?>
        
      </div>
    </div>
  </div>
</div>
<?php include "footer.php"; ?>
<script>
  const originalSummary = <?= json_encode(nl2br(htmlspecialchars($video['summary'] ?? ''))) ?>;
  const shortSummary = <?= json_encode(nl2br(htmlspecialchars($short ?? ''))) ?>;
  let expanded = false;

  function toggleSummary() {
    const text = document.getElementById("summary-text");
    const toggle = document.querySelector(".show-more");
    if (!expanded) {
      text.innerHTML = originalSummary;
      toggle.innerText = "Show Less";
    } else {
      text.innerHTML = shortSummary + "...";
      toggle.innerText = "Show More";
    }
    expanded = !expanded;
  }

</script>
</body>
</html>