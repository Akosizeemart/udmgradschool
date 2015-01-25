-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 25, 2015 at 09:46 AM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `u741013309_udm`
--
CREATE DATABASE IF NOT EXISTS `u741013309_udm` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `u741013309_udm`;

-- --------------------------------------------------------

--
-- Table structure for table `cv_courses`
--

DROP TABLE IF EXISTS `cv_courses`;
CREATE TABLE IF NOT EXISTS `cv_courses` (
`id` bigint(20) NOT NULL,
  `school_id` int(11) NOT NULL DEFAULT '1',
  `college_id` int(11) NOT NULL DEFAULT '1',
  `course_code` varchar(30) NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `units` varchar(10) NOT NULL,
  `has_laboratory` varchar(10) NOT NULL DEFAULT 'No' COMMENT 'Yes / No',
  `is_active` varchar(10) NOT NULL DEFAULT 'Yes' COMMENT 'Yes / No'
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `cv_courses`
--

INSERT INTO `cv_courses` (`id`, `school_id`, `college_id`, `course_code`, `title`, `description`, `units`, `has_laboratory`, `is_active`) VALUES
(1, 1, 1, 'MAED101', 'MAED101', 'MAED101', '3.0', 'No', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `cv_course_designation`
--

DROP TABLE IF EXISTS `cv_course_designation`;
CREATE TABLE IF NOT EXISTS `cv_course_designation` (
`id` bigint(20) NOT NULL,
  `school_id` int(11) NOT NULL DEFAULT '1',
  `college_id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  `program_code` varchar(20) NOT NULL,
  `course_id` int(11) NOT NULL,
  `course_code` varchar(20) NOT NULL,
  `course_title` varchar(100) NOT NULL,
  `school_year` varchar(30) NOT NULL,
  `semester` varchar(2) NOT NULL,
  `section` varchar(20) NOT NULL,
  `max_size` varchar(2) NOT NULL,
  `professor_id` int(11) NOT NULL COMMENT 'main_teacher',
  `professor_name` varchar(50) NOT NULL,
  `remarks` text NOT NULL,
  `schedule` varchar(50) NOT NULL COMMENT 'mwf  5-30 etc',
  `is_lock` varchar(5) NOT NULL DEFAULT 'No' COMMENT 'Yes / No',
  `submission_date` varchar(10) NOT NULL,
  `is_active` varchar(5) NOT NULL COMMENT 'Yes / No',
  `is_archive` varchar(5) NOT NULL COMMENT 'Yes / No',
  `date_added` varchar(10) NOT NULL,
  `added_by` int(11) NOT NULL COMMENT 'member_id'
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `cv_course_designation`
--

INSERT INTO `cv_course_designation` (`id`, `school_id`, `college_id`, `program_id`, `program_code`, `course_id`, `course_code`, `course_title`, `school_year`, `semester`, `section`, `max_size`, `professor_id`, `professor_name`, `remarks`, `schedule`, `is_lock`, `submission_date`, `is_active`, `is_archive`, `date_added`, `added_by`) VALUES
(1, 1, 1, 1, 'MAED', 1, 'MAED101', 'MAED101', '2014 - 2015', '1', 'a1', '', 2, 'Jose Waldemar Valmores', 'good', '', '', '2014-12-07', 'Yes', 'No', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cv_course_enrollees`
--

DROP TABLE IF EXISTS `cv_course_enrollees`;
CREATE TABLE IF NOT EXISTS `cv_course_enrollees` (
`id` bigint(50) NOT NULL,
  `school_id` int(11) NOT NULL DEFAULT '1',
  `course_designation_id` bigint(15) NOT NULL,
  `program_id` bigint(15) NOT NULL,
  `program_code` varchar(20) NOT NULL,
  `student_id` bigint(15) NOT NULL,
  `student_code` varchar(30) NOT NULL,
  `student_name` varchar(50) NOT NULL,
  `course_id` bigint(15) NOT NULL,
  `course_code` varchar(10) NOT NULL,
  `professor_id` bigint(15) NOT NULL,
  `professor_name` varchar(50) NOT NULL,
  `pre_final_grade` varchar(10) NOT NULL,
  `final_exam_grade` varchar(10) NOT NULL,
  `final_grade` varchar(10) NOT NULL,
  `remarks` text NOT NULL,
  `is_currently_enrolled` varchar(5) NOT NULL DEFAULT 'Yes' COMMENT 'Yes / No',
  `is_passed` varchar(10) NOT NULL COMMENT 'Passed, Dropped, Failed, Incomplete, Absent, Continuing',
  `enrolled_by` bigint(15) NOT NULL,
  `date_added` datetime NOT NULL,
  `is_archive` varchar(5) NOT NULL COMMENT 'Yes / No'
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `cv_course_enrollees`
--

INSERT INTO `cv_course_enrollees` (`id`, `school_id`, `course_designation_id`, `program_id`, `program_code`, `student_id`, `student_code`, `student_name`, `course_id`, `course_code`, `professor_id`, `professor_name`, `pre_final_grade`, `final_exam_grade`, `final_grade`, `remarks`, `is_currently_enrolled`, `is_passed`, `enrolled_by`, `date_added`, `is_archive`) VALUES
(1, 1, 1, 1, 'MAED', 4, '2014120004', 'Patrick Buena', 1, 'MAED101', 2, 'Jose Waldemar Valmores', '60', '65', '90', '', 'Yes', 'Passed', 1, '2014-12-04 12:13:38', 'No'),
(2, 1, 1, 1, 'MAED', 6, '2014120006', 'Kevin Pio', 1, 'MAED101', 2, 'Jose Waldemar Valmores', '95', '95', '5', '', 'Yes', 'Passed', 1, '2014-12-07 12:54:00', 'No'),
(3, 1, 1, 1, 'MAED', 14, '2014120014', 'czar patrick buena', 1, 'MAED101', 2, 'Jose Waldemar Valmores', '90', '90', '90', '', 'Yes', 'Passed', 1, '2015-01-19 10:57:39', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `cv_login`
--

DROP TABLE IF EXISTS `cv_login`;
CREATE TABLE IF NOT EXISTS `cv_login` (
`id` bigint(20) NOT NULL,
  `member_id` bigint(20) NOT NULL,
  `full_name` varchar(60) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email_address` varchar(50) NOT NULL,
  `pass_hash` text NOT NULL,
  `account_type` varchar(10) NOT NULL COMMENT 'Admin / Dean / Registrar / Professor / Student',
  `modules` varchar(100) NOT NULL COMMENT 'serialize',
  `is_active` varchar(10) NOT NULL COMMENT 'Yes / No',
  `date_added` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `cv_login`
--

INSERT INTO `cv_login` (`id`, `member_id`, `full_name`, `username`, `email_address`, `pass_hash`, `account_type`, `modules`, `is_active`, `date_added`) VALUES
(1, 1, 'Vivien Agustin', 'vivien.agustin', 'vivienagustin.agustin@gmail.com', '5a1204817a7120f6afc7a5fff1227f18986cdf3fb4df380e20cc7b3587f60083118b34981411a2fa3a160b3c9e9ab3a21a22c73f870c54b704021e31101a39b7', 'Admin', '', 'Yes', '2013-02-17 16:23:04'),
(2, 2, 'Jose Waldemar Valmores', 'josewaldemar.valmores', '', '5a1204817a7120f6afc7a5fff1227f18986cdf3fb4df380e20cc7b3587f60083118b34981411a2fa3a160b3c9e9ab3a21a22c73f870c54b704021e31101a39b7', 'Professor', '', 'Yes', '2015-01-19 13:58:18'),
(3, 4, 'Patrick Buena', 'patrick.buena', '', '5a1204817a7120f6afc7a5fff1227f18986cdf3fb4df380e20cc7b3587f60083118b34981411a2fa3a160b3c9e9ab3a21a22c73f870c54b704021e31101a39b7', 'Student', '', 'Yes', '2014-12-14 10:54:34'),
(4, 14, 'czar patrick buena', 'czarpatrick.buena', '', '5a1204817a7120f6afc7a5fff1227f18986cdf3fb4df380e20cc7b3587f60083118b34981411a2fa3a160b3c9e9ab3a21a22c73f870c54b704021e31101a39b7', 'Professor', '', 'Yes', '2015-01-19 22:59:41');

-- --------------------------------------------------------

--
-- Table structure for table `cv_members`
--

DROP TABLE IF EXISTS `cv_members`;
CREATE TABLE IF NOT EXISTS `cv_members` (
`id` bigint(20) NOT NULL,
  `school_id` int(11) NOT NULL DEFAULT '1',
  `firstname` varchar(30) NOT NULL,
  `middlename` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `fullname` varchar(90) NOT NULL,
  `gender` varchar(10) NOT NULL COMMENT 'Male / Female',
  `birthdate` varchar(10) NOT NULL,
  `email_address` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone_number` varchar(30) NOT NULL,
  `mobile_number` varchar(30) NOT NULL,
  `student_employee_code` varchar(30) NOT NULL COMMENT 'Student Code / Employee Code',
  `program_id` int(11) NOT NULL,
  `program_code` varchar(30) NOT NULL,
  `year_level` varchar(10) NOT NULL,
  `semester` varchar(10) NOT NULL,
  `college_id` int(11) NOT NULL COMMENT 'For Professors',
  `is_enrolled` varchar(5) NOT NULL COMMENT 'Yes / No',
  `is_active` varchar(5) NOT NULL COMMENT 'Yes / No',
  `member_type` varchar(20) NOT NULL COMMENT 'Admin, Dean, Registrar,  Student, Professor',
  `display_image` varchar(50) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `cv_members`
--

INSERT INTO `cv_members` (`id`, `school_id`, `firstname`, `middlename`, `lastname`, `fullname`, `gender`, `birthdate`, `email_address`, `address`, `phone_number`, `mobile_number`, `student_employee_code`, `program_id`, `program_code`, `year_level`, `semester`, `college_id`, `is_enrolled`, `is_active`, `member_type`, `display_image`, `date_added`) VALUES
(1, 1, 'Vivien', 'A', 'Agustin', 'Vivien Agustin', 'Female', '1991-08-01', 'vivienagustin.agustin@gmail.com', 'sta ana', '639231798118', '639231798118', '2008180031', 1, 'BS IT', '4', '', 0, 'Yes', 'Yes', 'Admin', '', '2012-12-03 00:00:00'),
(2, 1, 'Jose Waldemar', 'A', 'Valmores', 'Jose Waldemar Valmores', 'Male', '1987-12-07', 'jwaldemar.valmores@gmail.com', 'sta ana', '123456789', '12345678945', '201412002', 0, '', '', '', 0, '', 'Yes', 'Professor', '', '2014-12-03 23:57:07'),
(3, 1, 'Marlon ', 'A', 'Padilla', 'Marlon  Padilla', 'Male', '1987-12-08', 'marlon.padilla@gmail.com', 'sta ana', '12345', '123456789145', '201412003', 0, '', '', '', 1, '', 'Yes', 'Professor', '', '2014-12-03 23:59:47'),
(4, 1, 'Patrick', 'C', 'Buena', 'Patrick Buena', 'Male', '1987-12-08', 'pat.buena@gmail.com', 'sta ana', '93078642185', '93078642185', '2014120004', 1, 'MAED', '1', '', 0, 'Yes', 'No', 'Student', '', '2014-12-04 00:13:06'),
(5, 1, 'test', 'test', 'test', 'test test', 'Male', '1987-12-08', 'test@gmail.com', 'testadress', '9309579324', '9309579324', '2014120005', 1, 'MAED', '1', '', 0, 'Yes', 'Yes', 'Student', '', '2014-12-07 00:06:03'),
(6, 1, 'Kevin', 'M', 'Pio', 'Kevin Pio', 'Male', '1992-01-24', 'kvnpio@gmail.com', 'malabon city', '3762175', '9063799529', '2014120006', 1, 'MAED', '1', '', 0, 'Yes', 'No', 'Student', '', '2014-12-07 00:53:35'),
(7, 1, 'Lastname', 'C', 'LastName', 'Lastname LastName', 'Male', '1989-12-07', 'sample@yahoo.com', '2023 Lamayan Street\n', '5639931', '9226721264', '2014120007', 1, 'MAED', '2', '', 0, 'Yes', 'No', 'Student', '', '2014-12-07 11:55:24'),
(8, 1, 'Lastname', 'C', 'LastName', 'Lastname LastName', 'Male', '1989-12-07', 'sample@yahoo.com', '2023 Lamayan Street\n', '5639931', '9226721264', '2014120007', 1, 'MAED', '2', '', 0, 'Yes', 'No', 'Student', '', '2014-12-07 11:55:24'),
(9, 1, 'Lastname', 'C', 'LastName', 'Lastname LastName', 'Male', '1989-12-07', 'sample@yahoo.com', '2023 Lamayan Street\n', '5639931', '9226721264', '2014120007', 1, 'MAED', '2', '', 0, 'Yes', 'No', 'Student', '', '2014-12-07 11:55:25'),
(10, 1, 'Lastname', 'C', 'LastName', 'Lastname LastName', 'Male', '1989-12-07', 'sample@yahoo.com', '2023 Lamayan Street\n', '5639931', '9226721264', '2014120007', 1, 'MAED', '2', '', 0, 'Yes', 'No', 'Student', '', '2014-12-07 11:55:25'),
(11, 1, 'Lastname', 'C', 'LastName', 'Lastname LastName', 'Male', '1989-12-07', 'sample@yahoo.com', '2023 Lamayan Street\n', '5639931', '9226721264', '2014120007', 1, 'MAED', '2', '', 0, 'Yes', 'No', 'Student', '', '2014-12-07 11:55:25'),
(12, 1, 'Lastname', 'C', 'LastName', 'Lastname LastName', 'Male', '1989-12-07', 'sample@yahoo.com', '2023 Lamayan Street\n', '5639931', '9226721264', '2014120007', 1, 'MAED', '2', '', 0, 'Yes', 'No', 'Student', '', '2014-12-07 11:55:25'),
(13, 1, 'Lastname', 'C', 'LastName', 'Lastname LastName', 'Female', '1989-12-07', 'sample@yahoo.com', '2023 Lamayan Street\n', '5639931', '9226721264', '2014120007', 1, 'MAED', '2', '', 0, 'Yes', 'Yes', 'Student', '', '2014-12-07 11:55:26'),
(14, 1, 'czar patrick', 'T', 'buena', 'czar patrick buena', 'Female', '1987-07-10', 'patrick.buena@yahoo.com', 'sta.ana Manila', '12345678901', '54565184789', '2014120014', 1, 'MAED', '1', '', 0, 'Yes', 'Yes', 'Student', '', '2014-12-14 10:51:17');

-- --------------------------------------------------------

--
-- Table structure for table `cv_settings_college`
--

DROP TABLE IF EXISTS `cv_settings_college`;
CREATE TABLE IF NOT EXISTS `cv_settings_college` (
`id` bigint(20) NOT NULL,
  `school_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL COMMENT 'dean_id',
  `college_name` varchar(50) NOT NULL,
  `college_code` varchar(10) NOT NULL,
  `is_active` varchar(5) NOT NULL DEFAULT 'Yes' COMMENT 'Yes / No'
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `cv_settings_college`
--

INSERT INTO `cv_settings_college` (`id`, `school_id`, `member_id`, `college_name`, `college_code`, `is_active`) VALUES
(1, 1, 2, 'GSASE', 'GSASE', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `cv_settings_curriculum`
--

DROP TABLE IF EXISTS `cv_settings_curriculum`;
CREATE TABLE IF NOT EXISTS `cv_settings_curriculum` (
`id` bigint(20) NOT NULL,
  `school_id` int(11) NOT NULL DEFAULT '1',
  `program_id` int(20) NOT NULL,
  `course_id` int(20) NOT NULL,
  `batch_year` varchar(20) NOT NULL,
  `year_level` varchar(10) NOT NULL COMMENT '1,2,3,4,5',
  `semester` varchar(10) NOT NULL COMMENT '1,2,3',
  `is_active` varchar(5) NOT NULL DEFAULT 'Yes',
  `is_archive` varchar(5) NOT NULL DEFAULT 'No'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cv_settings_program`
--

DROP TABLE IF EXISTS `cv_settings_program`;
CREATE TABLE IF NOT EXISTS `cv_settings_program` (
`id` bigint(20) NOT NULL,
  `school_id` int(11) NOT NULL DEFAULT '1',
  `college_id` int(11) NOT NULL DEFAULT '1',
  `program_code` varchar(20) NOT NULL COMMENT 'BS IT, BS CS',
  `program_name` varchar(50) NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `degree_type` varchar(20) NOT NULL COMMENT '2-year, Bachelor, Masters, Doctoral',
  `is_offered` varchar(5) NOT NULL COMMENT 'Yes / No',
  `is_active` varchar(5) NOT NULL COMMENT 'Yes / No'
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `cv_settings_program`
--

INSERT INTO `cv_settings_program` (`id`, `school_id`, `college_id`, `program_code`, `program_name`, `title`, `description`, `degree_type`, `is_offered`, `is_active`) VALUES
(1, 1, 1, 'MAED', 'Masters of Education', 'Masters of Education', 'Masters of Education', 'Bachelor', 'Yes', 'Yes');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cv_courses`
--
ALTER TABLE `cv_courses`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cv_course_designation`
--
ALTER TABLE `cv_course_designation`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cv_course_enrollees`
--
ALTER TABLE `cv_course_enrollees`
 ADD PRIMARY KEY (`id`), ADD KEY `enrollees` (`school_id`,`course_designation_id`,`program_code`,`student_id`,`student_code`,`professor_name`,`pre_final_grade`,`final_exam_grade`,`final_grade`,`is_currently_enrolled`,`is_archive`);

--
-- Indexes for table `cv_login`
--
ALTER TABLE `cv_login`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cv_members`
--
ALTER TABLE `cv_members`
 ADD PRIMARY KEY (`id`), ADD KEY `default_condition` (`school_id`,`is_enrolled`,`is_active`), ADD KEY `basic_info` (`firstname`,`lastname`,`gender`,`birthdate`,`email_address`);

--
-- Indexes for table `cv_settings_college`
--
ALTER TABLE `cv_settings_college`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cv_settings_curriculum`
--
ALTER TABLE `cv_settings_curriculum`
 ADD PRIMARY KEY (`id`), ADD KEY `default_query` (`school_id`,`program_id`,`course_id`,`batch_year`,`year_level`,`semester`);

--
-- Indexes for table `cv_settings_program`
--
ALTER TABLE `cv_settings_program`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cv_courses`
--
ALTER TABLE `cv_courses`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cv_course_designation`
--
ALTER TABLE `cv_course_designation`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cv_course_enrollees`
--
ALTER TABLE `cv_course_enrollees`
MODIFY `id` bigint(50) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `cv_login`
--
ALTER TABLE `cv_login`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `cv_members`
--
ALTER TABLE `cv_members`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `cv_settings_college`
--
ALTER TABLE `cv_settings_college`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cv_settings_curriculum`
--
ALTER TABLE `cv_settings_curriculum`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cv_settings_program`
--
ALTER TABLE `cv_settings_program`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
