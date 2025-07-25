<?php include 'db.php'; ?>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>UP Police Programmer & LT Grade Teacher Study Guide</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    body {
      padding-top: 80px;
    }
    hr {
      border-top: 1px solid #dee2e6;
    }
     .card {
      border: none;
      border-radius: 12px;
      transition: transform 0.2s ease;
    }
    .card:hover {
      transform: scale(1.03);
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }
    .card-title {
      font-weight: 600;
    }
  </style>
</head>
<body>
  <!-- Navbar -->
  <?php include "nave.php" ?>

  <!-- Welcome Section -->
  <div class="container text-center mb-4">
    <h1 class="mt-4">
      <i class="bi bi-book-half"></i> Welcome to Complete Study Guide for <i class="bi bi-shield-lock"></i> UP Police Computer Programmer Grade-2 & <i class="bi bi-mortarboard"></i> UP LT Grade Teacher
    </h1>
    <p class="lead">सभी टॉपिक्स, तुलना, पिछले प्रश्नपत्र, और स्मार्ट स्टडी प्लान एक ही जगह!</p>
  </div>
  <!-- Summary Tool -->
  
  <!-- Feature Summary -->
  <section class="py-5 bg-light text-center">
    <div class="container">
      <div class="row justify-content-center mb-4">
        <div class="col-md-6">
          <div class="card border-primary shadow-sm">
            <div class="card-body">
              <h5 class="card-title">🛡️ UP Police Computer Programmer</h5>
              <p class="card-text">
                Designed for candidates aiming for the Programmer role in the Uttar Pradesh Police department. This section covers core programming, networking, database, and OS concepts.
              </p>
              <a href="http://localhost/up_job/police-syllabus.php" class="btn btn-primary">View Syllabus</a>
            </div>
          </div>
        </div>
        <div class="col-md-6 mt-3 mt-md-0">
          <div class="card border-success shadow-sm">
            <div class="card-body">
              <h5 class="card-title">🎓 UP LT Grade Computer Teacher</h5>
              <p class="card-text">
                Tailored for aspiring government school teachers, focusing on academic-level computer science including digital logic, data structures, OOP, and educational pedagogy.
              </p>
              <a href="http://localhost/up_job/teacher-syllabus.php" class="btn btn-success">View Syllabus</a>
            </div>
          </div>
        </div>
      </div>
      <hr class="my-4">
      <h4 class="mb-3">🔥 Latest Video Lessons</h4>
        <div class="row g-3">
        <?php
        $latestQuery = $conn->query("SELECT id, title, video_id, published_at, slug FROM youtube_videos ORDER BY published_at DESC LIMIT 8");
        if (!$latestQuery) {
            echo "<div class='alert alert-danger'>Query Failed: " . $conn->error . "</div>";
        } else {
            while ($video = $latestQuery->fetch_assoc()):
                $vid = htmlspecialchars($video['video_id']);
                $title = htmlspecialchars($video['title']);
                $date = date("d M Y", strtotime($video['published_at']));
                $slug = htmlspecialchars($video['slug']);
        ?>
            <div class="col-md-3">
              <a href="watch/<?= urlencode($slug) ?>" class="text-decoration-none text-dark">
                <div class="card h-100 shadow-sm">
                  <img src="https://img.youtube.com/vi/<?= $vid ?>/hqdefault.jpg" class="card-img-top rounded-top" alt="<?= $title ?>">
                  <div class="card-body p-2">
                    <h6 class="card-title mb-2"><?= $title ?></h6>
                    <p class="text-muted small mb-0"><?= $date ?></p>
                  </div>
                </div>
              </a>
            </div>
        <?php
            endwhile;
        }
        ?>
        </div>


      <hr class="my-4">

      <h4 class="mb-3">🚀 What This Guide Offers</h4>
      
          <div class="table-responsive">
      <table class="table table-bordered text-center align-middle">
        <thead>
          <tr>
            <th>🧠 टॉपिक / विषय</th>
            <th>👨‍🏫 UP LT Grade</th>
            <th>👮‍♂️ UP Police Programmer</th>
          </tr>
        </thead>
        <tbody>
          <tr><td>Computer Fundamentals</td><td class="tick">✅</td><td class="tick">✅</td></tr>
          <tr><td>Digital Electronics</td><td class="cross">❌</td><td class="tick">✅</td></tr>
          <tr><td>Operating System</td><td class="tick">✅</td><td class="tick">✅</td></tr>
          <tr><td>DBMS</td><td class="tick">✅</td><td class="tick">✅</td></tr>
          <tr><td>C Programming</td><td class="tick">✅</td><td class="tick">✅</td></tr>
          <tr><td>Java Programming</td><td class="tick">✅</td><td class="tick">✅</td></tr>
          <tr><td>Web Technology</td><td class="tick">✅</td><td class="tick">✅</td></tr>
          <tr><td>Networking & Internet</td><td class="tick">✅</td><td class="tick">✅</td></tr>
          <tr><td>Data Structure</td><td class="cross">❌</td><td class="tick">✅</td></tr>
          <tr><td>Software Engineering</td><td class="tick">✅</td><td class="tick">✅</td></tr>
          <tr><td>Compiler Design</td><td class="cross">❌</td><td class="tick">✅</td></tr>
          <tr><td>Discrete Mathematics</td><td class="cross">❌</td><td class="tick">✅</td></tr>
          <tr><td>Computer Architecture</td><td class="tick">✅</td><td class="tick">✅</td></tr>
          <tr><td>System Analysis & Design</td><td class="tick">✅</td><td class="tick">✅</td></tr>
          <tr><td>Computer Graphics</td><td class="tick">✅</td><td class="cross">❌</td></tr>
          <tr><td>Information Security</td><td class="tick">✅</td><td class="tick">✅</td></tr>
          <tr><td>MS Office / Productivity Tools</td><td class="tick">✅</td><td class="cross">❌</td></tr>
          <tr><td>Teaching Aptitude</td><td class="tick">✅</td><td class="cross">❌</td></tr>
          <tr><td>Reasoning & Mental Ability</td><td class="cross">❌</td><td class="tick">✅</td></tr>
        </tbody>
      </table>
    </div>
       <div class="row">
  <!-- Hindi -->
  <div class="col-md-6">
    <h5>📘 हिन्दी संस्करण</h5>
    <div class="bg-white border rounded p-3">
      <h6>🔹 दिन 1–10:</h6>
      <ul>
        <li>🖥️ <strong>Computer Fundamentals</strong> – बुनियादी सिद्धांत, हार्डवेयर, सॉफ़्टवेयर</li>
        <li>⚙️ <strong>Operating Systems</strong> – Windows, Linux, File Systems</li>
        <li>💡 Notes बनाना और छोटी-छोटी क्विज़ का अभ्यास</li>
      </ul>

      <h6>🔹 दिन 11–20:</h6>
      <ul>
        <li>📂 <strong>DBMS</strong> – ER Model, Normalization, SQL Queries</li>
        <li>🌐 <strong>Networking</strong> – TCP/IP, Topologies, Protocols</li>
        <li>📘 PYQs हल करना – DBMS + Networking</li>
      </ul>

      <h6>🔹 दिन 21–30:</h6>
      <ul>
        <li>👨‍💻 <strong>C Programming</strong> + <strong>Java Basics</strong></li>
        <li>🧠 <strong>Data Structures</strong> – Arrays, Stack, Queue, Linked List</li>
        <li>🧪 Weekly Mock Test (3 Sections)</li>
      </ul>

      <h6>🔹 दिन 31–40:</h6>
      <ul>
        <li>📊 <strong>Compiler Design</strong> – Phases, Lexical Analyzer</li>
        <li>📐 <strong>Discrete Math</strong> – Sets, Logic, Graph Theory</li>
        <li>💡 <strong>Teaching Pedagogy + MS Office (Only LT Grade)</strong></li>
      </ul>

      <h6>🔹 दिन 41–50:</h6>
      <ul>
        <li>💻 <strong>Web Technology</strong> – HTML, CSS, JavaScript</li>
        <li>🔐 <strong>Cyber Security + Software Engineering</strong></li>
        <li>🧠 <strong>Reasoning</strong> (Only Police Programmer)</li>
      </ul>

      <h6>🔹 दिन 51–60:</h6>
      <ul>
        <li>📘 सभी विषयों का Revision</li>
        <li>🧾 Short Notes से त्वरित दोहराव</li>
        <li>📊 3 Full-Length Mock Tests</li>
        <li>🎯 Weak Areas पर Focus</li>
      </ul>
    </div>
  </div>

  <!-- English -->
  <div class="col-md-6">
    <h5>📘 English Version</h5>
    <div class="bg-white border rounded p-3">
      <h6>🔹 Days 1–10:</h6>
      <ul>
        <li>🖥️ <strong>Computer Fundamentals</strong> – Basics, OS types, Software vs Hardware</li>
        <li>⚙️ <strong>Operating Systems</strong> – Process mgmt, Memory, File mgmt</li>
        <li>🧾 Make micro-notes and use flashcards</li>
      </ul>

      <h6>🔹 Days 11–20:</h6>
      <ul>
        <li>📂 <strong>DBMS</strong> – ER diagrams, Normal forms, SQL</li>
        <li>🌐 <strong>Networking</strong> – IP addressing, OSI model</li>
        <li>📘 Solve PYQs of DBMS & Networking</li>
      </ul>

      <h6>🔹 Days 21–30:</h6>
      <ul>
        <li>👨‍💻 <strong>C Programming</strong> + basic Java syntax and loops</li>
        <li>🧠 <strong>Data Structures</strong> – Stacks, Queues, Trees</li>
        <li>🧪 Weekly sectional mock tests</li>
      </ul>

      <h6>🔹 Days 31–40:</h6>
      <ul>
        <li>📊 <strong>Compiler Design</strong> – DFA, tokens, parsing</li>
        <li>📐 <strong>Discrete Math</strong> – Sets, logic gates, combinatorics</li>
        <li>💡 <strong>Pedagogy & MS Office</strong> (LT Grade only)</li>
      </ul>

      <h6>🔹 Days 41–50:</h6>
      <ul>
        <li>💻 <strong>Web Technologies</strong> – HTML, CSS, JavaScript</li>
        <li>🔐 <strong>Cyber Security + Software Engineering</strong></li>
        <li>🧠 <strong>Reasoning & Aptitude</strong> (Police Only)</li>
      </ul>

      <h6>🔹 Days 51–60:</h6>
      <ul>
        <li>📘 Final Revision of full syllabus</li>
        <li>🧾 Rapid revision using notes and MCQs</li>
        <li>📊 3 Full-Length Mock Tests (alternate days)</li>
        <li>🎯 Focus on weakest sections</li>
      </ul>
    </div>
  </div>
</div>
      
      <ul class="list-group list-group-flush text-start">
        <li class="list-group-item">
          ✔️ <strong>Detailed Syllabus for Both Exams</strong><br>
          📝 <em>UP Police Programmer Grade-2</em>: Data Structure, DBMS, Operating System, Networking, Web Technologies, और Logical Reasoning जैसे practical subjects.<br>
          📘 <em>LT Grade Computer Teacher</em>: Computer Fundamentals, Programming Concepts, Teaching Aptitude, ICT in Education, आदि पर focus.<br>
          🔁 दोनों का syllabus 40% common है, लेकिन depth और usage अलग-अलग है।
        </li>

        <li class="list-group-item">
          ✔️ <strong>Subject-wise Comparison</strong><br>
          🔍 हर subject का cross-analysis – जैसे Police में SQL query practical पूछी जाती है, जबकि LT में syntax-based या MCQ.<br>
          📊 Comparison Table और Highlighted Topics दोनों exam-specific insights के साथ.<br>
          🎯 Study Time Optimization के लिए सबसे important comparison strategy।
        </li>

        <li class="list-group-item">
          ✔️ <strong>Previous Year Paper Analysis</strong><br>
          📄 2017 से 2024 तक के पेपर का analysis – question types, difficulty level, repeat pattern, और smart tagging.<br>
          🧠 60% सवाल concept-based दोहराए गए; अगर tag करके पढ़ा जाए तो accuracy बढ़ेगी।<br>
          📌 LT Grade में theory + pedagogy mix होता है, जबकि Police में technical + logic mix।
        </li>

        <li class="list-group-item">
          ✔️ <strong>60-Day Custom Study Plan</strong><br>
          📅 Week-wise Plan: पहले 30 दिन common topics पर, अगले 30 दिन अलग-अलग subjects पर focus.<br>
          🧩 MCQ practice के साथ Notes revision sync किया गया है.<br>
          🎯 Daily Goal System: Theory + MCQ + Recap + Revision included.
        </li>

        <li class="list-group-item">
          ✔️ <strong>Study Tips & Smart Strategy</strong><br>
          🧠 Smart Learning: Chunking, Active Recall, and Interleaving Methods applied.<br>
          🕹️ Programming के लिए live example-based recall, और pedagogy के लिए concept mapping.<br>
          🔥 Focus strategy – किस exam में क्या नहीं पढ़ना है, ये clarity सबसे important.
        </li>
      </ul>
    <hr class="my-4">
      
    </div>
  </section>
  <?php include "footer.php";?>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
   