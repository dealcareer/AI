-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 25, 2025 at 09:31 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `up_job`
--

-- --------------------------------------------------------

--
-- Table structure for table `compare`
--

CREATE TABLE `compare` (
  `id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `type` enum('COMMON','POLICE_ONLY','LT_ONLY') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `syllabus_comparison`
--

CREATE TABLE `syllabus_comparison` (
  `id` int(11) NOT NULL,
  `topic` varchar(255) NOT NULL,
  `common` text DEFAULT NULL,
  `unique_police` text DEFAULT NULL,
  `unique_lt` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `syllabus_comparison`
--

INSERT INTO `syllabus_comparison` (`id`, `topic`, `common`, `unique_police`, `unique_lt`) VALUES
(1, 'Digital Logic & Circuits', 'Boolean Algebra, Logic Gates, Combinational & Sequential Circuits, Number Systems', 'Logic functions, Minimization, Design & synthesis, Floating-point arithmetic', 'Recurrence Relations, Graph Theory'),
(2, 'Computer Organization & Architecture', 'ALU, Control Unit, Memory Interface, I/O, Pipelining, Cache, Secondary Storage', 'DMA Mode, Machine instructions & addressing', 'Multicore, Multiprocessor, Instruction Formats'),
(3, 'Programming & Data Structures', 'C Language, Functions, Recursion, Arrays, Stacks, Queues, Linked Lists, Trees', 'Abstract Data Types, Binary Heaps', 'Red-Black Trees, B Trees, Binomial & Fibonacci Heaps'),
(4, 'Algorithms', 'Sorting, Searching, Greedy, Divide & Conquer, Dynamic Programming, Graph Traversals', 'Asymptotic Analysis, Complexity Classes (P, NP, etc.)', 'Advanced techniques: FFT, Backtracking, Branch & Bound, Approximation'),
(5, 'Compiler Design', 'Lexical Analysis, Parsing, Syntax Translation, Intermediate Code, Optimization', 'Runtime environments', '—'),
(6, 'Operating System', 'Processes, Threads, CPU Scheduling, Memory, File System, I/O, Synchronization, Deadlocks', 'Windows/Unix Commands, Virtual Memory', 'Shell Programming, OS Design Goals'),
(7, 'Database Systems', 'ER Models, Relational Algebra, SQL, Normalization, Transactions, Indexing', 'B & B+ Trees', 'Query Optimization, Concurrency Control, Recovery'),
(8, 'Computer Networks', 'OSI Model, TCP/IP, Routing, Congestion, Protocols (TCP, UDP, HTTP, FTP, etc.)', 'Hubs, Switches, Firewalls, Network Security (Public/Private Key, Digital Signature)', 'Topologies, Switching Techniques, Layer Functions'),
(9, 'Web & Internet Programming', 'HTML, XML, JavaScript Basics', 'VBScript, CGI, ActiveX, Netscape, RealAudio, Java Internet Integration', 'Servlet, JDBC/ODBC, JSP'),
(10, 'Object Oriented Programming', 'C++, Java Basics, Inheritance, Polymorphism, Exception Handling, Threads', 'JavaScript Objects, DOM Handling', 'Java Swing, Beans, UML, Enterprise JavaBeans'),
(11, 'Software Engineering', 'SDLC, Requirement Analysis, Design, Testing, Maintenance', 'DFDs, Feasibility Analysis', 'UML Modeling, Structured Analysis (JSD, SA/SD)'),
(12, 'General Studies', '—', '—', 'History, Geography, Polity, Economy, Agriculture, Current Affairs, General Science, Math (10th level)'),
(13, 'Workplace Productivity Tools', 'Word, Excel, PowerPoint, Access, Open Office', 'Unicode & File Exchange', '—'),
(14, 'Mental Ability & Reasoning', '—', 'Logical Diagrams, Series, Coding-Decoding, Direction Sense, Reasoning, Arithmetic Reasoning, Visual Memory', '—');

-- --------------------------------------------------------

--
-- Table structure for table `syllabus_topics`
--

CREATE TABLE `syllabus_topics` (
  `id` int(11) NOT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `exam_type` enum('COMON','POLICE','LT') DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `syllabus_topics`
--

INSERT INTO `syllabus_topics` (`id`, `topic_id`, `exam_type`, `description`) VALUES
(1, 1, 'COMON', 'Boolean Algebra, Logic Gates, Combinational & Sequential Circuits, Number Systems'),
(2, 1, 'POLICE', 'Logic functions, Minimization, Design & synthesis, Floating-point arithmetic'),
(3, 1, 'LT', 'Recurrence Relations, Graph Theory'),
(4, 2, 'COMON', 'ALU, Control Unit, Memory Interface, I/O, Pipelining, Cache, Secondary Storage'),
(5, 2, 'POLICE', 'DMA Mode, Machine instructions & addressing'),
(6, 2, 'LT', 'Multicore, Multiprocessor, Instruction Formats'),
(7, 3, 'COMON', 'C Language, Functions, Recursion, Arrays, Stacks, Queues, Linked Lists, Trees'),
(8, 3, 'POLICE', 'Abstract Data Types, Binary Heaps'),
(9, 3, 'LT', 'Red-Black Trees, B Trees, Binomial & Fibonacci Heaps'),
(10, 4, 'COMON', 'Sorting, Searching, Greedy, Divide & Conquer, Dynamic Programming, Graph Traversals'),
(11, 4, 'POLICE', 'Asymptotic Analysis, Complexity Classes (P, NP, etc.)'),
(12, 4, 'LT', 'Advanced techniques: FFT, Backtracking, Branch & Bound, Approximation'),
(13, 5, 'COMON', 'Lexical Analysis, Parsing, Syntax Translation, Intermediate Code, Optimization'),
(14, 5, 'POLICE', 'Runtime environments—Operating System'),
(15, 5, 'LT', ''),
(16, 6, 'COMON', 'Processes, Threads, CPU Scheduling, Memory, File System, I/O, Synchronization, Deadlocks'),
(17, 6, 'POLICE', 'Windows/Unix Commands, Virtual Memory'),
(18, 6, 'LT', 'Shell Programming, OS Design Goals'),
(19, 7, 'COMON', 'ER Models, Relational Algebra, SQL, Normalization, Transactions, Indexing'),
(20, 7, 'POLICE', 'B & B+ Trees'),
(21, 7, 'LT', 'Query Optimization, Concurrency Control, Recovery'),
(22, 8, 'COMON', 'OSI Model, TCP/IP, Routing, Congestion, Protocols (TCP, UDP, HTTP, FTP, etc.)'),
(23, 8, 'POLICE', 'Hubs, Switches, Firewalls, Network Security (Public/Private Key, Digital Signature)'),
(24, 8, 'LT', 'Topologies, Switching Techniques, Layer Functions'),
(25, 9, 'COMON', 'HTML, XML, JavaScript Basics'),
(26, 9, 'POLICE', 'VBScript, CGI, ActiveX, Netscape, RealAudio, Java Internet Integration'),
(27, 9, 'LT', 'Servlet, JDBC/ODBC, JSP'),
(28, 10, 'COMON', 'C++, Java Basics, Inheritance, Polymorphism, Exception Handling, Threads'),
(29, 10, 'POLICE', 'JavaScript Objects, DOM Handling'),
(30, 10, 'LT', 'Java Swing, Beans, UML, Enterprise JavaBeans'),
(31, 11, 'COMON', 'SDLC, Requirement Analysis, Design, Testing, Maintenance'),
(32, 11, 'POLICE', 'DFDs, Feasibility Analysis'),
(33, 11, 'LT', 'UML Modeling, Structured Analysis (JSD, SA/SD)'),
(34, 12, 'COMON', ''),
(35, 12, 'POLICE', 'History, Geography, Polity, Economy, Agriculture, Current Affairs, General Science, Math (10th level)'),
(36, 12, 'LT', ''),
(37, 13, 'COMON', 'Word, Excel, PowerPoint, Access, Open Office'),
(38, 13, 'POLICE', 'Unicode & File Exchange'),
(39, 13, 'LT', ''),
(40, 14, 'COMON', ''),
(41, 14, 'POLICE', 'Logical Diagrams, Series, Coding-Decoding, Direction Sense, Reasoning, Arithmetic Reasoning, Visual Memory'),
(42, 14, 'LT', '');

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `id` int(11) NOT NULL,
  `topic_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`id`, `topic_name`) VALUES
(1, 'Digital Logic & Circuits'),
(2, 'Computer Organization & Architecture'),
(3, 'Programming in C'),
(4, 'Object Oriented Programming'),
(5, 'Data Structures'),
(6, 'Algorithms'),
(7, 'Compiler Design'),
(8, 'Operating System'),
(9, 'Database Systems'),
(10, 'Computer Networks'),
(11, 'Web & Internet Programming'),
(12, 'Software Engineering'),
(13, 'General Studies'),
(14, 'Workplace Productivity Tools'),
(15, 'Mental Ability & Reasoning');

-- --------------------------------------------------------

--
-- Table structure for table `topic_status`
--

CREATE TABLE `topic_status` (
  `id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `is_ready` tinyint(1) DEFAULT 0,
  `comment` text DEFAULT NULL,
  `lt_comment` text DEFAULT NULL,
  `police_comment` text DEFAULT NULL,
  `common_comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `topic_status`
--

INSERT INTO `topic_status` (`id`, `topic_id`, `is_ready`, `comment`, `lt_comment`, `police_comment`, `common_comment`) VALUES
(1, 1, 1, 'its ready, its done', 'Hi, kaisa hainffff', 'hi, this good, hi kkdkd', 'hi its too good, its Too GOod'),
(2, 2, 1, 'ready', 'fghfgfg', NULL, 'nahi aaya'),
(3, 3, 1, 'noww work', NULL, NULL, NULL),
(4, 4, 1, 'Its Done', NULL, 'erdfrrrtr', NULL),
(5, 5, 1, 'Now Its Working,fgfgfgf', NULL, NULL, NULL),
(6, 6, 1, 'sdfsfsdf', NULL, NULL, NULL),
(7, 10, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `youtube_api`
--

CREATE TABLE `youtube_api` (
  `id` int(11) NOT NULL,
  `api` varchar(111) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `youtube_api`
--

INSERT INTO `youtube_api` (`id`, `api`) VALUES
(1, '');

-- --------------------------------------------------------

--
-- Table structure for table `youtube_videos`
--

CREATE TABLE `youtube_videos` (
  `id` int(11) NOT NULL,
  `video_id` varchar(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `channel_name` varchar(255) DEFAULT NULL,
  `video_url` text DEFAULT NULL,
  `thumbnail_url` varchar(255) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `fetched_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `summary` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `topic_tags` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `youtube_videos`
--

INSERT INTO `youtube_videos` (`id`, `video_id`, `title`, `description`, `channel_name`, `video_url`, `thumbnail_url`, `published_at`, `fetched_at`, `summary`, `notes`, `topic_tags`, `slug`) VALUES
(1, '1qcNxnt3UPU', 'UP LT Grade Vacancy 2025 | UP LT Grade Computer Teacher | Computer Digital Logic Number System Day 3', NULL, 'Study with Dheerendra sir', 'https://www.youtube.com/watch?v=1qcNxnt3UPU', NULL, '2025-07-24 10:40:45', '2025-07-24 04:40:27', NULL, NULL, NULL, 'up-lt-grade-vacancy-2025-up-lt-grade-computer-teacher-computer-digital-logic-number-system-day-3'),
(2, 'Ll3PJRNxMrQ', 'UP LT Grade Computer Science Best Book List, Lt Grade Computer Science Eligibility', NULL, 'Pariksha Plus', 'https://www.youtube.com/watch?v=Ll3PJRNxMrQ', NULL, '2025-07-20 12:57:48', '2025-07-24 04:40:27', NULL, NULL, NULL, 'up-lt-grade-computer-science-best-book-list-lt-grade-computer-science-eligibility'),
(3, 'WsA3aYpbaMU', 'UP LT Grade 2025 Computer Science | UP LT Grade Computer Science Syllabus | LT Grade Computer Class', NULL, 'Arora Educator', 'https://www.youtube.com/watch?v=WsA3aYpbaMU', NULL, '2025-07-23 09:50:35', '2025-07-24 04:40:27', NULL, NULL, NULL, 'up-lt-grade-2025-computer-science-up-lt-grade-computer-science-syllabus-lt-grade-computer-class'),
(4, 'H27B5xUpBD8', 'UPPSC LT Grade Computer Teacher 04 Digital Logic Combinational Circuits part 1', NULL, 'Himanshu Kaushik | DigiiMento GATE, NET, CSE Prep', 'https://www.youtube.com/watch?v=H27B5xUpBD8', NULL, '2018-06-27 15:44:19', '2025-07-24 04:40:27', NULL, NULL, NULL, 'uppsc-lt-grade-computer-teacher-04-digital-logic-combinational-circuits-part-1'),
(5, 'QdNFJVPGPKw', 'UP LT GRADE COMPUTER SCIENCE ELIGIBILITY CRITERIA | BTECH (IT) STUDENT ELIGIBLE? #computerscicence', NULL, 'NS CLASSES', 'https://www.youtube.com/watch?v=QdNFJVPGPKw', NULL, '2025-04-20 15:53:24', '2025-07-24 04:40:27', NULL, NULL, NULL, 'up-lt-grade-computer-science-eligibility-criteria-btech-it-student-eligible-computerscicence'),
(6, 'SywqHLxmqAc', 'UP LT GRADE COMPUTER SCIENCE DISCUSS SYLLABUS IN DETAILS WITH EXAM PATTERN #nsclasses #upltgrade', NULL, 'NS CLASSES', 'https://www.youtube.com/watch?v=SywqHLxmqAc', NULL, '2025-04-16 17:13:42', '2025-07-24 04:40:27', NULL, NULL, NULL, 'up-lt-grade-computer-science-discuss-syllabus-in-details-with-exam-pattern-nsclasses-upltgrade'),
(7, '63iUK-BNDQw', 'UP computer teacher Vacancy 2025 || UP LT Grade Computer Science  Syllabus &amp; Eligibility 2025', NULL, 'Pathshala IT Academy ', 'https://www.youtube.com/watch?v=63iUK-BNDQw', NULL, '2025-04-25 10:30:03', '2025-07-24 04:40:27', NULL, NULL, NULL, 'up-computer-teacher-vacancy-2025-up-lt-grade-computer-science-syllabus-amp-eligibility-2025'),
(8, 'JV4g8-1AQ98', 'UP LT Grade Computer Previous year Question, LT Grade Computer Science Eligibility', NULL, 'Pariksha Plus', 'https://www.youtube.com/watch?v=JV4g8-1AQ98', NULL, '2025-07-21 14:39:32', '2025-07-24 04:40:27', NULL, NULL, NULL, 'up-lt-grade-computer-previous-year-question-lt-grade-computer-science-eligibility'),
(9, 'XPhjSNiUjJM', 'UP LT Grade Vacancy 2025 | UP LT Grade Computer Teacher | Computer Network Protocol Questions Day 2', NULL, 'Study with Dheerendra sir', 'https://www.youtube.com/watch?v=XPhjSNiUjJM', NULL, '2025-07-23 00:26:59', '2025-07-24 04:40:27', NULL, NULL, NULL, 'up-lt-grade-vacancy-2025-up-lt-grade-computer-teacher-computer-network-protocol-questions-day-2'),
(10, 'OUHdM9noGNU', 'UP LT Grade Computer Science Cut Off ,Lt Grade computer safe score', NULL, 'Pariksha Plus', 'https://www.youtube.com/watch?v=OUHdM9noGNU', NULL, '2025-07-23 22:28:13', '2025-07-24 04:40:27', NULL, NULL, NULL, 'up-lt-grade-computer-science-cut-off-lt-grade-computer-safe-score'),
(11, '8GLaFqUFChY', 'UP LT Grade 2025 Computer Science | UP LT Grade Computer Science Syllabus | LT Grade Computer Class', NULL, 'Arora Educator', 'https://www.youtube.com/watch?v=8GLaFqUFChY', NULL, '2025-07-19 17:26:13', '2025-07-24 04:55:49', NULL, NULL, NULL, NULL),
(12, 'CyMzxGRl9dk', 'UP LT Grade New Vacancy 2025 | UP LT Grade Computer Science Eligibility , Syllabus | Complete Update', NULL, 'TGT PGT Adda247', 'https://www.youtube.com/watch?v=CyMzxGRl9dk', NULL, '2025-07-20 06:03:26', '2025-07-24 04:55:49', NULL, NULL, NULL, 'up-lt-grade-new-vacancy-2025-up-lt-grade-computer-science-eligibility-syllabus-complete-update'),
(13, 'Tm_N3_ybb1U', 'UP LT Grade Computer Sceince Vacancy 2025 Details | LT Grade Eligibility &amp; Paper Pattern Explained', NULL, 'Teachers Adda247', 'https://www.youtube.com/watch?v=Tm_N3_ybb1U', NULL, '2025-07-19 10:00:05', '2025-07-24 04:55:49', NULL, NULL, NULL, 'up-lt-grade-computer-sceince-vacancy-2025-details-lt-grade-eligibility-amp-paper-pattern-explained'),
(14, 'SudKLJAx0XA', 'UP LT Grade Computer vacancy ,LT grade Computer Previous year Question, programming mcq for lt grade', NULL, 'Pariksha Plus', 'https://www.youtube.com/watch?v=SudKLJAx0XA', NULL, '2025-07-20 02:38:14', '2025-07-24 04:55:49', NULL, NULL, NULL, 'up-lt-grade-computer-vacancy-lt-grade-computer-previous-year-question-programming-mcq-for-lt-grade'),
(15, 'txGlMUeJFNg', 'UP LT Grade 2025 Computer science | Eligibility, Syllabus, Age Limit, Qualification, Exam Date', NULL, 'TGT PGT Adda247', 'https://www.youtube.com/watch?v=txGlMUeJFNg', NULL, '2025-05-02 16:50:18', '2025-07-24 04:55:49', NULL, NULL, NULL, 'up-lt-grade-2025-computer-science-eligibility-syllabus-age-limit-qualification-exam-date'),
(16, 'XznzqWswAdw', 'UP LT Grade Computer Vacancy 2025, Computer science Eligibility, C Programming for lt grade computer', NULL, 'Pariksha Plus', 'https://www.youtube.com/watch?v=XznzqWswAdw', 'https://i.ytimg.com/vi/XznzqWswAdw/hqdefault.jpg', '2025-07-18 14:43:16', '2025-07-24 13:51:04', NULL, NULL, NULL, 'up-lt-grade-computer-vacancy-2025-computer-science-eligibility-c-programming-for-lt-grade-computer'),
(17, 'lPySvjiSCdo', 'UP LT GRADE EDUCATION QUALIFICATION IN Details #nsclasses #computerteacherjobs', NULL, 'Computer Job Updates', 'https://www.youtube.com/watch?v=lPySvjiSCdo', 'https://i.ytimg.com/vi/lPySvjiSCdo/hqdefault.jpg', '2025-07-16 11:45:49', '2025-07-24 13:51:04', NULL, NULL, NULL, 'up-lt-grade-education-qualification-in-details-nsclasses-computerteacherjobs'),
(19, 'XlXdAvi9k2w', 'LT Grade computer science | lt grade Computer Teacher | Computer Fundamentals | Class-02', NULL, 'Teachers Academy', 'https://www.youtube.com/watch?v=XlXdAvi9k2w', 'https://i.ytimg.com/vi/XlXdAvi9k2w/hqdefault.jpg', '2025-07-23 00:44:51', '2025-07-24 14:24:27', NULL, NULL, NULL, 'lt-grade-computer-science-lt-grade-computer-teacher-computer-fundamentals-class-02'),
(20, 'uRg96Ewuxxw', 'UP LT GRADE COMPUTER TEACHER SYLLABUS | UP LT GRADE VACANCY 2025 | UP LT COMPUTER TEACHER SYLLABUS', NULL, 'Study with Dheerendra sir', 'https://www.youtube.com/watch?v=uRg96Ewuxxw', 'https://i.ytimg.com/vi/uRg96Ewuxxw/hqdefault.jpg', '2025-05-06 14:28:00', '2025-07-24 14:25:56', NULL, NULL, NULL, 'up-lt-grade-computer-teacher-syllabus-up-lt-grade-vacancy-2025-up-lt-computer-teacher-syllabus'),
(21, 'Y391xvJzII4', '&#39;Computer Teacher&#39; Eligibility (सभी डाउट खत्म)- UP &#39;LT Grade&#39; teacher vacancy 2025', NULL, 'The MASTER', 'https://www.youtube.com/watch?v=Y391xvJzII4', 'https://i.ytimg.com/vi/Y391xvJzII4/hqdefault.jpg', '2025-07-22 07:55:28', '2025-07-24 14:29:33', NULL, NULL, NULL, '-39-computer-teacher-39-eligibility-up-39-lt-grade-39-teacher-vacancy-2025'),
(22, 'lrGMMrlGOQQ', 'LT Grade New Vacancy 2025 | UP LT Grade Computer Science Previous Year Questions #4 By Neeraj Sir', NULL, 'SuperCoaching TGT & PGT by Testbook', 'https://www.youtube.com/watch?v=lrGMMrlGOQQ', 'https://i.ytimg.com/vi/lrGMMrlGOQQ/hqdefault_live.jpg', '2025-07-24 12:11:43', '2025-07-24 14:32:14', NULL, NULL, NULL, 'lt-grade-new-vacancy-2025-up-lt-grade-computer-science-previous-year-questions-4-by-neeraj-sir'),
(23, '3BYGfanKrXw', 'UP LT GRADE 2025 COMPUTER ELEGIBILTY | कंप्यूटर से फ़ार्म कौन भर सकता है | LT COMPUTER SCIENCE INFO', NULL, 'Exam Master', 'https://www.youtube.com/watch?v=3BYGfanKrXw', 'https://i.ytimg.com/vi/3BYGfanKrXw/hqdefault.jpg', '2025-07-21 02:01:31', '2025-07-24 14:55:13', NULL, NULL, NULL, 'up-lt-grade-2025-computer-elegibilty-lt-computer-science-info'),
(24, 'W8YKFNJ2i6c', 'Computer Anudeshak | Computer Teacher | UP LT GRADE | BCI | SCI | DSA | Data Structures &amp; Algorithms', NULL, 'CompAcademy', 'https://www.youtube.com/watch?v=W8YKFNJ2i6c', 'https://i.ytimg.com/vi/W8YKFNJ2i6c/hqdefault_live.jpg', '2025-07-24 14:53:44', '2025-07-24 15:24:44', NULL, NULL, NULL, 'computer-anudeshak-computer-teacher-up-lt-grade-bci-sci-dsa-data-structures-amp-algorithms'),
(25, 'g_VSyk6mXf4', 'LT Grade New Vacancy 2025 | UP LT Grade Computer Science Previous Year Questions #3 By Neeraj Sir', NULL, 'SuperCoaching TGT & PGT by Testbook', 'https://www.youtube.com/watch?v=g_VSyk6mXf4', 'https://i.ytimg.com/vi/g_VSyk6mXf4/hqdefault.jpg', '2025-07-22 05:26:47', '2025-07-24 15:37:53', NULL, NULL, NULL, 'lt-grade-new-vacancy-2025-up-lt-grade-computer-science-previous-year-questions-3-by-neeraj-sir'),
(26, 'iteq_XoDdJQ', 'UP LT Grade Vacancy 2025 | UP LT Grade Computer Teacher | Computer OSI Model Questions #1', NULL, 'Study with Dheerendra sir', 'https://www.youtube.com/watch?v=iteq_XoDdJQ', 'https://i.ytimg.com/vi/iteq_XoDdJQ/hqdefault.jpg', '2025-07-22 00:32:22', '2025-07-24 16:57:42', NULL, NULL, NULL, 'up-lt-grade-vacancy-2025-up-lt-grade-computer-teacher-computer-osi-model-questions-1'),
(31, 'z25dGsxhu5M', 'UP LT Grade 2025 Computer Science | UP LT Grade Computer Science Syllabus | LT Grade Computer Class', NULL, 'Arora Educator', 'https://www.youtube.com/watch?v=z25dGsxhu5M', 'https://i.ytimg.com/vi/z25dGsxhu5M/hqdefault.jpg', '2025-07-24 04:30:49', '2025-07-24 21:41:42', NULL, NULL, NULL, 'up-lt-grade-2025-computer-science-up-lt-grade-computer-science-syllabus-lt-grade-computer-class-xhu5M'),
(32, 'oTsngqhxMCI', 'UP Police 👮‍♀️ Programmer Exam Pattern &amp; Preparation Guidance | Exam की तैयारी कैसे करें', NULL, 'Gate Smashers', 'https://www.youtube.com/watch?v=oTsngqhxMCI', 'https://i.ytimg.com/vi/oTsngqhxMCI/hqdefault.jpg', '2024-02-05 06:30:12', '2025-07-24 22:06:52', NULL, NULL, NULL, 'up-police-programmer-exam-pattern-amp-preparation-guidance-exam-hxMCI'),
(33, 'MWOMzyYo87Q', 'UP Police Computer Programmer Grade 2 Job Profile | Exam Pattern &amp; Syllabus, Salary, Promotion #upp', NULL, 'Vineesh Madaan UPP', 'https://www.youtube.com/watch?v=MWOMzyYo87Q', 'https://i.ytimg.com/vi/MWOMzyYo87Q/hqdefault.jpg', '2024-08-04 12:30:10', '2025-07-24 22:06:52', NULL, NULL, NULL, 'up-police-computer-programmer-grade-2-job-profile-exam-pattern-amp-syllabus-salary-promotion-upp-Yo87Q'),
(34, '7BYqCY8MuhY', 'UP Police Programmer Grade 2 Qualification? Eligibility? Age Limit? Exam Pattern? Syllabus? Salary?', NULL, 'Pariksha Plus', 'https://www.youtube.com/watch?v=7BYqCY8MuhY', 'https://i.ytimg.com/vi/7BYqCY8MuhY/hqdefault.jpg', '2023-05-29 16:09:42', '2025-07-24 22:06:52', NULL, NULL, NULL, 'up-police-programmer-grade-2-qualification-eligibility-age-limit-exam-pattern-syllabus-salary-8MuhY'),
(35, 'rPWbkBfP0h4', 'UP Police Programmer Grade 2 2024 Notification Out Vacancy, Exam Pattern,Syllabus, Eligibility', NULL, 'Exam with Arihant', 'https://www.youtube.com/watch?v=rPWbkBfP0h4', 'https://i.ytimg.com/vi/rPWbkBfP0h4/hqdefault.jpg', '2023-12-30 08:12:17', '2025-07-24 22:06:52', NULL, NULL, NULL, 'up-police-programmer-grade-2-2024-notification-out-vacancy-exam-pattern-syllabus-eligibility-fP0h4'),
(36, 'czPwRj0yew4', 'UP Police Programmer Syllabus | Up police programmer Latest Vacancies', NULL, 'TechTalk With AR', 'https://www.youtube.com/watch?v=czPwRj0yew4', 'https://i.ytimg.com/vi/czPwRj0yew4/hqdefault.jpg', '2024-01-06 11:00:51', '2025-07-24 22:06:52', NULL, NULL, NULL, 'up-police-programmer-syllabus-up-police-programmer-latest-vacancies-0yew4'),
(37, 'dCrG39wdDSE', 'UP Police Computer Operator / Programmer Recruitment 2023', NULL, 'STUDY247', 'https://www.youtube.com/watch?v=dCrG39wdDSE', 'https://i.ytimg.com/vi/dCrG39wdDSE/hqdefault.jpg', '2024-01-02 18:32:44', '2025-07-24 22:06:52', NULL, NULL, NULL, 'up-police-computer-operator-programmer-recruitment-2023-wdDSE'),
(38, 'L37AGYLdi88', 'UP Police Programmer Grade 2 Notification 2023 | UP Police Programmer Grade 2 Syllabus &amp; Course |', NULL, 'Arora Educator', 'https://www.youtube.com/watch?v=L37AGYLdi88', 'https://i.ytimg.com/vi/L37AGYLdi88/hqdefault.jpg', '2023-12-30 14:48:49', '2025-07-24 22:06:52', NULL, NULL, NULL, 'up-police-programmer-grade-2-notification-2023-up-police-programmer-grade-2-syllabus-amp-course-Ldi88'),
(39, 'vSz4M8uCFRk', 'Computer Operator Grade B Promoted #computeroperator #uppolice #promotion #sarkarinaukri', NULL, 'KnowledgeBooster', 'https://www.youtube.com/watch?v=vSz4M8uCFRk', 'https://i.ytimg.com/vi/vSz4M8uCFRk/hqdefault.jpg', '2025-01-01 12:03:42', '2025-07-24 22:06:52', NULL, NULL, NULL, 'computer-operator-grade-b-promoted-computeroperator-uppolice-promotion-sarkarinaukri-uCFRk'),
(40, 'U7epjo-M09U', 'Class 05 DEMO CLASS  | MATHS NUMBER SYSTEM | UP LT GRADE COMPUTER TEACHER  | RK Sir', NULL, '  Param Classes ', 'https://www.youtube.com/watch?v=U7epjo-M09U', 'https://i.ytimg.com/vi/U7epjo-M09U/hqdefault.jpg', '2025-07-23 21:27:46', '2025-07-24 22:06:52', NULL, NULL, NULL, 'class-05-demo-class-maths-number-system-up-lt-grade-computer-teacher-rk-sir--M09U'),
(41, 'BgwOt9yx2HI', 'UP POLICE PROGRAMMER SYLLABUS and PREPARATION STRETAGY by CJ Sir by CJ Sir', NULL, 'Unacademy GATE CSIT & DA', 'https://www.youtube.com/watch?v=BgwOt9yx2HI', 'https://i.ytimg.com/vi/BgwOt9yx2HI/hqdefault.jpg', '2024-02-05 10:45:10', '2025-07-24 22:06:52', NULL, NULL, NULL, 'up-police-programmer-syllabus-and-preparation-stretagy-by-cj-sir-by-cj-sir-yx2HI'),
(42, '-jJLrmh63SQ', 'UP POLICE PROGRAMMER GRADE-2 SYLLABUS AND EXAM PATTERN. FULL DETAILS #rojgarwithankit', NULL, 'UP COP R K Tiwari', 'https://www.youtube.com/watch?v=-jJLrmh63SQ', 'https://i.ytimg.com/vi/-jJLrmh63SQ/hqdefault.jpg', '2024-01-06 18:53:18', '2025-07-24 22:09:57', NULL, NULL, NULL, 'up-police-programmer-grade-2-syllabus-and-exam-pattern-full-details-rojgarwithankit-h63SQ'),
(43, 'f1Q0gY8MS2c', 'UP LT Grade New Vacancy 2025 🔥 | LT Grade Teacher Bharti Latest News! | Big Update by Prashank Sir', NULL, 'Teachers Adda247', 'https://www.youtube.com/watch?v=f1Q0gY8MS2c', 'https://i.ytimg.com/vi/f1Q0gY8MS2c/hqdefault.jpg', '2025-07-24 12:35:05', '2025-07-24 22:11:08', NULL, NULL, NULL, 'up-lt-grade-new-vacancy-2025-lt-grade-teacher-bharti-latest-news-big-update-by-prashank-sir-8MS2c'),
(44, 'y0VPJacBDls', 'Computer teacher Interview in Hindi | Computer Anudeshak | Computer Instructor | PD Classes', NULL, 'PD Classes 【Manoj Sharma】', 'https://www.youtube.com/watch?v=y0VPJacBDls', 'https://i.ytimg.com/vi/y0VPJacBDls/hqdefault.jpg', '2022-04-02 10:57:12', '2025-07-24 22:11:08', NULL, NULL, NULL, 'computer-teacher-interview-in-hindi-computer-anudeshak-computer-instructor-pd-classes-cBDls'),
(45, 'mlOV79EUk0s', 'If You Want to Become a Computer Teacher, Do These 3 Things | How to Become Computer Teacher', NULL, 'DOTNET Institute', 'https://www.youtube.com/watch?v=mlOV79EUk0s', 'https://i.ytimg.com/vi/mlOV79EUk0s/hqdefault.jpg', '2023-12-26 07:30:12', '2025-07-24 22:11:08', NULL, NULL, NULL, 'if-you-want-to-become-a-computer-teacher-do-these-3-things-how-to-become-computer-teacher-EUk0s'),
(46, '1ddxEPqQE-4', 'BPSC TRE Computer Teacher Vacancy 2025 | BPSC TRE 4.0 Computer Teacher Eligibility #Shorts #BPSCTRE4', NULL, 'Teaching Wallah', 'https://www.youtube.com/watch?v=1ddxEPqQE-4', 'https://i.ytimg.com/vi/1ddxEPqQE-4/hqdefault.jpg', '2024-12-24 11:36:37', '2025-07-24 22:11:08', NULL, NULL, NULL, 'bpsc-tre-computer-teacher-vacancy-2025-bpsc-tre-4-0-computer-teacher-eligibility-shorts-bpsctre4-qQE-4'),
(47, 'fZmG0RECeMw', 'BPSC TRE 4.0 | STET-2 | LT Grade 2025 🔥 Computer | Introduction class | By shahna Mam', NULL, 'Bihar Shikshak Adda247', 'https://www.youtube.com/watch?v=fZmG0RECeMw', 'https://i.ytimg.com/vi/fZmG0RECeMw/hqdefault.jpg', '2025-07-24 06:30:36', '2025-07-24 22:11:08', NULL, NULL, NULL, 'bpsc-tre-4-0-stet-2-lt-grade-2025-computer-introduction-class-by-shahna-mam-ECeMw'),
(48, '6EFUVLdtIKM', 'CCC Full Information A to Z | Syllabus, Exam pattern etc. #shorts #viralvideo #trending', NULL, 'Smarter IQ', 'https://www.youtube.com/watch?v=6EFUVLdtIKM', 'https://i.ytimg.com/vi/6EFUVLdtIKM/hqdefault.jpg', '2023-10-18 13:26:21', '2025-07-24 22:11:08', NULL, NULL, NULL, 'ccc-full-information-a-to-z-syllabus-exam-pattern-etc-shorts-viralvideo-trending-dtIKM'),
(49, 'cTFg5P8VfsQ', 'UP LT GRADE 2025 | LT GRADE Computer Teacher Eligibility Latest News l Computer Science By Vivek Sir', NULL, 'TGT PGT Adda247', 'https://www.youtube.com/watch?v=cTFg5P8VfsQ', 'https://i.ytimg.com/vi/cTFg5P8VfsQ/hqdefault.jpg', '2025-04-24 21:18:13', '2025-07-24 22:19:01', NULL, NULL, NULL, 'up-lt-grade-2025-lt-grade-computer-teacher-eligibility-latest-news-l-computer-science-by-vivek-sir-8VfsQ'),
(50, 'GJTHNYFGK9g', 'UP LT Grade 2025 | Computer 💻 | Introduction Class | Selection की शुरुआत यहीं से | By Vivek Sir', NULL, 'TGT PGT Adda247', 'https://www.youtube.com/watch?v=GJTHNYFGK9g', 'https://i.ytimg.com/vi/GJTHNYFGK9g/hqdefault.jpg', '2025-07-22 03:08:15', '2025-07-24 22:19:01', NULL, NULL, NULL, 'up-lt-grade-2025-computer-introduction-class-selection-by-vivek-sir-FGK9g'),
(51, 'kHG6XCiT_hk', 'UP LT Grade Teacher PGT Computer Science Recruitment', NULL, 'NTA UGC NET Computer Science CSE', 'https://www.youtube.com/watch?v=kHG6XCiT_hk', 'https://i.ytimg.com/vi/kHG6XCiT_hk/hqdefault.jpg', '2022-07-11 04:21:43', '2025-07-24 22:19:01', NULL, NULL, NULL, 'up-lt-grade-teacher-pgt-computer-science-recruitment-iT_hk'),
(52, 'RoVmjvnT67c', 'UP LT Grade Computer High Court Update ⚖️ | B.Tech (IT) &amp; B.Sc (IT) New Update 🔥 UPPSC Latest News', NULL, 'Pariksha Plus', 'https://www.youtube.com/watch?v=RoVmjvnT67c', 'https://i.ytimg.com/vi/RoVmjvnT67c/hqdefault.jpg', '2025-07-22 11:32:28', '2025-07-24 22:19:01', NULL, NULL, NULL, 'up-lt-grade-computer-high-court-update-b-tech-it-amp-b-sc-it-new-update-uppsc-latest-news-nT67c'),
(53, 'Nv9kUF_IKFE', 'UP LT GRADE COMPUTER SCIENCE PYQ | COMPLETE ANALYSIS | IMPORTANT SUBJECT #nsclasses #upltgrade #cs', NULL, 'NS CLASSES', 'https://www.youtube.com/watch?v=Nv9kUF_IKFE', 'https://i.ytimg.com/vi/Nv9kUF_IKFE/hqdefault.jpg', '2025-04-30 15:56:08', '2025-07-24 22:19:01', NULL, NULL, NULL, 'up-lt-grade-computer-science-pyq-complete-analysis-important-subject-nsclasses-upltgrade-cs-_IKFE'),
(54, 'TSWXfD_Fdgc', 'LT Grade computer science | lt grade Computer Teacher | अपना स्कोर किन तरीकों से बढ़ा सकते है', NULL, 'Teachers Academy', 'https://www.youtube.com/watch?v=TSWXfD_Fdgc', 'https://i.ytimg.com/vi/TSWXfD_Fdgc/hqdefault.jpg', '2025-07-20 00:06:36', '2025-07-24 22:19:01', NULL, NULL, NULL, 'lt-grade-computer-science-lt-grade-computer-teacher-_Fdgc'),
(55, 'UAXAoCINa7I', 'UP LT Grade New Vacancy 2025 | UP LT Grade Computer Science  Syllabus &amp; Eligibility 2025 |Sanjay Sir', NULL, 'Pathshala IT Academy ', 'https://www.youtube.com/watch?v=UAXAoCINa7I', 'https://i.ytimg.com/vi/UAXAoCINa7I/hqdefault.jpg', '2025-04-24 10:35:50', '2025-07-24 22:19:01', NULL, NULL, NULL, 'up-lt-grade-new-vacancy-2025-up-lt-grade-computer-science-syllabus-amp-eligibility-2025-sanjay-sir-INa7I'),
(56, '6AR2rou9TDk', 'Latest Update | UP LT GRADE COMPUTER TEACHER | Eligibility | POST | NEW Syllabus | Selection Plan', NULL, '  Param Classes ', 'https://www.youtube.com/watch?v=6AR2rou9TDk', 'https://i.ytimg.com/vi/6AR2rou9TDk/hqdefault.jpg', '2025-07-19 13:14:52', '2025-07-24 22:19:01', NULL, NULL, NULL, 'latest-update-up-lt-grade-computer-teacher-eligibility-post-new-syllabus-selection-plan-u9TDk'),
(57, 'csYri4lKuuI', 'LT Grade Computer 2025 C Programming , LT Grade Computer science Eligibility ,Syllabus', NULL, 'Pariksha Plus', 'https://www.youtube.com/watch?v=csYri4lKuuI', 'https://i.ytimg.com/vi/csYri4lKuuI/hqdefault.jpg', '2025-07-16 14:41:55', '2025-07-24 22:19:01', NULL, NULL, NULL, 'lt-grade-computer-2025-c-programming-lt-grade-computer-science-eligibility-syllabus-lKuuI'),
(58, 'POZBrPPc9jE', 'UP Teacher Vacancy 2025 New Niyamawali | UP LT Grade Computer Teacher Syllabus, Preparation Strategy', NULL, 'KAUTILYA TECHNICAL CLASSES', 'https://www.youtube.com/watch?v=POZBrPPc9jE', 'https://i.ytimg.com/vi/POZBrPPc9jE/hqdefault.jpg', '2025-04-27 16:08:24', '2025-07-24 22:19:01', NULL, NULL, NULL, 'up-teacher-vacancy-2025-new-niyamawali-up-lt-grade-computer-teacher-syllabus-preparation-strategy-Pc9jE'),
(59, 'hQ-uDtM_BMY', 'UP LT GRADE Computer Teacher best Book | Best Book for UP Computer Science  | UP Computer Best Books', NULL, 'Triloki IndIAwAle', 'https://www.youtube.com/watch?v=hQ-uDtM_BMY', 'https://i.ytimg.com/vi/hQ-uDtM_BMY/hqdefault.jpg', '2025-07-20 03:30:29', '2025-07-24 22:19:01', NULL, NULL, NULL, 'up-lt-grade-computer-teacher-best-book-best-book-for-up-computer-science-up-computer-best-books-M_BMY'),
(60, 'CVR1YyqgY7U', 'UP Computer Teacher Paper Solution | UPPSC LT Grade Computer Teacher 2025', NULL, 'infique classes', 'https://www.youtube.com/watch?v=CVR1YyqgY7U', 'https://i.ytimg.com/vi/CVR1YyqgY7U/hqdefault.jpg', '2025-05-10 05:05:38', '2025-07-24 22:19:01', NULL, NULL, NULL, 'up-computer-teacher-paper-solution-uppsc-lt-grade-computer-teacher-2025-qgY7U'),
(61, '3HHar6uJPKQ', 'UP LT GRADE | COMPUTER SCIENCE | DEMO CLASS-1 | BY SHAILESH SIR | NEW BATCH || EUREKA ACADEMY ||', NULL, 'EUREKA ACADEMY', 'https://www.youtube.com/watch?v=3HHar6uJPKQ', 'https://i.ytimg.com/vi/3HHar6uJPKQ/hqdefault.jpg', '2025-07-24 00:11:30', '2025-07-24 22:27:18', NULL, NULL, NULL, 'up-lt-grade-computer-science-demo-class-1-by-shailesh-sir-new-batch-eureka-academy-uJPKQ'),
(62, 'jTY1SAwa1x0', 'UP Lt grade computer science', NULL, 'Satyam Singh 🇮🇳', 'https://www.youtube.com/watch?v=jTY1SAwa1x0', 'https://i.ytimg.com/vi/jTY1SAwa1x0/hqdefault.jpg', '2021-12-14 16:51:22', '2025-07-24 22:27:18', NULL, NULL, NULL, 'up-lt-grade-computer-science-wa1x0'),
(63, 'pLZ4rsB07m8', 'UP LT GRADE COMPUTER SCIENCE VACANCY 2025 | COMPLETE ROADMAP| #nsclasses #pgtcomputerscience', NULL, 'NS CLASSES', 'https://www.youtube.com/watch?v=pLZ4rsB07m8', 'https://i.ytimg.com/vi/pLZ4rsB07m8/hqdefault.jpg', '2025-04-28 10:03:26', '2025-07-24 22:27:18', NULL, NULL, NULL, 'up-lt-grade-computer-science-vacancy-2025-complete-roadmap-nsclasses-pgtcomputerscience-B07m8'),
(64, 'um6sr2cJtvE', 'UP LT Grade 2025 Computer Science | UP LT Grade Computer Science Syllabus | CS Class By Shahna Ma&#39;am', NULL, 'TGT PGT Adda247', 'https://www.youtube.com/watch?v=um6sr2cJtvE', 'https://i.ytimg.com/vi/um6sr2cJtvE/hqdefault.jpg', '2025-07-17 15:22:39', '2025-07-24 22:27:18', NULL, NULL, NULL, 'up-lt-grade-2025-computer-science-up-lt-grade-computer-science-syllabus-cs-class-by-shahna-ma-39-am-cJtvE'),
(65, 'xt7pbqW6eJc', 'UP LT grade vacancy 2025 | UPPSC LT GRADE COMPUTER TEACHER Eligibility, up lt grade latest news', NULL, 'Guider', 'https://www.youtube.com/watch?v=xt7pbqW6eJc', 'https://i.ytimg.com/vi/xt7pbqW6eJc/hqdefault.jpg', '2025-04-20 10:14:24', '2025-07-24 22:31:27', NULL, NULL, NULL, 'up-lt-grade-vacancy-2025-uppsc-lt-grade-computer-teacher-eligibility-up-lt-grade-latest-news-W6eJc'),
(66, 'c2Nyt8oMOPE', 'UP LT Grade New Vacancy 2025 | LT Grade 2025 सबसे कठिन परीक्षा | क्यों बढ़ गया Competition इस बार?', NULL, 'Teachers Adda247', 'https://www.youtube.com/watch?v=c2Nyt8oMOPE', 'https://i.ytimg.com/vi/c2Nyt8oMOPE/hqdefault.jpg', '2025-07-22 16:00:06', '2025-07-24 22:31:27', NULL, NULL, NULL, 'up-lt-grade-new-vacancy-2025-lt-grade-2025-competition-oMOPE'),
(67, '4SlYjmbnGbk', 'LT Grade computer science  | lt grade computer | Computer Teacher  ,Syllabus ,Pattern', NULL, 'Teachers Academy', 'https://www.youtube.com/watch?v=4SlYjmbnGbk', 'https://i.ytimg.com/vi/4SlYjmbnGbk/hqdefault.jpg', '2025-07-15 11:56:04', '2025-07-24 22:35:00', NULL, NULL, NULL, 'lt-grade-computer-science-lt-grade-computer-computer-teacher-syllabus-pattern-bnGbk'),
(68, 'lfiTb3pagm0', 'UP LT Grade Computer Science Syllabus 2025 | UP TGT Computer Science Syllabus 2025', NULL, 'target in goal', 'https://www.youtube.com/watch?v=lfiTb3pagm0', 'https://i.ytimg.com/vi/lfiTb3pagm0/hqdefault.jpg', '2025-04-25 05:30:25', '2025-07-24 22:35:00', NULL, NULL, NULL, 'up-lt-grade-computer-science-syllabus-2025-up-tgt-computer-science-syllabus-2025-pagm0'),
(69, 'xlx0dERy9vU', 'LT grade teacher computer science , Syllabus, book list , Paper Pattern #ltgradeteacher  #computer', NULL, 'Educational Addiction', 'https://www.youtube.com/watch?v=xlx0dERy9vU', 'https://i.ytimg.com/vi/xlx0dERy9vU/hqdefault.jpg', '2024-02-23 04:34:13', '2025-07-24 22:35:00', NULL, NULL, NULL, 'lt-grade-teacher-computer-science-syllabus-book-list-paper-pattern-ltgradeteacher-computer-Ry9vU'),
(70, 'qbJotLEt7d0', 'LT Grade Teacher| Syllabus of Computer Science(कंप्यूटर साइंस)', NULL, 'YOGESH KUMAR YADUVANSHI ', 'https://www.youtube.com/watch?v=qbJotLEt7d0', 'https://i.ytimg.com/vi/qbJotLEt7d0/hqdefault.jpg', '2017-12-10 19:22:15', '2025-07-24 22:35:00', NULL, NULL, NULL, 'lt-grade-teacher-syllabus-of-computer-science-Et7d0'),
(71, 'yImUgoC81UA', 'UP LT GRADE COMPUTER TEACHER | EXAM PATTERN | EXAM LEVEL #nsclasses #upltgradecrashcourse', NULL, 'NS CLASSES', 'https://www.youtube.com/watch?v=yImUgoC81UA', 'https://i.ytimg.com/vi/yImUgoC81UA/hqdefault.jpg', '2025-07-16 13:19:33', '2025-07-24 22:35:00', NULL, NULL, NULL, 'up-lt-grade-computer-teacher-exam-pattern-exam-level-nsclasses-upltgradecrashcourse-C81UA'),
(72, '2R25JkuVvLA', 'UP LT GRADE 2025 EXAM PATTERN बदलाव ? PRE+MAINS  #ltgradenotification', NULL, 'SuperCoaching TGT & PGT by Testbook', 'https://www.youtube.com/watch?v=2R25JkuVvLA', 'https://i.ytimg.com/vi/2R25JkuVvLA/hqdefault.jpg', '2025-04-18 10:30:05', '2025-07-24 22:35:00', NULL, NULL, NULL, 'up-lt-grade-2025-exam-pattern-pre-mains-ltgradenotification-uVvLA'),
(73, 'k1Sum9Yn7ek', 'Lt Grade Computer Science class &quot;Detailed Syllabus Discussion&quot; |Lt grade 2025 computer science', NULL, 'PARTH EDUCATION', 'https://www.youtube.com/watch?v=k1Sum9Yn7ek', 'https://i.ytimg.com/vi/k1Sum9Yn7ek/hqdefault.jpg', '2025-07-20 20:46:29', '2025-07-24 22:35:00', NULL, NULL, NULL, 'lt-grade-computer-science-class-quot-detailed-syllabus-discussion-quot-lt-grade-2025-computer-science-Yn7ek'),
(74, 'QDephESePVI', 'LT Grade New Vacancy 2025 | UP LT Grade Preparation 2025 | LT Grade Preparation Strategy 2025', NULL, 'Teaching by Rojgar with Ankit', 'https://www.youtube.com/watch?v=QDephESePVI', 'https://i.ytimg.com/vi/QDephESePVI/hqdefault.jpg', '2025-07-14 13:41:01', '2025-07-24 22:35:00', NULL, NULL, NULL, 'lt-grade-new-vacancy-2025-up-lt-grade-preparation-2025-lt-grade-preparation-strategy-2025-SePVI'),
(75, 'U2JgWYvGzCE', 'UP Computer Teacher LT Grade 2 Syllabus | पास होने की रणनीति | Exam Strategy 2025 By Er. Sanjay Sir', NULL, 'Pathshala IT Academy ', 'https://www.youtube.com/watch?v=U2JgWYvGzCE', 'https://i.ytimg.com/vi/U2JgWYvGzCE/hqdefault.jpg', '2025-07-17 13:13:09', '2025-07-24 22:35:00', NULL, NULL, NULL, 'up-computer-teacher-lt-grade-2-syllabus-exam-strategy-2025-by-er-sanjay-sir-vGzCE'),
(76, 'mNG3smdZHmc', 'UP LT Grade syllabus 2025 | LT Grade Teacher syllabus 2025 in hindi', NULL, 'anuj gs academy', 'https://www.youtube.com/watch?v=mNG3smdZHmc', 'https://i.ytimg.com/vi/mNG3smdZHmc/hqdefault.jpg', '2024-10-27 14:52:59', '2025-07-24 22:35:46', NULL, NULL, NULL, 'up-lt-grade-syllabus-2025-lt-grade-teacher-syllabus-2025-in-hindi-dZHmc'),
(77, 'dlK70v7GwsI', 'UP LT Grade Computer Teacher Syllabus | UP LT Grade Computer Book | UP LT Grade syllabus 2025 &amp; Book', NULL, 'RozgarLogic CS – Triloki IndIAwAle', 'https://www.youtube.com/watch?v=dlK70v7GwsI', 'https://i.ytimg.com/vi/dlK70v7GwsI/hqdefault.jpg', '2025-07-17 10:02:15', '2025-07-24 22:35:46', NULL, NULL, NULL, 'up-lt-grade-computer-teacher-syllabus-up-lt-grade-computer-book-up-lt-grade-syllabus-2025-amp-book-7GwsI'),
(78, 'LSw3MyVHXBQ', 'LT Grade Home Science 2025 Vacancy 🔥 Subject Combination का Final Update | UP LT Grade Eligibility', NULL, 'Teachers Adda247', 'https://www.youtube.com/watch?v=LSw3MyVHXBQ', 'https://i.ytimg.com/vi/LSw3MyVHXBQ/hqdefault.jpg', '2025-07-23 17:45:06', '2025-07-24 22:35:46', NULL, NULL, NULL, 'lt-grade-home-science-2025-vacancy-subject-combination-final-update-up-lt-grade-eligibility-VHXBQ'),
(79, 'UNO402OAfPs', 'UP Teacher Vacancy Out | Age, Eligibility, Pattern for LT Grade 2025 #himanshisingh', NULL, 'Himanshi Singh', 'https://www.youtube.com/watch?v=UNO402OAfPs', 'https://i.ytimg.com/vi/UNO402OAfPs/hqdefault.jpg', '2025-07-17 04:00:13', '2025-07-24 22:35:46', NULL, NULL, NULL, 'up-teacher-vacancy-out-age-eligibility-pattern-for-lt-grade-2025-himanshisingh-OAfPs'),
(80, 'UqRoLg-XxEo', 'UP LT Grade New Vacancy 2025 New Notice OUT ⚠️ | Age Limit Changed in UP LT Grade Bharti 2025!', NULL, 'Teachers Adda247', 'https://www.youtube.com/watch?v=UqRoLg-XxEo', 'https://i.ytimg.com/vi/UqRoLg-XxEo/hqdefault.jpg', '2025-07-24 13:30:05', '2025-07-24 22:36:37', NULL, NULL, NULL, 'up-lt-grade-new-vacancy-2025-new-notice-out-age-limit-changed-in-up-lt-grade-bharti-2025--XxEo'),
(81, 'lyBlAAAUfSE', 'UP LT Grade Computer Teacher Eligibility | UP LT Grade New Vacancy 2025 | UP Teacher Vacancy Update', NULL, 'Teaching Wallah', 'https://www.youtube.com/watch?v=lyBlAAAUfSE', 'https://i.ytimg.com/vi/lyBlAAAUfSE/hqdefault.jpg', '2025-05-02 10:00:52', '2025-07-24 22:40:03', NULL, NULL, NULL, 'up-lt-grade-computer-teacher-eligibility-up-lt-grade-new-vacancy-2025-up-teacher-vacancy-update-AUfSE'),
(82, 'Y7zVfhJlcd0', 'UP LT Grade Teacher Salary 2025 | LT Grade Teacher Job Profile Working Time, Promotion , Posting', NULL, 'Pariksha Plus', 'https://www.youtube.com/watch?v=Y7zVfhJlcd0', 'https://i.ytimg.com/vi/Y7zVfhJlcd0/hqdefault.jpg', '2025-07-23 09:55:24', '2025-07-24 22:40:21', NULL, NULL, NULL, 'up-lt-grade-teacher-salary-2025-lt-grade-teacher-job-profile-working-time-promotion-posting-Jlcd0'),
(83, 'k2PGkxP_CLI', 'UP LT Grade New Vacancy 2025 | UP TeacherVacancy Latest News | LT Grade Teacher Eligibility in UP', NULL, 'DIGITAL GK CLASSES', 'https://www.youtube.com/watch?v=k2PGkxP_CLI', 'https://i.ytimg.com/vi/k2PGkxP_CLI/hqdefault.jpg', '2025-07-23 08:41:48', '2025-07-24 22:40:21', NULL, NULL, NULL, 'up-lt-grade-new-vacancy-2025-up-teachervacancy-latest-news-lt-grade-teacher-eligibility-in-up-P_CLI'),
(84, 'VcHwwbCpPRA', 'UP LT Grade New Vacancy 2025 Registration Start | हजारों छात्र बाहर | LT Grade Teacher Eligibility', NULL, 'Teachers Adda247', 'https://www.youtube.com/watch?v=VcHwwbCpPRA', 'https://i.ytimg.com/vi/VcHwwbCpPRA/hqdefault.jpg', '2025-07-22 10:50:36', '2025-07-24 22:40:21', NULL, NULL, NULL, 'up-lt-grade-new-vacancy-2025-registration-start-lt-grade-teacher-eligibility-CpPRA'),
(85, 'YwPeXEFbvP4', 'LT GRADE शिक्षक भर्ती 2025, Computer teacher बनना आसान है , LT grade computer teacher cut off', NULL, 'CP Smart Classes', 'https://www.youtube.com/watch?v=YwPeXEFbvP4', 'https://i.ytimg.com/vi/YwPeXEFbvP4/hqdefault.jpg', '2025-07-22 20:10:54', '2025-07-24 22:40:21', NULL, NULL, NULL, 'lt-grade-2025-computer-teacher-lt-grade-computer-teacher-cut-off-FbvP4'),
(86, 'ujV8svzsmiU', 'UP LT Grade New Vacancy 2025 | UP Teacher Vacancy Latest News | LT Grade Teacher Eligibility in UP', NULL, 'Teaching by Rojgar with Ankit', 'https://www.youtube.com/watch?v=ujV8svzsmiU', 'https://i.ytimg.com/vi/ujV8svzsmiU/hqdefault.jpg', '2025-07-20 13:20:21', '2025-07-24 22:40:21', NULL, NULL, NULL, 'up-lt-grade-new-vacancy-2025-up-teacher-vacancy-latest-news-lt-grade-teacher-eligibility-in-up-zsmiU'),
(87, 'nR4f1ZOBx28', 'What Is LT Grade Teacher ? LT Grade Teacher Eligibility In UP | How To Prepare For LT Grade Teacher', NULL, 'Teachers Adda247', 'https://www.youtube.com/watch?v=nR4f1ZOBx28', 'https://i.ytimg.com/vi/nR4f1ZOBx28/hqdefault.jpg', '2025-07-17 15:20:06', '2025-07-24 22:40:21', NULL, NULL, NULL, 'what-is-lt-grade-teacher-lt-grade-teacher-eligibility-in-up-how-to-prepare-for-lt-grade-teacher-OBx28'),
(88, 'NmU0V4uuKBo', 'Expected UP LT Grade 2025 Subject Wise Vacancy #ltgrade #subject #uppsc #vacancy #teacher', NULL, 'TRE TRIBE - Teacher Recruitment Examination Tribe', 'https://www.youtube.com/watch?v=NmU0V4uuKBo', 'https://i.ytimg.com/vi/NmU0V4uuKBo/hqdefault.jpg', '2025-07-17 07:47:00', '2025-07-24 22:40:21', NULL, NULL, NULL, 'expected-up-lt-grade-2025-subject-wise-vacancy-ltgrade-subject-uppsc-vacancy-teacher-uuKBo'),
(89, '5Fjz-waqxTE', 'Best Book For UP LT Grade Computer Teacher #uppsc', NULL, 'Yash Prajapati', 'https://www.youtube.com/watch?v=5Fjz-waqxTE', 'https://i.ytimg.com/vi/5Fjz-waqxTE/hqdefault.jpg', '2025-04-25 11:39:55', '2025-07-24 22:40:21', NULL, NULL, NULL, 'best-book-for-up-lt-grade-computer-teacher-uppsc-aqxTE'),
(90, 'baEwd4zEcpE', 'UP LT Grade Vacancy 2025 | UP LT Grade Computer Questions | UP LT Grade Computer Teacher MCQ | Day 1', NULL, 'Arora Educator', 'https://www.youtube.com/watch?v=baEwd4zEcpE', 'https://i.ytimg.com/vi/baEwd4zEcpE/hqdefault.jpg', '2025-07-16 14:15:48', '2025-07-24 22:40:21', NULL, NULL, NULL, 'up-lt-grade-vacancy-2025-up-lt-grade-computer-questions-up-lt-grade-computer-teacher-mcq-day-1-zEcpE'),
(91, '4P2F5vxfXus', 'LT Grade Subject Combination | New Vacancy 2025 | UPPSC', NULL, 'TRE TRIBE - Teacher Recruitment Examination Tribe', 'https://www.youtube.com/watch?v=4P2F5vxfXus', 'https://i.ytimg.com/vi/4P2F5vxfXus/hqdefault.jpg', '2025-07-17 18:16:00', '2025-07-24 22:40:21', NULL, NULL, NULL, 'lt-grade-subject-combination-new-vacancy-2025-uppsc-xfXus'),
(92, '4HQsHTOvRzI', 'है क्या ये UP LT GRADE? 🤔#teachersadda247 #upltgrade #upltgradejob #teachingexams', NULL, 'Teachers Adda247', 'https://www.youtube.com/watch?v=4HQsHTOvRzI', 'https://i.ytimg.com/vi/4HQsHTOvRzI/hqdefault.jpg', '2025-03-05 08:38:38', '2025-07-24 22:40:21', NULL, NULL, NULL, 'up-lt-grade-teachersadda247-upltgrade-upltgradejob-teachingexams-OvRzI'),
(93, 'jLE8rPBuvCw', 'UPPSC Lt grade 2024  mathematics syllabus # motivational song # Anita study🥰🥰🎉', NULL, 'Anita study', 'https://www.youtube.com/watch?v=jLE8rPBuvCw', 'https://i.ytimg.com/vi/jLE8rPBuvCw/hqdefault.jpg', '2024-04-02 12:25:18', '2025-07-24 22:40:21', NULL, NULL, NULL, 'uppsc-lt-grade-2024-mathematics-syllabus-motivational-song-anita-study-BuvCw'),
(94, 'XMTcJeax8VM', 'UP LT Grade  #tgtpgtadda247 #teachingexams #upltgrade2025 #upteachervacancy2025', NULL, 'TGT PGT Adda247', 'https://www.youtube.com/watch?v=XMTcJeax8VM', 'https://i.ytimg.com/vi/XMTcJeax8VM/hqdefault.jpg', '2025-07-19 16:55:10', '2025-07-24 22:40:21', NULL, NULL, NULL, 'up-lt-grade-tgtpgtadda247-teachingexams-upltgrade2025-upteachervacancy2025-ax8VM'),
(95, 'DyVDRdwpt2w', 'UP LT Grade New Vacancy 2025 | LT Grade Teacher Eligibility In UP | LT Grade New Vacancy 2025 | DH', NULL, 'SuperCoaching TGT & PGT by Testbook', 'https://www.youtube.com/watch?v=DyVDRdwpt2w', 'https://i.ytimg.com/vi/DyVDRdwpt2w/hqdefault.jpg', '2025-07-19 17:00:06', '2025-07-24 22:40:21', NULL, NULL, NULL, 'up-lt-grade-new-vacancy-2025-lt-grade-teacher-eligibility-in-up-lt-grade-new-vacancy-2025-dh-wpt2w'),
(96, 'XgXRzY85yf8', 'up lt grade subject combination for all students | lt grade subject combination #ltgradevacancy', NULL, 'PG Point', 'https://www.youtube.com/watch?v=XgXRzY85yf8', 'https://i.ytimg.com/vi/XgXRzY85yf8/hqdefault.jpg', '2025-07-16 18:53:49', '2025-07-24 22:40:21', NULL, NULL, NULL, 'up-lt-grade-subject-combination-for-all-students-lt-grade-subject-combination-ltgradevacancy-85yf8'),
(97, '_zbOUzXNum0', 'UPPSC GIC Lecturer Exam Pattern #uppsc #lecturer', NULL, 'Myogenic Abhishek', 'https://www.youtube.com/watch?v=_zbOUzXNum0', 'https://i.ytimg.com/vi/_zbOUzXNum0/hqdefault.jpg', '2024-02-24 20:04:26', '2025-07-24 22:40:21', NULL, NULL, NULL, 'uppsc-gic-lecturer-exam-pattern-uppsc-lecturer-XNum0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `compare`
--
ALTER TABLE `compare`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Indexes for table `syllabus_comparison`
--
ALTER TABLE `syllabus_comparison`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `syllabus_topics`
--
ALTER TABLE `syllabus_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topic_status`
--
ALTER TABLE `topic_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Indexes for table `youtube_api`
--
ALTER TABLE `youtube_api`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `youtube_videos`
--
ALTER TABLE `youtube_videos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `video_id_unique` (`video_id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `channel_name_index` (`channel_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `compare`
--
ALTER TABLE `compare`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `syllabus_comparison`
--
ALTER TABLE `syllabus_comparison`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `syllabus_topics`
--
ALTER TABLE `syllabus_topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `topic_status`
--
ALTER TABLE `topic_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `youtube_api`
--
ALTER TABLE `youtube_api`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `youtube_videos`
--
ALTER TABLE `youtube_videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `compare`
--
ALTER TABLE `compare`
  ADD CONSTRAINT `compare_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`);

--
-- Constraints for table `topic_status`
--
ALTER TABLE `topic_status`
  ADD CONSTRAINT `topic_status_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
