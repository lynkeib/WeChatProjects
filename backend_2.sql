/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : backend

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 17/10/2019 10:00:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for apis_app
-- ----------------------------
DROP TABLE IF EXISTS `apis_app`;
CREATE TABLE `apis_app` (
  `appid` varchar(32) NOT NULL,
  `category` varchar(128) NOT NULL,
  `application` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `publish_date` date NOT NULL,
  `url` varchar(128) NOT NULL,
  `desc` longtext NOT NULL,
  PRIMARY KEY (`appid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apis_app
-- ----------------------------
BEGIN;
INSERT INTO `apis_app` VALUES ('7343d28f02aa6dd62733a841dc3fadfe', 'life', 'backup', '图片备份', '2019-09-15', '/service/image', 'this is a backup app.');
INSERT INTO `apis_app` VALUES ('7b27422f98f13eb2610f1996ec757be7', 'life', 'stock', '股票', '2019-09-16', '/service/stock', 'this is a stock app.');
INSERT INTO `apis_app` VALUES ('833cfd91bc1ac638ecd3764715b443ef', 'life', 'joke', '笑话', '2019-09-16', '/service/joke', 'this is a joke app.');
INSERT INTO `apis_app` VALUES ('a381d410bea99d3618cc6cd431c32b0f', 'life', 'constellation', '星座', '2019-09-16', '/service/constellation', 'this is a constellation app.');
INSERT INTO `apis_app` VALUES ('f18ba49825b634f44e8cdfb694ecaa13', 'life', 'weather', '天气', '2019-09-15', '/service/weather', 'this is a weather app.');
COMMIT;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (5, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (8, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (9, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (10, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (11, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (12, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (17, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (18, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (19, 'Can add app', 7, 'add_app');
INSERT INTO `auth_permission` VALUES (20, 'Can change app', 7, 'change_app');
INSERT INTO `auth_permission` VALUES (21, 'Can delete app', 7, 'delete_app');
INSERT INTO `auth_permission` VALUES (22, 'Can add user', 8, 'add_user');
INSERT INTO `auth_permission` VALUES (23, 'Can change user', 8, 'change_user');
INSERT INTO `auth_permission` VALUES (24, 'Can delete user', 8, 'delete_user');
COMMIT;

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
BEGIN;
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$100000$PyyJ2Bp4fROH$gSWtr4lEf7fsgCqoZYn2gLCy0EMNl5DhfvgNl5+S8JI=', '2019-10-13 18:28:32.038097', 1, 'chengyinliu', '', '', '', 1, 1, '2019-10-13 18:28:21.405772');
COMMIT;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for authorization_user
-- ----------------------------
DROP TABLE IF EXISTS `authorization_user`;
CREATE TABLE `authorization_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `open_id` varchar(32) NOT NULL,
  `nickname` varchar(256) NOT NULL,
  `focus_cities` longtext NOT NULL,
  `focus_constellations` longtext NOT NULL,
  `focus_stocks` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `open_id` (`open_id`),
  KEY `authorizati_open_id_5cfcc1_idx` (`open_id`,`nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authorization_user
-- ----------------------------
BEGIN;
INSERT INTO `authorization_user` VALUES (1, 'oSuQ75AB3wihUXLT1fUPAhG0h1Rw', 'lnykeei', '[{\"province\": \"\\u5e7f\\u4e1c\\u7701\", \"city\": \"\\u6df1\\u5733\\u5e02\", \"area\": \"\\u5357\\u5c71\\u533a\"}, {\"province\": \"\\u91cd\\u5e86\\u5e02\", \"city\": \"\\u91cd\\u5e86\\u5e02\", \"area\": \"\\u4e07\\u5dde\\u533a\"}]', '[\"\\u53cc\\u5b50\\u5ea7\", \"\\u5929\\u874e\\u5ea7\"]', '[{\"code\": \"000004\", \"name\": \"\\u56fd\\u519c\\u79d1\\u6280\", \"fullInfo\": \"\\u6df1\\u4ea4\\u6240-\\u56fd\\u519c\\u79d1\\u6280(000004)\", \"market\": \"sz\"}, {\"code\": \"000002\", \"name\": \"\\u4e07 \\u79d1\\uff21\", \"fullInfo\": \"\\u6df1\\u4ea4\\u6240-\\u4e07 \\u79d1\\uff21(000002)\", \"market\": \"sz\"}]');
COMMIT;

-- ----------------------------
-- Table structure for authorization_user_menu
-- ----------------------------
DROP TABLE IF EXISTS `authorization_user_menu`;
CREATE TABLE `authorization_user_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `app_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authorization_user_menu_user_id_app_id_4d3d9382_uniq` (`user_id`,`app_id`),
  KEY `authorization_user_menu_app_id_13ca5893_fk_apis_app_appid` (`app_id`),
  CONSTRAINT `authorization_user_m_user_id_b7aaa9f0_fk_authoriza` FOREIGN KEY (`user_id`) REFERENCES `authorization_user` (`id`),
  CONSTRAINT `authorization_user_menu_app_id_13ca5893_fk_apis_app_appid` FOREIGN KEY (`app_id`) REFERENCES `apis_app` (`appid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authorization_user_menu
-- ----------------------------
BEGIN;
INSERT INTO `authorization_user_menu` VALUES (5, 1, '7343d28f02aa6dd62733a841dc3fadfe');
INSERT INTO `authorization_user_menu` VALUES (2, 1, '7b27422f98f13eb2610f1996ec757be7');
INSERT INTO `authorization_user_menu` VALUES (3, 1, '833cfd91bc1ac638ecd3764715b443ef');
INSERT INTO `authorization_user_menu` VALUES (4, 1, 'a381d410bea99d3618cc6cd431c32b0f');
INSERT INTO `authorization_user_menu` VALUES (1, 1, 'f18ba49825b634f44e8cdfb694ecaa13');
COMMIT;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (7, 'apis', 'app');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (8, 'authorization', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
COMMIT;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2019-10-05 23:16:52.076730');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2019-10-05 23:16:52.343630');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2019-10-05 23:16:52.399098');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2019-10-05 23:16:52.407840');
INSERT INTO `django_migrations` VALUES (5, 'apis', '0001_initial', '2019-10-05 23:16:52.428256');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2019-10-05 23:16:52.469346');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2019-10-05 23:16:52.491538');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2019-10-05 23:16:52.520377');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2019-10-05 23:16:52.532444');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2019-10-05 23:16:52.552397');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2019-10-05 23:16:52.555146');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2019-10-05 23:16:52.562435');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2019-10-05 23:16:52.582727');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2019-10-05 23:16:52.604729');
INSERT INTO `django_migrations` VALUES (15, 'authorization', '0001_initial', '2019-10-05 23:16:52.619829');
INSERT INTO `django_migrations` VALUES (16, 'authorization', '0002_auto_20190916_1950', '2019-10-05 23:16:52.631534');
INSERT INTO `django_migrations` VALUES (17, 'authorization', '0003_auto_20190916_2003', '2019-10-05 23:16:52.684818');
INSERT INTO `django_migrations` VALUES (18, 'authorization', '0004_auto_20190917_0800', '2019-10-05 23:16:52.701441');
INSERT INTO `django_migrations` VALUES (19, 'authorization', '0005_auto_20190924_1715', '2019-10-05 23:16:52.750269');
INSERT INTO `django_migrations` VALUES (20, 'authorization', '0006_auto_20190924_1718', '2019-10-05 23:16:52.848740');
INSERT INTO `django_migrations` VALUES (21, 'authorization', '0007_auto_20190924_1751', '2019-10-05 23:16:52.935468');
INSERT INTO `django_migrations` VALUES (22, 'sessions', '0001_initial', '2019-10-05 23:16:52.969222');
COMMIT;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
BEGIN;
INSERT INTO `django_session` VALUES ('1gehi1ontx8i35omjpklz78qs3v2i4gr', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-14 18:48:07.513369');
INSERT INTO `django_session` VALUES ('1uyp7bovzalirln10t1vtq74qj013cjn', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-14 18:53:22.289888');
INSERT INTO `django_session` VALUES ('2irt3g8u267f39otnuj3jqt9ml21w4pj', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-15 18:47:00.865936');
INSERT INTO `django_session` VALUES ('2xdikf47zx0lm4t3v8z7dn77xi940et6', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-15 16:55:35.417830');
INSERT INTO `django_session` VALUES ('32c73j3bqzkher2bhvnprkrotl6lfx6t', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-14 18:36:29.195130');
INSERT INTO `django_session` VALUES ('4dpo7qvsrdml8z6fjph5g38caubulouq', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-15 18:58:32.936580');
INSERT INTO `django_session` VALUES ('5a1hcu55mwb34a6p70djx0fcwrqn5vx9', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-15 17:29:26.997618');
INSERT INTO `django_session` VALUES ('6cl74jypptmfu70m8pt69hxz5rhkbm5g', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-14 18:47:33.201403');
INSERT INTO `django_session` VALUES ('7y0vu8lsy590kfoi1cicdgtadzgt3h0j', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-15 17:27:48.003539');
INSERT INTO `django_session` VALUES ('b67b2jj4eoqms269x1rukqnpv5byd6k3', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-15 17:30:00.994876');
INSERT INTO `django_session` VALUES ('befz34uqj7pe7tdcj0fuxrr4obiob95a', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-15 18:47:21.810241');
INSERT INTO `django_session` VALUES ('chmh7dlfzak6s2mn3321gq95fk6x4k2v', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-14 18:36:15.056062');
INSERT INTO `django_session` VALUES ('d7j7feiqmgpmp6id9lwc7a8cj1dix5bo', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-14 18:44:43.731180');
INSERT INTO `django_session` VALUES ('dfxpl5u7m9sa1osrow7s2lk9hlkdngy2', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-15 16:57:24.416087');
INSERT INTO `django_session` VALUES ('dt5es69dngjl8j5wujxsxxc621w6p8ng', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-15 16:54:10.268102');
INSERT INTO `django_session` VALUES ('g8r4ty4trqss4k3534p05y5yv7j4aqq4', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-14 16:42:45.539224');
INSERT INTO `django_session` VALUES ('gue1dj1thg8w8ywvu39j7nhwzwv4hd79', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-15 18:42:53.622997');
INSERT INTO `django_session` VALUES ('gvdh0cr4zqiwohswwbcw8ifxuk7o942m', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-15 18:43:56.398561');
INSERT INTO `django_session` VALUES ('gytqlnswem503i60fd2hl8pmwt39do3m', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-15 17:20:09.328055');
INSERT INTO `django_session` VALUES ('hkj19au2dpc7q71mqko4va43c6ixa7qw', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-15 17:34:09.111140');
INSERT INTO `django_session` VALUES ('mo9bq03aw8juk6kmhbnp96oej0nf22f7', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-14 18:49:07.372726');
INSERT INTO `django_session` VALUES ('muzpgc5wh3vmeacfia233qhhkhynvvh4', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-15 17:37:38.832925');
INSERT INTO `django_session` VALUES ('pqalrqhfmqxhqhro2312y154sfrzlbwg', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-15 17:07:10.971249');
INSERT INTO `django_session` VALUES ('ptpvmcec16n3t08zwpoen48t60xey00x', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-14 18:34:03.991980');
INSERT INTO `django_session` VALUES ('rq5yjo0v18h3r5ub6sf05l4xqu8vtqm1', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-14 17:31:02.535567');
INSERT INTO `django_session` VALUES ('s6eufihrligwq37vmfequd1ihq9tm89r', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-15 17:05:24.373784');
INSERT INTO `django_session` VALUES ('sn9cn7gymdcwl2pczrvigoa6ldmggubb', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-15 17:13:41.140501');
INSERT INTO `django_session` VALUES ('v47vs62fgnqqzgps6zna6q51bg0ljzbt', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-15 17:12:42.944969');
INSERT INTO `django_session` VALUES ('van7rv64ukk5mucjcr3x2wgu9dhvhxae', 'NWQ2ZmQ4NTYxZTYyNDMwMmNmZjc4ZDU5OGZiYjBjYmZkMTA4NWQzODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwMTMwMjJkYjMxZjM1ODc3ZWYxMjBjNWYwNDA3Y2I4YWQwMWU1ZDUzIn0=', '2019-10-14 18:28:32.041344');
INSERT INTO `django_session` VALUES ('w7gt8efpprdpkl6h6nmf9pgp0eiq6yeh', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-15 17:09:28.879253');
INSERT INTO `django_session` VALUES ('x5o17xo363pth0a3jjd9whs93arcyjqx', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-15 16:54:31.863006');
INSERT INTO `django_session` VALUES ('xmm8fx3bnrpqibos3cf96h4u7qqmbwc9', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-15 17:38:28.587466');
INSERT INTO `django_session` VALUES ('xv7xlvr3uq1qplcrbrrmm1l950w03ysf', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-15 17:02:54.262995');
INSERT INTO `django_session` VALUES ('y4b5ram5b0bc7z5d6kgo0f554eyxfn0r', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-14 18:56:46.438935');
INSERT INTO `django_session` VALUES ('z45225k4woh9cnsyjefjpkzg1wle71d1', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-15 16:52:49.873505');
INSERT INTO `django_session` VALUES ('zwezo2qc2459rxgzx19f4fc9uo3lgz0m', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-14 17:28:35.756286');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
