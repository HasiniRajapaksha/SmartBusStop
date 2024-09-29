-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 22, 2024 at 12:32 PM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bus_booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `available_dates`
--

DROP TABLE IF EXISTS `available_dates`;
CREATE TABLE IF NOT EXISTS `available_dates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bus_id` int DEFAULT NULL,
  `available` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bus_id` (`bus_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `available_dates`
--

INSERT INTO `available_dates` (`id`, `bus_id`, `available`) VALUES
(1, 1, '2024-08-16'),
(2, 1, '2024-08-17'),
(3, 1, '2024-08-22'),
(4, 1, '2024-08-23');

-- --------------------------------------------------------

--
-- Table structure for table `buses`
--

DROP TABLE IF EXISTS `buses`;
CREATE TABLE IF NOT EXISTS `buses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `route_id` int DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  `bus_type` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `number_of_seats` int DEFAULT NULL,
  `price` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buses`
--

INSERT INTO `buses` (`id`, `name`, `route_id`, `departure_time`, `arrival_time`, `bus_type`, `number_of_seats`, `price`) VALUES
(1, 'Colombo Express', 1, '06:00:00', '09:00:00', 'Sleeper', 36, 'LKR 1200'),
(2, 'Galle Comfort', 2, '07:30:00', '10:30:00', 'Seater', 48, 'LKR 1300'),
(3, 'Jaffna Journey', 3, '09:00:00', '07:00:00', 'Sleeper', 36, 'LKR 900');

-- --------------------------------------------------------

--
-- Table structure for table `bus_seats`
--

DROP TABLE IF EXISTS `bus_seats`;
CREATE TABLE IF NOT EXISTS `bus_seats` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `book_date` date DEFAULT NULL,
  `book_bus` int DEFAULT NULL,
  `book_seat` int DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `book_bus` (`book_bus`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bus_seats`
--

INSERT INTO `bus_seats` (`book_id`, `book_date`, `book_bus`, `book_seat`) VALUES
(3, '2024-08-22', 1, 1),
(4, '2024-08-22', 1, 2),
(5, '2024-08-22', 1, 36),
(6, '2024-08-22', 1, 36),
(7, '2024-08-22', 1, 22),
(8, '2024-08-22', 1, 28),
(9, '2024-08-22', 1, 34);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
CREATE TABLE IF NOT EXISTS `locations` (
  `loc_id` int NOT NULL AUTO_INCREMENT,
  `location` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`loc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`loc_id`, `location`) VALUES
(1, 'Colombo'),
(2, 'Kandy'),
(3, 'Galle'),
(4, 'Jaffna'),
(5, 'Trincomalee'),
(6, 'Matara'),
(7, 'Nuwara Eliya'),
(8, 'Kurunegala'),
(9, 'Badulla'),
(10, 'Anuradhapura'),
(11, 'Polonnaruwa'),
(12, 'Hambantota'),
(13, 'Kalutara');

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
CREATE TABLE IF NOT EXISTS `route` (
  `route_id` int NOT NULL AUTO_INCREMENT,
  `source` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `destination` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`route_id`, `source`, `destination`) VALUES
(1, 'Colombo', 'Kandy'),
(2, 'Colombo', 'Galle'),
(3, 'Colombo', 'Jaffna');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bus_seats`
--
ALTER TABLE `bus_seats`
  ADD CONSTRAINT `bus_seats_ibfk_1` FOREIGN KEY (`book_bus`) REFERENCES `buses` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

/*SELECT b.id, b.name, r.source, r.destination, b.departure_time, b.arrival_time, b.bus_type, b.number_of_seats, b.price
FROM buses b
JOIN route r ON b.route_id = r.route_id;


SELECT b.id, b.name, r.source, r.destination, b.departure_time, b.arrival_time, b.bus_type, b.number_of_seats, b.price
FROM buses b
JOIN route r ON b.route_id = r.route_id
WHERE b.id = ?*/
