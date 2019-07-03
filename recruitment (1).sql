-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2019 at 05:41 AM
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

INSERT INTO `candidates` (`id`, `created_on`, `job_opening_id`, `stage`, `rating`, `details`, `status`, `comment`, `interviews`, `to_dos`) VALUES
(24, 1561196114387, 34, 'Screening', 0, '[{\"text\":\"Name\",\"isChecked\":false,\"isRequired\":true,\"type\":\"text\",\"value\":\"test\"},{\"text\":\"Email\",\"isChecked\":false,\"isRequired\":true,\"type\":\"text\",\"value\":\"test@gmail.com\"},{\"text\":\"Upload CV\",\"isChecked\":false,\"isRequired\":true,\"type\":\"file\",\"value\":\"C:\\fakepath\\Resume.pdf\"},{\"text\":\"Upload Photo\",\"isChecked\":true,\"isRequired\":false,\"type\":\"file\",\"value\":\"C:\\fakepath\\recruitementapp-team.pdf\"},{\"text\":\"Cover Letter\",\"isChecked\":true,\"isRequired\":false,\"type\":\"textArea\",\"value\":\"\"},{\"text\":\"Mobile\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Other Email\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Nationality\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Marital Status\",\"isChecked\":false,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Hobbies\",\"isChecked\":false,\"isRequired\":false,\"type\":\"textArea\",\"value\":\"\"},{\"text\":\"Address\",\"isChecked\":false,\"isRequired\":false,\"type\":\"textArea\",\"value\":\"\"},{\"text\":\"Phone\",\"isChecked\":false,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Date of Birth\",\"isChecked\":false,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Gender\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Driving License\",\"isChecked\":true,\"isRequired\":false,\"type\":\"file\",\"value\":\"C:\\fakepath\\Resume.pdf\"},{\"text\":\"Website\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Biography\",\"isChecked\":true,\"isRequired\":false,\"type\":\"textArea\",\"value\":\"\"}]', '', '', '[]', '[]'),
(25, 1561206467037, 34, 'Phone Interview', 5, '[{\"text\":\"Name\",\"isChecked\":false,\"isRequired\":true,\"type\":\"text\",\"value\":\"Rey Vincent\"},{\"text\":\"Email\",\"isChecked\":false,\"isRequired\":true,\"type\":\"text\",\"value\":\"vcdizon04@gmail.com\"},{\"text\":\"Upload CV\",\"isChecked\":false,\"isRequired\":true,\"type\":\"file\",\"value\":\"C:\\fakepath\\recruitementapp-team.pdf\"},{\"text\":\"Upload Photo\",\"isChecked\":true,\"isRequired\":false,\"type\":\"file\",\"value\":\"C:\\fakepath\\Resume (1).pdf\"},{\"text\":\"Cover Letter\",\"isChecked\":true,\"isRequired\":false,\"type\":\"textArea\",\"value\":\"tasesaeae\"},{\"text\":\"Mobile\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"124124\"},{\"text\":\"Other Email\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Nationality\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Marital Status\",\"isChecked\":false,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Hobbies\",\"isChecked\":false,\"isRequired\":false,\"type\":\"textArea\",\"value\":\"sadsad\"},{\"text\":\"Address\",\"isChecked\":false,\"isRequired\":false,\"type\":\"textArea\",\"value\":\"dsadsada\"},{\"text\":\"Phone\",\"isChecked\":false,\"isRequired\":false,\"type\":\"text\",\"value\":\"123213123\"},{\"text\":\"Date of Birth\",\"isChecked\":false,\"isRequired\":false,\"type\":\"text\",\"value\":\"124124124\"},{\"text\":\"Gender\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"male\"},{\"text\":\"Driving License\",\"isChecked\":true,\"isRequired\":false,\"type\":\"file\",\"value\":\"C:\\fakepath\\recruitementapp-team.pdf\"},{\"text\":\"Website\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"asdsad\"},{\"text\":\"Biography\",\"isChecked\":true,\"isRequired\":false,\"type\":\"textArea\",\"value\":\"asdsad\"}]', 'Rejected', '', '[{\"stage\":\"Face to Face Interview\",\"detail\":\"test\",\"interviewer\":\"test4 test4\",\"date\":\"07/06/2019\",\"duration\":20}]', '[]');

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
  `details` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `status`, `name`, `designation`, `department`, `employment_type`, `created_on`, `details`) VALUES
(2, 'Active', 'vincent dizon', 'Marketing Manage', 'Design', 'Trainee', 1561187615737, 'undefined'),
(3, 'Deceased', 'test test', 'iOS Developer', 'Engineering', 'Temporary', 1561188510366, 'undefined'),
(4, 'Active', 'test 2 test2', 'iOS Developer', 'Design', '', 1561188589951, 'undefined'),
(5, 'Active', 'test3 test3', 'Frontend Developer', 'Engineering', 'On Contract', 1561188761135, 'undefined'),
(6, 'Terminated', 'test4 test4', 'iOS Developer', 'Marketing', 'Trainee', 1561189002466, 'undefined'),
(7, 'Deceased', 'vincent2 vincent2', 'HR Manager', 'Sales', 'Temporary', 1561189120821, 'undefined'),
(8, 'Active', 'vincent23 vincent23', 'HR Manager', 'Sales', 'Temporary', 1561189254228, 'undefined'),
(9, 'Deceased', 'candidate candidate', 'iOS Developer', 'Engineering', 'On Contract', 1561194583335, 'undefined'),
(10, 'Active', 'candidate2 candidate2', 'Android Developer', 'Engineering', 'Part Time', 1561194989404, 'undefined'),
(11, 'Terminated', 'candidate4 candidate4', 'Frontend Developer', 'Engineering', 'On Contract', 1561195579250, 'undefined');

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
(34, '<p>wEB DEVELOPER</p>', 1561131266799, '{\"position_title\":\"wEB DEVELOPER\"}', '{\"stages\":[{\"text\":\"Screening\",\"isChecked\":true},{\"text\":\"Phone Interview\",\"isChecked\":true},{\"text\":\"Face to Face Interview\",\"isChecked\":true},{\"text\":\"Make an Offer\",\"isChecked\":false}]}', '{\"department\":\"Design\",\"employment_type\":\"Part Time\",\"isRemoteOption\":true,\"minimum_experience\":\"5 - 7 Years\",\"submission_deadline\":\"06/28/2019\",\"location\":\"ANGELS\",\"number_of_vacancy\":123}', '{\"fields\":[{\"text\":\"Name\",\"isChecked\":false,\"isRequired\":true,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Email\",\"isChecked\":false,\"isRequired\":true,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Upload CV\",\"isChecked\":false,\"isRequired\":true,\"type\":\"file\",\"value\":\"\"},{\"text\":\"Upload Photo\",\"isChecked\":true,\"isRequired\":false,\"type\":\"file\",\"value\":\"\"},{\"text\":\"Cover Letter\",\"isChecked\":true,\"isRequired\":false,\"type\":\"textArea\",\"value\":\"\"},{\"text\":\"Mobile\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Other Email\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Nationality\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Marital Status\",\"isChecked\":false,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Hobbies\",\"isChecked\":false,\"isRequired\":false,\"type\":\"textArea\",\"value\":\"\"},{\"text\":\"Address\",\"isChecked\":false,\"isRequired\":false,\"type\":\"textArea\",\"value\":\"\"},{\"text\":\"Phone\",\"isChecked\":false,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Date of Birth\",\"isChecked\":false,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Gender\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Driving License\",\"isChecked\":true,\"isRequired\":false,\"type\":\"file\",\"value\":\"\"},{\"text\":\"Website\",\"isChecked\":true,\"isRequired\":false,\"type\":\"text\",\"value\":\"\"},{\"text\":\"Biography\",\"isChecked\":true,\"isRequired\":false,\"type\":\"textArea\",\"value\":\"\"}]}', '{\"isQuestionSet\":true,\"questionnaire\":\"Questionnaire 1\"}');

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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `candidates`
--
ALTER TABLE `candidates`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `job_openings`
--
ALTER TABLE `job_openings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
