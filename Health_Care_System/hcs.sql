

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE TABLE `doctors` (
  `did` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `doctorname` varchar(50) NOT NULL,
  `dept` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `doctors` (`did`, `email`, `doctorname`, `dept`) VALUES
(1, 'anees@gmail.com', 'anees', 'Cardiologists'),
(2, 'amina@gmail.com', 'amina', 'Dermatologists'),
(3, 'ayesha@gmail.com', 'ayesha', 'Anesthesiologists'),
(4, 'ali@gmail', 'ali', 'Endocrinologists'),
(5, 'umar@gmail.com', 'umar', 'corona');


CREATE TABLE `patients` (
  `pid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `slot` varchar(50) NOT NULL,
  `disease` varchar(50) NOT NULL,
  `time` time NOT NULL,
  `date` date NOT NULL,
  `dept` varchar(50) NOT NULL,
  `number` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `patients` (`pid`, `email`, `name`, `gender`, `slot`, `disease`, `time`, `date`, `dept`, `number`) VALUES
(2, 'omair@gmail.com', 'omair', 'Male1', 'evening', 'cold', '21:20:00', '2022-06-02', 'ortho11predict', '9874561110'),
(5, 'junaid@gmail.com', 'junaid', 'Male', 'morning', 'fever', '18:06:00', '2022-06-18', 'Cardiologists', '9874563210'),
(7, 'areeba@gmail.com', 'areeba', 'Male', 'evening', 'cold', '22:18:00', '2022-06-05', 'Dermatologists', '9874563210'),
(8, 'kashif@gmail.com', 'kashif', 'Male', 'evening', 'cold', '22:18:00', '2022-06-05', 'Dermatologists', '9874563210'),
(9, 'usman@gmail.com', 'usman', 'Male', 'morning', 'cold', '17:27:00', '2022-06-26', 'Anesthesiologists', '9874563210'),
(10, 'aziz@gmail.com', 'aziz', 'Male', 'evening', 'fever', '16:25:00', '2022-06-09', 'Cardiologists', '9874589654'),
(15, 'aliya@gmail.com', 'aliya', 'Female', 'morning', 'corona', '20:42:00', '2022-06-23', 'Anesthesiologists', '9874563210'),
(16, 'kiran@gmail.com', 'kiran', 'Female', 'evening', 'fever', '15:46:00', '2022-06-30', 'Endocrinologists', '9874587496'),
(17, 'aneeqa@gmail.com', 'aneeqa', 'Female', 'evening', 'fever', '15:48:00', '2022-06-23', 'Endocrinologists', '9874563210');


DELIMITER $$
CREATE TRIGGER `PatientDelete` BEFORE DELETE ON `patients` FOR EACH ROW INSERT INTO trigr VALUES(null,OLD.pid,OLD.email,OLD.name,'PATIENT DELETED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `PatientUpdate` AFTER UPDATE ON `patients` FOR EACH ROW INSERT INTO trigr VALUES(null,NEW.pid,NEW.email,NEW.name,'PATIENT UPDATED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `patientinsertion` AFTER INSERT ON `patients` FOR EACH ROW INSERT INTO trigr VALUES(null,NEW.pid,NEW.email,NEW.name,'PATIENT INSERTED',NOW())
$$
DELIMITER ;



CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `test` (`id`, `name`, `email`) VALUES
(1, 'ANEES', 'ARK@GMAIL.COM'),
(2, 'test', 'test@gmail.com');



CREATE TABLE `trigr` (
  `tid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `trigr` (`tid`, `pid`, `email`, `name`, `action`, `timestamp`) VALUES
(1, 12, 'anees@gmail.com', 'ANEES', 'PATIENT INSERTED', '2020-12-02 16:35:10'),
(2, 11, 'anees@gmail.com', 'anees', 'PATIENT INSERTED', '2020-12-02 16:37:34'),
(3, 10, 'anees@gmail.com', 'anees', 'PATIENT UPDATED', '2020-12-02 16:38:27'),
(4, 11, 'anees@gmail.com', 'anees', 'PATIENT UPDATED', '2020-12-02 16:38:33'),
(5, 12, 'anees@gmail.com', 'ANEES', 'Patient Deleted', '2020-12-02 16:40:40'),
(6, 11, 'anees@gmail.com', 'anees', 'PATIENT DELETED', '2020-12-02 16:41:10'),
(7, 13, 'testing@gmail.com', 'testing', 'PATIENT INSERTED', '2020-12-02 16:50:21'),
(8, 13, 'testing@gmail.com', 'testing', 'PATIENT UPDATED', '2020-12-02 16:50:32'),
(9, 13, 'testing@gmail.com', 'testing', 'PATIENT DELETED', '2020-12-02 16:50:57'),
(10, 14, 'aneeqa@gmail.com', 'aneeqa', 'PATIENT INSERTED', '2021-01-22 15:18:09'),
(11, 14, 'aneeqa@gmail.com', 'aneeqa', 'PATIENT UPDATED', '2021-01-22 15:18:29'),
(12, 14, 'aneeqa@gmail.com', 'aneeqa', 'PATIENT DELETED', '2021-01-22 15:41:48'),
(13, 15, 'kiran@gmail.com', 'kiran', 'PATIENT INSERTED', '2021-01-22 15:43:02'),
(14, 15, 'kiran@gmail.com', 'kiran', 'PATIENT UPDATED', '2021-01-22 15:43:11'),
(15, 16, 'kiran@gmail.com', 'kiran', 'PATIENT INSERTED', '2021-01-22 15:43:37'),
(16, 16, 'kiran@gmail.com', 'kiran', 'PATIENT UPDATED', '2021-01-22 15:43:49'),
(17, 17, 'aneeqa@gmail.com', 'aneeqa', 'PATIENT INSERTED', '2021-01-22 15:44:41'),
(18, 17, 'aneeqa@gmail.com', 'aneeqa', 'PATIENT UPDATED', '2021-01-22 15:44:52'),
(19, 17, 'aneeqa@gmail.com', 'aneeqa', 'PATIENT UPDATED', '2021-01-22 15:44:59');



CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `usertype` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `user` (`id`, `username`, `usertype`, `email`, `password`) VALUES
(13, 'anees', 'Doctor', 'anees@gmail.com', 'pbkdf2:sha256:150000$xAKZCiJG$4c7a7e704708f86659d730565ff92e8327b01be5c49a6b1ef8afdf1c531fa5c3'),
(14, 'aneeqa', 'Patient', 'aneeqa@gmail.com', 'pbkdf2:sha256:150000$Yf51ilDC$028cff81a536ed9d477f9e45efcd9e53a9717d0ab5171d75334c397716d581b8'),
(15, 'kiran', 'Patient', 'kiran@gmail.com', 'pbkdf2:sha256:150000$BeSHeRKV$a8b27379ce9b2499d4caef21d9d387260b3e4ba9f7311168b6e180a00db91f22');

ALTER TABLE `doctors`
  ADD PRIMARY KEY (`did`);


ALTER TABLE `patients`
  ADD PRIMARY KEY (`pid`);


ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `trigr`
  ADD PRIMARY KEY (`tid`);


ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);


ALTER TABLE `doctors`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;


ALTER TABLE `patients`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;


ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

ALTER TABLE `trigr`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;


ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
