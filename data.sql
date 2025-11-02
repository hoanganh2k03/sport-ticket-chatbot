-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.4.5 - MySQL Community Server - GPL
-- Server OS:                    Linux
-- HeidiSQL Version:             12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for sport_ticket_chatbot_db
CREATE DATABASE IF NOT EXISTS `sport_ticket_chatbot_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sport_ticket_chatbot_db`;

-- Dumping structure for table sport_ticket_chatbot_db.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sport_ticket_chatbot_db.auth_group: ~0 rows (approximately)

-- Dumping structure for table sport_ticket_chatbot_db.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sport_ticket_chatbot_db.auth_group_permissions: ~0 rows (approximately)

-- Dumping structure for table sport_ticket_chatbot_db.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sport_ticket_chatbot_db.auth_permission: ~108 rows (approximately)
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add customer', 7, 'add_customer'),
	(26, 'Can change customer', 7, 'change_customer'),
	(27, 'Can delete customer', 7, 'delete_customer'),
	(28, 'Can view customer', 7, 'view_customer'),
	(29, 'Can add customer account', 8, 'add_customeraccount'),
	(30, 'Can change customer account', 8, 'change_customeraccount'),
	(31, 'Can delete customer account', 8, 'delete_customeraccount'),
	(32, 'Can view customer account', 8, 'view_customeraccount'),
	(33, 'Can add employee', 9, 'add_employee'),
	(34, 'Can change employee', 9, 'change_employee'),
	(35, 'Can delete employee', 9, 'delete_employee'),
	(36, 'Can view employee', 9, 'view_employee'),
	(37, 'Can add employee account', 10, 'add_employeeaccount'),
	(38, 'Can change employee account', 10, 'change_employeeaccount'),
	(39, 'Can delete employee account', 10, 'delete_employeeaccount'),
	(40, 'Can view employee account', 10, 'view_employeeaccount'),
	(41, 'Can add league', 11, 'add_league'),
	(42, 'Can change league', 11, 'change_league'),
	(43, 'Can delete league', 11, 'delete_league'),
	(44, 'Can view league', 11, 'view_league'),
	(45, 'Can add match', 12, 'add_match'),
	(46, 'Can change match', 12, 'change_match'),
	(47, 'Can delete match', 12, 'delete_match'),
	(48, 'Can view match', 12, 'view_match'),
	(49, 'Can add match history', 13, 'add_matchhistory'),
	(50, 'Can change match history', 13, 'change_matchhistory'),
	(51, 'Can delete match history', 13, 'delete_matchhistory'),
	(52, 'Can view match history', 13, 'view_matchhistory'),
	(53, 'Can add order details', 14, 'add_orderdetails'),
	(54, 'Can change order details', 14, 'change_orderdetails'),
	(55, 'Can delete order details', 14, 'delete_orderdetails'),
	(56, 'Can view order details', 14, 'view_orderdetails'),
	(57, 'Can add orders', 15, 'add_orders'),
	(58, 'Can change orders', 15, 'change_orders'),
	(59, 'Can delete orders', 15, 'delete_orders'),
	(60, 'Can view orders', 15, 'view_orders'),
	(61, 'Can add payment', 16, 'add_payment'),
	(62, 'Can change payment', 16, 'change_payment'),
	(63, 'Can delete payment', 16, 'delete_payment'),
	(64, 'Can view payment', 16, 'view_payment'),
	(65, 'Can add price history', 17, 'add_pricehistory'),
	(66, 'Can change price history', 17, 'change_pricehistory'),
	(67, 'Can delete price history', 17, 'delete_pricehistory'),
	(68, 'Can view price history', 17, 'view_pricehistory'),
	(69, 'Can add promotion details', 18, 'add_promotiondetails'),
	(70, 'Can change promotion details', 18, 'change_promotiondetails'),
	(71, 'Can delete promotion details', 18, 'delete_promotiondetails'),
	(72, 'Can view promotion details', 18, 'view_promotiondetails'),
	(73, 'Can add promotions', 19, 'add_promotions'),
	(74, 'Can change promotions', 19, 'change_promotions'),
	(75, 'Can delete promotions', 19, 'delete_promotions'),
	(76, 'Can view promotions', 19, 'view_promotions'),
	(77, 'Can add seats', 20, 'add_seats'),
	(78, 'Can change seats', 20, 'change_seats'),
	(79, 'Can delete seats', 20, 'delete_seats'),
	(80, 'Can view seats', 20, 'view_seats'),
	(81, 'Can add section prices', 21, 'add_sectionprices'),
	(82, 'Can change section prices', 21, 'change_sectionprices'),
	(83, 'Can delete section prices', 21, 'delete_sectionprices'),
	(84, 'Can view section prices', 21, 'view_sectionprices'),
	(85, 'Can add sections', 22, 'add_sections'),
	(86, 'Can change sections', 22, 'change_sections'),
	(87, 'Can delete sections', 22, 'delete_sections'),
	(88, 'Can view sections', 22, 'view_sections'),
	(89, 'Can add sport type', 23, 'add_sporttype'),
	(90, 'Can change sport type', 23, 'change_sporttype'),
	(91, 'Can delete sport type', 23, 'delete_sporttype'),
	(92, 'Can view sport type', 23, 'view_sporttype'),
	(93, 'Can add stadium', 24, 'add_stadium'),
	(94, 'Can change stadium', 24, 'change_stadium'),
	(95, 'Can delete stadium', 24, 'delete_stadium'),
	(96, 'Can view stadium', 24, 'view_stadium'),
	(97, 'Can add team', 25, 'add_team'),
	(98, 'Can change team', 25, 'change_team'),
	(99, 'Can delete team', 25, 'delete_team'),
	(100, 'Can view team', 25, 'view_team'),
	(101, 'Can add ticket returns', 26, 'add_ticketreturns'),
	(102, 'Can change ticket returns', 26, 'change_ticketreturns'),
	(103, 'Can delete ticket returns', 26, 'delete_ticketreturns'),
	(104, 'Can view ticket returns', 26, 'view_ticketreturns'),
	(105, 'Can add chat history', 27, 'add_chathistory'),
	(106, 'Can change chat history', 27, 'change_chathistory'),
	(107, 'Can delete chat history', 27, 'delete_chathistory'),
	(108, 'Can view chat history', 27, 'view_chathistory');

-- Dumping structure for table sport_ticket_chatbot_db.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sport_ticket_chatbot_db.auth_user: ~0 rows (approximately)

-- Dumping structure for table sport_ticket_chatbot_db.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sport_ticket_chatbot_db.auth_user_groups: ~0 rows (approximately)

-- Dumping structure for table sport_ticket_chatbot_db.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sport_ticket_chatbot_db.auth_user_user_permissions: ~0 rows (approximately)

-- Dumping structure for table sport_ticket_chatbot_db.Chathistory
CREATE TABLE IF NOT EXISTS `Chathistory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `bot_response` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `session_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Chathistory_customer_id_60885cca_fk_Customer_customer_id` (`customer_id`),
  CONSTRAINT `Chathistory_customer_id_60885cca_fk_Customer_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sport_ticket_chatbot_db.Chathistory: ~52 rows (approximately)
INSERT INTO `Chathistory` (`id`, `user_message`, `bot_response`, `created_at`, `session_id`, `customer_id`) VALUES
	(1, 'Có vé VIP cho trận Việt Nam vs Thái Lan không?', 'Xin chào! Trận Việt Nam vs Thái Lan không có vé khu vực VIP. Tuy nhiên, bạn có thể chọn vé ở khu vực Khán đài A với giá 150,000đ hoặc Khán đài B với giá 100,000đ. Nếu bạn cần thêm thông tin hay giúp đỡ gì, hãy cho tôi biết nhé!', '2025-10-06 10:45:43.622422', 'session_001', 1),
	(2, 'Có vé VIP cho trận Việt Nam vs Thái Lan không?', 'Xin chào! Hiện tại, trận Việt Nam vs Thái Lan không có khu vực Khán đài VIP. Nhưng bạn có thể chọn vé ở khu vực Khán đài A (150,000đ) hoặc Khán đài B (100,000đ) nhé! Nếu bạn cần thêm thông tin hoặc giúp đỡ gì, hãy cho tôi biết!', '2025-10-06 10:47:35.914383', 'session_001', 1),
	(3, 'Có vé VIP cho trận Việt Nam vs Thái Lan không?', 'Xin chào bạn! Trận Việt Nam vs Thái Lan không có vé VIP, chỉ có các khu vực Khán đài A (150,000đ), Khán đài B (100,000đ) và Khán đài VIP có giá 300,000đ (còn 1800 chỗ). Nếu bạn quan tâm đến khu vực nào khác, hãy cho tôi biết nhé!', '2025-10-06 10:49:48.575099', 'session_001', 1),
	(4, 'Có vé ở khán đài VIP cho trận Việt Nam vs Thái Lan không?', 'Có, bạn ạ! Hiện tại, khu vực khán đài VIP cho trận Việt Nam vs Thái Lan vẫn còn 1,800 chỗ và giá vé là 300,000đ. Nếu bạn cần hỗ trợ đặt vé, hãy cho tôi biết nhé!', '2025-10-06 10:53:07.093650', 'session_001', 1),
	(5, 'Có vé VIP cho trận Việt Nam vs Thái Lan không?', 'Có, vé VIP cho trận Việt Nam vs Thái Lan có giá 300,000đ và còn 1800 chỗ.', '2025-10-06 10:59:21.773900', 'session_001', 1),
	(6, 'Có vé VIP trận Việt Nam vs Thái Lan không?', 'Chào bạn! Chúng tôi còn 1800 vé VIP cho trận Việt Nam vs Thái Lan. Giá vé VIP là 300,000 đồng. Bạn muốn mua vé không?', '2025-10-08 05:14:42.217237', 'sess_001', 1),
	(7, 'Có vé VIP trận Việt Nam vs Thái Lan không?', 'Vâng, có vé VIP trận Việt Nam vs Thái Lan! Chúng tôi còn 1800 chỗ tại khu vực Khán đài VIP với giá 300,000đ. Bạn có muốn đặt vé hay không?!', '2025-10-09 07:55:09.276246', 'sess_001', 1),
	(8, 'Có vé VIP trận Việt Nam vs Thái Lan không?', 'Xin chào! Chúng tôi có vé VIP cho trận đấu Việt Nam vs Thái Lan. Có 2 khu vực Khán đài VIP, mỗi khu vực có 1800 chỗ ngồi. Giá vé mỗi người là 300,000 đồng. Nếu bạn muốn đặt vé, hãy cho tôi biết số lượng vé bạn cần.', '2025-10-09 08:22:44.994839', 'sess_001', 1),
	(9, 'Trận đấu giữa man united với PSG có những vé khán đài nào?', 'Bạn đang tìm kiếm thông tin về các khán đài cho trận đấu giữa Manchester United và PSG!\n\nCăn cứ vào dữ liệu mà chúng tôi có, trận đấu giữa Manchester United và PSG có khu vực Khán đài Tây với 3.000 chỗ ngồi. Giá vé cho khu vực này là 1.200.000 đồng.\n\nBạn quan tâm đến khu vực này không? Hoặc bạn muốn biết thông tin về các khán đài khác không?', '2025-10-09 10:59:35.067808', 'sess_001', 1),
	(10, 'con bò có mấy chân', 'Con bò thường có 4 chân!\n\nNếu bạn muốn đặt vé để xem trận Argentina vs Brazil, tôi có thể giúp bạn! Bạn muốn biết thêm thông tin về vé hoặc đặt vé ngay bây giờ?', '2025-10-09 12:35:26.550013', 'sess_001', 1),
	(11, 'con cá có mấy chân', 'Tôi nghĩ có vẻ như bạn đang hỏi về thông tin liên quan đến trận bóng đá giữa Argentina và Brazil, phải không?\n\nTôi không tìm thấy thông tin liên quan đến "con cá có mấy chân". Nếu bạn muốn biết thông tin về các trận đấu, tôi có thể giúp bạn kiểm tra lại:\n\n- Có 3 trận Argentina vs Brazil với giá vé 700.000đ mỗi trận và còn 29.500 chỗ ở khu vực Khán đài A.\nHãy cho tôi biết xem bạn có cần giúp đỡ gì khác không?', '2025-10-09 12:35:53.965764', 'sess_001', 1),
	(12, 'Có vé VIP trận Việt Nam vs Thái Lan không?', 'Tôi có thể trả lời một cách chắc chắn hơn cho câu hỏi này!\n\nCó, có vé VIP cho trận Việt Nam vs Thái Lan!\n\nChúng tôi có 3 khu vực Khán đài VIP cho trận đấu này, mỗi khu vực đều có 1800 chỗ ngồi. Giá vé cho mỗi khu vực là 300,000 đồng.\n\nHãy cho tôi biết nếu bạn muốn đặt vé!', '2025-10-10 16:37:31.533713', 'sess_001', 1),
	(13, 'tôi tưởng có 3 khu vực trong đó co 1 khán đài vip chứ?', 'Tôi cảm thấy xấu hổ vì tôi đã không kiểm tra dữ liệu đúng.\n\nCăn cứ vào dữ liệu bạn cung cấp, có vẻ như không chỉ có khu vực Khán đài Tây cho trận đấu Manchester United vs PSG. Tuy nhiên, tôi không tìm thấy thông tin về khu vực Khán đài VIP.\n\nCó một thông tin khác cho thấy trận đấu này có 3 khu vực có thể liên quan đến khán đài VIP như sau:\n\nKhu vực Khán đài Tây (2.300 chỗ ngồi) - giá 9,000.000 vnđ và còn 2 chỗ\nKhán đài VIP (1.800 chỗ ngồi) - giá 12.000.000 vnđ và còn 2 chỗ\nKhán đài VIP (1.800 chỗ ngồi) - giá 12.000.000 vnđ và còn 1 chỗ\n\nVậy, có vẻ như trận đấu này có hai khu vực khán đài VIP và khu vực Khán đài Tây. Cảm ơn bạn đã giúp tôi kiểm tra lại dữ liệu!', '2025-10-10 16:39:36.563926', 'sess_001', 1),
	(14, 'Có vé VIP trận Việt Nam vs Thái Lan không?', 'Tôi hiểu rõ hơn bây giờ!\n\nTôi thấy rằng có ba khu vực Khán đài VIP cho trận đấu Việt Nam vs Thái Lan, mỗi khu vực đều có giá 300,000 đồng và còn 1.800 chỗ ngồi. Điều này có nghĩa là có 3 khu vực Khán đài VIP, mỗi khu vực đều có nhiều chỗ.\n\nVậy, có vé VIP cho trận Việt Nam vs Thái Lan.\n\nBạn muốn biết thêm thông tin hoặc đặt vé?', '2025-10-10 16:45:44.136361', 'sess_001', 1),
	(15, 'trận Việt Nam vs Thái Lan 19:00 20/10/2025 có các ghế như thế nào?', 'Căn cứ vào dữ liệu, trận đấu Việt Nam vs Thái Lan diễn ra vào lúc 19:00 vào ngày 20/10/2025.\n\nTôi thấy rằng có 3 mục liên quan đến khu vực Khán đài A, nhưng có vẻ như đây không phải là khu vực Khán đài VIP mà là khu vực Khán đài A.\n\nDựa trên dữ liệu, trận đấu Việt Nam vs Thái Lan vào lúc 19:00 vào ngày 20/10/2025 có khu vực Khán đài A, giá vé là 150,000 đồng và còn vé. không có thông tin về khu vực Khán đài VIP.\n\nVậy, trận đấu Việt Nam vs Thái Lan 19:00 20/10/2025 có khu vực Khán đài A với giá vé 150,000 đồng.', '2025-10-10 16:50:13.052507', 'sess_001', 1),
	(16, 'tôi có in 3 dòng là khán đài A khán đài B và khán đài VIP mà', 'Tôi hiểu rồi!\n\nDựa trên dữ liệu, tôi thấy rằng trận đấu Việt Nam vs Thái Lan 19:00 20/10/2025 có thể có:\n\n- Khán đài A (còn vé)\n- Khán đài B (còn vé)\n- Khán đài VIP (còn vé)\n\nCảm ơn bạn đã cung cấp dữ liệu liên quan! Tôi sẽ cố gắng cập nhật thông tin chính xác để phục vụ bạn tốt hơn.\n\nGiá vé cho khu vực Khán đài A và B là chưa rõ, nhưng có vẻ như có vẻ khu vực Khán đài VIP có thể có sẵn.', '2025-10-10 16:52:05.167767', 'sess_001', 1),
	(17, 'bây giờ cho tôi biết giá từng hạng vé được không', 'Tôi hiểu rõ hơn bây giờ!\n\nTừ dữ liệu bạn cung cấp, tôi thấy rằng có 3 khu vực Khán đài Tây cho trận đấu Manchester United vs PSG, mỗi khu vực đều có giá vé 1.200.000 đồng và còn 3000 chỗ ngồi.\n\nTuy nhiên, dữ liệu này không cho thấy sự khác biệt giữa các khu vực. Điều này có nghĩa là giá vé 1.200.000 đồng là giá vé chung cho tất cả các khu vực Khán đài Tây.\n\nVậy, giá từng hạng vé cho trận đấu Manchester United vs PSG như sau:\n- Vé Khán đài Tây: 1.200.000 đồng', '2025-10-10 16:52:44.640637', 'sess_001', 1),
	(18, 'còn 2 khán đài kia đâu', 'Tôi tìm kiếm thông tin liên quan đến trận đấu Việt Nam vs Thái Lan và thấy rằng có 3 mục liên quan đến khu vực Khán đài, nhưng không có thông tin về các khu vực khác.\n\nTuy nhiên, căn cứ vào dữ liệu mà bạn cung cấp, có vẻ như đây là một ví dụ về cách mà dữ liệu có thể được đưa ra. Trong trường hợp này, có vẻ như dữ liệu chỉ cung cấp thông tin về khu vực Khán đài Nam 3 lần lặp lại, nhưng không có thông tin về các khu vực khác.\n\nTôi đề xuất tìm kiếm thông tin liên quan đến trận đấu Việt Nam vs Thái Lan từ các nguồn khác để có thông tin chính xác hơn.\n\nNếu bạn có thông tin liên quan khác, vui lòng cho tôi biết.', '2025-10-10 16:53:47.969490', 'sess_001', 1),
	(19, 'trận Real Madrid vs Liverpool có các khán đài nào đang bán', 'Tôi có thể trả lời dựa trên dữ liệu bạn cung cấp!\n\nNhìn vào dữ liệu, tôi thấy rằng có 3 mục liên quan đến trận đấu Real Madrid vs Liverpool, tất cả đều là khu vực Khán đài Nam, với giá vé 800,000 đồng và còn 2500 chỗ.\n\nVậy, trận đấu Real Madrid vs Liverpool có khu vực Khán đài Nam đang bán với giá 800,000 đồng, và còn 7500 chỗ (tổng cộng 3 x 2500).\n\nNếu bạn muốn biết thông tin thêm hoặc đặt vé, hãy cho tôi biết!', '2025-10-10 16:57:07.443278', 'sess_001', 1),
	(20, 'trận Real Madrid vs Liverpool có các khán đài nào đang bán', 'Căn cứ vào dữ liệu, trận đấu Real Madrid vs Liverpool có 3 mục liên quan đến khu vực Khán đài Nam, mỗi mục đều có giá vé 800,000đ và còn 2500 chỗ.\n\nVậy, trận đấu Real Madrid vs Liverpool có khu vực Khán đài Nam đang bán, với giá vé 800,000đ và còn 7500 chỗ (3 mục x 2500 chỗ).\n\nNếu bạn muốn đặt vé, hãy cho tôi biết!', '2025-10-10 16:57:12.014657', 'sess_001', 1),
	(21, 'sao t đọc ra khán đài nam, khán đài bắc và khán đài vip', 'Tôi hiểu vấn đề bây giờ!\n\nTôi thấy rằng có 3 mục liên quan đến trận đấu Manchester United vs PSG, nhưng lại chỉ có thông tin về khu vực Khán đài Tây và giá vé 1.200.000 đồng. Không có thông tin về các khu vực khác như Nam, Bắc hoặc VIP.\n\nTuy nhiên, bạn đã đọc được thông tin về những khu vực này từ dữ liệu đó và tôi phải thừa nhận rằng đó là một cách đọc thông tin thông minh!\n\nTôi không có thông tin về các khu vực Khán đài Nam, Bắc hoặc VIP cho trận đấu này. Nhưng tôi hy vọng thông tin này sẽ giúp bạn hiểu rõ hơn về vấn đề này!\n\nVề trận đấu Việt Nam vs Thái Lan, tôi vẫn không có thông tin về các khu vực Khán đài Nam, Bắc hoặc VIP. Tôi chỉ có thông tin về khu vực Khán đài A với giá vé 150.000 đồng và còn vé.', '2025-10-10 16:59:50.713959', 'sess_001', 1),
	(22, 'tôi đang nói trận Real Madrid vs Liverpool mà', 'Tôi hiểu rõ hơn bây giờ!\n\nVới dữ liệu liên quan, có vẻ như trận đấu giữa Real Madrid và Liverpool có khu vực Khán đài Nam, giá vé là 800,000 đồng và còn 7.500 chỗ (3 mục * 2.500 chỗ).\n\nVậy, trận đấu Real Madrid vs Liverpool có khu vực Khán đài Nam với giá vé 800,000 đồng. Tôi xin lỗi vì trước đó tôi đã không có thông tin chính xác về trận đấu này.', '2025-10-10 17:00:47.031052', 'sess_001', 1),
	(23, 'Trận Real Madrid và Liverpool bán vé ở mấy khán đài vậy', 'Căn cứ vào dữ liệu, tôi thấy rằng trận đấu Real Madrid vs Liverpool có 3 lần được bán vé ở khu vực Khán đài Nam.\n\nĐiều này có nghĩa là trận đấu này chỉ có một khu vực Khán đài Nam, và giá vé cho khu vực này là 800,000 đồng, còn 7500 chỗ.\n\nVậy, trận đấu Real Madrid và Liverpool bán vé ở khán đài là:\n\n* Khán đài Nam: 800,000 đồng, còn 7500 chỗ.', '2025-10-10 17:13:00.434874', 'sess_001', 1),
	(24, 'sao tôi đọc ra 2500 chỗ ở khán đài nam', 'Tôi đã bị nhầm lẫn!\n\nDựa trên dữ liệu mà bạn cung cấp, tôi thấy rằng có ba lần lặp lại của thông tin về trận đấu Real Madrid vs Liverpool, với cùng một giá vé và số chỗ còn lại: 800,000đ và 2500 chỗ.\n\nDo đó, khi bạn đọc ra thông tin này, tôi nên xác nhận rằng thông tin này thực sự là của trận đấu Real Madrid vs Liverpool, chứ không phải là giả.\n\nVậy, trận đấu giữa Real Madrid vs Liverpool có khu vực Khán đài Nam với giá 800,000đ và còn 2500 chỗ.\n\nCảm ơn bạn đã giúp tôi kiểm tra lại dữ liệu!', '2025-10-10 17:13:59.666150', 'sess_001', 1),
	(25, 'còn 2 khán đài còn lại kia giá thế nào', 'Tôi thấy rằng dữ liệu liên quan đến trận đấu Real Madrid vs Liverpool có ba mục giống nhau.\n\nCăn cứ vào dữ liệu, tôi thấy rằng có 3 mục liên quan đến khu vực Khán đài Nam, mỗi mục đều có giá 800,000 đồng và còn 2500 chỗ ngồi.\n\nVậy, dữ liệu liên quan đến trận đấu Real Madrid vs Liverpool chỉ có khu vực Khán đài Nam. Để biết thông tin về các khu vực Khán đài còn lại, chúng ta cần phải xem thông tin khác.\n\nTôi kiểm tra lại dữ liệu và thấy rằng trận đấu này có 3 khu vực Khán đài, trong đó 2 khu vực còn lại là:\n\n* Khu vực Khán đài Tây, giá 1,2 triệu đồng, còn 2500 chỗ\n* Khu vực Khán đài VIP, giá 4 triệu đồng, còn 1000 chỗ\n\nVậy, các khu vực Khán đài của trận đấu Real Madrid vs Liverpool là:\n\n* Khu vực Khán đài Nam, giá 800.000đ, còn 2500 chỗ\n* Khu vực Khán đài Tây, giá 1.200.000 vnđ, còn 2500 chỗ\n* Khu vực Khán đài', '2025-10-10 17:14:40.485068', 'sess_001', 1),
	(26, 'bạn nên nhớ là mỗi đòng là một khán đài tương ứng với trận đó mà', 'Tôi xin lỗi vì sự nhầm lẫn trước đó. Căn cứ vào dữ liệu mà bạn cung cấp, tôi thấy rằng trận đấu Argentina vs Brazil có 3 khán đài có tên tương tự nhau là Khán đài B, với giá vé lần lượt là 500,000 đồng và còn 9800 chỗ.\n\nGiống như trường hợp trước đó, có vẻ như dữ liệu mà tôi có không đầy đủ hoặc không đúng. Vì vậy, tôi không có thông tin chính xác về trận đấu Việt Nam vs Thái Lan.\n\nĐể giúp tôi kiểm tra lại dữ liệu, bạn có thể cho tôi biết thêm thông tin về trận đấu Việt Nam vs Thái Lan, chẳng hạn như:\n\n- Có 3 khán đài với tên khác nhau cho trận đấu này không?\n- Có thông tin về giá vé và số lượng chỗ ngồi cho từng khán đài?\n\nTôi sẽ cố gắng trả lời dựa trên thông tin mà bạn cung cấp.', '2025-10-10 17:17:06.710429', 'sess_001', 1),
	(27, 'tôi đã hỏi bạn mấy câu từ trước giờ rồi', 'Tôi xin lỗi vì trước giờ tôi đã không kiểm tra dữ liệu đúng.\n\nCăn cứ vào dữ liệu mà bạn cung cấp, tôi thấy rằng có 3 trận đấu Argentina vs Brazil, mỗi trận đấu đều có khu vực Khán đài A với giá 700,000 đồng và còn 9500 chỗ ngồi.\n\nVậy, nếu có một dữ liệu khác liên quan đến "Trận Việt Nam vs Thái Lan 19:00 20/10/2025 có các ghế như thế nào?", tôi sẽ kiểm tra dữ liệu đó và trả lời cho bạn biết.\n\nNếu bạn nhớ, bạn hỏi tôi trước đó có vé VIP trận Việt Nam vs Thái Lan không, có vé VIP trận Việt Nam vs Thái Lan không, có vé VIP trận Việt Nam vs Thái Lan không, trận đấu giữa Man United với PSG có những vé khán đài nào, con bò có mấy chân, con cá có mấy chân và lại hỏi lại về vé VIP trận Việt Nam vs Thái Lan.', '2025-10-10 17:21:21.635950', 'sess_001', 1),
	(28, 'Có vé khán đài A trận Việt Nam vs Thái Lan không?', 'Tôi xin lỗi vì đã không hiểu dữ liệu đúng trước đó!\n\nVới thông tin dữ liệu mới, có vẻ như có 3 khu vực Khán đài VIP cho trận đấu Việt Nam vs Thái Lan, mỗi khu vực đều có giá 300,000 đồng và còn 1800 chỗ.\n\nVậy, tôi không tìm thấy thông tin về khu vực Khán đài A cho trận đấu Việt Nam vs Thái Lan.\n\nCảm ơn bạn đã cung cấp dữ liệu mới!', '2025-10-10 17:24:07.648018', 'sess_001', 1),
	(29, 'Có vé khán đài A trận Việt Nam vs Thái Lan không?', 'Tôi xin lỗi vì trước đó tôi đã nghĩ rằng không có thông tin về khu vực Khán đài A. Tuy nhiên, sau khi kiểm tra lại dữ liệu, tôi thấy rằng có thông tin liên quan đến khu vực Khán đài A.\n\nCăn cứ vào dữ liệu, trận đấu Việt Nam vs Thái Lan có 3 khu vực Khán đài VIP (mỗi khu vực 1.800 chỗ ngồi với giá 300.000 đồng) và 1 khu vực Khán đài A (giá vé 150.000 đồng và còn vé).\n\nVậy, Có vé Khán đài A trận Việt Nam vs Thái Lan!\n\nBạn muốn biết thêm thông tin hoặc đặt vé?', '2025-10-10 17:27:46.178893', 'sess_001', 1),
	(30, 'Có vé VIP trận Việt Nam vs Thái Lan không?', 'Tôi hiểu rõ dữ liệu bây giờ!\n\nTôi thấy rằng có 3 khu vực Khán đài VIP cho trận đấu Việt Nam vs Thái Lan, mỗi khu vực đều có giá vé 300,000 đồng và còn 1800 chỗ ngồi.\n\nVậy, có vé VIP cho trận Việt Nam vs Thái Lan.\n\nBạn muốn biết thêm thông tin hoặc đặt vé?', '2025-10-11 03:21:08.435561', 'sess_001', 1),
	(31, 'Có vé VIP trận Việt Nam vs Thái Lan không?', 'Tôi thấy rõ ràng rồi!\n\nCăn cứ vào dữ liệu, có ba câu liên quan đến khu vực Khán đài VIP cho trận đấu Việt Nam vs Thái Lan. Mỗi câu đều cho biết rằng khu vực Khán đài VIP có giá 300,000 đồng và còn 1800 chỗ.\n\nVậy, có vé VIP cho trận Việt Nam vs Thái Lan.\n\nTôi sẽ cung cấp thông tin đầy đủ cho bạn:\n\nCó 3 khu vực Khán đài VIP cho trận đấu Việt Nam vs Thái Lan, mỗi khu vực đều có giá 300,000 đồng và còn 1800 chỗ. Bạn muốn đặt vé hoặc biết thêm thông tin?', '2025-10-11 03:27:13.221386', 'sess_001', 1),
	(32, 'Có vé VIP trận Việt Nam vs Thái Lan không?', 'Tôi xin lỗi vì tôi đã không hiểu rõ dữ liệu trước đó!\n\nCăn cứ vào dữ liệu mới, trận đấu Việt Nam vs Thái Lan vào lúc 19:00 vào ngày 20/10/2025 có 3 khu vực:\n\n- Khu vực Khán đài B: giá 100,000đ, còn vé, còn 9800 chỗ\n- Khu vực Khán đài A: giá 150,000đ, còn vé, còn 9500 chỗ\n- Khu vực Khán đài VIP: giá 300,000đ, còn vé, còn 1800 chỗ\n\nVậy, có vé VIP cho trận Việt Nam vs Thái Lan vào lúc 19:00 vào ngày 20/10/2025.', '2025-10-11 06:08:08.501764', 'sess_001', 1),
	(33, 'Có vé VIP trận Việt Nam vs Thái Lan không?', 'Tôi xin lỗi vì sự nhầm lẫn trước đó.\n\nVới dữ liệu mới, tôi thấy rằng có 3 khu vực được liệt kê:\n\n* Khu vực Khán đài VIP: có 1800 chỗ, giá 300,000 đồng, còn vé\n* Khu vực Khán đài VIP: có 1800 chỗ, giá 300,000 đồng, còn vé\n* Khu vực Khán đài A: có 9500 chỗ, giá 150,000 đồng, còn vé\n\nVậy, có vé VIP cho trận Việt Nam vs Thái Lan vào lúc 19:00 vào ngày 20/10/2025.\n\nBạn muốn biết thêm thông tin hoặc đặt vé?', '2025-10-11 06:17:34.971918', 'sess_001', 1),
	(34, 'Có vé VIP trận Việt Nam vs Thái Lan không?', 'Có vé VIP cho trận Việt Nam vs Thái Lan! Hiện đang còn 1800 chỗ cho khu vực Khán đài VIP, giá vé là 300,000 đồng một vé. Bạn muốn mua vé cho mình không?', '2025-10-11 07:14:24.140010', 'frontend-test', 1),
	(35, 'còn loại vé khác không', 'Có vé VIP cho trận Việt Nam vs Thái Lan, đó là loại vé tại Khán đài B, giá vé là 100,000 đồng một vé. Hơn nữa, vẫn còn nhiều vị trí trống, lên tới 9800 chỗ ngồi. Nếu bạn muốn mua vé cho mình và gia đình, bạn có cần thêm thông tin nào không hoặc muốn đặt vé không?', '2025-10-11 07:14:38.341387', 'frontend-test', 1),
	(36, 'có vé khán đài A k', 'Dường như có vấn đề với dữ liệu. Nhưng từ dữ liệu bạn cung cấp, dường như chỉ có vé cho khu vực Khán đài B, giá 100,000 đồng mỗi vé và còn 9800 chỗ. Không có bất kỳ dòng dữ liệu nào liên quan đến khu vực Khán đài A.\n\nTuy nhiên, nếu bạn muốn đặt vé cho khu vực Khán đài B, tôi sẵn sàng giúp đỡ. Bạn có muốn đặt vé không?', '2025-10-11 07:16:50.339612', 'frontend-test', 1),
	(37, 'Có tất cả bao nhiêu khán đài trận Việt Nam vs Thái Lan ?', 'Dữ liệu cung cấp cho tôi đã giúp tôi hiểu rõ hơn về tình hình trận đấu.\n\nTheo dữ liệu, chúng ta có:\n\n- Giải Giao hữu quốc tế (Bóng đá), Trận Việt Nam vs Thái Lan, Thời gian diễn ra 19:00 20/10/2025, Khu vực Khán đài B, giá 100,000đ, còn vé, còn 9800 chỗ (đề cập 3 lần nhưng vẫn chỉ có 1 loại vé).\n\nVì dữ liệu này giống hệt và chỉ có một loại vé cho khu vực Khán đài B nên có thể chỉ có một khu vực là Khán đài B cho trận Việt Nam vs Thái Lan.\n\nVậy hiện tại, có 1 khu vực là Khán đài B và đã cung cấp vé với giá 100,000 đồng.', '2025-10-11 07:20:30.682576', 'frontend-test', 1),
	(38, 'Có tất cả bao nhiêu khán đài trận Việt Nam vs Thái Lan ?', 'Tôi xin lỗi vì nhận thức trước đó không chính xác.\n\nDựa trên dữ liệu mà bạn cung cấp, chúng ta có ba dòng dữ liệu liên quan đến trận đấu Việt Nam vs Thái Lan, tuy nhiên tất cả đều cho khu vực Khán đài B.\n\nTheo dữ liệu này, có vẻ như chỉ có Khán đài B cho trận đấu, vì không có bất kỳ dữ liệu nào liên quan đến khu vực Khán đài khác.\n\nVậy, có 1 khu vực cho trận Việt Nam vs Thái Lan là Khán đài B, với tổng 3 dữ liệu liên quan.', '2025-10-11 07:31:52.233396', 'frontend-test', 1),
	(39, 'Có tất cả bao nhiêu khán đài trận Việt Nam vs Thái Lan ?', 'Tôi xin lỗi vì nhận thức trước đó không chính xác.\n\nDựa trên dữ liệu mà bạn cung cấp, mặc dù có một số dữ liệu lặp lại về Khu vực Khán đài B, nhưng thực tế, chỉ có một loại vé và một khu vực để bán vé đó là Khán đài B.\n\nDo đó, mặc dù có 3 dòng dữ liệu, nhưng chỉ có một khu vực là Khán đài B cho trận đấu Việt Nam vs Thái Lan.\n\nVậy, có 1 khu vực cho trận Việt Nam vs Thái Lan là Khán đài B.', '2025-10-11 07:33:15.892002', 'frontend-test', 1),
	(40, 'Có tất cả bao nhiêu khán đài trận Việt Nam vs Thái Lan ?', 'Tôi xin lỗi vì nhận thức trước đó không chính xác.\n\nVới dữ liệu mới cung cấp, tôi có thể trả lời chính xác hơn:\n\nCó 3 khu vực cho trận Việt Nam vs Thái Lan:\n\n1. Khu vực Khán đài A\n2. Khu vực Khán đài B\n3. Khu vực Khán đài VIP\n\nVậy, có 3 khu vực cho trận đấu này.', '2025-10-11 07:35:54.507593', 'frontend-test', 1),
	(41, 'Có tất cả bao nhiêu khán đài trận Việt Nam vs Thái Lan ?', 'Vậy, cuối cùng tôi đã có dữ liệu chính xác!\n\nCó 2 khu vực cho trận Việt Nam vs Thái Lan:\n\n1. Khu vực Khán đài A\n2. Khu vực Khán đài B\n\nCăn cứ vào dữ liệu, tôi thấy rằng có 2 loại vé cho trận đấu Việt Nam vs Thái Lan, với giá vé và số lượng chỗ ngồi còn có sẵn khác nhau.\n\nVậy, có 2 khu vực cho trận đấu này.', '2025-10-11 07:39:16.192678', 'frontend-test', 1),
	(42, 'Có tất cả bao nhiêu khán đài trận Việt Nam vs Thái Lan ?', 'Tôi hiểu rõ ràng hơn về dữ liệu maintenant!\n\nMặc dù có 3 dòng dữ liệu liên quan đến trận đấu Việt Nam vs Thái Lan, nhưng tất cả đều cho khu vực Khán đài B. Điều này có nghĩa là không có dữ liệu nào liên quan đến các khu vực khác.\n\nVậy, có 1 khu vực cho trận đấu Việt Nam vs Thái Lan, đó là Khu vực Khán đài B.', '2025-10-11 07:43:36.680661', 'frontend-test', 1),
	(43, 'Có tất cả bao nhiêu khán đài trận Việt Nam vs Thái Lan ?', 'Tôi hiểu rõ ràng hơn về dữ liệu nay.\n\nMặc dù có 3 dòng dữ liệu liên quan đến trận đấu Việt Nam vs Thái Lan, nhưng tất cả đều cho khu vực Khán đài B. Điều này có nghĩa là không có dữ liệu nào liên quan đến các khu vực khác.\n\nVậy, có 1 khu vực cho trận đấu Việt Nam vs Thái Lan, đó là Khu vực Khán đài B.\n\nCòn lại, câu hỏi đầu tiên đã được trả lời: Có 1 loại vé cho trận đấu này, ở khu vực Khán đài B với giá 100,000 đồng và còn 9800 chỗ.', '2025-10-11 07:50:41.899499', 'frontend-test', 1),
	(44, 'Có tất cả bao nhiêu khán đài trận Việt Nam vs Thái Lan ?', 'Với dữ liệu này, tôi hiểu rõ ràng hơn.\n\nDữ liệu có lặp lại 3 lần, nhưng đều cho khu vực Khán đài B. Điều này có nghĩa là không có dữ liệu nào liên quan đến các khu vực khác.\n\nVậy, có 1 khán đài cho trận Việt Nam vs Thái Lan, đó là Khu vực Khán đài B.\n\nCũng có 1 loại vé cho trận đấu này, ở khu vực Khán đài B với giá 100,000 đồng và còn 9800 chỗ.', '2025-10-11 07:52:40.025866', 'frontend-test', 1),
	(45, 'Có tất cả bao nhiêu khán đài trận Việt Nam vs Thái Lan ?', 'Tôi hiểu rõ ràng về dữ liệu nay.\n\nMặc dù có 3 dòng dữ liệu liên quan đến trận đấu Việt Nam vs Thái Lan, nhưng tất cả đều cho khu vực Khán đài B. Điều này có nghĩa là không có dữ liệu nào liên quan đến các khu vực khác.\n\nVậy, có 1 khu vực cho trận đấu Việt Nam vs Thái Lan, đó là Khu vực Khán đài B.\n\nVà để trả lời câu hỏi đầu tiên của bạn, có 1 loại vé cho trận đấu này, ở khu vực Khán đài B với giá 100,000 đồng và còn 9800 chỗ.\n\nNếu muốn đặt vé, tôi sẵn sàng giúp đỡ!', '2025-10-11 07:56:29.967355', 'frontend-test', 1),
	(46, 'Có tất cả bao nhiêu khán đài trận Việt Nam vs Thái Lan ?', 'Tôi hiểu rõ ràng hơn về dữ liệu nay!\n\nMặc dù có 3 dòng dữ liệu liên quan đến trận đấu Việt Nam vs Thái Lan, tất cả đều cùng thông tin không khác biệt. Điều này có nghĩa là chỉ có một loại vé và một khu vực cho trận đấu.\n\nVậy, có 1 khu vực cho trận đấu Việt Nam vs Thái Lan, đó là Khu vực Khán đài B.\n\nBất kể số lượng dữ liệu, câu trả lời vẫn là 1 khu vực cho trận đấu này.', '2025-10-11 08:01:57.893862', 'frontend-test', 1),
	(47, 'Có tất cả bao nhiêu khán đài trận Việt Nam vs Thái Lan ?', 'Tôi xin lỗi vì nhận thức trước đó không chính xác.\n\nDựa trên dữ liệu mà bạn cung cấp, tôi thấy rằng có 3 khu vực cho trận đấu Việt Nam vs Thái Lan:\n\n1. Khu vực Khán đài A\n2. Khu vực Khán đài B\n3. Khu vực Khán đài VIP\n\nMỗi khu vực có giá vé và số lượng chỗ ngồi còn có sẵn khác nhau.\n\nVậy, có 3 khu vực cho trận đấu này. Cảm ơn bạn đã cung cấp dữ liệu chính xác!', '2025-10-11 08:12:13.427859', 'frontend-test', 1),
	(48, 'khán đài B còn không', 'Dữ liệu mới đã giúp tôi hiểu rõ hơn về tình hình trận đấu.\n\nVậy, có 3 khu vực cho các trận đấu khác nhau:\n\n* Trận Việt Nam vs Thái Lan: Khu vực Khán đài B, giá 100,000 đồng, còn 9800 chỗ\n* Trận Real Madrid vs Liverpool: Khu vực Khán đài Nam, giá 800,000 đồng, còn 2500 chỗ\n* Trận Argentina vs Brazil: Không có thông tin về tình trạng vé cho khu vực này.\n\nVậy, có 2 khu vực còn có vé cho các trận đấu đã biết:\n+ 1 khu vực là Khán đài B \n+ 1 là khu vực Khán đài Nam.', '2025-10-11 08:17:56.180175', 'frontend-test', 1),
	(49, 'Có tất cả bao nhiêu khán đài trận Việt Nam vs Thái Lan ?', 'Cảm ơn vì đã cung cấp dữ liệu chính xác!\n\nVậy, có 3 khu vực cho trận đấu Việt Nam vs Thái Lan:\n\n1. Khu vực Khán đài A\n2. Khu vực Khán đài B\n3. Khu vực Khán đài VIP\n\nVậy, có 3 khu vực cho trận đấu này.', '2025-10-11 09:03:42.494896', 'frontend-test', 1),
	(50, 'khu vực khán đài A bao nhiêu tiền', 'Dữ liệu liên quan đến trận đấu Việt Nam vs Thái Lan đã được cập nhật và rõ ràng hơn!\n\nĐúng là có 3 loại vé cho trận đấu này, và giá vé cho khu vực Khán đài A là 150,000 đồng.\n\nVậy, giá vé cho khu vực Khán đài A là 150,000 đồng. Còn lại, khu vực này còn có 9500 chỗ.', '2025-10-11 09:05:51.560048', 'frontend-test', 1),
	(51, 'khán đài B thì sao', 'Tôi xin lỗi vì nhận thức trước đó không chính xác.\n\nDựa trên dữ liệu mà bạn cung cấp, có vẻ như tôi đã hiểu sai về khu vực Khán đài B.\n\nCó nghĩa là, có 3 khu vực cho trận Việt Nam vs Thái Lan:\n\n1. Khu vực Khán đài A\n2. Khu vực Khán đài B\n3. Khu vực Khán đài VIP\n\nVậy, có 3 khu vực cho trận đấu này.\n\nVề khu vực Khán đài B, có vẻ như có 9800 chỗ ngồi còn trống, giá vé là 100,000 đồng.', '2025-10-11 10:09:05.308341', 'frontend-test', 1),
	(52, 'khán đài VIP còn vé không vậy', 'Dựa trên dữ liệu mà bạn cung cấp, có 2 trận đấu còn vé tại Khán đài VIP:\n\n- Giải Giao hữu quốc tế (Bóng đá), Trận Việt Nam vs Thái Lan, Thời gian diễn ra 19:00 20/10/2025, vẫn còn vé, giá 300,000đ, còn 1800 chỗ.\n- Và còn một trận đấu nữa vẫn còn vé, đó là giải  :  Giải Giao hữu quốc tế (Bóng đá), Trận Real Madrid vs Liverpool, Thời gian diễn ra 20:00 25/10/2025, với khuyến mãi giảm 100,000 đ khi áp dụng chương trình VIP100 giá vé là 400,000 đồng và còn 20000 chỗ.', '2025-10-11 10:09:41.246004', 'frontend-test', 1),
	(53, 'ý tôi là trận việt nam và thái lan á', 'Xin lỗi vì sự nhầm lẫn trước đó!\n\nDựa trên dữ liệu mới mà bạn cung cấp, tôi có thể trả lời chính xác hơn.\n\nCó 3 khu vực cho trận đấu Việt Nam vs Thái Lan:\n\n1. Khu vực Khán đài A\n2. Khu vực Khán đài B\n3. Khu vực Khán đài VIP\n\nVậy, có 3 khu vực cho trận đấu này.\n\nCảm ơn bạn đã cung cấp dữ liệu mới và giúp tôi hiểu rõ hơn về tình hình.', '2025-10-11 10:10:05.695874', 'frontend-test', 1),
	(54, 'tôi muốn hỏi khán đài vip trận trên', 'Với dữ liệu mới cung cấp, bạn muốn biết thông tin về Khán đài VIP trận Việt Nam vs Thái Lan.\n\nThông tin về Khán đài VIP như sau:\n- Giá vé: 300,000 đồng\n- Số chỗ còn có sẵn: 1800 chỗ\n\nBạn có muốn mua vé hoặc cần thêm thông tin nào không?', '2025-10-11 10:10:38.522313', 'frontend-test', 1);

-- Dumping structure for table sport_ticket_chatbot_db.Customer
CREATE TABLE IF NOT EXISTS `Customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `phone_number` (`phone_number`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sport_ticket_chatbot_db.Customer: ~3 rows (approximately)
INSERT INTO `Customer` (`customer_id`, `full_name`, `phone_number`, `email`, `created_at`, `updated_at`) VALUES
	(1, 'Nguyễn Minh Khang', '0909123456', 'khang@example.com', '2025-10-06 08:53:25', '2025-10-06 08:53:25'),
	(2, 'Lê Thu Hằng', '0909678123', 'hang@example.com', '2025-10-06 08:53:25', '2025-10-06 08:53:25'),
	(3, 'Trần Văn Tài', '0909555123', 'tai@example.com', '2025-10-06 08:53:25', '2025-10-06 08:53:25');

-- Dumping structure for table sport_ticket_chatbot_db.Customer_Account
CREATE TABLE IF NOT EXISTS `Customer_Account` (
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `customer_id` int NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `customer_id` (`customer_id`),
  CONSTRAINT `fk_customer_account_customer` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sport_ticket_chatbot_db.Customer_Account: ~0 rows (approximately)

-- Dumping structure for table sport_ticket_chatbot_db.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sport_ticket_chatbot_db.django_admin_log: ~0 rows (approximately)

-- Dumping structure for table sport_ticket_chatbot_db.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sport_ticket_chatbot_db.django_content_type: ~27 rows (approximately)
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(27, 'chatbot', 'chathistory'),
	(7, 'chatbot', 'customer'),
	(8, 'chatbot', 'customeraccount'),
	(9, 'chatbot', 'employee'),
	(10, 'chatbot', 'employeeaccount'),
	(11, 'chatbot', 'league'),
	(12, 'chatbot', 'match'),
	(13, 'chatbot', 'matchhistory'),
	(14, 'chatbot', 'orderdetails'),
	(15, 'chatbot', 'orders'),
	(16, 'chatbot', 'payment'),
	(17, 'chatbot', 'pricehistory'),
	(18, 'chatbot', 'promotiondetails'),
	(19, 'chatbot', 'promotions'),
	(20, 'chatbot', 'seats'),
	(21, 'chatbot', 'sectionprices'),
	(22, 'chatbot', 'sections'),
	(23, 'chatbot', 'sporttype'),
	(24, 'chatbot', 'stadium'),
	(25, 'chatbot', 'team'),
	(26, 'chatbot', 'ticketreturns'),
	(5, 'contenttypes', 'contenttype'),
	(6, 'sessions', 'session');

-- Dumping structure for table sport_ticket_chatbot_db.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sport_ticket_chatbot_db.django_migrations: ~19 rows (approximately)
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2025-10-05 06:05:49.997291'),
	(2, 'auth', '0001_initial', '2025-10-05 06:05:50.922356'),
	(3, 'admin', '0001_initial', '2025-10-05 06:05:51.139075'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2025-10-05 06:05:51.148846'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-10-05 06:05:51.166168'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2025-10-05 06:05:51.345010'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2025-10-05 06:05:51.456908'),
	(8, 'auth', '0003_alter_user_email_max_length', '2025-10-05 06:05:51.496651'),
	(9, 'auth', '0004_alter_user_username_opts', '2025-10-05 06:05:51.508414'),
	(10, 'auth', '0005_alter_user_last_login_null', '2025-10-05 06:05:51.602037'),
	(11, 'auth', '0006_require_contenttypes_0002', '2025-10-05 06:05:51.606921'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2025-10-05 06:05:51.617689'),
	(13, 'auth', '0008_alter_user_username_max_length', '2025-10-05 06:05:51.720433'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2025-10-05 06:05:51.811421'),
	(15, 'auth', '0010_alter_group_name_max_length', '2025-10-05 06:05:51.842735'),
	(16, 'auth', '0011_update_proxy_permissions', '2025-10-05 06:05:51.859836'),
	(17, 'auth', '0012_alter_user_first_name_max_length', '2025-10-05 06:05:51.967875'),
	(19, 'sessions', '0001_initial', '2025-10-05 06:05:52.194585'),
	(20, 'chatbot', '0001_initial', '2025-10-05 06:29:17.712701');

-- Dumping structure for table sport_ticket_chatbot_db.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sport_ticket_chatbot_db.django_session: ~0 rows (approximately)

-- Dumping structure for table sport_ticket_chatbot_db.Employee
CREATE TABLE IF NOT EXISTS `Employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `phone_number` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `citizen_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `phone_number` (`phone_number`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `citizen_id` (`citizen_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sport_ticket_chatbot_db.Employee: ~0 rows (approximately)
INSERT INTO `Employee` (`employee_id`, `full_name`, `date_of_birth`, `phone_number`, `email`, `citizen_id`, `gender`, `address`, `image`, `created_at`, `updated_at`) VALUES
	(1, 'Nguyễn Văn A', '1990-05-10', '0905123456', 'nva@example.com', '123456789', 1, 'Hà Nội', NULL, '2025-10-04 17:15:26', '2025-10-04 17:15:26');

-- Dumping structure for table sport_ticket_chatbot_db.Employee_Account
CREATE TABLE IF NOT EXISTS `Employee_Account` (
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('staff','manager') COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `employee_id` int NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `employee_id` (`employee_id`),
  CONSTRAINT `fk_employee_account_employee` FOREIGN KEY (`employee_id`) REFERENCES `Employee` (`employee_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sport_ticket_chatbot_db.Employee_Account: ~0 rows (approximately)

-- Dumping structure for table sport_ticket_chatbot_db.League
CREATE TABLE IF NOT EXISTS `League` (
  `league_id` int NOT NULL AUTO_INCREMENT,
  `sport_type_id` int NOT NULL,
  `league_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`league_id`),
  UNIQUE KEY `uq_league_name_start_date` (`league_name`,`start_date`),
  KEY `fk_league_sport_type` (`sport_type_id`),
  CONSTRAINT `fk_league_sport_type` FOREIGN KEY (`sport_type_id`) REFERENCES `Sport_Type` (`sport_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sport_ticket_chatbot_db.League: ~8 rows (approximately)
INSERT INTO `League` (`league_id`, `sport_type_id`, `league_name`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Giao hữu quốc tế', '2025-10-01', '2025-12-31', '2025-10-04 17:13:50', '2025-10-04 17:13:50'),
	(2, 1, 'UEFA Champions League', '2025-09-01', '2026-05-31', '2025-10-04 17:13:50', '2025-10-04 17:13:50'),
	(3, 1, 'Giao hữu Quốc tế', '2025-09-01', '2025-12-31', '2025-10-04 17:15:48', '2025-10-04 17:15:48'),
	(4, 1, 'La Liga', '2025-08-01', '2026-05-30', '2025-10-06 08:38:27', '2025-10-06 08:38:27'),
	(5, 1, 'Premier League', '2025-08-10', '2026-05-30', '2025-10-06 08:38:27', '2025-10-06 08:38:27'),
	(6, 1, 'Giao hữu quốc tế 2025', '2025-10-01', '2025-12-31', '2025-10-06 08:38:27', '2025-10-06 08:38:27'),
	(18, 1, 'Asian Cup 2025', '2025-12-01', '2026-01-15', '2025-10-09 10:51:56', '2025-10-09 10:51:56'),
	(19, 1, 'AFF Cup 2026', '2026-06-01', '2026-07-15', '2025-10-09 10:51:56', '2025-10-09 10:51:56');

-- Dumping structure for table sport_ticket_chatbot_db.Match
CREATE TABLE IF NOT EXISTS `Match` (
  `match_id` int NOT NULL AUTO_INCREMENT,
  `match_time` datetime NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `stadium_id` int NOT NULL,
  `league_id` int NOT NULL,
  `round` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `team_1_id` int NOT NULL,
  `team_2_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`match_id`),
  UNIQUE KEY `uq_match_time_stadium` (`match_time`,`stadium_id`),
  UNIQUE KEY `uq_league_round_teams` (`league_id`,`round`,`team_1_id`,`team_2_id`),
  KEY `fk_match_stadium` (`stadium_id`),
  KEY `fk_match_team1` (`team_1_id`),
  KEY `fk_match_team2` (`team_2_id`),
  CONSTRAINT `fk_match_league` FOREIGN KEY (`league_id`) REFERENCES `League` (`league_id`),
  CONSTRAINT `fk_match_stadium` FOREIGN KEY (`stadium_id`) REFERENCES `Stadium` (`stadium_id`),
  CONSTRAINT `fk_match_team1` FOREIGN KEY (`team_1_id`) REFERENCES `Team` (`team_id`),
  CONSTRAINT `fk_match_team2` FOREIGN KEY (`team_2_id`) REFERENCES `Team` (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sport_ticket_chatbot_db.Match: ~11 rows (approximately)
INSERT INTO `Match` (`match_id`, `match_time`, `description`, `stadium_id`, `league_id`, `round`, `team_1_id`, `team_2_id`, `created_at`) VALUES
	(1, '2025-10-20 19:00:00', 'Giao hữu Việt Nam vs Thái Lan', 1, 1, 'Giao hữu', 1, 2, '2025-10-04 17:19:30'),
	(2, '2025-10-25 20:00:00', 'Trận Real Madrid vs Barcelona', 1, 1, 'Vòng 1', 4, 6, '2025-10-06 08:44:03'),
	(3, '2025-11-02 18:30:00', 'Trận Manchester United vs PSGl', 2, 2, 'Vòng 5', 3, 7, '2025-10-06 08:44:03'),
	(4, '2025-11-10 19:00:00', 'Trận Argentina vs Brazil', 3, 3, 'Giao hữu', 8, 9, '2025-10-06 08:44:03'),
	(5, '2025-11-18 19:30:00', 'Trận PSG vs Real Madrid', 1, 1, 'Vòng bảng', 7, 4, '2025-10-06 08:44:03'),
	(34, '2025-12-05 19:30:00', 'Trận Việt Nam vs Nhật Bản', 1, 1, 'Vòng bảng', 1, 18, '2025-10-09 10:55:49'),
	(35, '2025-12-07 20:00:00', 'Trận Hàn Quốc vs Trung Quốc', 1, 1, 'Vòng bảng', 19, 21, '2025-10-09 10:55:49'),
	(36, '2025-12-10 18:00:00', 'Trận Úc vs Singapore', 1, 1, 'Vòng bảng', 20, 12, '2025-10-09 10:55:49'),
	(37, '2025-12-15 19:30:00', 'Trận Việt Nam vs Hàn Quốc', 1, 1, 'Tứ kết', 1, 19, '2025-10-09 10:55:49'),
	(38, '2025-12-20 19:00:00', 'Trận Nhật Bản vs Úc', 1, 1, 'Bán kết', 18, 20, '2025-10-09 10:55:49'),
	(39, '2025-12-25 19:00:00', 'Chung kết Asian Cup 2025', 1, 1, 'Chung kết', 10, 11, '2025-10-09 10:55:49');

-- Dumping structure for table sport_ticket_chatbot_db.Match_History
CREATE TABLE IF NOT EXISTS `Match_History` (
  `m_history_id` int NOT NULL AUTO_INCREMENT,
  `match_id` int NOT NULL,
  `changed_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `employee_id` int NOT NULL,
  `change_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `reason` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`m_history_id`),
  KEY `fk_match_history_match` (`match_id`),
  KEY `fk_match_history_employee` (`employee_id`),
  CONSTRAINT `fk_match_history_employee` FOREIGN KEY (`employee_id`) REFERENCES `Employee` (`employee_id`),
  CONSTRAINT `fk_match_history_match` FOREIGN KEY (`match_id`) REFERENCES `Match` (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sport_ticket_chatbot_db.Match_History: ~0 rows (approximately)

-- Dumping structure for table sport_ticket_chatbot_db.Orders
CREATE TABLE IF NOT EXISTS `Orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `order_status` enum('pending','completed','cancelled') COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `order_method` enum('online','offline') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `fk_orders_customer` (`customer_id`),
  CONSTRAINT `fk_orders_customer` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sport_ticket_chatbot_db.Orders: ~0 rows (approximately)

-- Dumping structure for table sport_ticket_chatbot_db.Order_Details
CREATE TABLE IF NOT EXISTS `Order_Details` (
  `detail_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `pricing_id` int NOT NULL,
  `qr_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seat_id` int DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `promo_id` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`detail_id`),
  UNIQUE KEY `qr_code` (`qr_code`),
  UNIQUE KEY `uq_order_seat` (`order_id`,`seat_id`),
  KEY `fk_order_details_pricing` (`pricing_id`),
  KEY `fk_order_details_seat` (`seat_id`),
  KEY `fk_order_details_promotion` (`promo_id`),
  CONSTRAINT `fk_order_details_order` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`),
  CONSTRAINT `fk_order_details_pricing` FOREIGN KEY (`pricing_id`) REFERENCES `Section_Prices` (`pricing_id`),
  CONSTRAINT `fk_order_details_promotion` FOREIGN KEY (`promo_id`) REFERENCES `Promotions` (`promo_id`) ON DELETE SET NULL,
  CONSTRAINT `fk_order_details_seat` FOREIGN KEY (`seat_id`) REFERENCES `Seats` (`seat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sport_ticket_chatbot_db.Order_Details: ~0 rows (approximately)

-- Dumping structure for table sport_ticket_chatbot_db.Payment
CREATE TABLE IF NOT EXISTS `Payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `payment_method` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` enum('success','failed','pending') COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `transaction_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  UNIQUE KEY `transaction_code` (`transaction_code`),
  KEY `fk_payment_order` (`order_id`),
  CONSTRAINT `fk_payment_order` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sport_ticket_chatbot_db.Payment: ~0 rows (approximately)

-- Dumping structure for table sport_ticket_chatbot_db.Price_History
CREATE TABLE IF NOT EXISTS `Price_History` (
  `p_history_id` int NOT NULL AUTO_INCREMENT,
  `pricing_id` int NOT NULL,
  `old_price` decimal(10,2) DEFAULT NULL,
  `new_price` decimal(10,2) NOT NULL,
  `effective_time` datetime NOT NULL,
  `changed_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `changed_by` int NOT NULL COMMENT 'employee_id',
  `reason` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`p_history_id`),
  KEY `fk_price_history_pricing` (`pricing_id`),
  KEY `fk_price_history_employee` (`changed_by`),
  CONSTRAINT `fk_price_history_employee` FOREIGN KEY (`changed_by`) REFERENCES `Employee` (`employee_id`),
  CONSTRAINT `fk_price_history_pricing` FOREIGN KEY (`pricing_id`) REFERENCES `Section_Prices` (`pricing_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sport_ticket_chatbot_db.Price_History: ~0 rows (approximately)

-- Dumping structure for table sport_ticket_chatbot_db.Promotions
CREATE TABLE IF NOT EXISTS `Promotions` (
  `promo_id` int NOT NULL AUTO_INCREMENT,
  `promo_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_value` decimal(10,2) NOT NULL,
  `discount_type` enum('percentage','fixed_amount') COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `usage_limit` int DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `employee_id` int NOT NULL,
  `status` tinyint DEFAULT '0' COMMENT '0: active, 1: inactive',
  PRIMARY KEY (`promo_id`),
  UNIQUE KEY `promo_code` (`promo_code`),
  KEY `fk_promotions_employee` (`employee_id`),
  CONSTRAINT `fk_promotions_employee` FOREIGN KEY (`employee_id`) REFERENCES `Employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sport_ticket_chatbot_db.Promotions: ~4 rows (approximately)
INSERT INTO `Promotions` (`promo_id`, `promo_code`, `discount_value`, `discount_type`, `start_time`, `end_time`, `usage_limit`, `description`, `employee_id`, `status`) VALUES
	(1, 'FAN50', 50.00, 'percentage', '2025-10-01 00:00:00', '2025-10-31 23:59:59', 1000, 'Giảm 50% cho fan đầu tiên', 1, 0),
	(2, 'RM50', 50.00, 'percentage', '2025-10-01 00:00:00', '2025-12-31 00:00:00', NULL, 'Giảm 50% cho vé Real Madrid', 1, 0),
	(3, 'VIP100', 100000.00, 'fixed_amount', '2025-10-01 00:00:00', '2025-12-31 00:00:00', NULL, 'Giảm 100k cho khu VIP', 1, 0),
	(4, 'MU30', 30.00, 'percentage', '2025-10-01 00:00:00', '2025-12-31 00:00:00', NULL, 'Giảm 30% cho trận MU vs PSG', 1, 0);

-- Dumping structure for table sport_ticket_chatbot_db.Promotion_Details
CREATE TABLE IF NOT EXISTS `Promotion_Details` (
  `promo_id` int NOT NULL,
  `match_id` int NOT NULL,
  `section_id` int NOT NULL,
  PRIMARY KEY (`promo_id`,`match_id`,`section_id`),
  KEY `fk_promo_details_match` (`match_id`),
  KEY `fk_promo_details_section` (`section_id`),
  CONSTRAINT `fk_promo_details_match` FOREIGN KEY (`match_id`) REFERENCES `Match` (`match_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_promo_details_promo` FOREIGN KEY (`promo_id`) REFERENCES `Promotions` (`promo_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_promo_details_section` FOREIGN KEY (`section_id`) REFERENCES `Sections` (`section_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sport_ticket_chatbot_db.Promotion_Details: ~11 rows (approximately)
INSERT INTO `Promotion_Details` (`promo_id`, `match_id`, `section_id`) VALUES
	(2, 2, 1),
	(3, 2, 4),
	(3, 2, 7),
	(3, 2, 28),
	(4, 3, 4),
	(4, 3, 7),
	(4, 3, 28),
	(2, 5, 1),
	(3, 5, 4),
	(3, 5, 7),
	(3, 5, 28);

-- Dumping structure for table sport_ticket_chatbot_db.Seats
CREATE TABLE IF NOT EXISTS `Seats` (
  `seat_id` int NOT NULL AUTO_INCREMENT,
  `seat_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seat_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `section_id` int NOT NULL,
  `status` tinyint DEFAULT '0' COMMENT '0: available, 1: maintenance',
  PRIMARY KEY (`seat_id`),
  UNIQUE KEY `seat_code` (`seat_code`),
  KEY `fk_seats_section` (`section_id`),
  CONSTRAINT `fk_seats_section` FOREIGN KEY (`section_id`) REFERENCES `Sections` (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sport_ticket_chatbot_db.Seats: ~50 rows (approximately)
INSERT INTO `Seats` (`seat_id`, `seat_code`, `seat_number`, `section_id`, `status`) VALUES
	(2, 'VIP-A1', 'A1', 3, 0),
	(3, 'VIP-A2', 'A2', 3, 0),
	(4, 'VIP-A3', 'A3', 3, 0),
	(5, 'VIP-A4', 'A4', 3, 0),
	(6, 'VIP-A5', 'A5', 3, 0),
	(7, 'VIP-A6', 'A6', 3, 0),
	(8, 'VIP-A7', 'A7', 3, 0),
	(9, 'VIP-A8', 'A8', 3, 0),
	(10, 'VIP-A9', 'A9', 3, 0),
	(11, 'VIP-A10', 'A10', 3, 0),
	(12, 'VIP-B1', 'B1', 3, 0),
	(13, 'VIP-B2', 'B2', 3, 0),
	(14, 'VIP-B3', 'B3', 3, 0),
	(15, 'VIP-B4', 'B4', 3, 0),
	(16, 'VIP-B5', 'B5', 3, 0),
	(17, 'VIP-B6', 'B6', 3, 0),
	(18, 'VIP-B7', 'B7', 3, 0),
	(19, 'VIP-B8', 'B8', 3, 0),
	(20, 'VIP-B9', 'B9', 3, 0),
	(21, 'VIP-B10', 'B10', 3, 0),
	(22, 'VIP-C1', 'C1', 3, 0),
	(23, 'VIP-C2', 'C2', 3, 0),
	(24, 'VIP-C3', 'C3', 3, 0),
	(25, 'VIP-C4', 'C4', 3, 0),
	(26, 'VIP-C5', 'C5', 3, 0),
	(27, 'VIP-C6', 'C6', 3, 0),
	(28, 'VIP-C7', 'C7', 3, 0),
	(29, 'VIP-C8', 'C8', 3, 0),
	(30, 'VIP-C9', 'C9', 3, 0),
	(31, 'VIP-C10', 'C10', 3, 0),
	(32, 'VIP-D1', 'D1', 3, 0),
	(33, 'VIP-D2', 'D2', 3, 0),
	(34, 'VIP-D3', 'D3', 3, 0),
	(35, 'VIP-D4', 'D4', 3, 0),
	(36, 'VIP-D5', 'D5', 3, 0),
	(37, 'VIP-D6', 'D6', 3, 0),
	(38, 'VIP-D7', 'D7', 3, 0),
	(39, 'VIP-D8', 'D8', 3, 0),
	(40, 'VIP-D9', 'D9', 3, 0),
	(41, 'VIP-D10', 'D10', 3, 0),
	(42, 'VIP-E1', 'E1', 3, 0),
	(43, 'VIP-E2', 'E2', 3, 0),
	(44, 'VIP-E3', 'E3', 3, 0),
	(45, 'VIP-E4', 'E4', 3, 0),
	(46, 'VIP-E5', 'E5', 3, 0),
	(47, 'VIP-E6', 'E6', 3, 0),
	(48, 'VIP-E7', 'E7', 3, 0),
	(49, 'VIP-E8', 'E8', 3, 0),
	(50, 'VIP-E9', 'E9', 3, 0),
	(51, 'VIP-E10', 'E10', 3, 0);

-- Dumping structure for table sport_ticket_chatbot_db.Sections
CREATE TABLE IF NOT EXISTS `Sections` (
  `section_id` int NOT NULL AUTO_INCREMENT,
  `section_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stadium_id` int NOT NULL,
  `capacity` int DEFAULT NULL,
  PRIMARY KEY (`section_id`),
  UNIQUE KEY `uq_stadium_section_name` (`stadium_id`,`section_name`),
  CONSTRAINT `fk_sections_stadium` FOREIGN KEY (`stadium_id`) REFERENCES `Stadium` (`stadium_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sport_ticket_chatbot_db.Sections: ~10 rows (approximately)
INSERT INTO `Sections` (`section_id`, `section_name`, `stadium_id`, `capacity`) VALUES
	(1, 'Khán đài A', 1, 10000),
	(2, 'Khán đài B', 1, 10000),
	(3, 'Khán đài VIP', 1, 2000),
	(4, 'VIP', 1, 5000),
	(5, 'Khán đài Bắc', 2, 25000),
	(6, 'Khán đài Nam', 2, 20000),
	(7, 'VIP', 2, 3000),
	(8, 'Khán đài Đông', 3, 25000),
	(9, 'Khán đài Tây', 3, 25000),
	(28, 'VIP', 3, 5000);

-- Dumping structure for table sport_ticket_chatbot_db.Section_Prices
CREATE TABLE IF NOT EXISTS `Section_Prices` (
  `pricing_id` int NOT NULL AUTO_INCREMENT,
  `match_id` int NOT NULL,
  `section_id` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `available_seats` int NOT NULL,
  `is_closed` tinyint(1) DEFAULT '0' COMMENT 'false: open for sale, true: closed',
  `sell_time` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pricing_id`),
  UNIQUE KEY `uq_match_section` (`match_id`,`section_id`),
  KEY `fk_section_prices_section` (`section_id`),
  CONSTRAINT `fk_section_prices_match` FOREIGN KEY (`match_id`) REFERENCES `Match` (`match_id`),
  CONSTRAINT `fk_section_prices_section` FOREIGN KEY (`section_id`) REFERENCES `Sections` (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sport_ticket_chatbot_db.Section_Prices: ~12 rows (approximately)
INSERT INTO `Section_Prices` (`pricing_id`, `match_id`, `section_id`, `price`, `available_seats`, `is_closed`, `sell_time`, `created_at`) VALUES
	(1, 1, 1, 150000.00, 9500, 0, '2025-10-01 08:00:00', '2025-10-04 17:19:31'),
	(2, 1, 2, 100000.00, 9800, 0, '2025-10-01 08:00:00', '2025-10-04 17:19:31'),
	(3, 1, 3, 300000.00, 1800, 0, '2025-10-01 08:00:00', '2025-10-04 17:19:31'),
	(64, 2, 4, 400000.00, 20000, 0, NULL, '2025-10-06 08:49:05'),
	(65, 2, 5, 300000.00, 18000, 0, NULL, '2025-10-06 08:49:05'),
	(66, 2, 6, 800000.00, 2500, 0, NULL, '2025-10-06 08:49:05'),
	(67, 3, 7, 600000.00, 23000, 0, NULL, '2025-10-06 08:49:05'),
	(68, 3, 8, 450000.00, 22000, 0, NULL, '2025-10-06 08:49:05'),
	(69, 3, 9, 1200000.00, 3000, 0, NULL, '2025-10-06 08:49:05'),
	(70, 4, 1, 700000.00, 9500, 0, NULL, '2025-10-06 08:49:05'),
	(71, 4, 2, 500000.00, 9800, 0, NULL, '2025-10-06 08:49:05'),
	(72, 4, 3, 1000000.00, 0, 0, NULL, '2025-10-06 08:49:05');

-- Dumping structure for table sport_ticket_chatbot_db.Sport_Type
CREATE TABLE IF NOT EXISTS `Sport_Type` (
  `sport_type_id` int NOT NULL AUTO_INCREMENT,
  `sport_type_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`sport_type_id`),
  UNIQUE KEY `sport_type_name` (`sport_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sport_ticket_chatbot_db.Sport_Type: ~4 rows (approximately)
INSERT INTO `Sport_Type` (`sport_type_id`, `sport_type_name`, `description`) VALUES
	(1, 'Bóng đá', 'Môn thể thao vua được chơi với một quả bóng giữa hai đội, mỗi đội có 11 cầu thủ.'),
	(2, 'Bóng rổ', 'Môn thể thao đồng đội trong đó hai đội cố gắng ghi điểm bằng cách ném một quả bóng vào rổ của đối phương.'),
	(3, 'Bóng chuyền', 'Môn thể thao đồng đội được ngăn cách bởi một tấm lưới, hai đội cố gắng ghi điểm bằng cách đưa một quả bóng qua lưới và chạm đất bên phần sân đối phương.'),
	(4, 'Thể thao điện tử', 'Hình thức thi đấu các trò chơi video, thường là giữa các tuyển thủ chuyên nghiệp, cá nhân hoặc theo đội.');

-- Dumping structure for table sport_ticket_chatbot_db.Stadium
CREATE TABLE IF NOT EXISTS `Stadium` (
  `stadium_id` int NOT NULL AUTO_INCREMENT,
  `stadium_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  PRIMARY KEY (`stadium_id`),
  UNIQUE KEY `stadium_name` (`stadium_name`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sport_ticket_chatbot_db.Stadium: ~9 rows (approximately)
INSERT INTO `Stadium` (`stadium_id`, `stadium_name`, `location`, `capacity`) VALUES
	(1, 'Sân Mỹ Đình', 'Hà Nội', 40000),
	(2, 'Sân Thống Nhất', 'TP. Hồ Chí Minh', 20000),
	(3, 'Sân Old Trafford', 'Manchester, Anh', 75000),
	(4, 'Sân Camp Nou', 'Barcelona, Tây Ban Nha', 99000),
	(5, 'Sân Anfield', 'Liverpool, Anh', 54000),
	(6, 'Sân Maracana', 'Rio de Janeiro, Brazil', 78000),
	(19, 'Sân Quốc gia Tokyo', 'Tokyo, Nhật Bản', 68000),
	(20, 'Sân Seoul World Cup', 'Seoul, Hàn Quốc', 66000),
	(21, 'Sân Sydney Olympic', 'Sydney, Úc', 83000),
	(22, 'Sân Thiên Tân', 'Thiên Tân, Trung Quốc', 54000);

-- Dumping structure for table sport_ticket_chatbot_db.Team
CREATE TABLE IF NOT EXISTS `Team` (
  `team_id` int NOT NULL AUTO_INCREMENT,
  `team_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `head_coach` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`team_id`),
  UNIQUE KEY `team_name` (`team_name`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sport_ticket_chatbot_db.Team: ~21 rows (approximately)
INSERT INTO `Team` (`team_id`, `team_name`, `logo`, `head_coach`, `description`) VALUES
	(1, 'Việt Nam', 'vietnam.png', 'Philippe Troussier', 'Đội tuyển quốc gia Việt Nam'),
	(2, 'Thái Lan', 'thailand.png', 'Masatada Ishii', 'Đội tuyển quốc gia Thái Lan'),
	(3, 'Manchester United', 'manutd.png', 'Erik ten Hag', 'Câu lạc bộ bóng đá Anh'),
	(4, 'Real Madrid', 'realmadrid.png', 'Carlo Ancelotti', 'Câu lạc bộ bóng đá Tây Ban Nha'),
	(5, 'Barcelona', 'barca.png', 'Xavi Hernandez', 'Câu lạc bộ bóng đá Tây Ban Nha'),
	(6, 'Liverpool', 'liverpool.png', 'Jurgen Klopp', 'Câu lạc bộ bóng đá Anh'),
	(7, 'PSG', 'psg.png', 'Luis Enrique', 'Câu lạc bộ bóng đá Pháp'),
	(8, 'Argentina', 'argentina.png', 'Lionel Scaloni', 'Đội tuyển quốc gia Argentina'),
	(9, 'Brazil', 'brazil.png', 'Dorival Júnior', 'Đội tuyển quốc gia Brazil'),
	(10, 'Malaysia', NULL, NULL, NULL),
	(11, 'Indonesia', NULL, NULL, NULL),
	(12, 'Singapore', NULL, NULL, NULL),
	(13, 'Philippines', NULL, NULL, NULL),
	(14, 'Myanmar', NULL, NULL, NULL),
	(15, 'Lào', NULL, NULL, NULL),
	(16, 'Campuchia', NULL, NULL, NULL),
	(17, 'Brunei', NULL, NULL, NULL),
	(18, 'Nhật Bản', 'japan.png', 'Hajime Moriyasu', 'Đội tuyển quốc gia Nhật Bản'),
	(19, 'Hàn Quốc', 'korea.png', 'Jurgen Klinsmann', 'Đội tuyển quốc gia Hàn Quốc'),
	(20, 'Úc', 'australia.png', 'Graham Arnold', 'Đội tuyển quốc gia Úc'),
	(21, 'Trung Quốc', 'china.png', 'Branko Ivanković', 'Đội tuyển quốc gia Trung Quốc');

-- Dumping structure for table sport_ticket_chatbot_db.Ticket_Returns
CREATE TABLE IF NOT EXISTS `Ticket_Returns` (
  `return_id` int NOT NULL AUTO_INCREMENT,
  `detail_id` int NOT NULL,
  `return_reason` text COLLATE utf8mb4_unicode_ci,
  `return_status` enum('pending','approved','rejected','completed') COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `refund_method` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `processed_time` datetime DEFAULT NULL,
  `refund_amount` decimal(10,2) DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`return_id`),
  UNIQUE KEY `detail_id` (`detail_id`),
  KEY `fk_ticket_returns_employee` (`employee_id`),
  CONSTRAINT `fk_ticket_returns_detail` FOREIGN KEY (`detail_id`) REFERENCES `Order_Details` (`detail_id`),
  CONSTRAINT `fk_ticket_returns_employee` FOREIGN KEY (`employee_id`) REFERENCES `Employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sport_ticket_chatbot_db.Ticket_Returns: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
