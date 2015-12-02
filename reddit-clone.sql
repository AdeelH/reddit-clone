-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2015 at 04:51 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `comm_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('NORMAL','DELETED') NOT NULL DEFAULT 'NORMAL',
  `text` text NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`comm_id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comm_id`, `post_id`, `user_id`, `time`, `status`, `text`, `parent_id`) VALUES
(1, 2, 1, '2015-10-30 15:22:14', 'DELETED', 'test comment 1', NULL),
(2, 2, 1, '2015-10-30 15:22:15', 'NORMAL', 'test comment 2', NULL),
(3, 2, 1, '2015-10-30 15:22:15', 'NORMAL', 'test comment 3', NULL),
(4, 2, 1, '2015-10-30 15:22:15', 'NORMAL', 'test comment 4', NULL),
(5, 3, 1, '2015-10-30 15:22:15', 'NORMAL', 'test comment 1', NULL),
(6, 3, 1, '2015-10-30 15:22:15', 'NORMAL', 'test comment 2', NULL),
(7, 3, 1, '2015-10-30 15:22:15', 'NORMAL', 'test comment 3', NULL),
(8, 3, 1, '2015-10-30 15:22:15', 'NORMAL', 'test comment 4', NULL),
(9, 3, 1, '2015-10-30 15:22:15', 'NORMAL', 'test comment 1', NULL),
(10, 3, 1, '2015-10-30 15:22:15', 'NORMAL', 'test comment 2', NULL),
(11, 3, 1, '2015-10-30 15:22:15', 'NORMAL', 'test comment 3', NULL),
(12, 3, 1, '2015-10-30 15:22:15', 'NORMAL', 'test comment 4', NULL),
(13, 4, 1, '2015-10-30 15:22:15', 'NORMAL', 'test comment 1', NULL),
(14, 4, 1, '2015-10-30 15:22:15', 'NORMAL', 'test comment 2', NULL),
(15, 4, 1, '2015-10-30 15:22:15', 'NORMAL', 'test comment 3', NULL),
(16, 4, 1, '2015-10-30 15:22:15', 'NORMAL', 'test comment 4', NULL),
(17, 2, 1, '2015-11-03 17:32:07', 'NORMAL', 'test', 1),
(24, 2, 1, '2015-11-03 17:33:12', 'NORMAL', 'test', 1),
(25, 2, 1, '2015-11-03 17:33:12', 'NORMAL', 'test', 1),
(26, 2, 1, '2015-11-03 17:33:12', 'NORMAL', 'test', 1),
(27, 2, 1, '2015-11-03 17:33:12', 'NORMAL', 'test', 17),
(28, 2, 1, '2015-11-03 17:33:12', 'NORMAL', 'test', 17),
(30, 2, 1, '2015-11-06 17:53:25', 'NORMAL', 'bla bla', NULL),
(31, 2, 1, '2015-11-06 17:57:15', 'NORMAL', 'kaslfh;oah;aoighsgh;', NULL),
(32, 23, 6, '2015-11-07 10:47:31', 'NORMAL', 'yada yada yada', NULL),
(33, 25, 1, '2015-11-07 11:15:00', 'NORMAL', 'aafsff', NULL),
(34, 24, 1, '2015-11-28 11:02:59', 'NORMAL', 'omg', NULL),
(35, 24, 1, '2015-11-28 13:16:43', 'NORMAL', 'wow, a reply!', NULL),
(36, 24, 1, '2015-11-28 13:19:26', 'NORMAL', 'abc', 34),
(37, 24, 1, '2015-11-28 13:45:34', 'NORMAL', 'deeper', 36),
(38, 4, 1, '2015-11-28 16:54:19', 'NORMAL', 'test comment 1.1', 13),
(39, 4, 1, '2015-11-28 16:54:19', 'NORMAL', 'test comment 1.1', 13),
(40, 24, 1, '2015-11-28 18:32:59', 'NORMAL', '1\r\n2\r\n3\r\n4', 35),
(41, 2, 1, '2015-12-01 07:07:45', 'NORMAL', 'asgasljga', 24),
(44, 26, 1, '2015-12-01 07:22:30', 'NORMAL', 'I''ll be there', NULL),
(45, 26, 1, '2015-12-01 07:22:45', 'DELETED', 'Whatever.', NULL),
(46, 2, 1, '2015-12-01 18:35:44', 'NORMAL', 'stuff', 24),
(47, 5, 1, '2015-12-01 18:36:26', 'NORMAL', '123', NULL),
(48, 9, 1, '2015-12-01 18:36:48', 'NORMAL', 'comment', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comm_control_log`
--

CREATE TABLE IF NOT EXISTS `comm_control_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `comm_id` int(11) NOT NULL,
  `mod_id` int(11) NOT NULL,
  `action` enum('DELETE','UNDELETE') NOT NULL,
  `comment` varchar(300) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  KEY `comm_id` (`comm_id`),
  KEY `mod_id` (`mod_id`),
  FULLTEXT KEY `comment` (`comment`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `comm_control_log`
--

INSERT INTO `comm_control_log` (`log_id`, `comm_id`, `mod_id`, `action`, `comment`, `time`) VALUES
(1, 1, 1, 'DELETE', 'deletion test', '2015-11-29 09:27:50'),
(2, 45, 1, 'DELETE', 'test', '2015-12-01 10:18:48');

-- --------------------------------------------------------

--
-- Table structure for table `comm_reports`
--

CREATE TABLE IF NOT EXISTS `comm_reports` (
  `report_id` int(11) NOT NULL,
  `comm_id` int(11) NOT NULL,
  PRIMARY KEY (`report_id`),
  KEY `comm_id` (`comm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comm_reports`
--

INSERT INTO `comm_reports` (`report_id`, `comm_id`) VALUES
(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `comm_votes`
--

CREATE TABLE IF NOT EXISTS `comm_votes` (
  `comm_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `vote` enum('UP','DOWN') NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comm_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comm_votes`
--

INSERT INTO `comm_votes` (`comm_id`, `user_id`, `vote`, `time`) VALUES
(3, 1, 'DOWN', '2015-11-28 11:04:49'),
(17, 1, 'DOWN', '2015-11-29 11:01:21'),
(24, 1, 'UP', '2015-11-29 11:01:54'),
(25, 1, 'UP', '2015-11-29 11:01:52'),
(26, 1, 'DOWN', '2015-11-29 11:00:14'),
(27, 1, 'UP', '2015-11-29 11:00:50'),
(30, 1, 'DOWN', '2015-11-29 11:04:45'),
(31, 1, 'DOWN', '2015-11-29 11:04:47'),
(34, 1, 'UP', '2015-11-28 11:09:15'),
(35, 1, 'DOWN', '2015-11-28 13:44:37'),
(36, 1, 'UP', '2015-11-28 13:44:39');

-- --------------------------------------------------------

--
-- Table structure for table `login_log`
--

CREATE TABLE IF NOT EXISTS `login_log` (
  `user_id` int(11) NOT NULL,
  `ip` char(45) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `result` enum('SUCCESS','FAILURE') NOT NULL,
  PRIMARY KEY (`user_id`,`time`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_log`
--

INSERT INTO `login_log` (`user_id`, `ip`, `time`, `result`) VALUES
(1, '::1', '2015-11-01 14:57:53', 'SUCCESS'),
(1, '::1', '2015-11-01 17:47:31', 'SUCCESS'),
(1, '::1', '2015-11-01 17:48:34', 'SUCCESS'),
(1, '::1', '2015-11-02 15:42:21', 'SUCCESS'),
(1, '::1', '2015-11-02 16:38:55', 'FAILURE'),
(1, '::1', '2015-11-02 16:39:15', 'SUCCESS'),
(1, '::1', '2015-11-02 17:28:25', 'FAILURE'),
(1, '::1', '2015-11-03 03:12:45', 'SUCCESS'),
(1, '::1', '2015-11-04 19:00:25', 'SUCCESS'),
(1, '::1', '2015-11-05 03:01:31', 'SUCCESS'),
(1, '::1', '2015-11-05 12:52:24', 'SUCCESS'),
(1, '::1', '2015-11-06 05:22:20', 'SUCCESS'),
(1, '::1', '2015-11-06 09:13:57', 'SUCCESS'),
(1, '::1', '2015-11-06 09:20:35', 'SUCCESS'),
(1, '::1', '2015-11-06 09:22:15', 'SUCCESS'),
(1, '::1', '2015-11-07 05:28:51', 'SUCCESS'),
(1, '::1', '2015-11-07 09:55:32', 'SUCCESS'),
(1, '::1', '2015-11-07 10:34:07', 'SUCCESS'),
(1, '::1', '2015-11-07 10:34:52', 'FAILURE'),
(1, '::1', '2015-11-07 10:37:00', 'SUCCESS'),
(1, '::1', '2015-11-07 10:39:23', 'FAILURE'),
(1, '::1', '2015-11-07 10:39:33', 'SUCCESS'),
(1, '::1', '2015-11-07 10:39:51', 'SUCCESS'),
(1, '::1', '2015-11-07 10:58:10', 'SUCCESS'),
(1, '::1', '2015-11-07 11:14:05', 'SUCCESS'),
(1, '::1', '2015-11-09 07:51:22', 'SUCCESS'),
(1, '::1', '2015-11-09 09:09:29', 'SUCCESS'),
(1, '::1', '2015-11-10 13:52:45', 'SUCCESS'),
(1, '::1', '2015-11-11 04:10:29', 'SUCCESS'),
(1, '::1', '2015-11-11 07:25:13', 'SUCCESS'),
(1, '::1', '2015-11-11 07:53:27', 'SUCCESS'),
(1, '::1', '2015-11-11 09:45:14', 'SUCCESS'),
(1, '::1', '2015-11-22 17:20:29', 'SUCCESS'),
(1, '::1', '2015-11-23 05:37:08', 'SUCCESS'),
(1, '::1', '2015-11-24 14:28:16', 'SUCCESS'),
(1, '::1', '2015-11-27 04:46:56', 'SUCCESS'),
(1, '::1', '2015-11-28 05:59:58', 'SUCCESS'),
(1, '::1', '2015-11-29 05:24:16', 'SUCCESS'),
(1, '::1', '2015-12-01 07:05:19', 'SUCCESS'),
(1, '::1', '2015-12-01 07:24:20', 'SUCCESS'),
(1, '::1', '2015-12-02 01:51:13', 'SUCCESS'),
(6, '::1', '2015-11-07 10:42:23', 'SUCCESS'),
(6, '::1', '2015-11-07 10:46:07', 'SUCCESS');

-- --------------------------------------------------------

--
-- Table structure for table `pms`
--

CREATE TABLE IF NOT EXISTS `pms` (
  `pm_id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` int(11) NOT NULL,
  `receiver` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `subject` varchar(300) DEFAULT NULL,
  `msg` text NOT NULL,
  `read_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pm_id`),
  KEY `sender` (`sender`),
  KEY `receiver` (`receiver`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `pms`
--

INSERT INTO `pms` (`pm_id`, `sender`, `receiver`, `time`, `subject`, `msg`, `read_time`) VALUES
(1, 1, 2, '2015-10-30 15:28:04', NULL, 'test PM 1', '2015-12-01 07:28:42'),
(2, 1, 2, '2015-10-30 15:28:04', NULL, 'test PM 2', '2015-12-01 07:28:42'),
(3, 1, 2, '2015-10-30 15:28:04', NULL, 'test PM 3', '2015-12-01 07:28:42'),
(4, 1, 2, '2015-10-30 15:28:04', NULL, 'test PM 4', '2015-12-01 07:28:42'),
(5, 1, 4, '2015-11-28 15:12:03', 'first', 'first', '2015-12-01 07:28:42'),
(6, 1, 4, '2015-11-28 15:16:04', 'Hi', 'Sup', '2015-12-01 07:28:42'),
(7, 2, 1, '2015-11-28 15:35:54', 'hi', 'hi', '2015-12-01 07:28:42');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `soc_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` enum('NORMAL','DELETED','LOCKED','STICKIED') NOT NULL DEFAULT 'NORMAL',
  `title` varchar(300) NOT NULL,
  `text` text,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`post_id`),
  KEY `soc_id` (`soc_id`),
  KEY `user_id` (`user_id`),
  FULLTEXT KEY `title` (`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `soc_id`, `user_id`, `status`, `title`, `text`, `time`) VALUES
(1, 1, 1, 'NORMAL', 'This is a test post', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed facilisis finibus libero at tincidunt. Ut nunc tortor, venenatis vitae commodo vel, tempus nec ante. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec ultricies fermentum consectetur. Proin eu urna laoreet, faucibus tortor nec, mollis nisl. Quisque fringilla massa ante. Fusce quis ligula vitae tellus cursus tempus rutrum at nisi. Fusce et ante dolor. Quisque pretium vitae metus a ultricies. Fusce vel massa eu nulla interdum eleifend. Donec in ex id mauris posuere ornare. Donec quam orci, tempus quis libero nec, pellentesque pharetra magna.', '2015-10-30 15:14:10'),
(2, 1, 1, 'NORMAL', 'test post 2', NULL, '2015-10-30 15:14:11'),
(3, 1, 1, 'DELETED', 'test post 3', NULL, '2015-10-30 15:14:11'),
(4, 1, 1, 'DELETED', 'test post 4', NULL, '2015-10-30 15:14:11'),
(5, 2, 1, 'NORMAL', 'test post 1', NULL, '2015-10-30 15:17:36'),
(6, 2, 1, 'NORMAL', 'test post 2', NULL, '2015-10-30 15:17:36'),
(7, 2, 1, 'NORMAL', 'test post 3', NULL, '2015-10-30 15:17:36'),
(8, 2, 1, 'NORMAL', 'test post 4', NULL, '2015-10-30 15:17:37'),
(9, 3, 1, 'NORMAL', 'test post 1', NULL, '2015-10-30 15:17:37'),
(10, 3, 1, 'NORMAL', 'test post 2', NULL, '2015-10-30 15:17:37'),
(11, 3, 1, 'NORMAL', 'test post 3', NULL, '2015-10-30 15:17:37'),
(12, 3, 1, 'NORMAL', 'test post 4', NULL, '2015-10-30 15:17:37'),
(13, 3, 1, 'NORMAL', 'test post 1', NULL, '2015-10-30 15:17:37'),
(14, 3, 1, 'NORMAL', 'test post 2', NULL, '2015-10-30 15:17:37'),
(15, 3, 1, 'NORMAL', 'test post 3', NULL, '2015-10-30 15:17:37'),
(16, 3, 1, 'NORMAL', 'test post 4', NULL, '2015-10-30 15:17:37'),
(17, 4, 1, 'NORMAL', 'test post 1', NULL, '2015-10-30 15:17:37'),
(18, 4, 1, 'NORMAL', 'test post 2', NULL, '2015-10-30 15:17:37'),
(19, 4, 1, 'NORMAL', 'test post 3', NULL, '2015-10-30 15:17:37'),
(20, 4, 1, 'NORMAL', 'test post 4', NULL, '2015-10-30 15:17:37'),
(21, 1, 1, 'NORMAL', 'asasvasv', 'aksblaksjf', '2015-11-06 06:18:34'),
(22, 1, 1, 'NORMAL', 'adasfasfa', 'lorem ipsum', '2015-11-06 06:18:49'),
(23, 1, 6, 'NORMAL', 'test new post', 'some text', '2015-11-07 10:46:50'),
(24, 1, 1, 'NORMAL', 'viva', 'sklahfaisf\r\n', '2015-11-07 11:14:44'),
(25, 1, 1, 'NORMAL', 'viva', 'sklahfaisf\r\n', '2015-11-07 11:14:44'),
(26, 11, 1, 'NORMAL', 'Meeting at 6 PM on 6/6', '', '2015-12-01 07:14:50'),
(27, 10, 1, 'NORMAL', 'Database.', '', '2015-12-02 02:22:56');

-- --------------------------------------------------------

--
-- Table structure for table `post_control_log`
--

CREATE TABLE IF NOT EXISTS `post_control_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `mod_id` int(11) NOT NULL,
  `action` enum('DELETE','UNDELETE','STICKY','UNSTICKY') NOT NULL,
  `comment` varchar(300) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  KEY `mod_id` (`mod_id`),
  KEY `post_id` (`post_id`),
  FULLTEXT KEY `comment` (`comment`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `post_control_log`
--

INSERT INTO `post_control_log` (`log_id`, `post_id`, `mod_id`, `action`, `comment`, `time`) VALUES
(1, 3, 1, 'DELETE', NULL, '2015-11-01 05:36:37'),
(2, 3, 1, 'DELETE', NULL, '2015-11-01 05:38:46'),
(3, 3, 1, 'UNDELETE', NULL, '2015-11-01 05:38:34'),
(4, 4, 1, 'DELETE', NULL, '2015-11-01 05:36:26');

-- --------------------------------------------------------

--
-- Table structure for table `post_reports`
--

CREATE TABLE IF NOT EXISTS `post_reports` (
  `report_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`report_id`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post_reports`
--

INSERT INTO `post_reports` (`report_id`, `post_id`) VALUES
(3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `post_subs`
--

CREATE TABLE IF NOT EXISTS `post_subs` (
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`post_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `post_views`
--

CREATE TABLE IF NOT EXISTS `post_views` (
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`post_id`,`user_id`,`time`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post_views`
--

INSERT INTO `post_views` (`post_id`, `user_id`, `time`) VALUES
(2, 1, '2015-12-01 18:35:33'),
(2, 1, '2015-12-01 18:35:45'),
(5, 1, '2015-12-01 18:36:16'),
(5, 1, '2015-12-01 18:36:27'),
(9, 1, '2015-12-01 18:36:37'),
(9, 1, '2015-12-01 18:36:48'),
(9, 1, '2015-12-01 18:41:48'),
(9, 1, '2015-12-01 18:41:58'),
(9, 1, '2015-12-01 18:42:21'),
(26, 1, '2015-12-01 10:33:26'),
(26, 1, '2015-12-01 10:44:04');

-- --------------------------------------------------------

--
-- Table structure for table `post_votes`
--

CREATE TABLE IF NOT EXISTS `post_votes` (
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `vote` enum('UP','DOWN') NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`post_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post_votes`
--

INSERT INTO `post_votes` (`post_id`, `user_id`, `vote`, `time`) VALUES
(1, 1, 'UP', '2015-10-31 15:48:02'),
(1, 2, 'DOWN', '2015-10-31 17:17:14'),
(2, 1, 'UP', '2015-10-31 15:48:02'),
(4, 1, 'UP', '2015-11-28 10:51:37'),
(21, 1, 'DOWN', '2015-11-27 17:51:35'),
(22, 1, 'DOWN', '2015-11-27 17:43:34'),
(24, 1, 'UP', '2015-11-28 08:12:31');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE IF NOT EXISTS `reports` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reason` text NOT NULL,
  PRIMARY KEY (`report_id`),
  FULLTEXT KEY `reason` (`reason`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`report_id`, `user_id`, `time`, `reason`) VALUES
(1, 1, '2015-11-29 11:23:15', 'report test'),
(3, 1, '2015-11-29 11:40:50', 'post-report test'),
(4, 1, '2015-11-29 12:13:42', 'soc-report test'),
(5, 1, '2015-11-29 12:37:18', 'user-report test'),
(6, 1, '2015-11-29 12:37:37', 'user-report test');

-- --------------------------------------------------------

--
-- Table structure for table `societies`
--

CREATE TABLE IF NOT EXISTS `societies` (
  `soc_id` int(11) NOT NULL AUTO_INCREMENT,
  `soc_name` varchar(50) NOT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('NORMAL','DELETED','LOCKED') NOT NULL DEFAULT 'NORMAL',
  `det_revision` int(11) DEFAULT NULL,
  PRIMARY KEY (`soc_id`),
  UNIQUE KEY `soc_name` (`soc_name`),
  KEY `created_by` (`created_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `societies`
--

INSERT INTO `societies` (`soc_id`, `soc_name`, `created_by`, `date_created`, `status`, `det_revision`) VALUES
(1, 'testsociety1', 1, '2015-10-30 14:59:29', 'NORMAL', 1),
(2, 'test2', 1, '2015-10-30 15:00:18', 'NORMAL', 2),
(3, 'test3', 1, '2015-10-30 15:00:19', 'LOCKED', 3),
(4, 'test4', 1, '2015-10-30 15:00:19', 'NORMAL', 4),
(5, 'test5', 1, '2015-10-30 15:00:19', 'NORMAL', NULL),
(6, 'test6', 1, '2015-10-30 15:00:19', 'NORMAL', NULL),
(7, 'test7', 1, '2015-10-30 15:00:19', 'NORMAL', NULL),
(8, 'test8', 1, '2015-10-30 15:00:19', 'NORMAL', NULL),
(9, 'newsoc', 6, '2015-11-07 10:57:54', 'NORMAL', NULL),
(10, 'database', 1, '2015-11-11 07:25:21', 'NORMAL', NULL),
(11, 'illuminati', 1, '2015-12-01 07:13:57', 'NORMAL', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `soc_bans`
--

CREATE TABLE IF NOT EXISTS `soc_bans` (
  `soc_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`soc_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `soc_bans`
--

INSERT INTO `soc_bans` (`soc_id`, `user_id`, `time`) VALUES
(1, 3, '0000-00-00 00:00:00'),
(1, 4, '2015-11-05 16:02:05'),
(2, 2, '2015-11-05 03:00:44');

-- --------------------------------------------------------

--
-- Table structure for table `soc_control_admin_log`
--

CREATE TABLE IF NOT EXISTS `soc_control_admin_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `soc_id` int(11) NOT NULL,
  `action` enum('DELETE','UNDELETE','LOCK','UNLOCK') NOT NULL,
  `comment` varchar(300) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  KEY `admin_id` (`admin_id`),
  KEY `soc_id` (`soc_id`),
  FULLTEXT KEY `comment` (`comment`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `soc_control_admin_log`
--

INSERT INTO `soc_control_admin_log` (`log_id`, `admin_id`, `soc_id`, `action`, `comment`, `time`) VALUES
(1, 1, 2, 'LOCK', 'lock test', '2015-11-29 14:42:54'),
(2, 1, 2, 'UNLOCK', 'unlock test', '2015-11-29 14:43:51'),
(3, 1, 3, 'LOCK', 'lock test', '2015-11-29 14:44:11'),
(4, 1, 3, 'LOCK', 'lock test', '2015-11-29 14:44:11');

-- --------------------------------------------------------

--
-- Table structure for table `soc_details`
--

CREATE TABLE IF NOT EXISTS `soc_details` (
  `rev_id` int(11) NOT NULL AUTO_INCREMENT,
  `soc_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `revised_by` int(11) NOT NULL,
  `info` text NOT NULL,
  PRIMARY KEY (`rev_id`),
  KEY `soc_id` (`soc_id`),
  KEY `revised_by` (`revised_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `soc_details`
--

INSERT INTO `soc_details` (`rev_id`, `soc_id`, `time`, `revised_by`, `info`) VALUES
(1, 1, '2015-10-30 15:35:04', 1, 'test description 1'),
(2, 2, '2015-10-30 15:35:04', 1, 'test description 1'),
(3, 3, '2015-10-30 15:35:04', 1, 'test description 1'),
(4, 4, '2015-10-30 15:35:04', 1, 'test description 1');

-- --------------------------------------------------------

--
-- Table structure for table `soc_mods`
--

CREATE TABLE IF NOT EXISTS `soc_mods` (
  `soc_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`soc_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `soc_mods`
--

INSERT INTO `soc_mods` (`soc_id`, `user_id`, `time`) VALUES
(1, 1, '2015-11-01 05:33:42'),
(1, 5, '2015-11-06 08:12:44');

-- --------------------------------------------------------

--
-- Table structure for table `soc_reports`
--

CREATE TABLE IF NOT EXISTS `soc_reports` (
  `report_id` int(11) NOT NULL,
  `soc_id` int(11) NOT NULL,
  PRIMARY KEY (`report_id`),
  KEY `soc_id` (`soc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `soc_reports`
--

INSERT INTO `soc_reports` (`report_id`, `soc_id`) VALUES
(4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `soc_subs`
--

CREATE TABLE IF NOT EXISTS `soc_subs` (
  `soc_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`soc_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `soc_subs`
--

INSERT INTO `soc_subs` (`soc_id`, `user_id`, `time`) VALUES
(1, 1, '2015-11-07 06:51:53'),
(1, 2, '0000-00-00 00:00:00'),
(1, 6, '2015-11-07 10:46:27'),
(2, 1, '0000-00-00 00:00:00'),
(2, 2, '0000-00-00 00:00:00'),
(3, 1, '2015-12-01 18:41:52'),
(4, 1, '2015-12-01 18:43:36'),
(10, 1, '2015-12-01 19:04:25');

-- --------------------------------------------------------

--
-- Table structure for table `soc_views`
--

CREATE TABLE IF NOT EXISTS `soc_views` (
  `soc_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `soc_id` (`soc_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `soc_views`
--

INSERT INTO `soc_views` (`soc_id`, `user_id`, `time`) VALUES
(10, 1, '2015-12-01 20:31:16'),
(10, 1, '2015-12-01 20:31:59'),
(10, 1, '2015-12-01 20:32:16'),
(10, 1, '2015-12-01 20:32:46'),
(10, 1, '2015-12-01 20:33:11'),
(10, 1, '2015-12-01 20:34:22'),
(10, 1, '2015-12-01 20:42:01'),
(10, 1, '2015-12-01 20:45:03'),
(10, 1, '2015-12-01 20:45:52'),
(10, 1, '2015-12-01 20:46:18'),
(10, 1, '2015-12-01 20:46:43'),
(10, 1, '2015-12-01 21:05:53'),
(10, 1, '2015-12-01 21:06:20'),
(10, 1, '2015-12-01 21:07:20'),
(10, 1, '2015-12-01 21:09:51'),
(10, 1, '2015-12-01 21:10:34'),
(10, 1, '2015-12-01 21:11:09'),
(10, 1, '2015-12-01 21:11:54'),
(10, 1, '2015-12-01 21:13:00'),
(10, 1, '2015-12-01 21:13:13'),
(10, 1, '2015-12-01 21:13:33'),
(10, 1, '2015-12-01 21:13:53'),
(10, 1, '2015-12-01 21:14:28'),
(10, 1, '2015-12-01 21:14:51'),
(10, 1, '2015-12-01 21:15:06'),
(10, 1, '2015-12-01 21:15:35'),
(10, 1, '2015-12-01 21:15:51'),
(10, 1, '2015-12-01 21:16:08'),
(10, 1, '2015-12-01 21:16:21'),
(10, 1, '2015-12-01 21:16:31'),
(10, 1, '2015-12-01 21:17:12'),
(10, 1, '2015-12-01 21:18:03'),
(10, 1, '2015-12-01 21:22:13'),
(10, 1, '2015-12-01 21:22:54'),
(10, 1, '2015-12-01 21:23:27'),
(10, 1, '2015-12-01 21:23:47'),
(10, 1, '2015-12-01 21:24:15'),
(10, 1, '2015-12-01 21:24:30'),
(10, 1, '2015-12-01 21:24:37'),
(10, 1, '2015-12-01 21:28:11'),
(10, 1, '2015-12-01 21:29:01'),
(10, 1, '2015-12-01 21:29:14'),
(10, 1, '2015-12-01 21:31:51'),
(10, 1, '2015-12-01 21:33:42'),
(10, 1, '2015-12-01 21:34:14'),
(10, 1, '2015-12-01 21:34:33'),
(10, 1, '2015-12-01 21:35:27'),
(10, 1, '2015-12-01 21:35:48'),
(10, 1, '2015-12-01 21:36:04'),
(10, 1, '2015-12-01 21:37:02'),
(10, 1, '2015-12-01 21:37:15'),
(10, 1, '2015-12-01 21:37:38'),
(10, 1, '2015-12-01 21:37:56'),
(10, 1, '2015-12-01 21:44:19'),
(10, 1, '2015-12-01 21:47:28'),
(10, 1, '2015-12-01 21:47:38'),
(10, 1, '2015-12-01 21:48:13'),
(10, 1, '2015-12-01 21:49:05'),
(10, 1, '2015-12-01 21:49:50'),
(10, 1, '2015-12-01 21:50:15'),
(10, 1, '2015-12-01 21:50:54'),
(10, 1, '2015-12-01 21:51:16'),
(10, 1, '2015-12-01 21:51:48'),
(10, 1, '2015-12-01 21:52:52'),
(10, 1, '2015-12-01 21:53:08'),
(10, 1, '2015-12-01 21:54:16'),
(10, 1, '2015-12-01 21:54:44'),
(10, 1, '2015-12-01 21:54:59'),
(10, 1, '2015-12-01 21:55:20'),
(10, 1, '2015-12-02 01:51:29'),
(10, 1, '2015-12-02 01:51:33'),
(10, 1, '2015-12-02 01:51:55'),
(10, 1, '2015-12-02 01:52:09'),
(10, 1, '2015-12-02 01:52:21'),
(10, 1, '2015-12-02 02:04:30'),
(10, 1, '2015-12-02 02:04:47'),
(10, 1, '2015-12-02 02:05:58'),
(10, 1, '2015-12-02 02:06:39'),
(10, 1, '2015-12-02 02:07:51'),
(10, 1, '2015-12-02 02:08:09'),
(10, 1, '2015-12-02 02:08:37'),
(10, 1, '2015-12-02 02:09:26'),
(10, 1, '2015-12-02 02:09:57'),
(10, 1, '2015-12-02 02:12:12'),
(10, 1, '2015-12-02 02:12:27'),
(10, 1, '2015-12-02 02:12:32'),
(10, 1, '2015-12-02 02:12:45'),
(10, 1, '2015-12-02 02:13:03'),
(10, 1, '2015-12-02 02:13:14'),
(10, 1, '2015-12-02 02:13:26'),
(10, 1, '2015-12-02 02:13:54'),
(10, 1, '2015-12-02 02:14:03'),
(10, 1, '2015-12-02 02:14:11'),
(10, 1, '2015-12-02 02:21:03'),
(10, 1, '2015-12-02 02:21:56'),
(10, 1, '2015-12-02 02:22:24'),
(10, 1, '2015-12-02 02:22:37'),
(10, 1, '2015-12-02 02:22:56'),
(10, 1, '2015-12-02 02:22:56'),
(10, 1, '2015-12-02 02:22:59'),
(10, 1, '2015-12-02 02:23:03'),
(10, 1, '2015-12-02 02:23:27'),
(10, 1, '2015-12-02 02:23:45'),
(10, 1, '2015-12-02 02:24:15'),
(10, 1, '2015-12-02 02:24:42'),
(10, 1, '2015-12-02 02:24:56'),
(10, 1, '2015-12-02 02:25:09'),
(10, 1, '2015-12-02 02:25:24'),
(10, 1, '2015-12-02 02:26:07'),
(10, 1, '2015-12-02 02:26:26'),
(10, 1, '2015-12-02 02:26:55'),
(10, 1, '2015-12-02 02:28:49'),
(10, 1, '2015-12-02 02:29:17'),
(10, 1, '2015-12-02 02:30:13'),
(10, 1, '2015-12-02 02:30:24'),
(10, 1, '2015-12-02 02:30:49'),
(10, 1, '2015-12-02 02:31:04'),
(10, 1, '2015-12-02 02:31:58'),
(10, 1, '2015-12-02 02:32:42'),
(10, 1, '2015-12-02 02:33:15'),
(10, 1, '2015-12-02 02:33:29'),
(10, 1, '2015-12-02 02:33:48'),
(10, 1, '2015-12-02 02:34:03'),
(10, 1, '2015-12-02 02:34:39'),
(10, 1, '2015-12-02 02:34:59'),
(10, 1, '2015-12-02 02:37:05'),
(10, 1, '2015-12-02 02:37:07'),
(10, 1, '2015-12-02 02:37:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('ADMIN','NORMAL','BANNED') NOT NULL DEFAULT 'NORMAL',
  `failed_logins` int(10) unsigned NOT NULL DEFAULT '0',
  `join_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `status`, `failed_logins`, `join_date`, `last_modified`) VALUES
(1, 'adeel', '$2y$10$EUiZECQ9dymJlCDHZD3OFeG3496EMQHj.umCdXKkxfFQnpW5cwyLi', 'ADMIN', 0, '2015-10-29 06:00:14', '2015-11-23 06:00:14'),
(2, 'abc', '$2y$10$a.UDrp/8YTsHRzZsdKzV.O/3nvgV7vt0mXTBHCFj/98QGqX7XXzWe', 'ADMIN', 0, '2015-10-29 06:00:14', '2015-11-28 18:02:27'),
(3, 'test', '$2y$10$2gTGdQ4SLmPtEssM11Ckr.AjzX8f/ex9zGy0bndnXaCsFFOPj6iAS', 'NORMAL', 3, '2015-10-29 06:00:14', '2015-11-23 06:00:14'),
(4, 'test2', '$2y$10$vRUygeGtOeSTM9CBjN9.ce0N4iVx6mOXYzYCk6X6jsr57lZtvOpVS', 'NORMAL', 0, '2015-11-05 15:55:36', '2015-11-22 18:00:08'),
(5, 'test3', '$2y$10$J68st60hxuKfKgBCtGaFy.R4f0TJlmYu4/EW37MM3GN3/Owww0bPG', 'BANNED', 0, '2015-11-05 15:56:38', '2015-11-22 17:40:54'),
(6, 'someuser', '$2y$10$JHLsP0ZcY/jMtUuyD9aKf.V.ek8TdBcCgz4gBjK6N2RVy4oOHijxO', 'NORMAL', 0, '2015-11-07 10:42:17', '2015-11-07 10:42:17'),
(7, 'test4', '$2y$10$QF/pYgkzJsdGvUI5LY6/UOweSbCzz05VNdQuZXZ9d6oVjIwKcLq0q', 'NORMAL', 0, '2015-11-23 06:17:54', '2015-11-23 06:17:54'),
(8, 'test5', '$2y$10$nNoDVUg97FOiG7I2nCmgB.cOCtHZFFSt2XEJIY/nwIbZb/S32UGCe', 'NORMAL', 0, '2015-11-23 06:22:14', '2015-11-23 06:22:14');

-- --------------------------------------------------------

--
-- Table structure for table `user_activity`
--

CREATE TABLE IF NOT EXISTS `user_activity` (
  `user_id` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_activity`
--

INSERT INTO `user_activity` (`user_id`, `time`) VALUES
(1, '2015-12-01 18:48:29'),
(1, '2015-12-01 18:48:29'),
(1, '2015-12-01 18:48:29'),
(1, '2015-12-01 18:48:29'),
(1, '2015-12-01 18:48:29'),
(1, '2015-12-01 18:48:30'),
(1, '2015-12-01 19:00:18'),
(1, '2015-12-01 19:00:18'),
(1, '2015-12-01 19:00:18'),
(1, '2015-12-01 19:00:19'),
(1, '2015-12-01 19:00:19'),
(1, '2015-12-01 19:00:19'),
(1, '2015-12-01 19:00:39'),
(1, '2015-12-01 19:00:39'),
(1, '2015-12-01 19:00:39'),
(1, '2015-12-01 19:00:40'),
(1, '2015-12-01 19:00:40'),
(1, '2015-12-01 19:00:40'),
(1, '2015-12-01 19:02:10'),
(1, '2015-12-01 19:02:10'),
(1, '2015-12-01 19:02:10'),
(1, '2015-12-01 19:02:10'),
(1, '2015-12-01 19:02:10'),
(1, '2015-12-01 19:02:10'),
(1, '2015-12-01 19:02:40'),
(1, '2015-12-01 19:02:40'),
(1, '2015-12-01 19:02:40'),
(1, '2015-12-01 19:02:41'),
(1, '2015-12-01 19:02:41'),
(1, '2015-12-01 19:02:41'),
(1, '2015-12-01 19:03:15'),
(1, '2015-12-01 19:03:15'),
(1, '2015-12-01 19:03:15'),
(1, '2015-12-01 19:03:15'),
(1, '2015-12-01 19:03:15'),
(1, '2015-12-01 19:03:15'),
(1, '2015-12-01 19:03:32'),
(1, '2015-12-01 19:03:32'),
(1, '2015-12-01 19:03:32'),
(1, '2015-12-01 19:03:32'),
(1, '2015-12-01 19:03:32'),
(1, '2015-12-01 19:03:32'),
(1, '2015-12-01 19:03:56'),
(1, '2015-12-01 19:03:57'),
(1, '2015-12-01 19:03:57'),
(1, '2015-12-01 19:03:57'),
(1, '2015-12-01 19:03:57'),
(1, '2015-12-01 19:03:57'),
(1, '2015-12-01 19:04:14'),
(1, '2015-12-01 19:04:14'),
(1, '2015-12-01 19:04:14'),
(1, '2015-12-01 19:04:14'),
(1, '2015-12-01 19:04:14'),
(1, '2015-12-01 19:04:14'),
(1, '2015-12-01 19:04:22'),
(1, '2015-12-01 19:04:22'),
(1, '2015-12-01 19:04:22'),
(1, '2015-12-01 19:04:22'),
(1, '2015-12-01 19:04:25'),
(1, '2015-12-01 19:04:25'),
(1, '2015-12-01 19:04:25'),
(1, '2015-12-01 19:04:25'),
(1, '2015-12-01 19:04:28'),
(1, '2015-12-01 19:04:28'),
(1, '2015-12-01 19:04:28'),
(1, '2015-12-01 19:04:28'),
(1, '2015-12-01 19:04:28'),
(1, '2015-12-01 19:04:28'),
(1, '2015-12-01 19:06:01'),
(1, '2015-12-01 19:06:01'),
(1, '2015-12-01 19:06:01'),
(1, '2015-12-01 19:06:01'),
(1, '2015-12-01 19:06:01'),
(1, '2015-12-01 19:06:01'),
(1, '2015-12-01 19:30:17'),
(1, '2015-12-01 19:30:17'),
(1, '2015-12-01 19:30:17'),
(1, '2015-12-01 19:30:17'),
(1, '2015-12-01 19:30:17'),
(1, '2015-12-01 19:30:17'),
(1, '2015-12-01 19:30:22'),
(1, '2015-12-01 19:30:22'),
(1, '2015-12-01 19:30:22'),
(1, '2015-12-01 19:30:22'),
(1, '2015-12-01 19:30:22'),
(1, '2015-12-01 19:30:22'),
(1, '2015-12-01 19:31:11'),
(1, '2015-12-01 19:31:12'),
(1, '2015-12-01 19:31:12'),
(1, '2015-12-01 19:31:12'),
(1, '2015-12-01 19:31:12'),
(1, '2015-12-01 19:31:12'),
(1, '2015-12-01 19:31:45'),
(1, '2015-12-01 19:31:45'),
(1, '2015-12-01 19:31:45'),
(1, '2015-12-01 19:31:45'),
(1, '2015-12-01 19:31:46'),
(1, '2015-12-01 19:31:46'),
(1, '2015-12-01 19:33:33'),
(1, '2015-12-01 19:33:34'),
(1, '2015-12-01 19:33:34'),
(1, '2015-12-01 19:33:34'),
(1, '2015-12-01 19:33:34'),
(1, '2015-12-01 19:33:34'),
(1, '2015-12-01 19:34:28'),
(1, '2015-12-01 19:34:28'),
(1, '2015-12-01 19:34:28'),
(1, '2015-12-01 19:35:51'),
(1, '2015-12-01 19:35:51'),
(1, '2015-12-01 19:35:51'),
(1, '2015-12-01 19:35:51'),
(1, '2015-12-01 19:40:05'),
(1, '2015-12-01 19:40:05'),
(1, '2015-12-01 19:40:05'),
(1, '2015-12-01 19:40:05'),
(1, '2015-12-01 19:40:09'),
(1, '2015-12-01 19:40:09'),
(1, '2015-12-01 19:40:09'),
(1, '2015-12-01 19:40:09'),
(1, '2015-12-01 19:40:09'),
(1, '2015-12-01 19:40:09'),
(1, '2015-12-01 19:40:12'),
(1, '2015-12-01 19:40:12'),
(1, '2015-12-01 19:40:12'),
(1, '2015-12-01 19:40:12'),
(1, '2015-12-01 19:40:12'),
(1, '2015-12-01 19:40:13'),
(1, '2015-12-01 19:56:45'),
(1, '2015-12-01 19:56:45'),
(1, '2015-12-01 19:56:45'),
(1, '2015-12-01 19:56:45'),
(1, '2015-12-01 19:56:45'),
(1, '2015-12-01 19:56:45'),
(1, '2015-12-01 19:57:14'),
(1, '2015-12-01 19:57:14'),
(1, '2015-12-01 19:57:14'),
(1, '2015-12-01 19:57:14'),
(1, '2015-12-01 19:57:14'),
(1, '2015-12-01 19:57:14'),
(1, '2015-12-01 20:04:12'),
(1, '2015-12-01 20:04:13'),
(1, '2015-12-01 20:04:13'),
(1, '2015-12-01 20:04:13'),
(1, '2015-12-01 20:04:13'),
(1, '2015-12-01 20:04:13'),
(1, '2015-12-01 20:05:54'),
(1, '2015-12-01 20:05:55'),
(1, '2015-12-01 20:05:55'),
(1, '2015-12-01 20:05:55'),
(1, '2015-12-01 20:05:55'),
(1, '2015-12-01 20:05:55'),
(1, '2015-12-01 20:07:53'),
(1, '2015-12-01 20:07:53'),
(1, '2015-12-01 20:07:53'),
(1, '2015-12-01 20:07:53'),
(1, '2015-12-01 20:07:53'),
(1, '2015-12-01 20:07:53'),
(1, '2015-12-01 20:24:43'),
(1, '2015-12-01 20:24:44'),
(1, '2015-12-01 20:24:44'),
(1, '2015-12-01 20:24:44'),
(1, '2015-12-01 20:24:44'),
(1, '2015-12-01 20:24:44'),
(1, '2015-12-01 20:31:16'),
(1, '2015-12-01 20:31:16'),
(1, '2015-12-01 20:31:16'),
(1, '2015-12-01 20:31:16'),
(1, '2015-12-01 20:31:59'),
(1, '2015-12-01 20:31:59'),
(1, '2015-12-01 20:31:59'),
(1, '2015-12-01 20:31:59'),
(1, '2015-12-01 20:32:00'),
(1, '2015-12-01 20:32:00'),
(1, '2015-12-01 20:32:16'),
(1, '2015-12-01 20:32:16'),
(1, '2015-12-01 20:32:16'),
(1, '2015-12-01 20:32:16'),
(1, '2015-12-01 20:32:16'),
(1, '2015-12-01 20:32:16'),
(1, '2015-12-01 20:32:46'),
(1, '2015-12-01 20:32:46'),
(1, '2015-12-01 20:32:46'),
(1, '2015-12-01 20:32:47'),
(1, '2015-12-01 20:32:47'),
(1, '2015-12-01 20:32:47'),
(1, '2015-12-01 20:32:47'),
(1, '2015-12-01 20:33:11'),
(1, '2015-12-01 20:33:11'),
(1, '2015-12-01 20:33:12'),
(1, '2015-12-01 20:33:12'),
(1, '2015-12-01 20:33:12'),
(1, '2015-12-01 20:33:12'),
(1, '2015-12-01 20:33:12'),
(1, '2015-12-01 20:34:22'),
(1, '2015-12-01 20:34:23'),
(1, '2015-12-01 20:34:23'),
(1, '2015-12-01 20:34:23'),
(1, '2015-12-01 20:34:23'),
(1, '2015-12-01 20:34:23'),
(1, '2015-12-01 20:34:23'),
(1, '2015-12-01 20:42:01'),
(1, '2015-12-01 20:42:01'),
(1, '2015-12-01 20:42:01'),
(1, '2015-12-01 20:42:01'),
(1, '2015-12-01 20:42:01'),
(1, '2015-12-01 20:42:01'),
(1, '2015-12-01 20:42:01'),
(1, '2015-12-01 20:45:03'),
(1, '2015-12-01 20:45:03'),
(1, '2015-12-01 20:45:03'),
(1, '2015-12-01 20:45:03'),
(1, '2015-12-01 20:45:03'),
(1, '2015-12-01 20:45:03'),
(1, '2015-12-01 20:45:03'),
(1, '2015-12-01 20:45:52'),
(1, '2015-12-01 20:45:52'),
(1, '2015-12-01 20:45:52'),
(1, '2015-12-01 20:45:53'),
(1, '2015-12-01 20:45:53'),
(1, '2015-12-01 20:45:53'),
(1, '2015-12-01 20:45:53'),
(1, '2015-12-01 20:46:18'),
(1, '2015-12-01 20:46:19'),
(1, '2015-12-01 20:46:19'),
(1, '2015-12-01 20:46:19'),
(1, '2015-12-01 20:46:19'),
(1, '2015-12-01 20:46:19'),
(1, '2015-12-01 20:46:19'),
(1, '2015-12-01 20:46:43'),
(1, '2015-12-01 20:46:43'),
(1, '2015-12-01 20:46:43'),
(1, '2015-12-01 20:46:43'),
(1, '2015-12-01 20:46:43'),
(1, '2015-12-01 20:46:43'),
(1, '2015-12-01 20:46:43'),
(1, '2015-12-01 21:05:49'),
(1, '2015-12-01 21:05:49'),
(1, '2015-12-01 21:05:49'),
(1, '2015-12-01 21:05:49'),
(1, '2015-12-01 21:05:49'),
(1, '2015-12-01 21:05:49'),
(1, '2015-12-01 21:05:53'),
(1, '2015-12-01 21:05:53'),
(1, '2015-12-01 21:05:53'),
(1, '2015-12-01 21:05:54'),
(1, '2015-12-01 21:05:54'),
(1, '2015-12-01 21:05:54'),
(1, '2015-12-01 21:05:54'),
(1, '2015-12-01 21:05:54'),
(1, '2015-12-01 21:06:19'),
(1, '2015-12-01 21:06:20'),
(1, '2015-12-01 21:06:20'),
(1, '2015-12-01 21:06:20'),
(1, '2015-12-01 21:06:20'),
(1, '2015-12-01 21:06:20'),
(1, '2015-12-01 21:06:20'),
(1, '2015-12-01 21:06:20'),
(1, '2015-12-01 21:07:20'),
(1, '2015-12-01 21:07:20'),
(1, '2015-12-01 21:07:20'),
(1, '2015-12-01 21:07:20'),
(1, '2015-12-01 21:07:20'),
(1, '2015-12-01 21:07:20'),
(1, '2015-12-01 21:07:20'),
(1, '2015-12-01 21:07:20'),
(1, '2015-12-01 21:09:51'),
(1, '2015-12-01 21:09:51'),
(1, '2015-12-01 21:09:51'),
(1, '2015-12-01 21:09:51'),
(1, '2015-12-01 21:09:51'),
(1, '2015-12-01 21:09:51'),
(1, '2015-12-01 21:09:52'),
(1, '2015-12-01 21:09:52'),
(1, '2015-12-01 21:10:34'),
(1, '2015-12-01 21:10:34'),
(1, '2015-12-01 21:10:34'),
(1, '2015-12-01 21:10:34'),
(1, '2015-12-01 21:10:34'),
(1, '2015-12-01 21:10:34'),
(1, '2015-12-01 21:10:34'),
(1, '2015-12-01 21:10:34'),
(1, '2015-12-01 21:11:09'),
(1, '2015-12-01 21:11:09'),
(1, '2015-12-01 21:11:09'),
(1, '2015-12-01 21:11:09'),
(1, '2015-12-01 21:11:09'),
(1, '2015-12-01 21:11:09'),
(1, '2015-12-01 21:11:10'),
(1, '2015-12-01 21:11:10'),
(1, '2015-12-01 21:11:54'),
(1, '2015-12-01 21:11:54'),
(1, '2015-12-01 21:11:54'),
(1, '2015-12-01 21:11:54'),
(1, '2015-12-01 21:11:54'),
(1, '2015-12-01 21:11:54'),
(1, '2015-12-01 21:11:54'),
(1, '2015-12-01 21:11:54'),
(1, '2015-12-01 21:13:00'),
(1, '2015-12-01 21:13:00'),
(1, '2015-12-01 21:13:00'),
(1, '2015-12-01 21:13:00'),
(1, '2015-12-01 21:13:00'),
(1, '2015-12-01 21:13:00'),
(1, '2015-12-01 21:13:00'),
(1, '2015-12-01 21:13:00'),
(1, '2015-12-01 21:13:13'),
(1, '2015-12-01 21:13:13'),
(1, '2015-12-01 21:13:13'),
(1, '2015-12-01 21:13:13'),
(1, '2015-12-01 21:13:13'),
(1, '2015-12-01 21:13:13'),
(1, '2015-12-01 21:13:13'),
(1, '2015-12-01 21:13:13'),
(1, '2015-12-01 21:13:32'),
(1, '2015-12-01 21:13:33'),
(1, '2015-12-01 21:13:33'),
(1, '2015-12-01 21:13:33'),
(1, '2015-12-01 21:13:33'),
(1, '2015-12-01 21:13:33'),
(1, '2015-12-01 21:13:33'),
(1, '2015-12-01 21:13:33'),
(1, '2015-12-01 21:13:53'),
(1, '2015-12-01 21:13:54'),
(1, '2015-12-01 21:13:54'),
(1, '2015-12-01 21:13:54'),
(1, '2015-12-01 21:13:54'),
(1, '2015-12-01 21:13:54'),
(1, '2015-12-01 21:13:54'),
(1, '2015-12-01 21:13:54'),
(1, '2015-12-01 21:14:28'),
(1, '2015-12-01 21:14:28'),
(1, '2015-12-01 21:14:28'),
(1, '2015-12-01 21:14:28'),
(1, '2015-12-01 21:14:28'),
(1, '2015-12-01 21:14:28'),
(1, '2015-12-01 21:14:28'),
(1, '2015-12-01 21:14:28'),
(1, '2015-12-01 21:14:51'),
(1, '2015-12-01 21:14:51'),
(1, '2015-12-01 21:14:51'),
(1, '2015-12-01 21:14:51'),
(1, '2015-12-01 21:14:51'),
(1, '2015-12-01 21:14:51'),
(1, '2015-12-01 21:14:52'),
(1, '2015-12-01 21:14:52'),
(1, '2015-12-01 21:15:06'),
(1, '2015-12-01 21:15:06'),
(1, '2015-12-01 21:15:06'),
(1, '2015-12-01 21:15:07'),
(1, '2015-12-01 21:15:07'),
(1, '2015-12-01 21:15:07'),
(1, '2015-12-01 21:15:07'),
(1, '2015-12-01 21:15:07'),
(1, '2015-12-01 21:15:35'),
(1, '2015-12-01 21:15:35'),
(1, '2015-12-01 21:15:35'),
(1, '2015-12-01 21:15:35'),
(1, '2015-12-01 21:15:35'),
(1, '2015-12-01 21:15:36'),
(1, '2015-12-01 21:15:36'),
(1, '2015-12-01 21:15:36'),
(1, '2015-12-01 21:15:51'),
(1, '2015-12-01 21:15:51'),
(1, '2015-12-01 21:15:51'),
(1, '2015-12-01 21:15:51'),
(1, '2015-12-01 21:15:51'),
(1, '2015-12-01 21:15:51'),
(1, '2015-12-01 21:15:51'),
(1, '2015-12-01 21:15:51'),
(1, '2015-12-01 21:16:08'),
(1, '2015-12-01 21:16:09'),
(1, '2015-12-01 21:16:09'),
(1, '2015-12-01 21:16:09'),
(1, '2015-12-01 21:16:09'),
(1, '2015-12-01 21:16:09'),
(1, '2015-12-01 21:16:09'),
(1, '2015-12-01 21:16:09'),
(1, '2015-12-01 21:16:21'),
(1, '2015-12-01 21:16:21'),
(1, '2015-12-01 21:16:21'),
(1, '2015-12-01 21:16:21'),
(1, '2015-12-01 21:16:21'),
(1, '2015-12-01 21:16:21'),
(1, '2015-12-01 21:16:21'),
(1, '2015-12-01 21:16:21'),
(1, '2015-12-01 21:16:31'),
(1, '2015-12-01 21:16:31'),
(1, '2015-12-01 21:16:31'),
(1, '2015-12-01 21:16:31'),
(1, '2015-12-01 21:16:31'),
(1, '2015-12-01 21:16:31'),
(1, '2015-12-01 21:16:31'),
(1, '2015-12-01 21:16:32'),
(1, '2015-12-01 21:17:12'),
(1, '2015-12-01 21:17:12'),
(1, '2015-12-01 21:17:12'),
(1, '2015-12-01 21:17:12'),
(1, '2015-12-01 21:17:12'),
(1, '2015-12-01 21:17:12'),
(1, '2015-12-01 21:17:12'),
(1, '2015-12-01 21:17:12'),
(1, '2015-12-01 21:18:03'),
(1, '2015-12-01 21:18:03'),
(1, '2015-12-01 21:18:03'),
(1, '2015-12-01 21:18:03'),
(1, '2015-12-01 21:18:03'),
(1, '2015-12-01 21:18:03'),
(1, '2015-12-01 21:18:03'),
(1, '2015-12-01 21:18:03'),
(1, '2015-12-01 21:22:13'),
(1, '2015-12-01 21:22:13'),
(1, '2015-12-01 21:22:13'),
(1, '2015-12-01 21:22:13'),
(1, '2015-12-01 21:22:13'),
(1, '2015-12-01 21:22:13'),
(1, '2015-12-01 21:22:13'),
(1, '2015-12-01 21:22:13'),
(1, '2015-12-01 21:22:54'),
(1, '2015-12-01 21:22:54'),
(1, '2015-12-01 21:22:54'),
(1, '2015-12-01 21:22:54'),
(1, '2015-12-01 21:22:54'),
(1, '2015-12-01 21:22:54'),
(1, '2015-12-01 21:22:54'),
(1, '2015-12-01 21:22:54'),
(1, '2015-12-01 21:23:27'),
(1, '2015-12-01 21:23:27'),
(1, '2015-12-01 21:23:27'),
(1, '2015-12-01 21:23:27'),
(1, '2015-12-01 21:23:27'),
(1, '2015-12-01 21:23:27'),
(1, '2015-12-01 21:23:27'),
(1, '2015-12-01 21:23:27'),
(1, '2015-12-01 21:23:47'),
(1, '2015-12-01 21:23:47'),
(1, '2015-12-01 21:23:47'),
(1, '2015-12-01 21:23:47'),
(1, '2015-12-01 21:23:47'),
(1, '2015-12-01 21:23:47'),
(1, '2015-12-01 21:23:47'),
(1, '2015-12-01 21:23:47'),
(1, '2015-12-01 21:24:15'),
(1, '2015-12-01 21:24:16'),
(1, '2015-12-01 21:24:16'),
(1, '2015-12-01 21:24:16'),
(1, '2015-12-01 21:24:16'),
(1, '2015-12-01 21:24:16'),
(1, '2015-12-01 21:24:16'),
(1, '2015-12-01 21:24:16'),
(1, '2015-12-01 21:24:30'),
(1, '2015-12-01 21:24:30'),
(1, '2015-12-01 21:24:30'),
(1, '2015-12-01 21:24:30'),
(1, '2015-12-01 21:24:30'),
(1, '2015-12-01 21:24:30'),
(1, '2015-12-01 21:24:30'),
(1, '2015-12-01 21:24:30'),
(1, '2015-12-01 21:24:37'),
(1, '2015-12-01 21:24:37'),
(1, '2015-12-01 21:24:37'),
(1, '2015-12-01 21:24:37'),
(1, '2015-12-01 21:24:37'),
(1, '2015-12-01 21:24:38'),
(1, '2015-12-01 21:24:38'),
(1, '2015-12-01 21:24:38'),
(1, '2015-12-01 21:28:10'),
(1, '2015-12-01 21:28:11'),
(1, '2015-12-01 21:28:11'),
(1, '2015-12-01 21:28:11'),
(1, '2015-12-01 21:28:11'),
(1, '2015-12-01 21:28:11'),
(1, '2015-12-01 21:28:11'),
(1, '2015-12-01 21:28:11'),
(1, '2015-12-01 21:29:01'),
(1, '2015-12-01 21:29:01'),
(1, '2015-12-01 21:29:01'),
(1, '2015-12-01 21:29:01'),
(1, '2015-12-01 21:29:01'),
(1, '2015-12-01 21:29:01'),
(1, '2015-12-01 21:29:01'),
(1, '2015-12-01 21:29:01'),
(1, '2015-12-01 21:29:14'),
(1, '2015-12-01 21:29:14'),
(1, '2015-12-01 21:29:14'),
(1, '2015-12-01 21:29:14'),
(1, '2015-12-01 21:29:14'),
(1, '2015-12-01 21:29:14'),
(1, '2015-12-01 21:29:14'),
(1, '2015-12-01 21:29:14'),
(1, '2015-12-01 21:31:50'),
(1, '2015-12-01 21:31:51'),
(1, '2015-12-01 21:31:51'),
(1, '2015-12-01 21:31:51'),
(1, '2015-12-01 21:31:51'),
(1, '2015-12-01 21:31:51'),
(1, '2015-12-01 21:31:51'),
(1, '2015-12-01 21:31:51'),
(1, '2015-12-01 21:33:38'),
(1, '2015-12-01 21:33:39'),
(1, '2015-12-01 21:33:39'),
(1, '2015-12-01 21:33:39'),
(1, '2015-12-01 21:33:39'),
(1, '2015-12-01 21:33:39'),
(1, '2015-12-01 21:33:42'),
(1, '2015-12-01 21:33:42'),
(1, '2015-12-01 21:33:42'),
(1, '2015-12-01 21:33:42'),
(1, '2015-12-01 21:33:42'),
(1, '2015-12-01 21:33:42'),
(1, '2015-12-01 21:33:42'),
(1, '2015-12-01 21:33:42'),
(1, '2015-12-01 21:34:14'),
(1, '2015-12-01 21:34:14'),
(1, '2015-12-01 21:34:14'),
(1, '2015-12-01 21:34:14'),
(1, '2015-12-01 21:34:15'),
(1, '2015-12-01 21:34:15'),
(1, '2015-12-01 21:34:15'),
(1, '2015-12-01 21:34:15'),
(1, '2015-12-01 21:34:33'),
(1, '2015-12-01 21:34:33'),
(1, '2015-12-01 21:34:33'),
(1, '2015-12-01 21:34:33'),
(1, '2015-12-01 21:34:33'),
(1, '2015-12-01 21:34:33'),
(1, '2015-12-01 21:34:33'),
(1, '2015-12-01 21:34:33'),
(1, '2015-12-01 21:35:27'),
(1, '2015-12-01 21:35:27'),
(1, '2015-12-01 21:35:27'),
(1, '2015-12-01 21:35:27'),
(1, '2015-12-01 21:35:27'),
(1, '2015-12-01 21:35:27'),
(1, '2015-12-01 21:35:27'),
(1, '2015-12-01 21:35:27'),
(1, '2015-12-01 21:35:47'),
(1, '2015-12-01 21:35:48'),
(1, '2015-12-01 21:35:48'),
(1, '2015-12-01 21:35:48'),
(1, '2015-12-01 21:35:48'),
(1, '2015-12-01 21:35:48'),
(1, '2015-12-01 21:35:48'),
(1, '2015-12-01 21:35:48'),
(1, '2015-12-01 21:36:04'),
(1, '2015-12-01 21:36:04'),
(1, '2015-12-01 21:36:04'),
(1, '2015-12-01 21:36:04'),
(1, '2015-12-01 21:36:04'),
(1, '2015-12-01 21:36:04'),
(1, '2015-12-01 21:36:04'),
(1, '2015-12-01 21:36:04'),
(1, '2015-12-01 21:37:02'),
(1, '2015-12-01 21:37:02'),
(1, '2015-12-01 21:37:02'),
(1, '2015-12-01 21:37:02'),
(1, '2015-12-01 21:37:02'),
(1, '2015-12-01 21:37:02'),
(1, '2015-12-01 21:37:02'),
(1, '2015-12-01 21:37:02'),
(1, '2015-12-01 21:37:15'),
(1, '2015-12-01 21:37:15'),
(1, '2015-12-01 21:37:16'),
(1, '2015-12-01 21:37:16'),
(1, '2015-12-01 21:37:16'),
(1, '2015-12-01 21:37:16'),
(1, '2015-12-01 21:37:16'),
(1, '2015-12-01 21:37:16'),
(1, '2015-12-01 21:37:38'),
(1, '2015-12-01 21:37:38'),
(1, '2015-12-01 21:37:38'),
(1, '2015-12-01 21:37:38'),
(1, '2015-12-01 21:37:38'),
(1, '2015-12-01 21:37:38'),
(1, '2015-12-01 21:37:38'),
(1, '2015-12-01 21:37:38'),
(1, '2015-12-01 21:37:55'),
(1, '2015-12-01 21:37:56'),
(1, '2015-12-01 21:37:56'),
(1, '2015-12-01 21:37:56'),
(1, '2015-12-01 21:37:56'),
(1, '2015-12-01 21:37:56'),
(1, '2015-12-01 21:37:56'),
(1, '2015-12-01 21:37:56'),
(1, '2015-12-01 21:44:19'),
(1, '2015-12-01 21:44:19'),
(1, '2015-12-01 21:44:19'),
(1, '2015-12-01 21:44:19'),
(1, '2015-12-01 21:44:19'),
(1, '2015-12-01 21:44:19'),
(1, '2015-12-01 21:44:19'),
(1, '2015-12-01 21:44:19'),
(1, '2015-12-01 21:47:28'),
(1, '2015-12-01 21:47:28'),
(1, '2015-12-01 21:47:28'),
(1, '2015-12-01 21:47:29'),
(1, '2015-12-01 21:47:29'),
(1, '2015-12-01 21:47:29'),
(1, '2015-12-01 21:47:29'),
(1, '2015-12-01 21:47:29'),
(1, '2015-12-01 21:47:38'),
(1, '2015-12-01 21:47:38'),
(1, '2015-12-01 21:47:38'),
(1, '2015-12-01 21:47:38'),
(1, '2015-12-01 21:47:38'),
(1, '2015-12-01 21:47:38'),
(1, '2015-12-01 21:47:38'),
(1, '2015-12-01 21:47:38'),
(1, '2015-12-01 21:48:13'),
(1, '2015-12-01 21:48:13'),
(1, '2015-12-01 21:48:13'),
(1, '2015-12-01 21:48:13'),
(1, '2015-12-01 21:48:13'),
(1, '2015-12-01 21:49:05'),
(1, '2015-12-01 21:49:05'),
(1, '2015-12-01 21:49:05'),
(1, '2015-12-01 21:49:05'),
(1, '2015-12-01 21:49:06'),
(1, '2015-12-01 21:49:50'),
(1, '2015-12-01 21:49:50'),
(1, '2015-12-01 21:49:50'),
(1, '2015-12-01 21:49:50'),
(1, '2015-12-01 21:50:15'),
(1, '2015-12-01 21:50:16'),
(1, '2015-12-01 21:50:16'),
(1, '2015-12-01 21:50:16'),
(1, '2015-12-01 21:50:54'),
(1, '2015-12-01 21:50:54'),
(1, '2015-12-01 21:50:54'),
(1, '2015-12-01 21:50:54'),
(1, '2015-12-01 21:51:16'),
(1, '2015-12-01 21:51:16'),
(1, '2015-12-01 21:51:16'),
(1, '2015-12-01 21:51:16'),
(1, '2015-12-01 21:51:48'),
(1, '2015-12-01 21:51:48'),
(1, '2015-12-01 21:51:48'),
(1, '2015-12-01 21:51:48'),
(1, '2015-12-01 21:52:52'),
(1, '2015-12-01 21:52:52'),
(1, '2015-12-01 21:52:52'),
(1, '2015-12-01 21:52:52'),
(1, '2015-12-01 21:53:08'),
(1, '2015-12-01 21:53:08'),
(1, '2015-12-01 21:53:08'),
(1, '2015-12-01 21:53:08'),
(1, '2015-12-01 21:54:16'),
(1, '2015-12-01 21:54:16'),
(1, '2015-12-01 21:54:16'),
(1, '2015-12-01 21:54:16'),
(1, '2015-12-01 21:54:44'),
(1, '2015-12-01 21:54:44'),
(1, '2015-12-01 21:54:45'),
(1, '2015-12-01 21:54:45'),
(1, '2015-12-01 21:54:59'),
(1, '2015-12-01 21:54:59'),
(1, '2015-12-01 21:54:59'),
(1, '2015-12-01 21:54:59'),
(1, '2015-12-01 21:55:20'),
(1, '2015-12-01 21:55:20'),
(1, '2015-12-01 21:55:20'),
(1, '2015-12-01 21:55:20'),
(1, '2015-12-02 01:51:14'),
(1, '2015-12-02 01:51:29'),
(1, '2015-12-02 01:51:29'),
(1, '2015-12-02 01:51:29'),
(1, '2015-12-02 01:51:29'),
(1, '2015-12-02 01:51:29'),
(1, '2015-12-02 01:51:29'),
(1, '2015-12-02 01:51:29'),
(1, '2015-12-02 01:51:29'),
(1, '2015-12-02 01:51:33'),
(1, '2015-12-02 01:51:33'),
(1, '2015-12-02 01:51:33'),
(1, '2015-12-02 01:51:33'),
(1, '2015-12-02 01:51:55'),
(1, '2015-12-02 01:51:55'),
(1, '2015-12-02 01:51:55'),
(1, '2015-12-02 01:51:55'),
(1, '2015-12-02 01:52:09'),
(1, '2015-12-02 01:52:09'),
(1, '2015-12-02 01:52:09'),
(1, '2015-12-02 01:52:09'),
(1, '2015-12-02 01:52:21'),
(1, '2015-12-02 01:52:21'),
(1, '2015-12-02 01:52:21'),
(1, '2015-12-02 01:52:21'),
(1, '2015-12-02 02:04:29'),
(1, '2015-12-02 02:04:30'),
(1, '2015-12-02 02:04:30'),
(1, '2015-12-02 02:04:30'),
(1, '2015-12-02 02:04:30'),
(1, '2015-12-02 02:04:47'),
(1, '2015-12-02 02:04:47'),
(1, '2015-12-02 02:04:47'),
(1, '2015-12-02 02:04:47'),
(1, '2015-12-02 02:04:47'),
(1, '2015-12-02 02:05:58'),
(1, '2015-12-02 02:05:59'),
(1, '2015-12-02 02:05:59'),
(1, '2015-12-02 02:05:59'),
(1, '2015-12-02 02:05:59'),
(1, '2015-12-02 02:06:39'),
(1, '2015-12-02 02:06:39'),
(1, '2015-12-02 02:06:39'),
(1, '2015-12-02 02:06:39'),
(1, '2015-12-02 02:06:39'),
(1, '2015-12-02 02:07:51'),
(1, '2015-12-02 02:07:51'),
(1, '2015-12-02 02:07:51'),
(1, '2015-12-02 02:07:51'),
(1, '2015-12-02 02:07:51'),
(1, '2015-12-02 02:08:08'),
(1, '2015-12-02 02:08:09'),
(1, '2015-12-02 02:08:09'),
(1, '2015-12-02 02:08:09'),
(1, '2015-12-02 02:08:09'),
(1, '2015-12-02 02:08:37'),
(1, '2015-12-02 02:08:37'),
(1, '2015-12-02 02:08:37'),
(1, '2015-12-02 02:08:37'),
(1, '2015-12-02 02:08:37'),
(1, '2015-12-02 02:09:26'),
(1, '2015-12-02 02:09:26'),
(1, '2015-12-02 02:09:26'),
(1, '2015-12-02 02:09:26'),
(1, '2015-12-02 02:09:26'),
(1, '2015-12-02 02:09:57'),
(1, '2015-12-02 02:09:57'),
(1, '2015-12-02 02:09:57'),
(1, '2015-12-02 02:09:57'),
(1, '2015-12-02 02:09:57'),
(1, '2015-12-02 02:12:12'),
(1, '2015-12-02 02:12:12'),
(1, '2015-12-02 02:12:12'),
(1, '2015-12-02 02:12:12'),
(1, '2015-12-02 02:12:12'),
(1, '2015-12-02 02:12:27'),
(1, '2015-12-02 02:12:27'),
(1, '2015-12-02 02:12:27'),
(1, '2015-12-02 02:12:27'),
(1, '2015-12-02 02:12:27'),
(1, '2015-12-02 02:12:32'),
(1, '2015-12-02 02:12:32'),
(1, '2015-12-02 02:12:32'),
(1, '2015-12-02 02:12:32'),
(1, '2015-12-02 02:12:32'),
(1, '2015-12-02 02:12:45'),
(1, '2015-12-02 02:12:45'),
(1, '2015-12-02 02:12:45'),
(1, '2015-12-02 02:12:45'),
(1, '2015-12-02 02:12:45'),
(1, '2015-12-02 02:13:03'),
(1, '2015-12-02 02:13:03'),
(1, '2015-12-02 02:13:03'),
(1, '2015-12-02 02:13:03'),
(1, '2015-12-02 02:13:03'),
(1, '2015-12-02 02:13:14'),
(1, '2015-12-02 02:13:14'),
(1, '2015-12-02 02:13:14'),
(1, '2015-12-02 02:13:14'),
(1, '2015-12-02 02:13:14'),
(1, '2015-12-02 02:13:26'),
(1, '2015-12-02 02:13:26'),
(1, '2015-12-02 02:13:26'),
(1, '2015-12-02 02:13:26'),
(1, '2015-12-02 02:13:26'),
(1, '2015-12-02 02:13:54'),
(1, '2015-12-02 02:13:54'),
(1, '2015-12-02 02:13:54'),
(1, '2015-12-02 02:13:54'),
(1, '2015-12-02 02:13:54'),
(1, '2015-12-02 02:14:02'),
(1, '2015-12-02 02:14:03'),
(1, '2015-12-02 02:14:03'),
(1, '2015-12-02 02:14:03'),
(1, '2015-12-02 02:14:03'),
(1, '2015-12-02 02:14:11'),
(1, '2015-12-02 02:14:11'),
(1, '2015-12-02 02:14:11'),
(1, '2015-12-02 02:14:11'),
(1, '2015-12-02 02:14:11'),
(1, '2015-12-02 02:21:03'),
(1, '2015-12-02 02:21:03'),
(1, '2015-12-02 02:21:03'),
(1, '2015-12-02 02:21:03'),
(1, '2015-12-02 02:21:03'),
(1, '2015-12-02 02:21:03'),
(1, '2015-12-02 02:21:03'),
(1, '2015-12-02 02:21:56'),
(1, '2015-12-02 02:21:56'),
(1, '2015-12-02 02:21:56'),
(1, '2015-12-02 02:21:56'),
(1, '2015-12-02 02:21:56'),
(1, '2015-12-02 02:21:56'),
(1, '2015-12-02 02:21:56'),
(1, '2015-12-02 02:22:24'),
(1, '2015-12-02 02:22:24'),
(1, '2015-12-02 02:22:24'),
(1, '2015-12-02 02:22:25'),
(1, '2015-12-02 02:22:25'),
(1, '2015-12-02 02:22:25'),
(1, '2015-12-02 02:22:25'),
(1, '2015-12-02 02:22:37'),
(1, '2015-12-02 02:22:37'),
(1, '2015-12-02 02:22:38'),
(1, '2015-12-02 02:22:56'),
(1, '2015-12-02 02:22:56'),
(1, '2015-12-02 02:22:56'),
(1, '2015-12-02 02:22:56'),
(1, '2015-12-02 02:22:56'),
(1, '2015-12-02 02:22:56'),
(1, '2015-12-02 02:22:56'),
(1, '2015-12-02 02:22:58'),
(1, '2015-12-02 02:22:59'),
(1, '2015-12-02 02:22:59'),
(1, '2015-12-02 02:22:59'),
(1, '2015-12-02 02:22:59'),
(1, '2015-12-02 02:22:59'),
(1, '2015-12-02 02:22:59'),
(1, '2015-12-02 02:22:59'),
(1, '2015-12-02 02:23:03'),
(1, '2015-12-02 02:23:03'),
(1, '2015-12-02 02:23:03'),
(1, '2015-12-02 02:23:03'),
(1, '2015-12-02 02:23:03'),
(1, '2015-12-02 02:23:03'),
(1, '2015-12-02 02:23:03'),
(1, '2015-12-02 02:23:27'),
(1, '2015-12-02 02:23:27'),
(1, '2015-12-02 02:23:27'),
(1, '2015-12-02 02:23:27'),
(1, '2015-12-02 02:23:27'),
(1, '2015-12-02 02:23:27'),
(1, '2015-12-02 02:23:27'),
(1, '2015-12-02 02:23:44'),
(1, '2015-12-02 02:23:45'),
(1, '2015-12-02 02:23:45'),
(1, '2015-12-02 02:23:45'),
(1, '2015-12-02 02:23:45'),
(1, '2015-12-02 02:23:45'),
(1, '2015-12-02 02:23:45'),
(1, '2015-12-02 02:24:14'),
(1, '2015-12-02 02:24:15'),
(1, '2015-12-02 02:24:15'),
(1, '2015-12-02 02:24:15'),
(1, '2015-12-02 02:24:15'),
(1, '2015-12-02 02:24:15'),
(1, '2015-12-02 02:24:15'),
(1, '2015-12-02 02:24:42'),
(1, '2015-12-02 02:24:42'),
(1, '2015-12-02 02:24:42'),
(1, '2015-12-02 02:24:42'),
(1, '2015-12-02 02:24:42'),
(1, '2015-12-02 02:24:42'),
(1, '2015-12-02 02:24:56'),
(1, '2015-12-02 02:24:56'),
(1, '2015-12-02 02:24:56'),
(1, '2015-12-02 02:24:56'),
(1, '2015-12-02 02:24:56'),
(1, '2015-12-02 02:24:56'),
(1, '2015-12-02 02:24:57'),
(1, '2015-12-02 02:25:09'),
(1, '2015-12-02 02:25:09'),
(1, '2015-12-02 02:25:09'),
(1, '2015-12-02 02:25:09'),
(1, '2015-12-02 02:25:09'),
(1, '2015-12-02 02:25:09'),
(1, '2015-12-02 02:25:09'),
(1, '2015-12-02 02:25:24'),
(1, '2015-12-02 02:25:24'),
(1, '2015-12-02 02:25:24'),
(1, '2015-12-02 02:25:25'),
(1, '2015-12-02 02:25:25'),
(1, '2015-12-02 02:25:25'),
(1, '2015-12-02 02:25:25'),
(1, '2015-12-02 02:26:07'),
(1, '2015-12-02 02:26:07'),
(1, '2015-12-02 02:26:07'),
(1, '2015-12-02 02:26:08'),
(1, '2015-12-02 02:26:08'),
(1, '2015-12-02 02:26:08'),
(1, '2015-12-02 02:26:08'),
(1, '2015-12-02 02:26:26'),
(1, '2015-12-02 02:26:26'),
(1, '2015-12-02 02:26:26'),
(1, '2015-12-02 02:26:26'),
(1, '2015-12-02 02:26:26'),
(1, '2015-12-02 02:26:26'),
(1, '2015-12-02 02:26:26'),
(1, '2015-12-02 02:26:55'),
(1, '2015-12-02 02:26:56'),
(1, '2015-12-02 02:26:56'),
(1, '2015-12-02 02:26:56'),
(1, '2015-12-02 02:26:56'),
(1, '2015-12-02 02:26:56'),
(1, '2015-12-02 02:26:56'),
(1, '2015-12-02 02:28:49'),
(1, '2015-12-02 02:28:49'),
(1, '2015-12-02 02:28:49'),
(1, '2015-12-02 02:28:49'),
(1, '2015-12-02 02:28:49'),
(1, '2015-12-02 02:28:49'),
(1, '2015-12-02 02:28:49'),
(1, '2015-12-02 02:29:17'),
(1, '2015-12-02 02:29:17'),
(1, '2015-12-02 02:29:17'),
(1, '2015-12-02 02:29:17'),
(1, '2015-12-02 02:29:17'),
(1, '2015-12-02 02:29:17'),
(1, '2015-12-02 02:29:17'),
(1, '2015-12-02 02:30:13'),
(1, '2015-12-02 02:30:13'),
(1, '2015-12-02 02:30:13'),
(1, '2015-12-02 02:30:13'),
(1, '2015-12-02 02:30:13'),
(1, '2015-12-02 02:30:13'),
(1, '2015-12-02 02:30:13'),
(1, '2015-12-02 02:30:23'),
(1, '2015-12-02 02:30:24'),
(1, '2015-12-02 02:30:24'),
(1, '2015-12-02 02:30:24'),
(1, '2015-12-02 02:30:24'),
(1, '2015-12-02 02:30:24'),
(1, '2015-12-02 02:30:24'),
(1, '2015-12-02 02:30:49'),
(1, '2015-12-02 02:30:49'),
(1, '2015-12-02 02:30:50'),
(1, '2015-12-02 02:30:50'),
(1, '2015-12-02 02:30:50'),
(1, '2015-12-02 02:30:50'),
(1, '2015-12-02 02:30:50'),
(1, '2015-12-02 02:31:04'),
(1, '2015-12-02 02:31:04'),
(1, '2015-12-02 02:31:04'),
(1, '2015-12-02 02:31:04'),
(1, '2015-12-02 02:31:04'),
(1, '2015-12-02 02:31:04'),
(1, '2015-12-02 02:31:04'),
(1, '2015-12-02 02:31:58'),
(1, '2015-12-02 02:31:58'),
(1, '2015-12-02 02:31:58'),
(1, '2015-12-02 02:31:58'),
(1, '2015-12-02 02:31:58'),
(1, '2015-12-02 02:31:58'),
(1, '2015-12-02 02:31:58'),
(1, '2015-12-02 02:32:42'),
(1, '2015-12-02 02:32:42'),
(1, '2015-12-02 02:32:42'),
(1, '2015-12-02 02:32:42'),
(1, '2015-12-02 02:32:42'),
(1, '2015-12-02 02:32:42'),
(1, '2015-12-02 02:32:42'),
(1, '2015-12-02 02:33:15'),
(1, '2015-12-02 02:33:15'),
(1, '2015-12-02 02:33:15'),
(1, '2015-12-02 02:33:15'),
(1, '2015-12-02 02:33:15'),
(1, '2015-12-02 02:33:15'),
(1, '2015-12-02 02:33:15'),
(1, '2015-12-02 02:33:29'),
(1, '2015-12-02 02:33:29'),
(1, '2015-12-02 02:33:29'),
(1, '2015-12-02 02:33:29'),
(1, '2015-12-02 02:33:29'),
(1, '2015-12-02 02:33:29'),
(1, '2015-12-02 02:33:29'),
(1, '2015-12-02 02:33:48'),
(1, '2015-12-02 02:33:48'),
(1, '2015-12-02 02:33:48'),
(1, '2015-12-02 02:33:48'),
(1, '2015-12-02 02:33:48'),
(1, '2015-12-02 02:33:48'),
(1, '2015-12-02 02:33:48'),
(1, '2015-12-02 02:34:03'),
(1, '2015-12-02 02:34:03'),
(1, '2015-12-02 02:34:03'),
(1, '2015-12-02 02:34:03'),
(1, '2015-12-02 02:34:03'),
(1, '2015-12-02 02:34:03'),
(1, '2015-12-02 02:34:03'),
(1, '2015-12-02 02:34:38'),
(1, '2015-12-02 02:34:39'),
(1, '2015-12-02 02:34:39'),
(1, '2015-12-02 02:34:39'),
(1, '2015-12-02 02:34:39'),
(1, '2015-12-02 02:34:39'),
(1, '2015-12-02 02:34:39'),
(1, '2015-12-02 02:34:59'),
(1, '2015-12-02 02:34:59'),
(1, '2015-12-02 02:34:59'),
(1, '2015-12-02 02:34:59'),
(1, '2015-12-02 02:34:59'),
(1, '2015-12-02 02:34:59'),
(1, '2015-12-02 02:34:59'),
(1, '2015-12-02 02:34:59'),
(1, '2015-12-02 02:37:04'),
(1, '2015-12-02 02:37:05'),
(1, '2015-12-02 02:37:05'),
(1, '2015-12-02 02:37:05'),
(1, '2015-12-02 02:37:05'),
(1, '2015-12-02 02:37:05'),
(1, '2015-12-02 02:37:05'),
(1, '2015-12-02 02:37:07'),
(1, '2015-12-02 02:37:07'),
(1, '2015-12-02 02:37:07'),
(1, '2015-12-02 02:37:07'),
(1, '2015-12-02 02:37:43'),
(1, '2015-12-02 02:37:44'),
(1, '2015-12-02 02:37:44'),
(1, '2015-12-02 02:37:44'),
(1, '2015-12-02 02:37:44'),
(1, '2015-12-02 02:37:44'),
(1, '2015-12-02 02:37:44'),
(1, '2015-12-02 02:37:44'),
(1, '2015-12-02 02:45:22'),
(1, '2015-12-02 02:45:22'),
(1, '2015-12-02 02:45:22'),
(1, '2015-12-02 02:45:22'),
(1, '2015-12-02 02:45:23'),
(1, '2015-12-02 02:45:23'),
(1, '2015-12-02 02:53:05'),
(1, '2015-12-02 02:53:05'),
(1, '2015-12-02 02:53:05'),
(1, '2015-12-02 02:53:05'),
(1, '2015-12-02 02:53:05'),
(1, '2015-12-02 02:53:05'),
(1, '2015-12-02 02:53:12'),
(1, '2015-12-02 02:53:12'),
(1, '2015-12-02 02:53:13'),
(1, '2015-12-02 02:53:39'),
(1, '2015-12-02 02:53:39'),
(1, '2015-12-02 02:53:39'),
(1, '2015-12-02 02:53:39'),
(1, '2015-12-02 02:53:54'),
(1, '2015-12-02 02:53:54'),
(1, '2015-12-02 02:53:54'),
(1, '2015-12-02 02:53:54'),
(1, '2015-12-02 02:54:09'),
(1, '2015-12-02 02:54:09'),
(1, '2015-12-02 02:54:09'),
(1, '2015-12-02 02:54:09'),
(1, '2015-12-02 02:54:17'),
(1, '2015-12-02 02:54:17'),
(1, '2015-12-02 02:54:17'),
(1, '2015-12-02 02:54:18'),
(1, '2015-12-02 02:54:29'),
(1, '2015-12-02 02:54:29'),
(1, '2015-12-02 02:54:29'),
(1, '2015-12-02 02:54:29'),
(1, '2015-12-02 02:55:53'),
(1, '2015-12-02 02:55:53'),
(1, '2015-12-02 02:55:53'),
(1, '2015-12-02 02:55:53'),
(1, '2015-12-02 02:56:46'),
(1, '2015-12-02 02:56:46'),
(1, '2015-12-02 02:56:46'),
(1, '2015-12-02 02:56:46'),
(1, '2015-12-02 02:57:10'),
(1, '2015-12-02 02:57:10'),
(1, '2015-12-02 02:57:10'),
(1, '2015-12-02 02:57:10'),
(1, '2015-12-02 02:57:45'),
(1, '2015-12-02 02:57:45'),
(1, '2015-12-02 02:57:45'),
(1, '2015-12-02 02:57:45'),
(1, '2015-12-02 02:58:02'),
(1, '2015-12-02 02:58:02'),
(1, '2015-12-02 02:58:02'),
(1, '2015-12-02 02:58:02'),
(1, '2015-12-02 02:58:06'),
(1, '2015-12-02 02:58:06'),
(1, '2015-12-02 02:58:07'),
(1, '2015-12-02 02:58:07'),
(1, '2015-12-02 02:58:07'),
(1, '2015-12-02 02:58:07'),
(1, '2015-12-02 02:58:10'),
(1, '2015-12-02 02:58:10'),
(1, '2015-12-02 02:58:10'),
(1, '2015-12-02 02:58:10'),
(1, '2015-12-02 02:59:37'),
(1, '2015-12-02 02:59:37'),
(1, '2015-12-02 02:59:37'),
(1, '2015-12-02 02:59:37'),
(1, '2015-12-02 03:32:42'),
(1, '2015-12-02 03:32:42'),
(1, '2015-12-02 03:32:57'),
(1, '2015-12-02 03:32:57'),
(1, '2015-12-02 03:33:31'),
(1, '2015-12-02 03:33:31'),
(1, '2015-12-02 03:34:35'),
(1, '2015-12-02 03:34:35'),
(1, '2015-12-02 03:34:45'),
(1, '2015-12-02 03:34:45'),
(1, '2015-12-02 03:37:45'),
(1, '2015-12-02 03:37:45'),
(1, '2015-12-02 03:37:52'),
(1, '2015-12-02 03:37:53'),
(1, '2015-12-02 03:38:05'),
(1, '2015-12-02 03:38:05'),
(1, '2015-12-02 03:39:00'),
(1, '2015-12-02 03:39:00'),
(1, '2015-12-02 03:39:09'),
(1, '2015-12-02 03:39:09'),
(1, '2015-12-02 03:43:25'),
(1, '2015-12-02 03:43:25'),
(1, '2015-12-02 03:45:09'),
(1, '2015-12-02 03:45:09'),
(1, '2015-12-02 03:47:10'),
(1, '2015-12-02 03:47:10'),
(1, '2015-12-02 03:48:11'),
(1, '2015-12-02 03:48:11'),
(1, '2015-12-02 03:48:16'),
(1, '2015-12-02 03:48:17'),
(1, '2015-12-02 03:48:27'),
(1, '2015-12-02 03:48:27');

-- --------------------------------------------------------

--
-- Table structure for table `user_control_admin_log`
--

CREATE TABLE IF NOT EXISTS `user_control_admin_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `action` enum('DELETE','UNDELETE','BAN','UNBAN','ADMIN','DEADMIN') NOT NULL,
  `comment` varchar(300) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  KEY `admin_id` (`admin_id`),
  KEY `user_id` (`user_id`),
  FULLTEXT KEY `comment` (`comment`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `user_control_admin_log`
--

INSERT INTO `user_control_admin_log` (`log_id`, `admin_id`, `user_id`, `action`, `comment`, `time`) VALUES
(1, 1, 1, 'ADMIN', NULL, '2015-11-06 09:46:43'),
(2, 1, 4, 'ADMIN', 'test', '2015-11-22 17:40:26'),
(3, 1, 5, 'BAN', 'test', '2015-11-22 17:40:54'),
(4, 1, 4, 'DEADMIN', 'test', '2015-11-22 18:00:08'),
(5, 1, 2, 'ADMIN', 'test', '2015-11-28 18:02:28');

-- --------------------------------------------------------

--
-- Table structure for table `user_control_mod_log`
--

CREATE TABLE IF NOT EXISTS `user_control_mod_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `soc_id` int(11) NOT NULL,
  `action` enum('BAN','UNBAN','MOD','DEMOD') NOT NULL,
  `comment` varchar(300) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  KEY `mod_id` (`mod_id`),
  KEY `user_id` (`user_id`),
  KEY `soc_id` (`soc_id`),
  FULLTEXT KEY `comment` (`comment`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `user_control_mod_log`
--

INSERT INTO `user_control_mod_log` (`log_id`, `mod_id`, `user_id`, `soc_id`, `action`, `comment`, `time`) VALUES
(1, 1, 3, 1, 'BAN', NULL, '2015-11-05 13:06:06'),
(2, 1, 2, 2, 'BAN', NULL, '2015-11-05 13:06:37'),
(4, 1, 4, 1, 'BAN', 'test', '2015-11-05 16:02:05'),
(5, 1, 5, 1, 'BAN', 'test', '2015-11-05 16:03:08'),
(8, 1, 5, 1, 'UNBAN', 'test', '2015-11-05 18:03:49'),
(9, 1, 5, 1, 'MOD', 'test promotion', '2015-11-06 08:12:44');

-- --------------------------------------------------------

--
-- Table structure for table `user_reports`
--

CREATE TABLE IF NOT EXISTS `user_reports` (
  `report_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`report_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_reports`
--

INSERT INTO `user_reports` (`report_id`, `user_id`) VALUES
(5, 4),
(6, 4);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`comm_id`),
  ADD CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `comm_control_log`
--
ALTER TABLE `comm_control_log`
  ADD CONSTRAINT `comm_control_log_ibfk_1` FOREIGN KEY (`comm_id`) REFERENCES `comments` (`comm_id`),
  ADD CONSTRAINT `comm_control_log_ibfk_2` FOREIGN KEY (`mod_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `comm_reports`
--
ALTER TABLE `comm_reports`
  ADD CONSTRAINT `comm_reports_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`),
  ADD CONSTRAINT `comm_reports_ibfk_2` FOREIGN KEY (`comm_id`) REFERENCES `comments` (`comm_id`);

--
-- Constraints for table `comm_votes`
--
ALTER TABLE `comm_votes`
  ADD CONSTRAINT `comm_votes_ibfk_1` FOREIGN KEY (`comm_id`) REFERENCES `comments` (`comm_id`),
  ADD CONSTRAINT `comm_votes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `login_log`
--
ALTER TABLE `login_log`
  ADD CONSTRAINT `login_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `pms`
--
ALTER TABLE `pms`
  ADD CONSTRAINT `pms_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `pms_ibfk_2` FOREIGN KEY (`receiver`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`soc_id`) REFERENCES `societies` (`soc_id`),
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `post_control_log`
--
ALTER TABLE `post_control_log`
  ADD CONSTRAINT `post_control_log_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`),
  ADD CONSTRAINT `post_control_log_ibfk_2` FOREIGN KEY (`mod_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `post_reports`
--
ALTER TABLE `post_reports`
  ADD CONSTRAINT `post_reports_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`),
  ADD CONSTRAINT `post_reports_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`);

--
-- Constraints for table `post_subs`
--
ALTER TABLE `post_subs`
  ADD CONSTRAINT `post_subs_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`),
  ADD CONSTRAINT `post_subs_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `post_views`
--
ALTER TABLE `post_views`
  ADD CONSTRAINT `post_views_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`),
  ADD CONSTRAINT `post_views_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `post_votes`
--
ALTER TABLE `post_votes`
  ADD CONSTRAINT `post_votes_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`),
  ADD CONSTRAINT `post_votes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `societies`
--
ALTER TABLE `societies`
  ADD CONSTRAINT `societies_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `soc_bans`
--
ALTER TABLE `soc_bans`
  ADD CONSTRAINT `soc_bans_ibfk_1` FOREIGN KEY (`soc_id`) REFERENCES `societies` (`soc_id`),
  ADD CONSTRAINT `soc_bans_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `soc_control_admin_log`
--
ALTER TABLE `soc_control_admin_log`
  ADD CONSTRAINT `soc_control_admin_log_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `soc_control_admin_log_ibfk_2` FOREIGN KEY (`soc_id`) REFERENCES `societies` (`soc_id`);

--
-- Constraints for table `soc_details`
--
ALTER TABLE `soc_details`
  ADD CONSTRAINT `soc_details_ibfk_1` FOREIGN KEY (`soc_id`) REFERENCES `societies` (`soc_id`),
  ADD CONSTRAINT `soc_details_ibfk_2` FOREIGN KEY (`revised_by`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `soc_mods`
--
ALTER TABLE `soc_mods`
  ADD CONSTRAINT `soc_mods_ibfk_1` FOREIGN KEY (`soc_id`) REFERENCES `societies` (`soc_id`),
  ADD CONSTRAINT `soc_mods_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `soc_reports`
--
ALTER TABLE `soc_reports`
  ADD CONSTRAINT `soc_reports_ibfk_1` FOREIGN KEY (`soc_id`) REFERENCES `societies` (`soc_id`),
  ADD CONSTRAINT `soc_reports_ibfk_2` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`);

--
-- Constraints for table `soc_subs`
--
ALTER TABLE `soc_subs`
  ADD CONSTRAINT `soc_subs_ibfk_1` FOREIGN KEY (`soc_id`) REFERENCES `societies` (`soc_id`),
  ADD CONSTRAINT `soc_subs_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `soc_views`
--
ALTER TABLE `soc_views`
  ADD CONSTRAINT `soc_views_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `soc_views_ibfk_1` FOREIGN KEY (`soc_id`) REFERENCES `societies` (`soc_id`);

--
-- Constraints for table `user_activity`
--
ALTER TABLE `user_activity`
  ADD CONSTRAINT `user_activity_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `user_control_admin_log`
--
ALTER TABLE `user_control_admin_log`
  ADD CONSTRAINT `user_control_admin_log_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `user_control_admin_log_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `user_control_mod_log`
--
ALTER TABLE `user_control_mod_log`
  ADD CONSTRAINT `user_control_mod_log_ibfk_1` FOREIGN KEY (`mod_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `user_control_mod_log_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `user_control_mod_log_ibfk_3` FOREIGN KEY (`soc_id`) REFERENCES `societies` (`soc_id`);

--
-- Constraints for table `user_reports`
--
ALTER TABLE `user_reports`
  ADD CONSTRAINT `user_reports_ibfk_1` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`),
  ADD CONSTRAINT `user_reports_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
