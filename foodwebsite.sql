-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 05, 2026 at 12:33 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `foodwebsite`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `email`, `password`) VALUES
(1, 'admin@gmail.com', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `payment` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE `feedbacks` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedbacks`
--

INSERT INTO `feedbacks` (`id`, `name`, `email`, `rating`, `message`) VALUES
(1, 'Deepraj singh Rathore', 'deeprajrathore3132@gmail.com', 4, 'good'),
(2, 'Deepraj singh Rathore', 'deeprajrathore3132@gmail.com', 4, 'good'),
(3, 'Deepraj singh Rathore', 'deeprajrathore3132@gmail.com', 5, 'g'),
(4, 'Deepraj singh Rathore', 'deeprajrathore3132@gmail.com', 4, 'goood'),
(5, 'Deepraj singh Rathore', 'deeprajrathore3132@gmail.com', 3, 'good'),
(6, 'Deepraj singh Rathore', 'deeprajrathore3132@gmail.com', 1, 'good'),
(7, 'vishal ', 'vijay@gmail.com', 2, 'good'),
(8, 'Deepraj ', 'de3132@gmail.com', 5, ''),
(9, 'monty', 'mon@gmail.com', 2, 'poor'),
(10, 'Deep', 're3132@gmail.com', 1, 'bad'),
(11, 'vishal ', 'vishal3@gmail.com', 4, 'good'),
(12, 'vishal ', 'vishal3@gmail.com', 4, 'good'),
(13, 'vishal ', 'vishal3@gmail.com', 4, 'good');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu_ad`
--

CREATE TABLE `menu_ad` (
  `id` int(11) NOT NULL,
  `food` varchar(100) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `stock` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_ad`
--

INSERT INTO `menu_ad` (`id`, `food`, `price`, `image`, `description`, `stock`) VALUES
(17, 'Burger', 120, 'http://localhost:3000/uploads/1776952173593.png', 'burger king', 'In Stock'),
(18, 'Pizza', 299, 'http://localhost:3000/uploads/1776952244359.png', 'pzza chinese', 'In Stock'),
(19, 'Coffee', 99, 'http://localhost:3000/uploads/1776952320052.png', 'coffee', 'In Stock'),
(20, 'Pasta', 249, 'http://localhost:3000/uploads/1776952370569.png', 'Pasta', 'In Stock'),
(21, 'Pasta', 150, 'http://localhost:3000/uploads/1776952400651.png', 'normal pasta', 'In Stock'),
(22, 'Panner machurian', 240, 'http://localhost:3000/uploads/1776952469022.png', 'panner machurina', 'In Stock'),
(23, 'Cold  coffee', 149, 'http://localhost:3000/uploads/1776952665320.png', 'cold coffee', 'In Stock'),
(24, 'Shahi Panner', 300, 'http://localhost:3000/uploads/1776952773295.png', 'panner', 'In Stock');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `food` varchar(100) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `payment` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `email`, `food`, `price`, `quantity`, `total`, `address`, `city`, `pincode`, `payment`) VALUES
(1, 'deeprajrathore3132@gmail.com', 'Pizza', 299, 1, 299, 'mangliya', 'indore', '453771', 'UPI'),
(2, 'deeprajrathore3132@gmail.com', 'Pizza', 299, 1, NULL, 'dvb', 'indore', '453771', 'Cash'),
(3, 'deeprajrathore3132@gmail.com', 'Paneer Tikka', 259, 4, 1036, 'mangliya', 'indore', '453771', 'Card'),
(4, 'abhi@gmail.com', 'Burger', 199, 4, 796, 'dewas  naka ', 'indore', '452010', 'Card'),
(5, 'vishal3132@gmail.com', 'Pasta', 249, 1, 249, 'dewas  naka ', 'indore', '452010', 'Cash'),
(6, 'vaibhavsoni123@gmail.com', 'Pizza', 299, 2, 598, 'mangliya', 'indore', '452010', 'UPI'),
(7, 'sk@gmail.com', 'Burger', 199, 5, 995, 'mangliya', 'indore', '452010', 'UPI'),
(9, 'sk@gmail.com', 'Burger', 199, 10, NULL, 'mangliya', 'indore', '452010', 'UPI'),
(10, 'sk@gmail.com', 'Pasta', 249, 2, NULL, 'mangliya', 'indore', '452010', 'Cash'),
(11, 'patel@gmail.com', 'Pizza', 299, 1, NULL, 'mangliya', 'indore', '452010', 'UPI'),
(12, 'sk@gmail.com', 'Pizza', 299, 1, NULL, 'dvb', 'indore', '452010', 'Cash'),
(13, 'sk@gmail.com', 'Pasta', 249, 5, NULL, 'dvb', 'indore', '452010', 'Cash'),
(14, 'sk@gmail.com', 'Burger', 199, 1, 199, 'mangliya', 'indore', '453771', 'UPI'),
(15, 'sk@gmail.com', 'Paneer Tikka', 259, 2, 518, 'mangliya', 'indore', '452010', 'UPI'),
(16, 'deeprajrathore3132@gmail.com', 'Pizza', 299, 2, 598, '78 area', 'indore', '452010', 'Card'),
(17, 'deeprajrathore3132@gmail.com', 'Paneer Tikka', 259, 5, 1295, '78 area', 'indore', '452010', 'Card'),
(18, 'neeta@gmail.com', 'Burger', 199, 2, NULL, 'vijya  nagar ', 'indore', '453771', 'Cash'),
(19, 'sk@gmail.com', 'mike', 90, 1, NULL, NULL, NULL, NULL, ''),
(20, 'sk@gmail.com', 'Shahi Panner', 300, 1, 300, NULL, 'mp', NULL, 'CARD'),
(21, 'sk@gmail.com', 'Shahi Panner', 300, 1, 300, NULL, 'mp', NULL, 'CARD'),
(22, 'sk@gmail.com', 'Shahi Panner', 300, 1, 300, NULL, 'mp', NULL, 'CARD'),
(23, 'sk@gmail.com', 'Shahi Panner', 300, 1, 300, NULL, 'indore', NULL, 'UPI'),
(24, 'vishal3@gmail.com', 'milk', NULL, 1, 49, NULL, 'indore', NULL, 'UPI'),
(25, 'vishal3@gmail.com', 'Shahi Panner', NULL, 3, 900, NULL, 'indore', NULL, 'CARD'),
(26, 'vishal3@gmail.com', 'Panner machurian', NULL, 1, 240, NULL, 'indore', NULL, 'CARD'),
(27, 'gungunrathore@gmail.com', 'Cold  coffee', NULL, 1, 149, NULL, 'indore', NULL, 'UPI'),
(28, 'gungunrathore@gmail.com', 'Panner machurian', NULL, 2, 480, NULL, 'indore', NULL, 'COD'),
(29, 'gungunrathore@gmail.com', 'Coffee', NULL, 1, 99, NULL, 'indore', NULL, 'COD');

-- --------------------------------------------------------

--
-- Table structure for table `table_bookings`
--

CREATE TABLE `table_bookings` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `payment` varchar(20) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `table_bookings`
--

INSERT INTO `table_bookings` (`id`, `name`, `email`, `phone`, `message`, `payment`, `amount`) VALUES
(1, 'Deepraj singh Rathore', 'deeprajrathore3132@gmail.com', '+917508213264', 'dinner', 'Card', 200),
(2, 'Deepraj singh Rathore', 'deeprajrathore3132@gmail.com', '+917508213264', 'dinner', 'Card', 200),
(3, 'Deepraj singh Rathore', 'deeprajrathore3132@gmail.com', '7047823132', 'indore', 'UPI', 200);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `password`) VALUES
(1, 'Deep', 'sk@gmail.com', '7047823132', '3132'),
(2, 'deepraj singh rathore', 'deeprajrathore3132@gmail.com', '7047823132', '3132'),
(3, 'monty', 'monty@gmail.com', '9977333480', '111'),
(4, 'monty', 'monty@gmail.com', '7047823132', '1111'),
(5, 'dp', 'dp@gmail.com', '1111111111', '111'),
(6, 'ajay', 'ajay@gmail.com', '6265635467', '6262'),
(7, 'ap', 'ap@gmail.com', '1021304020', '123'),
(8, 'ap', 'ap@gmail.com', '1021304020', '123'),
(9, 'mp', 'mp@gamil.com', '121331321', '1234'),
(10, 'kp', 'kp@gmail.com', '2039102720', '1234'),
(11, 'vijay', 'vijay@gmail.com', '9977333480', '1234'),
(12, 'abhi', 'abhi@gmail.com', '9294672789', '2789'),
(13, 'abhi', 'abhi@gmail.com', '9294672789', '2789'),
(14, 'vishal ', 'vishal3132@gmail.com', '9930201010', '1234'),
(15, 'vaibhav', 'vaibhavsoni123@gmail.com', '7047823132', '1234'),
(16, 'deepraj patel', 'patel@gmail.com', '1111122222', '1111'),
(17, 'neeta rathore', 'neeta@gmail.com', '9753446714', '1234'),
(18, 'dps', 'dps@gamil.com', '9294672789', '1234'),
(19, 'vishal ', 'vishal3@gmail.com', '1021304020', '1111'),
(20, 'Gungun Rathore', 'gungunrathore@gmail.com', '9302917987', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_ad`
--
ALTER TABLE `menu_ad`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_bookings`
--
ALTER TABLE `table_bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu_ad`
--
ALTER TABLE `menu_ad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `table_bookings`
--
ALTER TABLE `table_bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
