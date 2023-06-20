-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2023 at 05:49 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fayeed_electronics`
--

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `branchID` int(11) NOT NULL,
  `usersID` int(11) NOT NULL,
  `Branch_Name` varchar(100) NOT NULL,
  `Branch_Address` varchar(100) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `Branch_Contact_number` varchar(20) NOT NULL,
  `DateCreated` varchar(50) NOT NULL,
  `branch_email` varchar(50) NOT NULL,
  `status` int(1) DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`branchID`, `usersID`, `Branch_Name`, `Branch_Address`, `city`, `Branch_Contact_number`, `DateCreated`, `branch_email`, `status`) VALUES
(4, 3, 'Fayeed Electronics Branch 2', 'Basilan', 'Basilan', '7634283', '2023-06-13', 'argonfernando453@gmail.com', 2),
(5, 3, 'Fayeed Electronics', 'tumaga tupperware bldg', 'zamboanga city', '090908999', '2023-06-19', 'fernandoaragon117@yahoo.com', 2);

-- --------------------------------------------------------

--
-- Table structure for table `branch_staff`
--

CREATE TABLE `branch_staff` (
  `staffID` int(11) NOT NULL,
  `branchID` int(11) NOT NULL,
  `usersID` int(11) NOT NULL,
  `assigndby` int(11) DEFAULT NULL,
  `roles` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branch_staff`
--

INSERT INTO `branch_staff` (`staffID`, `branchID`, `usersID`, `assigndby`, `roles`) VALUES
(46, 4, 16, 3, 1),
(47, 4, 19, 3, 2),
(48, 5, 17, 3, 1),
(49, 5, 13, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `SettingsId` int(11) NOT NULL,
  `System_Name` varchar(255) NOT NULL,
  `System_Email` varchar(255) NOT NULL,
  `System_number` varchar(255) NOT NULL,
  `Smtp_email` varchar(255) NOT NULL,
  `Smatp_password` varchar(255) NOT NULL,
  `Smtp_Provider` varchar(255) NOT NULL,
  `Smtp_port` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`SettingsId`, `System_Name`, `System_Email`, `System_number`, `Smtp_email`, `Smatp_password`, `Smtp_Provider`, `Smtp_port`) VALUES
(1, 'Fayeed Electronics', 'hsfsjhdbsdjf@email.com', '09358250452', 'argonfernando453@gmail.com', '123456789', 'smtp.gmail.com', '578');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `usersID` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `profile` varchar(255) DEFAULT 'user.png',
  `cover_photo` varchar(255) DEFAULT 'fayeedcover.png',
  `usersFirstName` varchar(50) NOT NULL,
  `usersLastName` varchar(50) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `Address` varchar(100) NOT NULL,
  `CellNumber` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(225) DEFAULT NULL,
  `code` int(11) NOT NULL,
  `status` text NOT NULL,
  `roles` int(1) DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`usersID`, `username`, `profile`, `cover_photo`, `usersFirstName`, `usersLastName`, `age`, `Address`, `CellNumber`, `email`, `password`, `code`, `status`, `roles`) VALUES
(3, 'Aragon123_', 'fayeed_logo-removebg-preview (2).png', 'https://c4.wallpaperflare.com/wallpaper/203/203/693/sunset-drawing-animals-lake-wallpaper-preview.jpg', 'Fern', 'Aragon', 21, 'j,a gamboa drive putik zamboanga city', '09358250452', 'argonfernando453@gmail.com', '$2y$10$hMhAv53PrjJSKemKi6.2cO/LtoJDhRPjM6IQQc0.B58LNVItxNqQi', 0, 'verified', 1),
(13, 'Aragon123_s', 'user.png', 'fayeedcover.png', '', '', NULL, '', NULL, 'argon4458@gmail.com', '$2y$10$M6ieaMj5D6ORrpYQ/Xc9eO38uspDqsnWrip9SyU4ql2YXXSI3Tkzq', 0, 'verified', 2),
(16, 'Keneth123', 'user.png', 'fayeedcover.png', '', '', NULL, '', NULL, 'tankenneth1220@gmail.com', '$2y$10$t7fDkHpDQGWEfnSRiYgFiOTmPOpXIuKv7JCHUREPpcmT364k9NBKC', 872636, 'notverified', 2),
(17, 'teff123', 'user.png', 'fayeedcover.png', '', '', NULL, '', NULL, 'teff.wong@gmail.com', '$2y$10$lCuJyqyCwXTpyN5RLIpI4.ISYiu2t7cPqC75IPRjS6uE.lFNaodOG', 0, 'verified', 2),
(19, 'argonfernando453@gmail.com', 'user.png', 'fayeedcover.png', '', '', NULL, '', NULL, 'argonfernando45d3@gmail.com', '$2y$10$DCZKXGbJYj4Lc6b96FeX9uHnIRESpMy4sZCPdTI3vFWvyKL82moHu', 778618, 'notverified', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`branchID`,`usersID`),
  ADD KEY `fkbranches` (`usersID`);

--
-- Indexes for table `branch_staff`
--
ALTER TABLE `branch_staff`
  ADD PRIMARY KEY (`staffID`,`branchID`,`usersID`),
  ADD KEY `fkstaff` (`branchID`),
  ADD KEY `fkstaff2` (`usersID`),
  ADD KEY `fkstaff3` (`assigndby`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`SettingsId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`usersID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `branchID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `branch_staff`
--
ALTER TABLE `branch_staff`
  MODIFY `staffID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `SettingsId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `usersID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `fkbranches` FOREIGN KEY (`usersID`) REFERENCES `users` (`usersID`);

--
-- Constraints for table `branch_staff`
--
ALTER TABLE `branch_staff`
  ADD CONSTRAINT `fkstaff` FOREIGN KEY (`branchID`) REFERENCES `branches` (`branchID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fkstaff2` FOREIGN KEY (`usersID`) REFERENCES `users` (`usersID`) ON DELETE CASCADE,
  ADD CONSTRAINT `fkstaff3` FOREIGN KEY (`assigndby`) REFERENCES `users` (`usersID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
