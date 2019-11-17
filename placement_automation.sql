-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 17, 2019 at 07:07 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `placement_automation`
--

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) NOT NULL,
  `company_branch` varchar(100) NOT NULL,
  `company_url` varchar(500) NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `company_name`, `company_branch`, `company_url`) VALUES
(15, 'WIPRO', 'CSE', 'wipro.in'),
(16, 'TCS', 'CSE', 'TCS.in');

-- --------------------------------------------------------

--
-- Table structure for table `drive`
--

DROP TABLE IF EXISTS `drive`;
CREATE TABLE IF NOT EXISTS `drive` (
  `drive_id` int(11) NOT NULL AUTO_INCREMENT,
  `drive_title` varchar(200) CHARACTER SET latin1 NOT NULL,
  `company_id` int(11) NOT NULL,
  `job_position` varchar(100) CHARACTER SET latin1 NOT NULL,
  `job_profile` text CHARACTER SET latin1 NOT NULL,
  `dod` date NOT NULL,
  `salary` int(11) NOT NULL,
  `ssc_result` float NOT NULL,
  `hsc_result` float NOT NULL,
  `graduation_result` float NOT NULL,
  PRIMARY KEY (`drive_id`),
  KEY `fkdrive` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `drive`
--

INSERT INTO `drive` (`drive_id`, `drive_title`, `company_id`, `job_position`, `job_profile`, `dod`, `salary`, `ssc_result`, `hsc_result`, `graduation_result`) VALUES
(17, 'WIPRO Placement Drive', 15, 'Software Developer', 'evaluating the software and systems that make computers and hardware work', '2020-04-12', 50000, 70, 70, 65);

-- --------------------------------------------------------

--
-- Table structure for table `enrolled_students`
--

DROP TABLE IF EXISTS `enrolled_students`;
CREATE TABLE IF NOT EXISTS `enrolled_students` (
  `user_id` int(11) NOT NULL,
  `drive_id` int(11) NOT NULL,
  KEY `fkuser_id` (`user_id`),
  KEY `fkdrive_id` (`drive_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enrolled_students`
--

INSERT INTO `enrolled_students` (`user_id`, `drive_id`) VALUES
(21, 17);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
CREATE TABLE IF NOT EXISTS `profile` (
  `mobile` varchar(50) NOT NULL,
  `dob` varchar(50) NOT NULL,
  `ssc_marks` float NOT NULL,
  `hsc_marks` float NOT NULL,
  `graduation_discipline` varchar(100) NOT NULL,
  `graduation` varchar(100) NOT NULL,
  `graduation_marks` float DEFAULT NULL,
  `post_graduation` varchar(100) NOT NULL,
  `post_graduation_discipline` varchar(100) NOT NULL,
  `post_graduation_marks` float DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `uid` int(11) NOT NULL,
  `resume` varchar(100) NOT NULL,
  `profile_image` text NOT NULL,
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`mobile`, `dob`, `ssc_marks`, `hsc_marks`, `graduation_discipline`, `graduation`, `graduation_marks`, `post_graduation`, `post_graduation_discipline`, `post_graduation_marks`, `gender`, `uid`, `resume`, `profile_image`) VALUES
('9838149626', '12/11/1999', 85, 83, 'CSE', 'B.TECH', 80, '', '', NULL, 'Male', 21, 'sample.pdf', 'img_21.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) DEFAULT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_pass` varchar(100) NOT NULL,
  `date_of_registration` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_pass`, `date_of_registration`) VALUES
(21, 'utpal singh', 'utpalsingh434@gmail.com', '0c669096255f122c4e39a9b0ce77543b', '2019-11-13 02:19:42');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `drive`
--
ALTER TABLE `drive`
  ADD CONSTRAINT `fkdrive` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`);

--
-- Constraints for table `enrolled_students`
--
ALTER TABLE `enrolled_students`
  ADD CONSTRAINT `fkdrive_id` FOREIGN KEY (`drive_id`) REFERENCES `drive` (`drive_id`),
  ADD CONSTRAINT `fkuser_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
