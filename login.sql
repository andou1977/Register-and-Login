-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.31 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for login
CREATE DATABASE IF NOT EXISTS `login` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `login`;

-- Dumping structure for table login.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table login.auth_group: 0 rows
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- Dumping structure for table login.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table login.auth_group_permissions: 0 rows
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- Dumping structure for table login.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- Dumping data for table login.auth_permission: 28 rows
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
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
	(25, 'Can add client', 7, 'add_client'),
	(26, 'Can change client', 7, 'change_client'),
	(27, 'Can delete client', 7, 'delete_client'),
	(28, 'Can view client', 7, 'view_client');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Dumping structure for table login.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table login.auth_user: 1 rows
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$260000$1imR6slkICFakBGkn6Vv2C$MR5VFi+RsUxCCZfhV/2F1RrpjGsh5g+Ncn2dUs+Czc8=', '2021-08-29 10:32:52.534410', 1, 'andou', '', '', 'andouemmanuel@gmail.com', 1, 1, '2021-08-28 15:48:40.522060');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

-- Dumping structure for table login.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table login.auth_user_groups: 0 rows
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

-- Dumping structure for table login.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table login.auth_user_user_permissions: 0 rows
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

-- Dumping structure for table login.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table login.django_admin_log: 1 rows
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2021-08-29 10:36:53.875108', '1', 'Client object (1)', 1, '[{"added": {}}]', 7, 1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Dumping structure for table login.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table login.django_content_type: 7 rows
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(2, 'auth', 'permission'),
	(3, 'auth', 'group'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(6, 'sessions', 'session'),
	(7, 'loginkb', 'client');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Dumping structure for table login.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- Dumping data for table login.django_migrations: 21 rows
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2021-08-28 00:23:14.133035'),
	(2, 'auth', '0001_initial', '2021-08-28 00:23:14.617364'),
	(3, 'admin', '0001_initial', '2021-08-28 00:23:14.711093'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2021-08-28 00:23:14.711093'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-08-28 00:23:14.726731'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2021-08-28 00:23:14.836092'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2021-08-28 00:23:14.914209'),
	(8, 'auth', '0003_alter_user_email_max_length', '2021-08-28 00:23:14.945470'),
	(9, 'auth', '0004_alter_user_username_opts', '2021-08-28 00:23:14.961077'),
	(10, 'auth', '0005_alter_user_last_login_null', '2021-08-28 00:23:14.992325'),
	(11, 'auth', '0006_require_contenttypes_0002', '2021-08-28 00:23:15.007964'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2021-08-28 00:23:15.007964'),
	(13, 'auth', '0008_alter_user_username_max_length', '2021-08-28 00:23:15.070474'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2021-08-28 00:23:15.148574'),
	(15, 'auth', '0010_alter_group_name_max_length', '2021-08-28 00:23:15.211063'),
	(16, 'auth', '0011_update_proxy_permissions', '2021-08-28 00:23:15.242316'),
	(17, 'auth', '0012_alter_user_first_name_max_length', '2021-08-28 00:23:15.304804'),
	(18, 'sessions', '0001_initial', '2021-08-28 00:23:15.367304'),
	(19, 'loginkb', '0001_initial', '2021-08-28 11:26:32.976331'),
	(20, 'loginkb', '0002_alter_client_options', '2021-08-28 16:21:39.272156'),
	(21, 'loginkb', '0003_alter_client_options', '2021-08-29 10:34:01.077231');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Dumping structure for table login.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table login.django_session: 1 rows
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('b9cd172fb1rpcs6fm50fe3ksmo46vm1r', '.eJxVjDsOwyAQBe9CHSE-hg0p0-cMiGUhOIlAMnYV5e6xJRd2-2bmfZkPy1z80tPkR2I3JtnluGGI71Q3QK9Qn43HVudpRL4pfKedPxqlz313Twcl9LLW2erhakApqcEQKpe1E1YZCw5QkoFMNibI0aIEwhUKiVGIpAbngkb2-wO2sjcb:1mKI7Q:YxPczFPbV-whD7lyyRjSO1Jv0qtzCjzrjmU_iKMrhRM', '2021-09-12 10:32:52.535412');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- Dumping structure for table login.loginkb_client
CREATE TABLE IF NOT EXISTS `loginkb_client` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `gender` varchar(15) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- Dumping data for table login.loginkb_client: 19 rows
/*!40000 ALTER TABLE `loginkb_client` DISABLE KEYS */;
INSERT INTO `loginkb_client` (`id`, `nom`, `prenom`, `username`, `email`, `gender`, `telephone`, `Password`, `date`) VALUES
	(1, 'andou', 'jhonny', 'cool', 'andouemmanuel@gmail.com', 'masculin', '675746', 'kokokokok', '2021-08-29'),
	(2, 'andou', 'rrrr', 'andou', 'andouemmanuel@gmail.com', 'femal', '7777', 'hghgh', '2021-08-30'),
	(3, 'andou', 'rrrr', 'andou', 'andouemmanuel@gmail.com', 'femal', '7777', 'hghgh', '2021-08-30'),
	(4, 'andounmnmn', 'jhonnynnmnm', 'coolrrbbn', 'hhhh', 'male', '777778787', 'vvvvbfc', '2021-08-30'),
	(5, 'andounmnmn', 'jhonnynnmnm', 'coolrrbbn', 'hhhh', 'male', '777778787', 'vvvvbfc', '2021-08-30'),
	(6, 'andounmnmn', 'jhonnynnmnm', 'coolrrbbn', 'hhhh', 'male', '777778787', 'vvvvbfc', '2021-08-30'),
	(7, 'andou', 'jhonnyrrr', 'coolrrkfjlkjff', 'andouemmanuel@gmail.com', 'femal', '675746', 'nndndnd', '2021-08-30'),
	(8, 'peter', 'paul', 'fffffff', 'france@gmail.com', 'male', '42733455', 'junior', '2021-08-30'),
	(9, 'hfhfhf', 'jhonnyrrr', 'cool', 'andouemmanuel@gmail.com', 'male', '675746', 'bnbnbn', '2021-08-30'),
	(10, 'hfhfhf', 'jhonnyrrr', 'cool', 'andouemmanuel@gmail.com', 'male', '675746', 'bnbnbn', '2021-08-30'),
	(11, 'hfhfhf', 'ffff', 'cool', 'andouemmanuel@gmail.com', 'male', '675746', 'bbbnnb', '2021-08-30'),
	(12, 'hfhfhf', 'jhonnyrrr', 'eeee', 'andouemmanuel@gmail.com', 'male', '675746', 'nnn', '2021-08-30'),
	(14, 'ffff', 'fff', 'ffffff', 'andouemmanuel@gmail.com', 'male', '675746', 'bbnbb', '2021-08-30'),
	(15, 'jkjkfff', 'jhonnyrrr', 'eeee', 'andouemmanuel@gmail.com', 'male', '675746', 'hfhfuf', '2021-08-30'),
	(16, 'jkjkfff', 'rrrr', 'coolrr', 'andouemmanuel@gmail.com', 'femal', '32333', 'bbnbnb', '2021-08-30'),
	(17, 'hfhfhf', 'jhonny', 'cool', 'andouemmanuel@gmail.com', 'male', '675746', 'nbnbbnbn', '2021-08-30'),
	(18, 'hfhfhf', 'rrrr', 'andou', 'andouemmanuel@gmail.com', 'male', '32333', 'bobo', '2021-08-30'),
	(19, 'bbnbn', 'ccfcf', 'cool', 'andouemmanuel@gmail.com', 'male', '675746', 'bb', '2021-08-30');
/*!40000 ALTER TABLE `loginkb_client` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
