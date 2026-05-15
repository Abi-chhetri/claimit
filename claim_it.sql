-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 15, 2026 at 06:14 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `claim_it`
--

-- --------------------------------------------------------

--
-- Table structure for table `ADMINS`
--

CREATE TABLE `ADMINS` (
  `Admin_ID` int(11) NOT NULL,
  `Full_Name` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Role` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Status` varchar(20) NOT NULL,
  `Created_At` timestamp NOT NULL DEFAULT current_timestamp(),
  `Created_By` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ADMINS`
--

INSERT INTO `ADMINS` (`Admin_ID`, `Full_Name`, `Email`, `Role`, `Password`, `Status`, `Created_At`, `Created_By`) VALUES
(1, 'Abi Chhetri', 'admin@claimit.com', 'ADMIN', '$2a$12$Zw55lle8YjVh9HsOHhpg7uA5OcV1BOSy.12SBCUjsmpYz9Mtk5zfS', 'ACTIVE', '2026-04-18 14:37:06', NULL),
(2, 'James Gorden', 'james@claimit.com', 'MODERATOR', '$2a$12$nBNz2KfH28cEh2JYJBEyPuITfFa67ByhYG33DG3gHl4HrVleBJrMC', 'ACTIVE', '2026-05-05 11:14:54', 1),
(3, 'bullok', 'bullok@claimit.com', 'MODERATOR', '$2a$12$ktT3gDE7UoBFU/cxIhz/K.n7sThEVxo8v1vFo39mCCkqdFt3Jn5N2', 'ACTIVE', '2026-05-05 11:28:37', 1),
(4, 'help desk', 'helpline@claimit.com', 'MODERATOR', '$2a$12$hgHwtRjvZ6BVm72kkiZEMu4ZmXNAWs/dcxz/.lnmAAfpG0dTMlwnC', 'ACTIVE', '2026-05-05 12:46:05', 2),
(5, 'testing', 'testing@gmail.com', 'MODERATOR', '$2a$12$iT2Vn/qEy2bxJp8VjktgpOSkZ63PzsPiHMPLt5/G0G9E9FRxME0gu', 'SUSPENDED', '2026-05-06 17:08:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ADMIN_LOGS`
--

CREATE TABLE `ADMIN_LOGS` (
  `Admin_log_ID` int(11) NOT NULL,
  `Admin_ID` int(11) NOT NULL,
  `Action_Type` varchar(100) NOT NULL,
  `Target_Type` varchar(100) DEFAULT NULL,
  `Target_ID` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ADMIN_LOGS`
--

INSERT INTO `ADMIN_LOGS` (`Admin_log_ID`, `Admin_ID`, `Action_Type`, `Target_Type`, `Target_ID`) VALUES
(1, 1, 'Login', 'Login', 'Admin : 1'),
(2, 1, 'Login', 'Login', 'Admin : 1'),
(3, 1, 'Login', 'Login', 'Admin : 1'),
(4, 1, 'suspend', 'suspend user', 'userId : 22'),
(5, 1, 'approve user', 'User', 'user id : 22'),
(6, 1, 'reinstate', 'reinstate/approve user', 'userId : 22'),
(7, 1, 'SUSPENDED', 'Moderator Status Update', 'Mod Id: 4'),
(8, 1, 'ACTIVE', 'Moderator Status Update', 'Mod Id: 4'),
(9, 1, 'Login', 'Login', 'Admin : 1'),
(10, 1, 'reject', 'Item Status', 'Item Id : 6'),
(11, 1, 'reject', 'Item Status', 'Item Id : 6'),
(12, 1, 'reject', 'Item Status', 'Item Id : 5'),
(13, 1, 'reject', 'Item Status', 'Item Id : 5'),
(14, 1, 'reject', 'Item Status', 'Item Id : 6'),
(15, 1, 'Login', 'Login', 'Admin : 1'),
(16, 1, 'Login', 'Login', 'Admin : 1'),
(17, 1, 'Login', 'Login', 'Admin : 1'),
(18, 1, 'reject', 'reject user', 'userId : 23'),
(19, 1, 'Login', 'Login', 'Admin : 1'),
(20, 1, 'Login', 'Login', 'Admin : 1'),
(21, 1, 'Login', 'Login', 'Admin : 1'),
(22, 1, 'Login', 'Login', 'Admin : 1'),
(23, 1, 'Login', 'Login', 'Admin : 1'),
(24, 1, 'Login', 'Login', 'Admin : 1'),
(25, 1, 'Login', 'Login', 'Admin : 1'),
(26, 1, 'Login', 'Login', 'Admin : 1'),
(27, 1, 'Login', 'Login', 'Admin : 1'),
(28, 1, 'Login', 'Login', 'Admin : 1'),
(29, 1, 'Login', 'Login', 'Admin : 1'),
(30, 1, 'Login', 'Login', 'Admin : 1'),
(31, 1, 'Login', 'Login', 'Admin : 1'),
(32, 1, 'Login', 'Login', 'Admin : 1'),
(33, 1, 'Login', 'Login', 'Admin : 1'),
(34, 1, 'Login', 'Login', 'Admin : 1'),
(35, 1, 'Login', 'Login', 'Admin : 1'),
(36, 1, 'Login', 'Login', 'Admin : 1'),
(37, 1, 'Login', 'Login', 'Admin : 1'),
(38, 1, 'Login', 'Login', 'Admin : 1'),
(39, 1, 'Login', 'Login', 'Admin : 1'),
(40, 1, 'Login', 'Login', 'Admin : 1'),
(41, 1, 'Login', 'Login', 'Admin : 1'),
(42, 1, 'Login', 'Login', 'Admin : 1'),
(43, 1, 'Login', 'Login', 'Admin : 1'),
(44, 1, 'Login', 'Login', 'Admin : 1'),
(45, 1, 'Login', 'Login', 'Admin : 1'),
(46, 1, 'Login', 'Login', 'Admin : 1'),
(47, 1, 'Login', 'Login', 'Admin : 1'),
(48, 1, 'Login', 'Login', 'Admin : 1'),
(49, 1, 'Login', 'Login', 'Admin : 1'),
(50, 1, 'Login', 'Login', 'Admin : 1'),
(51, 1, 'Login', 'Login', 'Admin : 1'),
(52, 1, 'Login', 'Login', 'Admin : 1'),
(53, 1, 'Login', 'Login', 'Admin : 1'),
(54, 1, 'Login', 'Login', 'Admin : 1'),
(55, 1, 'Login', 'Login', 'Admin : 1'),
(56, 1, 'Login', 'Login', 'Admin : 1'),
(57, 1, 'Login', 'Login', 'Admin : 1'),
(58, 1, 'Login', 'Login', 'Admin : 1'),
(59, 1, 'Login', 'Login', 'Admin : 1'),
(60, 1, 'Login', 'Login', 'Admin : 1'),
(61, 1, 'Login', 'Login', 'Admin : 1'),
(62, 1, 'Login', 'Login', 'Admin : 1'),
(63, 1, 'Login', 'Login', 'Admin : 1'),
(64, 1, 'Login', 'Login', 'Admin : 1'),
(65, 1, 'Login', 'Login', 'Admin : 1'),
(66, 1, 'Login', 'Login', 'Admin : 1'),
(67, 1, 'Login', 'Login', 'Admin : 1'),
(68, 1, 'Login', 'Login', 'Admin : 1'),
(69, 1, 'Login', 'Login', 'Admin : 1'),
(70, 1, 'Login', 'Login', 'Admin : 1'),
(71, 1, 'Login', 'Login', 'Admin : 1'),
(72, 1, 'Login', 'Login', 'Admin : 1'),
(73, 1, 'Login', 'Login', 'Admin : 1'),
(74, 1, 'Login', 'Login', 'Admin : 1'),
(75, 1, 'Login', 'Login', 'Admin : 1'),
(76, 1, 'Login', 'Login', 'Admin : 1'),
(77, 1, 'Login', 'Login', 'Admin : 1'),
(78, 1, 'Login', 'Login', 'Admin : 1'),
(79, 1, 'Login', 'Login', 'Admin : 1'),
(80, 1, 'Login', 'Login', 'Admin : 1'),
(81, 1, 'Login', 'Login', 'Admin : 1'),
(82, 1, 'Login', 'Login', 'Admin : 1'),
(83, 1, 'Login', 'Login', 'Admin : 1'),
(84, 1, 'Login', 'Login', 'Admin : 1'),
(85, 1, 'Login', 'Login', 'Admin : 1'),
(86, 1, 'Login', 'Login', 'Admin : 1'),
(87, 1, 'Login', 'Login', 'Admin : 1'),
(88, 1, 'Login', 'Login', 'Admin : 1'),
(89, 1, 'Login', 'Login', 'Admin : 1'),
(90, 1, 'Login', 'Login', 'Admin : 1'),
(91, 1, 'Login', 'Login', 'Admin : 1'),
(92, 1, 'Login', 'Login', 'Admin : 1'),
(93, 1, 'Login', 'Login', 'Admin : 1'),
(94, 1, 'Login', 'Login', 'Admin : 1'),
(95, 1, 'Login', 'Login', 'Admin : 1'),
(96, 1, 'Login', 'Login', 'Admin : 1'),
(97, 1, 'Login', 'Login', 'Admin : 1'),
(98, 1, 'Login', 'Login', 'Admin : 1'),
(99, 1, 'Login', 'Login', 'Admin : 1'),
(100, 1, 'Login', 'Login', 'Admin : 1'),
(101, 1, 'Login', 'Login', 'Admin : 1'),
(102, 1, 'Login', 'Login', 'Admin : 1'),
(103, 1, 'Login', 'Login May 06, 2026 02:41:09', 'Admin : 1'),
(104, 1, 'Login', 'Login May 06, 2026 02:41:21', 'Admin : 1'),
(105, 1, 'Login', 'Login May 06, 2026 02:41:52', 'Admin : 1'),
(106, 1, 'Login', 'Login May 06, 2026 17:43:13', 'Admin : 1'),
(107, 1, 'Login', 'Login May 06, 2026 21:15:20', 'Admin : 1'),
(108, 1, 'Login', 'Login May 06, 2026 21:15:23', 'Admin : 1'),
(109, 1, 'Login', 'Login May 06, 2026 22:14:34', 'Admin : 1'),
(110, 1, 'Login', 'Login May 06, 2026 22:22:43', 'Admin : 1'),
(111, 1, 'Login', 'Login May 06, 2026 22:24:50', 'Admin : 1'),
(112, 1, 'Login', 'Login May 06, 2026 22:49:08', 'Admin : 1'),
(113, 1, 'Moderator Creation', 'Moderator May 06, 2026 22:53:00', 'Moderator : testing'),
(114, 1, 'Login', 'Login May 06, 2026 22:53:46', 'Admin : 1'),
(115, 1, 'Login', 'Login May 06, 2026 22:54:13', 'Admin : 1'),
(116, 1, 'Login', 'Login May 06, 2026 22:54:14', 'Admin : 1'),
(117, 1, 'Login', 'Login May 06, 2026 22:54:16', 'Admin : 1'),
(118, 1, 'Login', 'Login May 06, 2026 22:54:18', 'Admin : 1'),
(119, 1, 'Login', 'Login May 06, 2026 22:58:52', 'Admin : 1'),
(120, 1, 'approve user', 'User', 'user id : 23'),
(121, 1, 'approve', 'reinstate/approve user May 06, 2026 22:59:53', 'userId : 23'),
(122, 1, 'suspend', 'suspend user May 06, 2026 22:59:55', 'userId : 23'),
(123, 1, 'Login', 'Login May 07, 2026 00:44:11', 'Admin : 1'),
(124, 1, 'Login', 'Login May 07, 2026 00:49:13', 'Admin : 1'),
(125, 1, 'reject', 'Item Status May 07, 2026 00:49:31', 'Item Id : 7'),
(126, 1, 'Login', 'Login May 07, 2026 00:52:33', 'Admin : 1'),
(127, 1, 'review', 'Claim Status updated May 07, 2026 00:52:47', 'Claim id : 7'),
(128, 1, 'approve', 'Claim Status updated May 07, 2026 00:53:06', 'Claim id : 7'),
(129, 1, 'Login', 'Login May 07, 2026 00:55:50', 'Admin : 1'),
(130, 1, 'approve', 'Item Status May 07, 2026 00:57:21', 'Item Id : 5'),
(131, 1, 'reject', 'Item Status May 07, 2026 00:57:31', 'Item Id : 5'),
(132, 1, 'approve', 'Item Status May 07, 2026 00:57:39', 'Item Id : 5'),
(133, 1, 'Login', 'Login May 07, 2026 00:59:09', 'Admin : 1'),
(134, 1, 'Login', 'Login May 07, 2026 01:02:04', 'Admin : 1'),
(135, 1, 'review', 'Claim Status updated May 07, 2026 01:12:33', 'Claim id : 8'),
(136, 1, 'approve', 'Claim Status updated May 07, 2026 01:12:54', 'Claim id : 8'),
(137, 1, 'Login', 'Login May 07, 2026 01:36:19', 'Admin : 1'),
(138, 1, 'Login', 'Login May 07, 2026 01:49:43', 'Admin : 1'),
(139, 1, 'Login', 'Login May 07, 2026 02:45:14', 'Admin : 1'),
(140, 1, 'Login', 'Login May 07, 2026 02:52:49', 'Admin : 1'),
(141, 1, 'Login', 'Login May 07, 2026 03:10:17', 'Admin : 1'),
(142, 1, 'Login', 'Login May 07, 2026 03:16:16', 'Admin : 1'),
(143, 1, 'Login', 'Login May 07, 2026 03:16:58', 'Admin : 1'),
(144, 1, 'Login', 'Login May 07, 2026 03:17:44', 'Admin : 1'),
(145, 1, 'Login', 'Login May 07, 2026 03:18:09', 'Admin : 1'),
(146, 1, 'Login', 'Login May 07, 2026 03:24:03', 'Admin : 1'),
(147, 1, 'Login', 'Login May 07, 2026 03:25:37', 'Admin : 1'),
(148, 1, 'Login', 'Login May 07, 2026 03:26:08', 'Admin : 1'),
(149, 1, 'Login', 'Login May 07, 2026 03:27:52', 'Admin : 1'),
(150, 1, 'Login', 'Login May 07, 2026 03:32:45', 'Admin : 1'),
(151, 1, 'Login', 'Login May 07, 2026 03:34:56', 'Admin : 1'),
(152, 1, 'Login', 'Login May 07, 2026 03:36:29', 'Admin : 1'),
(153, 1, 'Login', 'Login May 07, 2026 03:37:29', 'Admin : 1'),
(154, 1, 'Login', 'Login May 07, 2026 03:37:43', 'Admin : 1'),
(155, 1, 'Login', 'Login May 07, 2026 17:28:20', 'Admin : 1'),
(156, 1, 'Login', 'Login May 07, 2026 17:29:23', 'Admin : 1'),
(157, 1, 'reject', 'Item Status May 07, 2026 17:36:58', 'Item Id : 8'),
(158, 1, 'reject', 'Item Status May 07, 2026 17:37:01', 'Item Id : 8'),
(159, 1, 'approve', 'Item Status May 07, 2026 17:37:05', 'Item Id : 8'),
(160, 1, 'reject', 'Item Status May 07, 2026 17:37:12', 'Item Id : 8'),
(161, 1, 'reject', 'Item Status May 07, 2026 17:37:15', 'Item Id : 8'),
(162, 1, 'Login', 'Login May 07, 2026 17:54:54', 'Admin : 1'),
(163, 1, 'approve', 'Item Status May 07, 2026 17:54:57', 'Item Id : 8'),
(164, 1, 'Login', 'Login May 07, 2026 17:56:11', 'Admin : 1'),
(165, 1, 'fake listing', 'Item Status May 07, 2026 17:56:28', 'Item Id : 8'),
(166, 1, 'approve user', 'User', 'user id : 23'),
(167, 1, 'reinstate', 'reinstate/approve user May 07, 2026 18:09:44', 'userId : 23'),
(168, 1, 'suspend', 'suspend user May 07, 2026 18:09:44', 'userId : 23'),
(169, 1, 'suspend', 'suspend user May 07, 2026 18:09:45', 'userId : 22'),
(170, 1, 'approve user', 'User', 'user id : 22'),
(171, 1, 'reinstate', 'reinstate/approve user May 07, 2026 18:09:46', 'userId : 22'),
(172, 1, 'approve user', 'User', 'user id : 23'),
(173, 1, 'reinstate', 'reinstate/approve user May 07, 2026 18:10:02', 'userId : 23'),
(174, 1, 'suspend', 'suspend user May 07, 2026 18:10:03', 'userId : 23'),
(175, 1, 'suspend', 'suspend user May 07, 2026 18:10:08', 'userId : 22'),
(176, 1, 'approve user', 'User', 'user id : 22'),
(177, 1, 'reinstate', 'reinstate/approve user May 07, 2026 18:10:08', 'userId : 22'),
(178, 1, 'Login', 'Login May 07, 2026 18:44:14', 'Admin : 1'),
(179, 1, 'approve', 'Item Status May 07, 2026 18:44:23', 'Item Id : 10'),
(180, 1, 'approve', 'Item Status May 07, 2026 18:44:24', 'Item Id : 9'),
(181, 1, 'Login', 'Login May 07, 2026 22:08:07', 'Admin : 1'),
(182, 1, 'approve', 'Claim Status updated May 07, 2026 22:08:39', 'Claim id : 9'),
(183, 1, 'approve', 'Claim Status updated May 07, 2026 22:17:00', 'Claim id : 9'),
(184, 1, 'review', 'Claim Status updated May 07, 2026 22:23:29', 'Claim id : 9'),
(185, 1, 'Login', 'Login May 07, 2026 22:45:58', 'Admin : 1'),
(186, 2, 'Login', 'Login May 07, 2026 22:46:48', 'Moderator : 2'),
(187, 2, 'Login', 'Login May 07, 2026 22:47:30', 'Moderator : 2'),
(188, 2, 'Login', 'Login May 07, 2026 22:51:18', 'Moderator : 2'),
(189, 2, 'approve', 'Item Status May 07, 2026 22:58:26', 'Item Id : 14'),
(190, 2, 'approve', 'Item Status May 07, 2026 22:58:52', 'Item Id : 11'),
(191, 2, 'reject', 'Item Status May 07, 2026 22:59:03', 'Item Id : 13'),
(192, 1, 'Login', 'Login May 07, 2026 23:21:09', 'Admin : 1'),
(193, 1, 'Login', 'Login May 07, 2026 23:24:21', 'Admin : 1'),
(194, 1, 'Login', 'Login May 07, 2026 23:31:14', 'Admin : 1'),
(195, 1, 'Login', 'Login May 07, 2026 23:41:30', 'Admin : 1'),
(196, 2, 'Login', 'Login May 07, 2026 23:44:16', 'Moderator : 2'),
(197, 1, 'Login', 'Login May 07, 2026 23:49:51', 'Admin : 1'),
(198, 1, 'Login', 'Login May 07, 2026 23:51:30', 'Admin : 1'),
(199, 1, 'reject', 'Item Status May 07, 2026 23:55:26', 'Item Id : 14'),
(200, 2, 'approve user', 'User', 'user id : 23'),
(201, 2, 'reinstate', 'reinstate/approve user May 07, 2026 23:56:40', 'userId : 23'),
(202, 2, 'suspend', 'suspend user May 07, 2026 23:56:40', 'userId : 23'),
(203, 1, 'Login', 'Login May 08, 2026 00:17:57', 'Admin : 1'),
(204, 1, 'approve', 'Item Status May 08, 2026 00:27:01', 'Item Id : 14'),
(205, 1, 'approve', 'Item Status May 08, 2026 00:27:04', 'Item Id : 14'),
(206, 2, 'Login', 'Login May 08, 2026 00:29:09', 'Moderator : 2'),
(207, 1, 'suspend', 'suspend user May 08, 2026 00:29:25', 'userId : 22'),
(208, 1, 'approve user', 'User', 'user id : 22'),
(209, 1, 'reinstate', 'reinstate/approve user May 08, 2026 00:29:27', 'userId : 22'),
(210, 2, 'suspend', 'suspend user May 08, 2026 00:29:54', 'userId : 22'),
(211, 2, 'approve user', 'User', 'user id : 22'),
(212, 2, 'reinstate', 'reinstate/approve user May 08, 2026 00:29:55', 'userId : 22'),
(213, 2, 'suspend', 'suspend user May 08, 2026 00:30:16', 'userId : 22'),
(214, 2, 'approve user', 'User', 'user id : 22'),
(215, 2, 'reinstate', 'reinstate/approve user May 08, 2026 00:30:41', 'userId : 22'),
(216, 1, 'Login', 'Login May 08, 2026 19:32:56', 'Admin : 1'),
(217, 2, 'Login', 'Login May 08, 2026 19:33:12', 'Moderator : 2'),
(218, 2, 'approve user', 'User', 'user id : 23'),
(219, 2, 'reinstate', 'reinstate/approve user May 08, 2026 19:33:28', 'userId : 23'),
(220, 2, 'suspend', 'suspend user May 08, 2026 19:33:29', 'userId : 23'),
(221, 1, 'Login', 'Login May 09, 2026 09:06:01', 'Admin : 1'),
(222, 1, 'approve user', 'User', 'user id : 24'),
(223, 1, 'approve', 'reinstate/approve user May 09, 2026 09:06:24', 'userId : 24'),
(224, 1, 'Login', 'Login May 09, 2026 10:30:58', 'Admin : 1'),
(225, 1, 'Login', 'Login May 09, 2026 12:19:39', 'Admin : 1'),
(226, 1, 'Login', 'Login May 09, 2026 12:28:27', 'Admin : 1'),
(227, 1, 'reject', 'Item Status May 09, 2026 13:04:54', 'Item Id : 14'),
(228, 1, 'approve', 'Item Status May 09, 2026 13:05:14', 'Item Id : 14'),
(229, 1, 'approve', 'Item Status May 09, 2026 13:05:16', 'Item Id : 14'),
(230, 1, 'reject', 'Item Status May 09, 2026 13:05:21', 'Item Id : 14'),
(231, 1, 'approve', 'Item Status May 09, 2026 13:05:26', 'Item Id : 14'),
(232, 1, 'reject', 'Item Status May 09, 2026 13:05:29', 'Item Id : 14'),
(233, 1, 'approve', 'Item Status May 09, 2026 13:05:31', 'Item Id : 14'),
(234, 1, 'approve', 'Item Status May 09, 2026 13:05:34', 'Item Id : 14'),
(235, 1, 'approve', 'Item Status May 09, 2026 13:08:52', 'Item Id : 14'),
(236, 1, 'approve', 'Item Status May 09, 2026 13:08:53', 'Item Id : 14'),
(237, 1, 'approve', 'Item Status May 09, 2026 13:08:56', 'Item Id : 14'),
(238, 1, 'reject', 'Item Status May 09, 2026 13:14:13', 'Item Id : 14'),
(239, 1, 'approve', 'Item Status May 09, 2026 13:19:38', 'Item Id : 14'),
(240, 1, 'Login', 'Login May 09, 2026 13:20:28', 'Admin : 1'),
(241, 1, 'reject', 'Item Status May 09, 2026 13:32:53', 'Item Id : 14'),
(242, 1, 'approve', 'Item Status May 09, 2026 13:32:54', 'Item Id : 14'),
(243, 1, 'approve', 'Item Status May 09, 2026 13:33:46', 'Item Id : 14'),
(244, 1, 'approve', 'Item Status May 09, 2026 13:33:52', 'Item Id : 14'),
(245, 1, 'approve', 'Item Status May 09, 2026 13:34:00', 'Item Id : 14'),
(246, 1, 'reject', 'Item Status May 09, 2026 13:39:55', 'Item Id : 14'),
(247, 1, 'approve', 'Item Status May 09, 2026 13:39:57', 'Item Id : 14'),
(248, 1, 'fake', 'Item Status May 09, 2026 13:40:04', 'Item Id : 14'),
(249, 1, 'approve', 'Item Status May 09, 2026 13:40:22', 'Item Id : 14'),
(250, 1, 'Login', 'Login May 09, 2026 14:36:34', 'Admin : 1'),
(251, 1, 'Login', 'Login May 09, 2026 14:38:56', 'Admin : 1'),
(252, 1, 'Login', 'Login May 09, 2026 15:07:35', 'Admin : 1'),
(253, 1, 'Login', 'Login May 09, 2026 16:30:17', 'Admin : 1'),
(254, 1, 'Login', 'Login May 10, 2026 15:57:16', 'Admin : 1'),
(255, 1, 'SUSPENDED', 'Moderator Status Update May 10, 2026 16:54:47', 'Mod Id: 5'),
(256, 1, 'Login', 'Login May 10, 2026 23:54:42', 'Admin : 1'),
(257, 1, '', 'Claim Status updated May 10, 2026 23:54:58', 'Claim id : 35'),
(258, 1, 'approve', 'Claim Status updated May 10, 2026 23:55:19', 'Claim id : 35'),
(259, 1, 'reject', 'Claim Status updated May 10, 2026 23:55:29', 'Claim id : 9'),
(260, 1, 'Login', 'Login May 10, 2026 23:57:03', 'Admin : 1'),
(261, 1, '', 'Claim Status updated May 11, 2026 00:00:19', 'Claim id : 36'),
(262, 1, 'approve', 'Claim Status updated May 11, 2026 00:00:30', 'Claim id : 36'),
(263, 1, 'Login', 'Login May 11, 2026 00:03:22', 'Admin : 1'),
(264, 1, 'approve', 'Claim Status updated May 11, 2026 00:10:21', 'Claim id : 37'),
(265, 1, 'Login', 'Login May 11, 2026 00:12:13', 'Admin : 1'),
(266, 1, 'approve', 'Item Status May 11, 2026 00:12:21', 'Item Id : 17'),
(267, 1, 'approve', 'Item Status May 11, 2026 00:12:31', 'Item Id : 16'),
(268, 1, 'approve', 'Item Status May 11, 2026 00:12:33', 'Item Id : 15'),
(269, 1, 'Login', 'Login May 11, 2026 00:14:23', 'Admin : 1'),
(270, 1, 'approve', 'Claim Status updated May 11, 2026 00:14:54', 'Claim id : 39'),
(271, 1, 'reject', 'Claim Status updated May 11, 2026 00:15:19', 'Claim id : 38'),
(272, 1, 'Login', 'Login May 11, 2026 00:26:26', 'Admin : 1'),
(273, 1, 'suspend', 'suspend user May 11, 2026 00:26:34', 'userId : 24'),
(274, 1, 'approve user', 'User', 'user id : 24'),
(275, 1, 'reinstate', 'reinstate/approve user May 11, 2026 00:26:36', 'userId : 24'),
(276, 1, '', 'Claim Status updated May 11, 2026 00:27:31', 'Claim id : 40'),
(277, 1, 'approve', 'Claim Status updated May 11, 2026 00:37:58', 'Claim id : 40'),
(278, 1, 'Login', 'Login May 11, 2026 00:46:50', 'Admin : 1'),
(279, 1, '', 'Claim Status updated May 11, 2026 00:48:17', 'Claim id : 41'),
(280, 1, 'Login', 'Login May 11, 2026 00:49:08', 'Admin : 1'),
(281, 1, 'approve', 'Claim Status updated May 11, 2026 00:49:18', 'Claim id : 42'),
(282, 1, 'Login', 'Login May 11, 2026 00:55:38', 'Admin : 1'),
(283, 1, 'approve', 'Item Status May 11, 2026 00:55:46', 'Item Id : 19'),
(284, 1, 'approve', 'Item Status May 11, 2026 00:55:47', 'Item Id : 18'),
(285, 1, 'Login', 'Login May 11, 2026 00:56:38', 'Admin : 1'),
(286, 1, 'approve', 'Claim Status updated May 11, 2026 00:57:09', 'Claim id : 44'),
(287, 1, 'review', 'Claim Status updated May 11, 2026 00:57:35', 'Claim id : 43'),
(288, 1, 'approve', 'Claim Status updated May 11, 2026 00:57:59', 'Claim id : 43'),
(289, 1, 'Login', 'Login May 11, 2026 16:18:23', 'Admin : 1'),
(290, 1, 'approve', 'Item Status May 11, 2026 16:18:27', 'Item Id : 20'),
(291, 1, 'approve', 'Item Status May 11, 2026 16:18:29', 'Item Id : 12'),
(292, 1, 'Login', 'Login May 11, 2026 16:24:50', 'Admin : 1'),
(293, 2, 'Login', 'Login May 11, 2026 16:25:11', 'Moderator : 2'),
(294, 1, 'Login', 'Login May 11, 2026 16:37:58', 'Admin : 1'),
(295, 1, '', 'Claim Status updated May 11, 2026 16:39:55', 'Claim id : 45'),
(296, 1, 'approve', 'Claim Status updated May 11, 2026 16:41:16', 'Claim id : 46'),
(297, 1, 'approve', 'Claim Status updated May 11, 2026 16:44:44', 'Claim id : 45'),
(298, 1, 'Login', 'Login May 11, 2026 17:42:30', 'Admin : 1'),
(299, 1, 'Login', 'Login May 11, 2026 18:15:43', 'Admin : 1'),
(300, 1, 'Login', 'Login May 11, 2026 18:16:46', 'Admin : 1'),
(301, 1, 'Login', 'Login May 14, 2026 14:20:05', 'Admin : 1'),
(302, 1, 'Login', 'Login May 14, 2026 15:43:03', 'Admin : 1');

-- --------------------------------------------------------

--
-- Table structure for table `CLAIMS`
--

CREATE TABLE `CLAIMS` (
  `Claim_ID` int(11) NOT NULL,
  `Item_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Proof_Image` varchar(255) DEFAULT NULL,
  `Claim_Status` varchar(20) NOT NULL,
  `Admin_Notes` text DEFAULT NULL,
  `Created_At` timestamp NOT NULL DEFAULT current_timestamp(),
  `Ownership_Description` text DEFAULT NULL,
  `Approved_By` int(11) DEFAULT NULL,
  `Approved_At` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `CLAIMS`
--

INSERT INTO `CLAIMS` (`Claim_ID`, `Item_ID`, `User_ID`, `Proof_Image`, `Claim_Status`, `Admin_Notes`, `Created_At`, `Ownership_Description`, `Approved_By`, `Approved_At`) VALUES
(5, 4, 22, 'uploads/proof_images/1777888866718_image-2.jpeg', 'APPROVED', 'collect your item', '2026-05-04 10:01:06', 'thjyhkl', 1, '2026-05-04 14:16:24'),
(6, 6, 5, 'uploads/proof_images/1778011734194_Screenshot 2026-05-05 at 5.23.14 PM.png', 'APPROVED', 'collect you item from our department', '2026-05-05 20:08:54', 'this is mine', 1, '2026-05-05 20:09:42'),
(7, 7, 22, 'uploads/proof_images/1778094429398_Screenshot 2025-12-12 at 4.00.47 PM.png', 'APPROVED', 'Please collect your item from our department', '2026-05-06 19:07:09', 'mine', 1, '2026-05-06 19:08:06'),
(8, 5, 22, 'uploads/proof_images/1778094825493_Screenshot 2026-04-21 at 1.01.04 PM.png', 'APPROVED', 'please collect your item from our department ', '2026-05-06 19:13:45', 'ytykuj', 1, '2026-05-06 19:27:54'),
(9, 10, 22, 'uploads/proof_images/1778165764072_Screenshot 2026-03-15 at 4.34.52 PM.png', 'REJECTED', 'in review', '2026-05-07 14:56:04', 'fdfd', 1, '2026-05-10 18:10:29'),
(35, 14, 5, 'uploads/proof_images/1778318535164_dev-group.jpg', 'APPROVED', 'fd', '2026-05-09 09:22:15', 'rtjk', 1, '2026-05-10 18:10:19'),
(36, 9, 22, NULL, 'APPROVED', 'claim it from our department', '2026-05-10 18:11:47', 'mine', 1, '2026-05-10 18:15:30'),
(37, 11, 22, NULL, 'APPROVED', 'done', '2026-05-10 18:18:09', 'mine', 1, '2026-05-10 18:25:21'),
(38, 17, 5, NULL, 'REJECTED', 'insufficient reason', '2026-05-10 18:29:02', 'mine\r\n', 1, '2026-05-10 18:30:19'),
(39, 16, 5, NULL, 'APPROVED', 'done', '2026-05-10 18:29:08', 'mine', 1, '2026-05-10 18:29:54'),
(40, 15, 22, NULL, 'APPROVED', 'done', '2026-05-10 18:41:15', 'mine', 1, '2026-05-10 18:52:58'),
(41, 17, 5, NULL, 'IN_REVIEW', 'done', '2026-05-10 19:01:27', 'dfghjk', 1, '2026-05-10 19:03:17'),
(42, 17, 5, NULL, 'APPROVED', 'done', '2026-05-10 19:03:49', 'mine', 1, '2026-05-10 19:04:18'),
(43, 19, 22, NULL, 'APPROVED', 'done collect your item from our department', '2026-05-10 19:11:12', 'mine', 1, '2026-05-10 19:12:59'),
(44, 18, 22, NULL, 'APPROVED', 'done all set collect your item from our department', '2026-05-10 19:11:21', 'mine kamalpokhari', 1, '2026-05-10 19:12:09'),
(45, 20, 22, NULL, 'APPROVED', 'done', '2026-05-11 10:53:47', 'hello', 1, '2026-05-11 10:59:44'),
(46, 20, 22, NULL, 'APPROVED', 'done', '2026-05-11 10:55:51', 'hello', 1, '2026-05-11 10:56:16'),
(47, 12, 22, NULL, 'PENDING', NULL, '2026-05-11 11:12:42', 'fghgjh', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `CONTACT_MESSAGES`
--

CREATE TABLE `CONTACT_MESSAGES` (
  `Contact_Message_ID` int(11) NOT NULL,
  `User_ID` int(11) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  `Message` text NOT NULL,
  `Submitted_At` timestamp NOT NULL DEFAULT current_timestamp(),
  `Is_Read` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `CONTACT_MESSAGES`
--

INSERT INTO `CONTACT_MESSAGES` (`Contact_Message_ID`, `User_ID`, `Email`, `Message`, `Submitted_At`, `Is_Read`) VALUES
(17, NULL, 'abcd@gmail.com', 'Hello Admin', '2026-05-06 15:12:53', 1),
(18, 5, 'acbp890@gmail.com', 'i had claimed the item but you rejected my claim that item is mine please approve my claim', '2026-05-06 15:14:13', 1),
(19, NULL, 'abichhetri6677@gmail.com', 'testing ', '2026-05-06 21:10:15', 1),
(20, NULL, 'randomuser@gmail.com', 'random user testing', '2026-05-06 21:17:15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ITEMS`
--

CREATE TABLE `ITEMS` (
  `Item_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Title` varchar(200) NOT NULL,
  `Category` varchar(100) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `Lost_Found_Date` date DEFAULT NULL,
  `Status` varchar(20) NOT NULL,
  `Rejection_Reason` text DEFAULT NULL,
  `Created_At` timestamp NOT NULL DEFAULT current_timestamp(),
  `Updated_At` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ITEMS`
--

INSERT INTO `ITEMS` (`Item_ID`, `User_ID`, `Type`, `Title`, `Category`, `Description`, `Location`, `Lost_Found_Date`, `Status`, `Rejection_Reason`, `Created_At`, `Updated_At`) VALUES
(4, 5, 'RETURNED', 'hjk', 'BAGS', 'fghjk', 'fghjk', '2026-05-04', 'APPROVED', 'fake', '2026-05-04 08:11:52', '2026-05-05 16:32:48'),
(5, 5, 'RETURNED', 'fghnb', 'BAGS', 'fghn', 'fghjmn', '2026-05-04', 'APPROVED', 'fake', '2026-05-04 14:31:55', '2026-05-06 19:27:54'),
(6, 22, 'RETURNED', 'car', 'OTHER', 'car', 'kamalpokhari', '2026-05-04', 'APPROVED', 'looks like wallpaper', '2026-05-04 17:57:27', '2026-05-05 20:09:42'),
(7, 5, 'RETURNED', 'hello', 'OTHER', 'stall', 'kamalpokhari', '2026-05-07', 'APPROVED', 'nope', '2026-05-06 18:57:55', '2026-05-06 19:08:06'),
(8, 5, 'FOUND', 'helo', 'KEYS', 'ghjkn', 'ds', '2026-05-07', 'REJECTED', 'fake listing', '2026-05-07 11:44:06', '2026-05-07 12:11:28'),
(9, 5, 'RETURNED', 'gjhkl', 'KEYS', 'hgjh', 'ffewf', '2026-05-13', 'APPROVED', NULL, '2026-05-07 12:58:01', '2026-05-10 18:15:30'),
(10, 5, 'RETURNED', 'fghgjj', 'BAGS', 'wr', 'fghgjh', '2026-05-15', 'APPROVED', NULL, '2026-05-07 12:58:24', '2026-05-07 16:23:39'),
(11, 5, 'RETURNED', 'hjyhk', 'BAGS', 'dgfhh', 'dfghj', '2026-05-07', 'APPROVED', NULL, '2026-05-07 13:47:38', '2026-05-10 18:25:21'),
(12, 5, 'FOUND', 'dfgh', 'BAGS', 'dgfh', 'gh', '2026-05-07', 'APPROVED', NULL, '2026-05-07 13:48:01', '2026-05-11 10:33:29'),
(13, 5, 'FOUND', 'dfgh', 'BAGS', 'dgfh', 'gh', '2026-05-07', 'REJECTED', 'fake', '2026-05-07 13:48:04', '2026-05-07 17:14:03'),
(14, 22, 'RETURNED', 'ghhj', 'ELECTRONICS', 'ghjk', 'gjhk', '2026-05-06', 'APPROVED', 'fake', '2026-05-07 15:06:38', '2026-05-10 18:10:19'),
(15, 5, 'RETURNED', 'citizenship ', 'DOCUMENTS', 'citizenship id lost saroj chhetri name', 'kamalpokhari', '2026-05-09', 'APPROVED', NULL, '2026-05-09 08:51:08', '2026-05-10 18:52:58'),
(16, 22, 'RETURNED', 'hello', 'BAGS', 'hello admin how are you', 'wgjdhkbjnk', '2026-05-11', 'APPROVED', NULL, '2026-05-10 18:26:15', '2026-05-10 18:29:54'),
(17, 22, 'RETURNED', 'hello admin', 'OTHER', 'hello', 'kamalpokhari', '2026-05-12', 'APPROVED', NULL, '2026-05-10 18:27:01', '2026-05-10 19:04:18'),
(18, 5, 'RETURNED', 'abcd', 'OTHER', 'rfgjhk', 'kamalpokhari', '2026-05-05', 'APPROVED', NULL, '2026-05-10 19:09:49', '2026-05-10 19:12:09'),
(19, 5, 'RETURNED', 'hello world', 'OTHER', 'hello world', 'know yourslef', '2026-05-11', 'APPROVED', NULL, '2026-05-10 19:10:20', '2026-05-10 19:12:59'),
(20, 5, 'RETURNED', 'fhg', 'KEYS', 'fhgj', 'ghjh', '2026-05-16', 'APPROVED', NULL, '2026-05-11 10:33:09', '2026-05-11 10:56:16');

-- --------------------------------------------------------

--
-- Table structure for table `ITEM_IMAGES`
--

CREATE TABLE `ITEM_IMAGES` (
  `Item_Image_ID` int(11) NOT NULL,
  `Item_ID` int(11) NOT NULL,
  `Image_Path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ITEM_IMAGES`
--

INSERT INTO `ITEM_IMAGES` (`Item_Image_ID`, `Item_ID`, `Image_Path`) VALUES
(34, 4, 'uploads/found_items/1777882312216_image.jpeg'),
(35, 5, 'uploads/found_items/1777905115570_Screenshot 2026-04-21 at 1.01.04 PM.png'),
(36, 6, 'uploads/found_items/1777917447610_speed_scalabe.jpg'),
(37, 7, 'uploads/found_items/1778093875147_Screenshot 2025-12-12 at 4.00.47 PM.png'),
(38, 8, 'uploads/found_items/1778154246311_Screenshot 2026-04-21 at 1.01.04 PM.png'),
(39, 10, 'uploads/found_items/1778158704383_Screenshot 2026-03-15 at 4.34.52 PM.png'),
(40, 12, 'uploads/found_items/1778161681142_Screenshot 2026-03-15 at 4.34.52 PM.png'),
(41, 13, 'uploads/found_items/1778161684046_Screenshot 2026-03-15 at 4.34.52 PM.png'),
(42, 14, 'uploads/found_items/1778166398083_Screenshot 2026-04-21 at 1.01.04 PM.png'),
(43, 15, 'uploads/found_items/1778316668407_WhatsApp Image 2025-07-28 at 13.09.30.jpeg'),
(44, 15, 'uploads/found_items/1778316668410_WhatsApp Image 2025-07-28 at 13.09.31.jpeg'),
(45, 16, 'uploads/found_items/1778437575563_Screenshot 2026-04-21 at 1.01.04 PM.png'),
(46, 17, 'uploads/found_items/1778437621411_Screenshot 2025-12-12 at 4.00.47 PM.png'),
(47, 18, 'uploads/found_items/1778440189583_Screenshot 2026-04-21 at 1.01.04 PM.png'),
(48, 19, 'uploads/found_items/1778440220889_Screenshot 2026-03-15 at 4.34.52 PM.png'),
(49, 20, 'uploads/found_items/1778495589698_Screenshot 2026-05-11 at 4.11.23 PM.png');

-- --------------------------------------------------------

--
-- Table structure for table `ITEM_REPORTS`
--

CREATE TABLE `ITEM_REPORTS` (
  `Item_Report_ID` int(11) NOT NULL,
  `Item_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Reason` text NOT NULL,
  `Status` varchar(20) NOT NULL,
  `Created_At` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ITEM_REPORTS`
--

INSERT INTO `ITEM_REPORTS` (`Item_Report_ID`, `Item_ID`, `User_ID`, `Reason`, `Status`, `Created_At`) VALUES
(2, 5, 22, 'fake listing', 'ACTED', '2026-05-04 16:40:07'),
(3, 8, 22, 'fake listing', 'ACTED', '2026-05-07 12:10:52'),
(4, 10, 22, 'something fishy', 'PENDING', '2026-05-07 14:43:43'),
(5, 14, 5, 'fake', 'ACTED', '2026-05-07 17:58:49'),
(6, 12, 22, 'this item seems to be fake no image is listed and random name', 'PENDING', '2026-05-11 12:42:37');

-- --------------------------------------------------------

--
-- Table structure for table `NOTIFICATIONS`
--

CREATE TABLE `NOTIFICATIONS` (
  `Notification_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Message` text NOT NULL,
  `Created_At` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `NOTIFICATIONS`
--

INSERT INTO `NOTIFICATIONS` (`Notification_ID`, `User_ID`, `Type`, `Message`, `Created_At`) VALUES
(1, 5, 'Login', 'Your account was logged in just now. If it was not you then please change your password', '2026-05-06 18:54:04'),
(2, 5, 'Reported Found Item', 'You have just reported an found Item to our admin with description stall', '2026-05-06 18:57:55'),
(3, 22, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-06 18:58:47'),
(4, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-06 18:59:47'),
(5, 5, 'Item Report Found Status', 'Your item report has been rejected : nope', '2026-05-06 19:04:31'),
(6, 5, 'Item Report Found Status', 'Your item report has been approved', '2026-05-06 19:04:32'),
(7, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-06 19:05:38'),
(8, 22, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-06 19:06:50'),
(9, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-06 19:07:09'),
(10, 22, 'Claim Status', 'Your claim has been null In review\r\n', '2026-05-06 19:07:47'),
(11, 22, 'Claim Status', 'Your claim has been null Please collect your item from our department', '2026-05-06 19:08:06'),
(12, 22, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-06 19:08:43'),
(13, 5, 'Item Report Found Status', 'Your item report has been approved', '2026-05-06 19:12:21'),
(14, 5, 'Item Report Found Status', 'Your item report has been rejected , reason: fake', '2026-05-06 19:12:31'),
(15, 5, 'Item Report Found Status', 'Your item report has been approved', '2026-05-06 19:12:39'),
(16, 22, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-06 19:13:31'),
(17, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-06 19:13:45'),
(18, 22, 'Claim Status', 'Your claim has been review in review', '2026-05-06 19:27:33'),
(19, 22, 'Claim Status', 'Your claim has been approve please collect your item from our department ', '2026-05-06 19:27:54'),
(20, 22, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-06 19:28:13'),
(21, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-06 19:51:45'),
(22, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-06 19:56:55'),
(23, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-06 20:32:03'),
(24, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-06 21:07:09'),
(25, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-06 21:34:12'),
(26, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-07 11:43:51'),
(27, 5, 'Reported Found Item', 'You have just reported an found Item to our admin with description ghjkn', '2026-05-07 11:44:06'),
(28, 5, 'Item Report Found Status', 'Your item report has been rejected , reason: fake listing', '2026-05-07 11:51:58'),
(29, 5, 'Item Report Found Status', 'Your item report has been rejected , reason: fake listing', '2026-05-07 11:52:01'),
(30, 5, 'Item Report Found Status', 'Your item report has been approved', '2026-05-07 11:52:05'),
(31, 5, 'Item Report Found Status', 'Your item report has been rejected , reason: fake listing', '2026-05-07 11:52:12'),
(32, 5, 'Item Report Found Status', 'Your item report has been rejected , reason: fake listing', '2026-05-07 11:52:15'),
(33, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-07 12:09:34'),
(34, 5, 'Item Report Found Status', 'Your item report has been approved', '2026-05-07 12:09:57'),
(35, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-07 12:10:21'),
(36, 22, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-07 12:10:42'),
(37, 22, 'Reported Item', 'You have reported an item with itemId :8 with reason which is fake listing', '2026-05-07 12:10:52'),
(38, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-07 12:54:07'),
(39, 5, 'Reported Found Item', 'You have just reported an found Item to our admin with description hgjh', '2026-05-07 12:58:01'),
(40, 5, 'Reported Found Item', 'You have just reported an found Item to our admin with description wr', '2026-05-07 12:58:24'),
(41, 5, 'Item Report Found Status', 'Your item report has been approved', '2026-05-07 12:59:23'),
(42, 5, 'Item Report Found Status', 'Your item report has been approved', '2026-05-07 12:59:24'),
(43, 5, 'Reported Found Item', 'You have just reported an found Item to our admin with description dgfhh', '2026-05-07 13:47:38'),
(44, 5, 'Reported Found Item', 'You have just reported an found Item to our admin with description dgfh', '2026-05-07 13:48:01'),
(45, 5, 'Reported Found Item', 'You have just reported an found Item to our admin with description dgfh', '2026-05-07 13:48:04'),
(46, 5, 'Profile Update', 'Profile updated successfully.', '2026-05-07 13:51:25'),
(47, 5, 'Profile Update', 'Profile updated successfully.', '2026-05-07 13:59:44'),
(48, 22, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-07 14:43:13'),
(49, 22, 'Reported Item', 'You have reported an item with itemId :10 with reason which is something fishy\r\n', '2026-05-07 14:43:43'),
(50, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-07 14:56:04'),
(51, 22, 'Reported Found Item', 'You have just reported an found Item to our admin with description ghjk', '2026-05-07 15:06:38'),
(52, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-07 15:23:13'),
(53, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-07 15:23:19'),
(54, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-07 15:25:01'),
(55, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-07 15:25:04'),
(56, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-07 15:25:15'),
(57, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-07 15:26:44'),
(58, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-07 15:26:47'),
(59, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-07 15:26:48'),
(60, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-07 15:27:57'),
(61, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-07 15:28:22'),
(62, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-07 15:31:09'),
(63, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-07 15:32:26'),
(64, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-07 15:33:08'),
(65, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-07 15:33:21'),
(66, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-07 15:34:17'),
(67, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-07 15:34:21'),
(68, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-07 15:34:28'),
(69, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-07 15:37:47'),
(70, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-07 15:37:57'),
(71, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-07 15:38:43'),
(72, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-07 15:40:16'),
(73, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-07 15:40:24'),
(74, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-07 15:42:13'),
(75, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-07 15:53:31'),
(76, 22, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-07 15:55:19'),
(77, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-07 15:57:01'),
(78, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-07 15:57:05'),
(79, 22, 'Claim Status', 'Your claim has been approveed ', '2026-05-07 16:23:40'),
(80, 22, 'Claim Status', 'Your claim has been approveed ', '2026-05-07 16:32:00'),
(81, 22, 'Claim Status', 'Your claim has been reviewed in review', '2026-05-07 16:38:29'),
(82, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-07 16:59:28'),
(83, 22, 'Item Report Found Status', 'Your item report has been approved', '2026-05-07 17:13:26'),
(84, 5, 'Item Report Found Status', 'Your item report has been approved', '2026-05-07 17:13:52'),
(85, 5, 'Item Report Found Status', 'Your item report has been rejected , reason: fake', '2026-05-07 17:14:03'),
(86, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-07 17:57:56'),
(87, 5, 'Reported Item', 'You have reported an item with itemId :14 with reason which is fake\r\n', '2026-05-07 17:58:49'),
(88, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-07 18:02:31'),
(89, 22, 'Item Report Found Status', 'Your item report has been rejected , reason: fake', '2026-05-07 18:10:26'),
(90, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-07 18:11:06'),
(91, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-07 18:32:22'),
(92, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-07 18:41:38'),
(93, 22, 'Item Report Found Status', 'Your item report has been approved', '2026-05-07 18:42:01'),
(94, 22, 'Item Report Found Status', 'Your item report has been approved', '2026-05-07 18:42:04'),
(95, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-08 13:46:17'),
(96, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-09 03:22:58'),
(97, 22, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-09 03:36:33'),
(98, 22, 'Item Report Found Status', 'Your item report has been rejected , reason: ', '2026-05-09 07:19:54'),
(99, 22, 'Item Report Found Status', 'Your item report has been approved', '2026-05-09 07:20:14'),
(100, 22, 'Item Report Found Status', 'Your item report has been approved', '2026-05-09 07:20:16'),
(101, 22, 'Item Report Found Status', 'Your item report has been rejected , reason: ', '2026-05-09 07:20:21'),
(102, 22, 'Item Report Found Status', 'Your item report has been approved', '2026-05-09 07:20:26'),
(103, 22, 'Item Report Found Status', 'Your item report has been rejected , reason: ', '2026-05-09 07:20:29'),
(104, 22, 'Item Report Found Status', 'Your item report has been approved', '2026-05-09 07:20:31'),
(105, 22, 'Item Report Found Status', 'Your item report has been approved', '2026-05-09 07:20:34'),
(106, 22, 'Item Report Found Status', 'Your item report has been approved', '2026-05-09 07:23:52'),
(107, 22, 'Item Report Found Status', 'Your item report has been approved', '2026-05-09 07:23:53'),
(108, 22, 'Item Report Found Status', 'Your item report has been approved', '2026-05-09 07:23:56'),
(109, 22, 'Item Report Found Status', 'Your item report has been rejected , reason: fghj', '2026-05-09 07:29:13'),
(110, 22, 'Item Report Found Status', 'Your item report has been approved', '2026-05-09 07:34:38'),
(111, 22, 'Item Report Found Status', 'Your item report has been rejected , reason: fh', '2026-05-09 07:47:53'),
(112, 22, 'Item Report Found Status', 'Your item report has been approved', '2026-05-09 07:47:54'),
(113, 22, 'Item Report Found Status', 'Your item report has been approved', '2026-05-09 07:48:46'),
(114, 22, 'Item Report Found Status', 'Your item report has been approved', '2026-05-09 07:48:52'),
(115, 22, 'Item Report Found Status', 'Your item report has been approved', '2026-05-09 07:49:00'),
(116, 22, 'Item Report Found Status', 'Your item report has been rejected , reason: fghn', '2026-05-09 07:54:55'),
(117, 22, 'Item Report Found Status', 'Your item report has been approved', '2026-05-09 07:54:57'),
(118, 22, 'Item Report Found Status', 'Your item report has been approved', '2026-05-09 07:55:22'),
(119, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-09 08:47:42'),
(120, 5, 'Reported Found Item', 'You have just reported an found Item to our admin with description citizenship id lost saroj chhetri name', '2026-05-09 08:51:08'),
(121, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-09 08:53:21'),
(122, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-09 09:21:21'),
(123, 5, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-09 09:22:15'),
(124, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-09 09:36:54'),
(125, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-09 10:03:17'),
(126, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-09 10:10:43'),
(127, 5, 'Profile Update', 'Profile updated successfully.', '2026-05-09 10:10:51'),
(128, 5, 'Profile Update', 'Profile updated successfully.', '2026-05-09 10:10:55'),
(129, 5, 'Profile Update', 'Profile updated successfully.', '2026-05-09 10:10:59'),
(130, 5, 'Profile Update', 'Profile updated successfully.', '2026-05-09 10:11:18'),
(131, 5, 'Profile Update', 'Profile updated successfully.', '2026-05-09 10:11:50'),
(132, 5, 'Profile Update', 'Profile updated successfully.', '2026-05-09 10:12:30'),
(133, 5, 'Profile Update', 'Profile updated successfully.', '2026-05-09 10:15:25'),
(134, 5, 'Profile Update', 'Profile updated successfully.', '2026-05-09 10:15:29'),
(135, 5, 'Profile Update', 'Profile updated successfully.', '2026-05-09 10:15:44'),
(136, 5, 'Profile Update', 'Profile updated successfully.', '2026-05-09 10:17:21'),
(137, 5, 'Profile Update', 'Profile updated successfully.', '2026-05-09 10:17:27'),
(138, 5, 'Profile Update', 'Profile updated successfully.', '2026-05-09 10:17:34'),
(139, 5, 'Profile Update', 'Profile updated successfully.', '2026-05-09 10:19:10'),
(140, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-10 10:11:56'),
(141, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-10 12:11:43'),
(142, 5, 'Claim Status', 'Your claim has been ed fd', '2026-05-10 18:09:58'),
(143, 5, 'Claim Status', 'Your claim has been approveed fd', '2026-05-10 18:10:19'),
(144, 22, 'Claim Status', 'Your claim has been rejected in review', '2026-05-10 18:10:29'),
(145, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-10 18:10:54'),
(146, 22, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-10 18:11:26'),
(147, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-10 18:11:47'),
(148, 22, 'Claim Status', 'Your claim has been ed claim it from our department', '2026-05-10 18:15:19'),
(149, 22, 'Claim Status', 'Your claim has been approveed claim it from our department', '2026-05-10 18:15:30'),
(150, 22, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-10 18:17:54'),
(151, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-10 18:18:09'),
(152, 22, 'Claim Status', 'Your claim has been approveed done', '2026-05-10 18:25:21'),
(153, 22, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-10 18:25:47'),
(154, 22, 'Reported Found Item', 'You have just reported an found Item to our admin with description hello admin how are you', '2026-05-10 18:26:15'),
(155, 22, 'Reported Found Item', 'You have just reported an found Item to our admin with description hello', '2026-05-10 18:27:01'),
(156, 22, 'Item Report Found Status', 'Your item report has been approved', '2026-05-10 18:27:21'),
(157, 22, 'Item Report Found Status', 'Your item report has been approved', '2026-05-10 18:27:31'),
(158, 5, 'Item Report Found Status', 'Your item report has been approved', '2026-05-10 18:27:33'),
(159, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-10 18:28:53'),
(160, 5, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-10 18:29:02'),
(161, 5, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-10 18:29:08'),
(162, 5, 'Claim Status', 'Your claim has been approveed done', '2026-05-10 18:29:54'),
(163, 5, 'Claim Status', 'Your claim has been rejected insufficient reason', '2026-05-10 18:30:19'),
(164, 22, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-10 18:41:05'),
(165, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-10 18:41:15'),
(166, 22, 'Claim Status', 'Your claim has been ed done', '2026-05-10 18:42:31'),
(167, 22, 'Claim Status', 'Your claim has been approveed done', '2026-05-10 18:52:58'),
(168, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-10 19:01:12'),
(169, 5, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-10 19:01:27'),
(170, 5, 'Claim Status', 'Your claim has been ed done', '2026-05-10 19:03:17'),
(171, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-10 19:03:42'),
(172, 5, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-10 19:03:49'),
(173, 5, 'Claim Status', 'Your claim has been approveed done', '2026-05-10 19:04:18'),
(174, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-10 19:09:24'),
(175, 5, 'Reported Found Item', 'You have just reported an found Item to our admin with description rfgjhk', '2026-05-10 19:09:49'),
(176, 5, 'Reported Found Item', 'You have just reported an found Item to our admin with description hello world', '2026-05-10 19:10:20'),
(177, 5, 'Item Report Found Status', 'Your item report has been approved', '2026-05-10 19:10:46'),
(178, 5, 'Item Report Found Status', 'Your item report has been approved', '2026-05-10 19:10:47'),
(179, 22, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-10 19:11:01'),
(180, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-10 19:11:12'),
(181, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-10 19:11:21'),
(182, 22, 'Claim Status', 'Your claim has been approveed done all set collect your item from our department', '2026-05-10 19:12:09'),
(183, 22, 'Claim Status', 'Your claim has been reviewed In review process', '2026-05-10 19:12:35'),
(184, 22, 'Claim Status', 'Your claim has been approveed done collect your item from our department', '2026-05-10 19:12:59'),
(185, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-11 10:26:13'),
(186, 5, 'Reported Found Item', 'You have just reported an found Item to our admin with description fhgj', '2026-05-11 10:33:09'),
(187, 5, 'Item Report Found Status', 'Your item report has been approved', '2026-05-11 10:33:27'),
(188, 5, 'Item Report Found Status', 'Your item report has been approved', '2026-05-11 10:33:29'),
(189, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-11 10:34:18'),
(190, 22, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-11 10:53:24'),
(191, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-11 10:53:47'),
(192, 22, 'Claim Status', 'Your claim has been ed done', '2026-05-11 10:54:55'),
(193, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-11 10:55:51'),
(194, 22, 'Claim Status', 'Your claim has been approveed done', '2026-05-11 10:56:16'),
(195, 22, 'Claim Status', 'Your claim has been approveed done', '2026-05-11 10:59:44'),
(196, 22, 'Claimed Item', 'Your claim was successfull submitted', '2026-05-11 11:12:42'),
(197, 22, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-11 12:07:28'),
(198, 22, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-11 12:34:46'),
(199, 22, 'Reported Item', 'You have reported an item with itemId :12 with reason which is this item seems to be fake no image is listed and random name', '2026-05-11 12:42:37'),
(200, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-12 08:07:13'),
(201, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-14 10:46:00'),
(202, 22, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-14 10:46:57'),
(203, 5, 'Login', 'Your account was logged in just now. If this was not you then please change your password', '2026-05-14 10:48:09');

-- --------------------------------------------------------

--
-- Table structure for table `USERS`
--

CREATE TABLE `USERS` (
  `User_ID` int(11) NOT NULL,
  `Full_Name` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone_Number` varchar(20) DEFAULT NULL,
  `Password` varchar(255) NOT NULL,
  `Profile_Photo` varchar(255) DEFAULT NULL,
  `Status` varchar(20) NOT NULL,
  `Created_At` timestamp NOT NULL DEFAULT current_timestamp(),
  `Updated_At` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Approved_By` int(11) DEFAULT NULL,
  `Approve_Status` varchar(20) DEFAULT NULL,
  `Approved_At` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `USERS`
--

INSERT INTO `USERS` (`User_ID`, `Full_Name`, `Email`, `Phone_Number`, `Password`, `Profile_Photo`, `Status`, `Created_At`, `Updated_At`, `Approved_By`, `Approve_Status`, `Approved_At`) VALUES
(5, 'Abi Chhetri', 'acbp890@gmail.com', '9824442812', '$2a$12$xeW/H4t5yfyt3CqAHcSXnO6HSR9mXMU0wCyU4HkZFK0V6F2ueNDDO', NULL, 'ACTIVE', '2026-04-18 13:27:44', '2026-05-14 10:48:09', 1, 'APPROVED', '2026-04-30 11:44:29'),
(22, 'Bruce Wayne', 'testing123@gmail.com', '9812345678', '$2a$12$I76ba4aS/IcfrOuIKkf6OeJocwIzON5DGrYPpxcip/8yA1dCo.evm', 'uploads/profile-pics/1777916380436_Solution-for-digital-world.jpg', 'INACTIVE', '2026-05-01 10:30:36', '2026-05-14 10:47:51', 2, 'APPROVED', '2026-05-07 18:45:41'),
(23, 'abi chhetriK', 'abcd@gmail.com', NULL, '$2a$12$pJvWvxuiS8O9NfUpHHjhUOW8dQmySYQ5obkIj7sosWopP5EqHpLse', NULL, 'INACTIVE', '2026-05-05 16:44:12', '2026-05-08 13:48:29', 2, 'SUSPENDED', '2026-05-08 13:48:28'),
(24, 'Gaurav', 'gc@gmail.com', NULL, '$2a$12$8j6D8z1k86geBDKLR6EaRe5S49rm1mTFNiDo2WmLN1bmpyvKzuf8C', NULL, 'INACTIVE', '2026-05-07 18:31:43', '2026-05-10 18:41:36', 1, 'APPROVED', '2026-05-10 18:41:36'),
(25, 'Abi chhetri', 'asdb@gmail.com', '9824442812', '$2a$12$ZbbWB14jRdh/p4OiYjBw3ePOMENi//TabILEFxLkcorz8V2SSypE.', NULL, 'INACTIVE', '2026-05-09 10:04:31', '2026-05-09 10:04:31', NULL, 'PENDING', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ADMINS`
--
ALTER TABLE `ADMINS`
  ADD PRIMARY KEY (`Admin_ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `ADMIN_LOGS`
--
ALTER TABLE `ADMIN_LOGS`
  ADD PRIMARY KEY (`Admin_log_ID`),
  ADD KEY `Admin_ID` (`Admin_ID`);

--
-- Indexes for table `CLAIMS`
--
ALTER TABLE `CLAIMS`
  ADD PRIMARY KEY (`Claim_ID`),
  ADD KEY `Item_ID` (`Item_ID`),
  ADD KEY `User_ID` (`User_ID`),
  ADD KEY `Approved_By` (`Approved_By`);

--
-- Indexes for table `CONTACT_MESSAGES`
--
ALTER TABLE `CONTACT_MESSAGES`
  ADD PRIMARY KEY (`Contact_Message_ID`),
  ADD KEY `contact_messages_ibfk_1` (`User_ID`);

--
-- Indexes for table `ITEMS`
--
ALTER TABLE `ITEMS`
  ADD PRIMARY KEY (`Item_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `ITEM_IMAGES`
--
ALTER TABLE `ITEM_IMAGES`
  ADD PRIMARY KEY (`Item_Image_ID`),
  ADD KEY `Item_ID` (`Item_ID`);

--
-- Indexes for table `ITEM_REPORTS`
--
ALTER TABLE `ITEM_REPORTS`
  ADD PRIMARY KEY (`Item_Report_ID`),
  ADD KEY `Item_ID` (`Item_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `NOTIFICATIONS`
--
ALTER TABLE `NOTIFICATIONS`
  ADD PRIMARY KEY (`Notification_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `USERS`
--
ALTER TABLE `USERS`
  ADD PRIMARY KEY (`User_ID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `Approved_By` (`Approved_By`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ADMINS`
--
ALTER TABLE `ADMINS`
  MODIFY `Admin_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ADMIN_LOGS`
--
ALTER TABLE `ADMIN_LOGS`
  MODIFY `Admin_log_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=303;

--
-- AUTO_INCREMENT for table `CLAIMS`
--
ALTER TABLE `CLAIMS`
  MODIFY `Claim_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `CONTACT_MESSAGES`
--
ALTER TABLE `CONTACT_MESSAGES`
  MODIFY `Contact_Message_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `ITEMS`
--
ALTER TABLE `ITEMS`
  MODIFY `Item_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `ITEM_IMAGES`
--
ALTER TABLE `ITEM_IMAGES`
  MODIFY `Item_Image_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `ITEM_REPORTS`
--
ALTER TABLE `ITEM_REPORTS`
  MODIFY `Item_Report_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `NOTIFICATIONS`
--
ALTER TABLE `NOTIFICATIONS`
  MODIFY `Notification_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `USERS`
--
ALTER TABLE `USERS`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ADMIN_LOGS`
--
ALTER TABLE `ADMIN_LOGS`
  ADD CONSTRAINT `admin_logs_ibfk_1` FOREIGN KEY (`Admin_ID`) REFERENCES `ADMINS` (`Admin_ID`);

--
-- Constraints for table `CLAIMS`
--
ALTER TABLE `CLAIMS`
  ADD CONSTRAINT `claims_ibfk_1` FOREIGN KEY (`Item_ID`) REFERENCES `ITEMS` (`Item_ID`),
  ADD CONSTRAINT `claims_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `USERS` (`User_ID`),
  ADD CONSTRAINT `claims_ibfk_3` FOREIGN KEY (`Approved_By`) REFERENCES `ADMINS` (`Admin_ID`);

--
-- Constraints for table `CONTACT_MESSAGES`
--
ALTER TABLE `CONTACT_MESSAGES`
  ADD CONSTRAINT `contact_messages_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `USERS` (`User_ID`) ON DELETE SET NULL;

--
-- Constraints for table `ITEMS`
--
ALTER TABLE `ITEMS`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `USERS` (`User_ID`);

--
-- Constraints for table `ITEM_IMAGES`
--
ALTER TABLE `ITEM_IMAGES`
  ADD CONSTRAINT `item_images_ibfk_1` FOREIGN KEY (`Item_ID`) REFERENCES `ITEMS` (`Item_ID`) ON DELETE CASCADE;

--
-- Constraints for table `ITEM_REPORTS`
--
ALTER TABLE `ITEM_REPORTS`
  ADD CONSTRAINT `item_reports_ibfk_1` FOREIGN KEY (`Item_ID`) REFERENCES `ITEMS` (`Item_ID`),
  ADD CONSTRAINT `item_reports_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `USERS` (`User_ID`);

--
-- Constraints for table `NOTIFICATIONS`
--
ALTER TABLE `NOTIFICATIONS`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `USERS` (`User_ID`);

--
-- Constraints for table `USERS`
--
ALTER TABLE `USERS`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`Approved_By`) REFERENCES `ADMINS` (`Admin_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
