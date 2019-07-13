-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2019 at 01:08 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recruitment`
--

-- --------------------------------------------------------

--
-- Table structure for table `candidates`
--

CREATE TABLE `candidates` (
  `id` int(11) NOT NULL,
  `created_on` bigint(20) NOT NULL,
  `job_opening_id` int(11) NOT NULL,
  `job_title` varchar(255) NOT NULL,
  `stage` varchar(255) NOT NULL,
  `rating` int(11) NOT NULL,
  `details` longtext NOT NULL,
  `status` varchar(255) NOT NULL,
  `comment` longtext NOT NULL,
  `interviews` longtext NOT NULL,
  `to_dos` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `candidates`
--

INSERT INTO `candidates` (`id`, `created_on`, `job_opening_id`, `job_title`, `stage`, `rating`, `details`, `status`, `comment`, `interviews`, `to_dos`) VALUES
(33, 1562992581471, 34, 'wEB DEVELOPER', 'Screening', 0, '[{\"text\":\"Name\",\"isChecked\":false,\"isRequired\":true,\"type\":\"text\",\"value\":\"Rey Vincent Dizon\"},{\"text\":\"Email\",\"isChecked\":false,\"isRequired\":true,\"type\":\"text\",\"value\":\"vincent.c.dizon04@gmail.com\"},{\"text\":\"Upload CV\",\"isChecked\":false,\"isRequired\":true,\"type\":\"file\",\"value\":\"uploads\\SLS261kWinYhvkr51WrL-ZEc.pdf\"},{\"text\":\"Upload Photo\",\"isChecked\":true,\"isRequired\":false,\"type\":\"file\",\"value\":\"\"},{\"text\":\"Cover Letter\",\"isChecked\":true,\"isRequired\":false,\"type\":\"textArea\",\"value\":\"\"},{\"text\":\"Mobile\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Other Email\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Nationality\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Marital Status\",\"isChecked\":false,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Hobbies\",\"isChecked\":false,\"isRequired\":false,\"type\":\"textArea\",\"value\":\"\"},{\"text\":\"Address\",\"isChecked\":false,\"isRequired\":false,\"type\":\"textArea\",\"value\":\"\"},{\"text\":\"Phone\",\"isChecked\":false,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Date of Birth\",\"isChecked\":false,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Gender\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Driving License\",\"isChecked\":true,\"isRequired\":false,\"type\":\"file\",\"value\":\"\"},{\"text\":\"Website\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Biography\",\"isChecked\":true,\"isRequired\":false,\"type\":\"textArea\",\"value\":\"\"}]', 'Rejected', '', '[{\"stage\":\"Screening\",\"detail\":\"\",\"interviewer\":\"vincent dizon\",\"date\":\"07/13/2019\",\"duration\":25}]', '[]'),
(34, 1563013065948, 35, 'Ionic Developer', 'Screening', 0, '[{\"text\":\"Name\",\"isChecked\":false,\"isRequired\":true,\"type\":\"text\",\"value\":\"Rey Vincent Dizon\"},{\"text\":\"Email\",\"isChecked\":false,\"isRequired\":true,\"type\":\"text\",\"value\":\"vcdizon04@gmail.com\"},{\"text\":\"Upload CV\",\"isChecked\":false,\"isRequired\":true,\"type\":\"file\",\"value\":\"uploads\\wyA42MgcqKOygZF5muFG4oPm.pdf\"},{\"text\":\"Upload Photo\",\"isChecked\":true,\"isRequired\":true,\"type\":\"file\",\"value\":\"\"},{\"text\":\"Cover Letter\",\"isChecked\":true,\"isRequired\":true,\"type\":\"textArea\",\"value\":\"\"},{\"text\":\"Mobile\",\"isChecked\":true,\"isRequired\":true,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Other Email\",\"isChecked\":true,\"isRequired\":true,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Nationality\",\"isChecked\":true,\"isRequired\":true,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Marital Status\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Hobbies\",\"isChecked\":true,\"isRequired\":false,\"type\":\"textArea\",\"value\":\"\"},{\"text\":\"Address\",\"isChecked\":true,\"isRequired\":false,\"type\":\"textArea\",\"value\":\"\"},{\"text\":\"Phone\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Date of Birth\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Gender\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Driving License\",\"isChecked\":true,\"isRequired\":false,\"type\":\"file\",\"value\":\"\"},{\"text\":\"Website\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Biography\",\"isChecked\":true,\"isRequired\":false,\"type\":\"textArea\",\"value\":\"\"}]', 'Withdrawn', '', '[]', '[]'),
(35, 1563013497826, 35, 'Ionic Developer', 'Screening', 0, '[{\"text\":\"Name\",\"isChecked\":false,\"isRequired\":true,\"type\":\"text\",\"value\":\"test\"},{\"text\":\"Email\",\"isChecked\":false,\"isRequired\":true,\"type\":\"text\",\"value\":\"vcdizon04@gmail.com\"},{\"text\":\"Upload CV\",\"isChecked\":false,\"isRequired\":true,\"type\":\"file\",\"value\":\"uploads\\9BB-gGNRHhQaNzFJY18RBmbb.pdf\"},{\"text\":\"Upload Photo\",\"isChecked\":true,\"isRequired\":true,\"type\":\"file\",\"value\":\"\"},{\"text\":\"Cover Letter\",\"isChecked\":true,\"isRequired\":true,\"type\":\"textArea\",\"value\":\"\"},{\"text\":\"Mobile\",\"isChecked\":true,\"isRequired\":true,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Other Email\",\"isChecked\":true,\"isRequired\":true,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Nationality\",\"isChecked\":true,\"isRequired\":true,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Marital Status\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Hobbies\",\"isChecked\":true,\"isRequired\":false,\"type\":\"textArea\",\"value\":\"\"},{\"text\":\"Address\",\"isChecked\":true,\"isRequired\":false,\"type\":\"textArea\",\"value\":\"\"},{\"text\":\"Phone\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Date of Birth\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Gender\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Driving License\",\"isChecked\":true,\"isRequired\":false,\"type\":\"file\",\"value\":\"\"},{\"text\":\"Website\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Biography\",\"isChecked\":true,\"isRequired\":false,\"type\":\"textArea\",\"value\":\"\"}]', '', '', '[]', '[]');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `no_of_employee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `title`, `no_of_employee`) VALUES
(2, 'Engineering', 0),
(3, 'Design', 0),
(4, 'Marketing', 0),
(5, 'Sales', 0),
(6, 'Report', 0),
(7, 'Web Development', 0),
(9, 'Administration', 0);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `department` varchar(255) NOT NULL,
  `employment_type` varchar(255) NOT NULL,
  `created_on` bigint(20) NOT NULL,
  `details` longtext NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `status`, `name`, `designation`, `department`, `employment_type`, `created_on`, `details`, `email`, `password`, `level`) VALUES
(2, 'Active', 'vincent dizon', 'Marketing Manage', 'Design', 'Trainee', 1561187615737, 'undefined', 'vincent.c.dizon04@gmail.com', 'admin123', 1),
(9, 'Deceased', 'candidate candidate', 'HR', 'Administration', 'On Contract', 1561194583335, 'undefined', 'vcdizon04@gmail.com', 'admin123', 0);

-- --------------------------------------------------------

--
-- Table structure for table `job_openings`
--

CREATE TABLE `job_openings` (
  `id` int(11) NOT NULL,
  `opening_description` longtext NOT NULL,
  `created_on` bigint(11) NOT NULL,
  `job_description` longtext NOT NULL,
  `hiring_workflow` longtext NOT NULL,
  `job_information` longtext NOT NULL,
  `basic_information` longtext NOT NULL,
  `question_set` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job_openings`
--

INSERT INTO `job_openings` (`id`, `opening_description`, `created_on`, `job_description`, `hiring_workflow`, `job_information`, `basic_information`, `question_set`) VALUES
(34, '<p>wEB DEVELOPER</p>', 1561131266799, '{\"position_title\":\"wEB DEVELOPER\"}', '{\"stages\":[{\"text\":\"Screening\",\"isChecked\":true},{\"text\":\"Phone Interview\",\"isChecked\":true},{\"text\":\"Face to Face Interview\",\"isChecked\":true},{\"text\":\"Make an Offer\",\"isChecked\":false}]}', '{\"department\":\"Design\",\"employment_type\":\"Part Time\",\"isRemoteOption\":true,\"minimum_experience\":\"5 - 7 Years\",\"submission_deadline\":\"06/28/2019\",\"location\":\"ANGELS\",\"number_of_vacancy\":123}', '{\"fields\":[{\"text\":\"Name\",\"isChecked\":false,\"isRequired\":true,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Email\",\"isChecked\":false,\"isRequired\":true,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Upload CV\",\"isChecked\":false,\"isRequired\":true,\"type\":\"file\",\"value\":\"\"},{\"text\":\"Upload Photo\",\"isChecked\":true,\"isRequired\":false,\"type\":\"file\",\"value\":\"\"},{\"text\":\"Cover Letter\",\"isChecked\":true,\"isRequired\":false,\"type\":\"textArea\",\"value\":\"\"},{\"text\":\"Mobile\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Other Email\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Nationality\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Marital Status\",\"isChecked\":false,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Hobbies\",\"isChecked\":false,\"isRequired\":false,\"type\":\"textArea\",\"value\":\"\"},{\"text\":\"Address\",\"isChecked\":false,\"isRequired\":false,\"type\":\"textArea\",\"value\":\"\"},{\"text\":\"Phone\",\"isChecked\":false,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Date of Birth\",\"isChecked\":false,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Gender\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Driving License\",\"isChecked\":true,\"isRequired\":false,\"type\":\"file\",\"value\":\"\"},{\"text\":\"Website\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Biography\",\"isChecked\":true,\"isRequired\":false,\"type\":\"textArea\",\"value\":\"\"}]}', '{\"isQuestionSet\":true,\"questionnaire\":\"Questionnaire 1\"}'),
(35, '<p>Neeed an Ionic Developer</p>', 1562999527304, '{\"position_title\":\"Ionic Developer\"}', '{\"stages\":[{\"text\":\"Screening\",\"isChecked\":true},{\"text\":\"Phone Interview\",\"isChecked\":true},{\"text\":\"Face to Face Interview\",\"isChecked\":true},{\"text\":\"Make an Offer\",\"isChecked\":true},{\"text\":\"Last Offer\",\"isChecked\":true}]}', '{\"department\":\"Engineering\",\"employment_type\":\"Part Time\",\"isRemoteOption\":true,\"minimum_experience\":\"3 - 5 Years\",\"submission_deadline\":\"07/14/2019\",\"location\":\"Angeles\",\"number_of_vacancy\":12}', '{\"fields\":[{\"text\":\"Name\",\"isChecked\":false,\"isRequired\":true,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Email\",\"isChecked\":false,\"isRequired\":true,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Upload CV\",\"isChecked\":false,\"isRequired\":true,\"type\":\"file\",\"value\":\"\"},{\"text\":\"Upload Photo\",\"isChecked\":true,\"isRequired\":true,\"type\":\"file\",\"value\":\"\"},{\"text\":\"Cover Letter\",\"isChecked\":true,\"isRequired\":true,\"type\":\"textArea\",\"value\":\"\"},{\"text\":\"Mobile\",\"isChecked\":true,\"isRequired\":true,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Other Email\",\"isChecked\":true,\"isRequired\":true,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Nationality\",\"isChecked\":true,\"isRequired\":true,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Marital Status\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Hobbies\",\"isChecked\":true,\"isRequired\":false,\"type\":\"textArea\",\"value\":\"\"},{\"text\":\"Address\",\"isChecked\":true,\"isRequired\":false,\"type\":\"textArea\",\"value\":\"\"},{\"text\":\"Phone\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Date of Birth\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Gender\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Driving License\",\"isChecked\":true,\"isRequired\":false,\"type\":\"file\",\"value\":\"\"},{\"text\":\"Website\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Biography\",\"isChecked\":true,\"isRequired\":false,\"type\":\"textArea\",\"value\":\"\"}]}', '{\"isQuestionSet\":false,\"questionnaire\":\"\"}');

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` int(8) NOT NULL,
  `note` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `note`) VALUES
(1, 'test'),
(2, 'This is a random 93 note'),
(3, 'This is a random 65 note'),
(4, 'This is a random 98 note'),
(5, 'This is a random 13 note');

-- --------------------------------------------------------

--
-- Table structure for table `stages`
--

CREATE TABLE `stages` (
  `stage` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stages`
--

INSERT INTO `stages` (`stage`) VALUES
('Screening'),
('Phone Interview'),
('Face to Face Interview'),
('Make an Offer'),
('Test'),
('Screening2'),
('Last Offer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `candidates`
--
ALTER TABLE `candidates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_openings`
--
ALTER TABLE `job_openings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `candidates`
--
ALTER TABLE `candidates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `job_openings`
--
ALTER TABLE `job_openings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
