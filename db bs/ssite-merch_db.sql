-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2024 at 02:12 AM
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
-- Database: `ssite-merch_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `userinfo_id` bigint(11) UNSIGNED NOT NULL,
  `user_privilege` varchar(255) NOT NULL,
  `granting_date` datetime NOT NULL,
  `admin_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `userinfo_id`, `user_privilege`, `granting_date`, `admin_status`) VALUES
(1, 1, 'Authorized', '2024-12-09 02:09:08', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` bigint(20) NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `cart_status` varchar(50) NOT NULL,
  `userinfo_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `admin_creator` bigint(20) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `record_status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customertype`
--

CREATE TABLE `customertype` (
  `customertype_id` bigint(20) UNSIGNED NOT NULL,
  `customer_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customertype`
--

INSERT INTO `customertype` (`customertype_id`, `customer_type`) VALUES
(1, 'Student'),
(2, 'Non-Student');

-- --------------------------------------------------------

--
-- Table structure for table `customertype_verification`
--

CREATE TABLE `customertype_verification` (
  `custype_verif_id` int(11) NOT NULL,
  `type_verification_stat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customertype_verification`
--

INSERT INTO `customertype_verification` (`custype_verif_id`, `type_verification_stat`) VALUES
(1, 'Pending'),
(2, 'Verified'),
(3, 'Invalid');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_spec` text NOT NULL,
  `item_desc` varchar(255) NOT NULL,
  `item_type` varchar(50) NOT NULL,
  `item_img` longblob NOT NULL,
  `item_price` decimal(10,0) NOT NULL,
  `item_discprice` decimal(10,0) NOT NULL,
  `cat_id` int(11) UNSIGNED NOT NULL,
  `admin_creator` bigint(20) UNSIGNED NOT NULL,
  `date_created` date NOT NULL,
  `record_status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_id`, `item_name`, `item_spec`, `item_desc`, `item_type`, `item_img`, `item_price`, `item_discprice`, `cat_id`, `admin_creator`, `date_created`, `record_status`) VALUES
(1, 'T-Shirt', 'Small', 'White', 'Single', 0x315f313733333637323935372e706e67, 320, 300, 1, 2, '2024-12-07', 'Active'),
(2, 'Tote Bag', 'Brightening Future~', '-', 'Single', 0x325f313733333637323937322e706e67, 220, 200, 1, 2, '2024-12-07', 'Active'),
(3, 'Crinkles', '1pc', ' -', 'Bundle', 0x335f313733333637333136382e6a7067, 80, 75, 1, 2, '2024-12-07', 'Active'),
(4, 'Polo Shirt', 'Small', ' AA', 'Single', 0x345f313733333637333039372e706e67, 412, 312, 1, 4, '2024-12-07', 'Active'),
(5, 'T-Shirt', 'Small', 'Teal', 'Single', 0x355f313733333537363933342e6a7067, 566, 342, 1, 4, '2024-12-07', 'Removed'),
(6, 'Tote Bag', 'SSITE', '-', 'Single', 0x365f313733333537363937362e6a7067, 200, 232, 1, 4, '2024-12-07', 'Removed');

-- --------------------------------------------------------

--
-- Table structure for table `item_orders`
--

CREATE TABLE `item_orders` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `item_totalamount` decimal(10,0) NOT NULL,
  `quantity` int(11) NOT NULL,
  `item_id` bigint(11) UNSIGNED NOT NULL,
  `transaction_id` bigint(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mem_status`
--

CREATE TABLE `mem_status` (
  `memstatus_id` bigint(20) UNSIGNED NOT NULL,
  `memstatus` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mem_status`
--

INSERT INTO `mem_status` (`memstatus_id`, `memstatus`) VALUES
(1, 'Unidentified'),
(2, 'Active'),
(3, 'Inactive');

-- --------------------------------------------------------

--
-- Table structure for table `news_update`
--

CREATE TABLE `news_update` (
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `caption` text NOT NULL,
  `post_img` longblob NOT NULL,
  `post_url` text NOT NULL,
  `admin_id` bigint(11) UNSIGNED NOT NULL,
  `date_webposted` datetime NOT NULL,
  `record_status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news_update`
--

INSERT INTO `news_update` (`post_id`, `title`, `caption`, `post_img`, `post_url`, `admin_id`, `date_webposted`, `record_status`) VALUES
(1, 'SSITE Conversion Week 2024', ' 🎶“𝐺𝑢𝑠𝑡𝑜 𝑘𝑜𝑛𝑔 𝑖𝑏𝑖𝑔𝑎𝑦 𝑎𝑛𝑔 𝑐𝑜𝑑𝑒 𝑛𝑎 𝑔𝑢𝑠𝑡𝑜 𝑚𝑜”🎶\r\n\r\n\r\nDecember 06 is coming, Peninsulares! Are you ready for some fun at the Treyd Fest 2024?💥📢\r\n\r\nDon’t miss out on this chance to get a discount when you purchase your tickets—just use our promo code, 𝗦𝗦𝗜𝗧𝗘𝟮𝟬𝟮𝟰 ✨ Malay mo, may makasama ka pa sa 711 after the event. 👀\r\n\r\nGrab your tickets now, and let&#039;s make this event unforgettable!🎉\r\n\r\n:pushpin: For ticket-selling instructions, click this link: https://www.facebook.com/share/p/19bQLNzAwJ/ \r\n\r\n:pushpin: Visit the page below for further updates and information regarding Treyd Fest 2024\r\nCampus Student Government- BPSU Main Campus : \r\nhttps://www.facebook.com/bpsuCSGmain\r\n@everyone\r\n\r\n#TreydFest2024\r\n#SSITE2024', 0x315f313733333337323235322e6a7067, 'https://www.facebook.com/', 2, '2024-12-05 00:00:00', 'Active'),
(2, 'SSITE Conversion Week', 'TEST', 0x325f313733333538333239382e6a7067, 'ASDSAD.COM', 2, '2024-12-07 22:54:58', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` bigint(20) UNSIGNED NOT NULL,
  `totalamount` decimal(10,0) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `order_date` date NOT NULL,
  `transaction_status_id` bigint(50) UNSIGNED NOT NULL,
  `userinfo_id` bigint(11) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactionstatus`
--

CREATE TABLE `transactionstatus` (
  `transaction_status_id` bigint(11) UNSIGNED NOT NULL,
  `transaction_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactionstatus`
--

INSERT INTO `transactionstatus` (`transaction_status_id`, `transaction_status`) VALUES
(1, 'Pending'),
(2, 'Ongoing'),
(3, 'Completed'),
(4, 'Cancelled');

-- --------------------------------------------------------

--
-- Table structure for table `user_credentials`
--

CREATE TABLE `user_credentials` (
  `usercred_id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `userinfo_id` bigint(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_credentials`
--

INSERT INTO `user_credentials` (`usercred_id`, `email`, `password`, `userinfo_id`) VALUES
(1, 'e...d@gmail.com', '$2y$10$wQjgu.WvoM5ulRs1IVun8u9afeuvvRb/cPFvtnIxbWI.6UQgB6vdS', 1),
(2, 'kmp@gmail.com', '$2y$10$2vMBDyW5VvI15JOU7cjpFedRsHhyF6IRSb/ugnmvFcgUdSASz6jbm', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_information`
--

CREATE TABLE `user_information` (
  `userinfo_id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `sex` varchar(50) NOT NULL,
  `bday` date NOT NULL,
  `student_number` varchar(15) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `account_status` varchar(50) NOT NULL,
  `memstatus_id` bigint(11) UNSIGNED NOT NULL,
  `customertype_id` bigint(11) UNSIGNED NOT NULL,
  `custype_verif_id` int(11) NOT NULL,
  `account_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_information`
--

INSERT INTO `user_information` (`userinfo_id`, `firstname`, `lastname`, `sex`, `bday`, `student_number`, `contact_number`, `email`, `account_status`, `memstatus_id`, `customertype_id`, `custype_verif_id`, `account_created`) VALUES
(1, 'Eloisa Marie', 'Sumbad', 'Female', '2004-10-28', '-', '09913655545', 'e...d@gmail.com', 'Active', 1, 2, 1, '2024-12-09 09:08:22'),
(2, 'Krysta', 'Paule', 'Female', '2022-02-22', '22-01111', '09913655545', 'kmp@gmail.com', 'Active', 1, 1, 1, '2024-12-09 09:11:25');

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--

CREATE TABLE `user_login` (
  `userlogin_id` bigint(20) UNSIGNED NOT NULL,
  `usercred_id` bigint(11) UNSIGNED NOT NULL,
  `logindate` datetime NOT NULL,
  `usertype_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_login`
--

INSERT INTO `user_login` (`userlogin_id`, `usercred_id`, `logindate`, `usertype_id`) VALUES
(1, 1, '2024-12-09 09:09:58', 2),
(2, 2, '2024-12-09 09:11:35', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `usertype_id` int(20) UNSIGNED NOT NULL,
  `usertype` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`usertype_id`, `usertype`) VALUES
(1, 'Customer'),
(2, 'Administrator');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `admin_id` (`admin_id`),
  ADD KEY `fk_adminuid` (`userinfo_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `fk_cart_item` (`item_id`),
  ADD KEY `fk_cart_` (`userinfo_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`),
  ADD UNIQUE KEY `cat_id` (`cat_id`),
  ADD KEY `fk_adminid_cat` (`admin_creator`);

--
-- Indexes for table `customertype`
--
ALTER TABLE `customertype`
  ADD PRIMARY KEY (`customertype_id`),
  ADD UNIQUE KEY `customertype_id` (`customertype_id`);

--
-- Indexes for table `customertype_verification`
--
ALTER TABLE `customertype_verification`
  ADD PRIMARY KEY (`custype_verif_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`),
  ADD UNIQUE KEY `item_id` (`item_id`),
  ADD KEY `fk_catid` (`cat_id`),
  ADD KEY `fk_adminid_item` (`admin_creator`);

--
-- Indexes for table `item_orders`
--
ALTER TABLE `item_orders`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `order_id` (`order_id`),
  ADD KEY `fk_itemid` (`item_id`),
  ADD KEY `fk_tranid` (`transaction_id`);

--
-- Indexes for table `mem_status`
--
ALTER TABLE `mem_status`
  ADD PRIMARY KEY (`memstatus_id`),
  ADD UNIQUE KEY `memstatus_id` (`memstatus_id`);

--
-- Indexes for table `news_update`
--
ALTER TABLE `news_update`
  ADD PRIMARY KEY (`post_id`),
  ADD UNIQUE KEY `post_id` (`post_id`),
  ADD KEY `fk_adminid_post` (`admin_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD UNIQUE KEY `transaction_id` (`transaction_id`),
  ADD KEY `fk_trstatus` (`transaction_status_id`),
  ADD KEY `fk_tr_uid` (`userinfo_id`),
  ADD KEY `fk_tr_item` (`item_id`);

--
-- Indexes for table `transactionstatus`
--
ALTER TABLE `transactionstatus`
  ADD PRIMARY KEY (`transaction_status_id`);

--
-- Indexes for table `user_credentials`
--
ALTER TABLE `user_credentials`
  ADD PRIMARY KEY (`usercred_id`),
  ADD UNIQUE KEY `usercred_id` (`usercred_id`),
  ADD KEY `fk_userinfo` (`userinfo_id`);

--
-- Indexes for table `user_information`
--
ALTER TABLE `user_information`
  ADD PRIMARY KEY (`userinfo_id`),
  ADD UNIQUE KEY `userinfo_id` (`userinfo_id`),
  ADD KEY `fk_memstat` (`memstatus_id`),
  ADD KEY `dk_customertype` (`customertype_id`),
  ADD KEY `fk_custype_verif` (`custype_verif_id`);

--
-- Indexes for table `user_login`
--
ALTER TABLE `user_login`
  ADD PRIMARY KEY (`userlogin_id`),
  ADD UNIQUE KEY `userlogin_id` (`userlogin_id`),
  ADD KEY `fk_usercred` (`usercred_id`),
  ADD KEY `fk_login_usertype` (`usertype_id`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`usertype_id`),
  ADD UNIQUE KEY `usertype_id` (`usertype_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customertype`
--
ALTER TABLE `customertype`
  MODIFY `customertype_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `item_orders`
--
ALTER TABLE `item_orders`
  MODIFY `order_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mem_status`
--
ALTER TABLE `mem_status`
  MODIFY `memstatus_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `news_update`
--
ALTER TABLE `news_update`
  MODIFY `post_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_login`
--
ALTER TABLE `user_login`
  MODIFY `userlogin_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `fk_adminuid` FOREIGN KEY (`userinfo_id`) REFERENCES `user_information` (`userinfo_id`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_cart_` FOREIGN KEY (`userinfo_id`) REFERENCES `user_information` (`userinfo_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cart_item` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`) ON UPDATE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `fk_adminid_cat` FOREIGN KEY (`admin_creator`) REFERENCES `admin` (`admin_id`) ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `fk_adminid_item` FOREIGN KEY (`admin_creator`) REFERENCES `admin` (`admin_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_catid` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`cat_id`) ON UPDATE CASCADE;

--
-- Constraints for table `item_orders`
--
ALTER TABLE `item_orders`
  ADD CONSTRAINT `fk_itemid` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tranid` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`) ON UPDATE CASCADE;

--
-- Constraints for table `news_update`
--
ALTER TABLE `news_update`
  ADD CONSTRAINT `fk_adminid_post` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`) ON UPDATE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `fk_tr_item` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tr_uid` FOREIGN KEY (`userinfo_id`) REFERENCES `user_information` (`userinfo_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_trstatus` FOREIGN KEY (`transaction_status_id`) REFERENCES `transactionstatus` (`transaction_status_id`) ON UPDATE CASCADE;

--
-- Constraints for table `user_credentials`
--
ALTER TABLE `user_credentials`
  ADD CONSTRAINT `fk_userinfo` FOREIGN KEY (`userinfo_id`) REFERENCES `user_information` (`userinfo_id`) ON UPDATE CASCADE;

--
-- Constraints for table `user_information`
--
ALTER TABLE `user_information`
  ADD CONSTRAINT `dk_customertype` FOREIGN KEY (`customertype_id`) REFERENCES `customertype` (`customertype_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_custype_verif` FOREIGN KEY (`custype_verif_id`) REFERENCES `customertype_verification` (`custype_verif_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_memstat` FOREIGN KEY (`memstatus_id`) REFERENCES `mem_status` (`memstatus_id`) ON UPDATE CASCADE;

--
-- Constraints for table `user_login`
--
ALTER TABLE `user_login`
  ADD CONSTRAINT `fk_login_usertype` FOREIGN KEY (`usertype_id`) REFERENCES `user_type` (`usertype_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usercred` FOREIGN KEY (`usercred_id`) REFERENCES `user_credentials` (`usercred_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
