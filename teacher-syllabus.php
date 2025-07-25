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
    hr {
      border-top: 1px solid #dee2e6;
    }
    body {
      padding-top: 80px;
      background-color: #f9f9f9;
      
      font-family: 'Segoe UI', sans-serif;
    }
    h2 {
      color: black;
      margin-top: 40px;
      border-bottom: 2px solid #0d6efd;
      padding-bottom: 10px;
    }
    ul {
      margin-bottom: 30px;
    }
    .topic i {
      color: #198754;
      margin-right: 8px;
    }
  </style>
</head>
<body>
  <!-- Navbar -->
  <?php include "nave.php";?>
  <!-- Welcome Section -->
  <div class="container text-center mb-4">
    <h1 class="mt-4">
 <i class="bi bi-mortarboard"></i>UP LT Grade Computer Science Syllabus
    </h1>
  </div>
  <div class="container">

<div class="topic">
  <h2><i class="bi bi-cpu"></i> Digital Logic and Circuits & Discrete Mathematics</h2>
  <ul>
    <li><i class="bi bi-dot"></i> Number Systems, Boolean Algebra, Logic Gates</li>
    <li><i class="bi bi-dot"></i> Simplification of Boolean Functions</li>
    <li><i class="bi bi-dot"></i> Combinational and Sequential Circuits</li>
    <li><i class="bi bi-dot"></i> Memory Circuits</li>
    <li><i class="bi bi-dot"></i> Sets, Relations & Functions</li>
    <li><i class="bi bi-dot"></i> Mathematical Logic, Combinatorics</li>
    <li><i class="bi bi-dot"></i> Recurrence Relations, Graph Theory</li>
  </ul>
  <p class="text-success"><strong>संभावित प्रश्न:</strong> 12–15 | <strong>अंक:</strong> 18–22</p>
</div>

<!-- Computer Organization and Architecture -->
<div class="topic">
  <h2><i class="bi bi-hdd-network"></i> Computer Organization and Architecture</h2>
  <ul>
    <li><i class="bi bi-dot"></i> Stored Program Concept, CPU Components</li>
    <li><i class="bi bi-dot"></i> Opcodes, Operands, Instruction Cycle</li>
    <li><i class="bi bi-dot"></i> ALU, Hardwired & Microprogrammed Control Unit</li>
    <li><i class="bi bi-dot"></i> Registers, Memory & I/O Organization</li>
    <li><i class="bi bi-dot"></i> Instruction Formats, Types, Addressing Modes</li>
    <li><i class="bi bi-dot"></i> Microprocessor Instructions, Multicore Architecture</li>
    <li><i class="bi bi-dot"></i> Multiprocessor and Multicomputer Systems</li>
  </ul>
  <p class="text-success"><strong>संभावित प्रश्न:</strong> 10–12 | <strong>अंक:</strong> 15–18</p>
</div>

<!-- Data Structures and Algorithms -->
<div class="topic">
  <h2><i class="bi bi-diagram-3"></i> Data Structures and Algorithms</h2>
  <ul>
    <li><i class="bi bi-dot"></i> Linear and Non-Linear Data Structures</li>
    <li><i class="bi bi-dot"></i> Hashing and Collision Resolution</li>
    <li><i class="bi bi-dot"></i> Searching, Sorting, Algorithm Analysis</li>
    <li><i class="bi bi-dot"></i> Red-Black Trees, B-Trees, Heaps</li>
    <li><i class="bi bi-dot"></i> Design Techniques: Divide & Conquer, Greedy</li>
    <li><i class="bi bi-dot"></i> Dynamic Programming, Backtracking, Branch & Bound</li>
    <li><i class="bi bi-dot"></i> NP-Completeness, Approximation Algorithms</li>
  </ul>
  <p class="text-success"><strong>संभावित प्रश्न:</strong> 14–16 | <strong>अंक:</strong> 20–25</p>
</div>

<!-- Programming in C -->
<div class="topic">
  <h2><i class="bi bi-code-slash"></i> Programming in C</h2>
  <ul>
    <li><i class="bi bi-dot"></i> Basic Programming Concepts</li>
    <li><i class="bi bi-dot"></i> C Syntax, Control Structures, Functions</li>
    <li><i class="bi bi-dot"></i> Arrays, Strings, Pointers, Structures</li>
    <li><i class="bi bi-dot"></i> File Handling in C</li>
  </ul>
  <p class="text-success"><strong>संभावित प्रश्न:</strong> 8–10 | <strong>अंक:</strong> 10–12</p>
</div>

<!-- Object Oriented Techniques -->
<div class="topic">
  <h2><i class="bi bi-diagram-3-fill"></i> Object Oriented Techniques</h2>
  <ul>
    <li><i class="bi bi-dot"></i> OOP Principles: Encapsulation, Polymorphism</li>
    <li><i class="bi bi-dot"></i> UML Modelling: Structural, Behavioral, Architectural</li>
    <li><i class="bi bi-dot"></i> Java, Java Beans, EJB, Java Swing</li>
    <li><i class="bi bi-dot"></i> JDBC/ODBC, Servlets</li>
  </ul>
  <p class="text-success"><strong>संभावित प्रश्न:</strong> 8–10 | <strong>अंक:</strong> 10–12</p>
</div>

<!-- Operating System -->
<div class="topic">
  <h2><i class="bi bi-windows"></i> Operating System</h2>
  <ul>
    <li><i class="bi bi-dot"></i> OS Goals, Functions, Structure</li>
    <li><i class="bi bi-dot"></i> Process Management, Memory Management</li>
    <li><i class="bi bi-dot"></i> File and Storage Management</li>
    <li><i class="bi bi-dot"></i> UNIX and Shell Programming</li>
    <li><i class="bi bi-dot"></i> Windows Programming Basics</li>
  </ul>
  <p class="text-success"><strong>संभावित प्रश्न:</strong> 6–8 | <strong>अंक:</strong> 8–10</p>
</div>

<!-- Database Management System -->
<div class="topic">
  <h2><i class="bi bi-database"></i> Database Management Systems</h2>
  <ul>
    <li><i class="bi bi-dot"></i> DBMS Architecture, Models, ER Modelling</li>
    <li><i class="bi bi-dot"></i> Relational Model, SQL, Relational Design</li>
    <li><i class="bi bi-dot"></i> Query Processing, Optimization, Transactions</li>
    <li><i class="bi bi-dot"></i> Concurrency Control & Recovery</li>
    <li><i class="bi bi-dot"></i> DB Security & Data Independence</li>
  </ul>
  <p class="text-success"><strong>संभावित प्रश्न:</strong> 6–8 | <strong>अंक:</strong> 8–10</p>
</div>

<!-- Computer Networks -->
<div class="topic">
  <h2><i class="bi bi-globe2"></i> Computer Networks</h2>
  <ul>
    <li><i class="bi bi-dot"></i> Network Types, Topologies, Protocols</li>
    <li><i class="bi bi-dot"></i> OSI & TCP/IP Models</li>
    <li><i class="bi bi-dot"></i> Data Communication Fundamentals</li>
    <li><i class="bi bi-dot"></i> Switching & Access Mechanisms</li>
    <li><i class="bi bi-dot"></i> Layer-wise Functions: Data Link, Network, Transport</li>
  </ul>
  <p class="text-success"><strong>संभावित प्रश्न:</strong> 6–8 | <strong>अंक:</strong> 8–10</p>
</div>
  </div>
<?php include "footer.php";?>

</body>
</html>
