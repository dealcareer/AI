<?php
include "db.php";

// Fetch all topics
$topic_sql = "SELECT * FROM topics";
$topic_result = $conn->query($topic_sql);
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Syllabus Comparison</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    hr {
      border-top: 1px solid #dee2e6;
    }
    body { padding-top: 80px; }
    table { border-collapse: collapse; width: 100%; margin-top: 20px; }
    th, td { border: 1px solid #dee2e6; padding: 12px; vertical-align: top; }
    th { background-color: #e9ecef; text-align: center; }
    textarea.comment-area {
      width: 100%; min-height: 40px;
      border: 1px solid #ccc;
      padding: 6px;
      resize: vertical;
      color: #dc3545;
    }
    textarea.comment-area::placeholder { color: #999; }
    .ready-yes { background-color: #d4edda; }
    .ready-no { background-color: #f8d7da; }
    .edit-icon {
      cursor: pointer;
      font-size: 18px;
      margin-right: 5px;
    }
    .text-danger { color: #dc3545 !important; }
    .comment-text { margin-top: 5px; font-weight: 500; }
    .comment-editor { margin-top: 10px; }
    .d-none { display: none; }
  </style>
</head>
    
<body>
    <!-- Navbar -->
<?php include "nave.php";?>
  <div class="container text-center mb-4">
    <h1 class="mt-4">
      <i class="bi bi-book-half"></i> <i class="bi bi-shield-lock"></i> UP Police Computer Programmer Grade-2 VS<br> <i class="bi bi-mortarboard"></i> UP LT Grade Teacher
    </h1>
    <p class="lead">सभी टॉपिक्स, तुलना, पिछले प्रश्नपत्र, और स्मार्ट स्टडी प्लान एक ही जगह!</p>
  </div>
<!-- Content -->
<div class="container py-4">
  <table class="table table-bordered">
    <thead class="table-light">
      <tr>
        <th>Topic</th>
        <th>Common Sub-Topics <span class="badge bg-primary">Shared</span></th>
        <th>UP Police Programmer Only <span class="badge bg-danger">Unique</span></th>
        <th>LT Grade Assistant Teacher Only <span class="badge bg-danger">Unique</span></th>
        <th>Ready?</th>
        <th>Comment</th>
      </tr>
    </thead>
    <tbody>
    <?php while ($row = $topic_result->fetch_assoc()) {
        $topic_id = $row['id'];
        $name = $row['topic_name'];

        $common_data = $conn->query("SELECT description FROM syllabus_topics WHERE topic_id=$topic_id AND exam_type='COMON'");
        $police_data = $conn->query("SELECT description FROM syllabus_topics WHERE topic_id=$topic_id AND exam_type='POLICE'");
        $lt_data = $conn->query("SELECT description FROM syllabus_topics WHERE topic_id=$topic_id AND exam_type='LT'");
        $status_result = $conn->query("SELECT * FROM topic_status WHERE topic_id=$topic_id");
        $status_data = $status_result && $status_result->num_rows > 0 ? $status_result->fetch_assoc() : [];

        $common_desc = $common_data && $common_data->num_rows ? $common_data->fetch_assoc()['description'] : '';
        $lt_desc = $lt_data && $lt_data->num_rows ? $lt_data->fetch_assoc()['description'] : '';
        $police_desc = $police_data && $police_data->num_rows ? $police_data->fetch_assoc()['description'] : '';

        $common_comment = $status_data['common_comment'] ?? '';
        $lt_comment = $status_data['lt_comment'] ?? '';
        $police_comment = $status_data['police_comment'] ?? '';
        $ready = $status_data['is_ready'] ?? 0;
        $main_comment = $status_data['comment'] ?? '';
        $row_class = $ready ? 'ready-yes' : 'ready-no';
    ?>
      <tr class="<?= $row_class ?>">
        <td><strong><?= htmlspecialchars($name) ?></strong></td>

        <!-- COMMON TOPICS -->
        <td>
          <?= nl2br(htmlspecialchars($common_desc)) ?>
          <div class="mt-2">
            <?php if (!empty($common_comment)): ?>
              <span class="edit-icon comment-text text-danger" onclick="toggleEditor(this)"><?= htmlspecialchars($common_comment) ?></span><i class="edit-icon text-success" onclick="toggleEditor(this)">✏️ Write More...</i>
            <?php else: ?>
              <i class="edit-icon text-success" onclick="toggleEditor(this)">✏️ Write any comment...</i>
            <?php endif; ?>
            <div class="comment-editor d-none">
              <textarea class="comment-area" placeholder="✏️ Write any comment..."><?= htmlspecialchars($common_comment) ?></textarea>
              <button class="btn btn-sm btn-danger mt-1" onclick="submitComment(this, <?= $topic_id ?>, 'COMMON')">Submit</button>
            </div>
          </div>
        </td>

        <!-- POLICE SYLLABUS -->
        <td>
          <?= nl2br(htmlspecialchars($police_desc)) ?>
          <div class="mt-2">
            <?php if (!empty($police_comment)): ?>
              <span class="edit-icon comment-text text-danger" onclick="toggleEditor(this)"><?= htmlspecialchars($police_comment) ?></span><i class="edit-icon text-success" onclick="toggleEditor(this)">✏️ Write More...</i>
            <?php else: ?>
              <i class="edit-icon text-success" onclick="toggleEditor(this)">✏️ Write any comment...</i>
            <?php endif; ?>
            <div class="comment-editor d-none">
              <textarea class="comment-area" placeholder="✏️ Write any comment..."><?= htmlspecialchars($police_comment) ?></textarea>
              <button class="btn btn-sm btn-danger mt-1" onclick="submitComment(this, <?= $topic_id ?>, 'POLICE')">Submit</button>
            </div>
          </div>
        </td>

        <!-- LT SYLLABUS -->
        <td>
          <?= nl2br(htmlspecialchars($lt_desc)) ?>
          <div class="mt-2">
            <?php if (!empty($lt_comment)): ?>
              <span class="edit-icon comment-text text-danger" onclick="toggleEditor(this)"><?= htmlspecialchars($lt_comment) ?></span><i class="edit-icon text-success" onclick="toggleEditor(this)">✏️ Write More...</i>
            <?php else: ?>
              <i class="edit-icon text-success" onclick="toggleEditor(this)">✏️ Write any comment...</i>
            <?php endif; ?>
            <div class="comment-editor d-none">
              <textarea class="comment-area" placeholder="✏️ Write any comment..."><?= htmlspecialchars($lt_comment) ?></textarea>
              <button class="btn btn-sm btn-danger mt-1" onclick="submitComment(this, <?= $topic_id ?>, 'LT')">Submit</button>
            </div>
          </div>
        </td>

        <!-- READY CHECKBOX -->
        <td class="text-center">
          <input type="checkbox" onchange="updateStatus(<?= $topic_id ?>, this.checked, null)" <?= $ready ? 'checked' : '' ?>>
        </td>

        <!-- MAIN COMMENT -->
        <td>
          <div>
            <?php if (!empty($main_comment)): ?>
              <span class="edit-icon comment-text text-danger" onclick="toggleEditor(this)"><?= htmlspecialchars($main_comment) ?></span><i class="edit-icon text-success" onclick="toggleEditor(this)">✏️ Write More...</i>
            <?php else: ?>
              <i class="edit-icon text-success" onclick="toggleEditor(this)">✏️ Write any comment...</i>
            <?php endif; ?>
            <div class="comment-editor d-none">
              <textarea class="comment-area" placeholder="✏️ Write any comment..." onblur="updateStatus(<?= $topic_id ?>, null, this.value)"><?= htmlspecialchars($main_comment) ?></textarea>
            </div>
          </div>
        </td>
      </tr>
    <?php } ?>
    </tbody>
  </table>
</div>
  <!-- Scripts -->
  <script>
    function toggleEditor(icon) {
      const editor = icon.parentElement.querySelector('.comment-editor');
      editor.classList.toggle('d-none');
    }

    function submitComment(button, topicId, examType) {
      const textarea = button.previousElementSibling;
      const comment = textarea.value.trim();
      if (comment === '') return;
      const formData = new FormData();
      formData.append("topic_id", topicId);
      formData.append("exam_type", examType);
      formData.append("sub_comment", comment);
      fetch("update_sub_comment.php", {
        method: "POST",
        body: formData
      }).then(() => {
        button.textContent = "Saved!";
        button.disabled = true;
        textarea.disabled = true;
        setTimeout(() => location.reload(), 500);
      });
    }

    function updateStatus(topicId, isReady, comment) {
      const formData = new FormData();
      formData.append("topic_id", topicId);
      if (isReady !== null) formData.append("is_ready", isReady ? 1 : 0);
      if (comment !== null) formData.append("comment", comment);
      fetch("update_status.php", {
        method: "POST",
        body: formData
      }).then(() => location.reload());
    }
  </script>
    <?php include "footer.php";?>
</body>
</html>
