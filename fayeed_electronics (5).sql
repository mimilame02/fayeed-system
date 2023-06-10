-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2023 at 11:17 AM
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
  `branch_email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`branchID`, `usersID`, `Branch_Name`, `Branch_Address`, `city`, `Branch_Contact_number`, `DateCreated`, `branch_email`) VALUES
(1, 3, 'adasdasd', 'j,a gamboa drive putik zamboanga city', 'zamboanga city', '4435345', '2023-06-09', 'fernandoaragon117@yahoo.com');

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
  `roles` int(1) NOT NULL DEFAULT 3
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`usersID`, `username`, `profile`, `cover_photo`, `usersFirstName`, `usersLastName`, `age`, `Address`, `CellNumber`, `email`, `password`, `code`, `status`, `roles`) VALUES
(3, 'Aragon123_', 'fayeed_logo-removebg-preview (2).png', 'https://c4.wallpaperflare.com/wallpaper/767/612/930/nature-landscape-trees-digital-art-wallpaper-preview.jpg', 'Fern', 'Aragon', 21, 'j,a gamboa drive putik zamboanga city', '09358250452', 'argonfernando453@gmail.com', '$2y$10$hMhAv53PrjJSKemKi6.2cO/LtoJDhRPjM6IQQc0.B58LNVItxNqQi', 0, 'verified', 1),
(13, 'Aragon123_s', 'user.png', 'fayeedcover.png', '', '', NULL, '', NULL, 'argon4458@gmail.com', '$2y$10$M6ieaMj5D6ORrpYQ/Xc9eO38uspDqsnWrip9SyU4ql2YXXSI3Tkzq', 0, 'verified', 1);

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
  MODIFY `branchID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `usersID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `fkbranches` FOREIGN KEY (`usersID`) REFERENCES `users` (`usersID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
