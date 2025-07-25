<?php
function step_alert($step, $message, $type = 'info') {
    echo "<div class='alert alert-$type'><strong>Step $step:</strong> $message</div>";
}

// Show form if not submitted
if (!isset($_POST['submit'])) {
    echo '<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Install UP Job</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light">
    <div class="container mt-5">
        <div class="card">
            <div class="card-header bg-primary text-white">Install UP Job</div>
            <div class="card-body">
                <form method="POST" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label class="form-label">Host</label>
                        <input type="text" name="host" class="form-control" value="localhost" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">User</label>
                        <input type="text" name="user" class="form-control" value="root" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input type="password" name="password" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Database Name</label>
                        <input type="text" name="dbname" class="form-control" value="up_job" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">YouTube API Key 
                            <button class="btn btn-sm btn-info" type="button" data-bs-toggle="collapse" data-bs-target="#apiHelp" aria-expanded="false" aria-controls="apiHelp">
                                How to get?
                            </button>
                        </label>
                        <input type="text" name="youtube_api" class="form-control" required>

                        <div class="collapse mt-2" id="apiHelp">
                            <div class="card card-body bg-light">
                                <strong>Follow these steps:</strong>
                                <ol class="mb-3 ps-3">
                                    <li>Go to <a href="https://console.cloud.google.com/" target="_blank">Google Cloud Console</a></li>
                                    <li>Create or select a project.</li>
                                    <li>Navigate to <strong>APIs & Services → Library</strong>.</li>
                                    <li>Search for <strong>YouTube Data API v3</strong> and enable it.</li>
                                    <li>Now go to <strong>APIs & Services → Credentials</strong>.</li>
                                    <li>Click <strong>+ CREATE CREDENTIALS → API Key</strong>.</li>
                                    <li>Copy the API key shown and paste it above.</li>
                                </ol>
                                <div class="ratio ratio-16x9">
                                    <iframe src="https://www.youtube.com/embed/LLAZUTbc97I" title="How to get YouTube API Key" allowfullscreen></iframe>
                                </div>
                            </div>
                        </div>
                    </div>

                <div class="mb-3">
                    <label class="form-label">SQL File 
                        <button class="btn btn-sm btn-info" type="button" data-bs-toggle="collapse" data-bs-target="#sqlHelp" aria-expanded="false" aria-controls="sqlHelp">
                            How to get?
                        </button>
                    </label>
                    <input type="file" name="sql_file" class="form-control" accept=".sql" required>

                    <div class="collapse mt-2" id="sqlHelp">
                        <div class="card card-body bg-light">
                            <strong>How to Upload  .sql file:</strong>
                            <ol class="mb-3 ps-3">
                                <li>Open <strong>up_job</strong> Folder.</li>
                                <li>Select your database here <strong>up_job.sql</strong>.</li>
                                <li>Choose format: <strong>SQL</strong>.</li>
                                <li>Upload it here to install the tables & data.</li>
                            </ol>
                        </div>
                    </div>
                </div>

                    <button type="submit" name="submit" class="btn btn-success">🚀 Install Now</button>
                </form>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
    </html>';
    exit();
}

$host = $_POST['host'];
$user = $_POST['user'];
$password = $_POST['password'];
$dbname = $_POST['dbname'];
$youtube_api = $_POST['youtube_api'];

echo "<!DOCTYPE html><html lang='en'><head>
    <meta charset='UTF-8'><title>Installing...</title>
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css' rel='stylesheet'>
    <style>body { padding: 2rem; background: #f8f9fa; }</style>
</head><body><div class='container'>";

step_alert(1, "Connecting to MySQL...", "info");

$conn = new mysqli($host, $user, $password);
if ($conn->connect_error) {
    step_alert(1, "❌ Connection failed: " . $conn->connect_error, "danger");
    exit;
}
step_alert(1, "✅ Connected to MySQL successfully.", "success");

step_alert(2, "Creating database `$dbname` if not exists...", "info");
$conn->query("CREATE DATABASE IF NOT EXISTS `$dbname` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci");
$conn->select_db($dbname);
step_alert(2, "✅ Database `$dbname` ready.", "success");

step_alert(3, "Creating `settings` table and inserting API key...", "info");
$conn->query("CREATE TABLE IF NOT EXISTS `settings` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `youtube_api` TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;");
$conn->query("TRUNCATE TABLE `settings`");
$conn->query("INSERT INTO `settings` (`youtube_api`) VALUES ('" . $conn->real_escape_string($youtube_api) . "')");
step_alert(3, "✅ API key saved in `settings` table.", "success");

step_alert(4, "Creating <code>db.php</code> config file...", "info");
$db_php = "<?php\n$" . "host = '$host';\n$" . "user = '$user';\n$" . "pass = '$password';\n$" . "dbname = '$dbname';\n$" . "conn = new mysqli(\$host, \$user, \$pass, \$dbname);\nif (\$conn->connect_error) {\n    die('❌ Connection failed: ' . \$conn->connect_error);\n}\n\$conn->set_charset('utf8mb4');\n?>";

if (file_put_contents("db.php", $db_php)) {
    step_alert(4, "✅ <code>db.php</code> created successfully.", "success");
} else {
    step_alert(4, "❌ Failed to create <code>db.php</code>.", "danger");
}

step_alert(5, "Importing SQL file...", "info");
if (isset($_FILES['sql_file']) && $_FILES['sql_file']['error'] === UPLOAD_ERR_OK) {
    $tmpName = $_FILES['sql_file']['tmp_name'];
    $sql = file_get_contents($tmpName);
    $lines = explode("\n", $sql);
    $query = '';
    foreach ($lines as $line) {
        $line = trim($line);
        if ($line == '' || strpos($line, '--') === 0 || strpos($line, '#') === 0) continue;
        $query .= $line . ' ';
        if (substr(trim($line), -1) == ';') {
            if (!$conn->query($query)) {
                echo "<div class='alert alert-danger'><strong>❌ SQL Error:</strong> " . $conn->error . "<br><code>$query</code></div>";
            }
            $query = '';
        }
    }
    unlink($tmpName);
    step_alert(5, "✅ SQL file imported successfully.", "success");
} else {
    step_alert(5, "❌ Failed to read SQL file.", "danger");
}

step_alert(6, "🎉 Installation complete. Redirecting to <code>index.php</code>...", "success");
echo "<script>
    setTimeout(function() {
        window.location.href = 'index.php';
    }, 3000);
</script>";

echo "</div></body></html>";
// Optional: Delete install.php after use
// unlink(__FILE__);
