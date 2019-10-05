/*
 Navicat Premium Data Transfer

 Source Server         : db
 Source Server Type    : SQLite
 Source Server Version : 3026000
 Source Schema         : main

 Target Server Type    : SQLite
 Target Server Version : 3026000
 File Encoding         : 65001

 Date: 04/10/2019 20:36:03
*/

PRAGMA foreign_keys = false;

-- ----------------------------
-- Table structure for apis_app
-- ----------------------------
DROP TABLE IF EXISTS "apis_app";
CREATE TABLE "apis_app" ("appid" varchar(32) NOT NULL PRIMARY KEY, "category" varchar(128) NOT NULL, "application" varchar(128) NOT NULL, "name" varchar(128) NOT NULL, "publish_date" date NOT NULL, "url" varchar(128) NOT NULL, "desc" text NOT NULL);

-- ----------------------------
-- Records of apis_app
-- ----------------------------
BEGIN;
INSERT INTO "apis_app" VALUES ('f18ba49825b634f44e8cdfb694ecaa13', 'life', 'weather', '天气', '2019-09-15', '/service/weather', 'this is a weather app.');
INSERT INTO "apis_app" VALUES ('7343d28f02aa6dd62733a841dc3fadfe', 'life', 'backup', '图片备份', '2019-09-15', '/service/image', 'this is a backup app.');
INSERT INTO "apis_app" VALUES ('7b27422f98f13eb2610f1996ec757be7', 'life', 'stock', '股票', '2019-09-16', '/service/stock', 'this is a stock app.');
INSERT INTO "apis_app" VALUES ('a381d410bea99d3618cc6cd431c32b0f', 'life', 'constellation', '星座', '2019-09-16', '/service/constellation', 'this is a constellation app.');
INSERT INTO "apis_app" VALUES ('833cfd91bc1ac638ecd3764715b443ef', 'life', 'joke', '笑话', '2019-09-16', '/service/joke', 'this is a joke app.');
COMMIT;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS "auth_group";
CREATE TABLE "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(80) NOT NULL UNIQUE);

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS "auth_group_permissions";
CREATE TABLE "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission__old" ("id") DEFERRABLE INITIALLY DEFERRED);

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS "auth_permission";
CREATE TABLE "auth_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL);

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO "auth_permission" VALUES (1, 1, 'add_logentry', 'Can add log entry');
INSERT INTO "auth_permission" VALUES (2, 1, 'change_logentry', 'Can change log entry');
INSERT INTO "auth_permission" VALUES (3, 1, 'delete_logentry', 'Can delete log entry');
INSERT INTO "auth_permission" VALUES (4, 2, 'add_permission', 'Can add permission');
INSERT INTO "auth_permission" VALUES (5, 2, 'change_permission', 'Can change permission');
INSERT INTO "auth_permission" VALUES (6, 2, 'delete_permission', 'Can delete permission');
INSERT INTO "auth_permission" VALUES (7, 3, 'add_group', 'Can add group');
INSERT INTO "auth_permission" VALUES (8, 3, 'change_group', 'Can change group');
INSERT INTO "auth_permission" VALUES (9, 3, 'delete_group', 'Can delete group');
INSERT INTO "auth_permission" VALUES (10, 4, 'add_user', 'Can add user');
INSERT INTO "auth_permission" VALUES (11, 4, 'change_user', 'Can change user');
INSERT INTO "auth_permission" VALUES (12, 4, 'delete_user', 'Can delete user');
INSERT INTO "auth_permission" VALUES (13, 5, 'add_contenttype', 'Can add content type');
INSERT INTO "auth_permission" VALUES (14, 5, 'change_contenttype', 'Can change content type');
INSERT INTO "auth_permission" VALUES (15, 5, 'delete_contenttype', 'Can delete content type');
INSERT INTO "auth_permission" VALUES (16, 6, 'add_session', 'Can add session');
INSERT INTO "auth_permission" VALUES (17, 6, 'change_session', 'Can change session');
INSERT INTO "auth_permission" VALUES (18, 6, 'delete_session', 'Can delete session');
INSERT INTO "auth_permission" VALUES (19, 7, 'add_user', 'Can add user');
INSERT INTO "auth_permission" VALUES (20, 7, 'change_user', 'Can change user');
INSERT INTO "auth_permission" VALUES (21, 7, 'delete_user', 'Can delete user');
INSERT INTO "auth_permission" VALUES (22, 8, 'add_app', 'Can add app');
INSERT INTO "auth_permission" VALUES (23, 8, 'change_app', 'Can change app');
INSERT INTO "auth_permission" VALUES (24, 8, 'delete_app', 'Can delete app');
COMMIT;

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS "auth_user";
CREATE TABLE "auth_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "username" varchar(150) NOT NULL UNIQUE, "first_name" varchar(30) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "last_name" varchar(150) NOT NULL);

-- ----------------------------
-- Records of auth_user
-- ----------------------------
BEGIN;
INSERT INTO "auth_user" VALUES (1, 'pbkdf2_sha256$100000$SM5aSh7Z7Iv4$VXPu4zohbA43V6fejHoCqgvsSHrVG1S6CnEe8eBj2Oc=', '2019-10-05 03:06:13.910878', 1, 'chengyinliu', '', 'liucy9511@gmail.com', 1, 1, '2019-09-17 07:40:03.614886', '');
COMMIT;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS "auth_user_groups";
CREATE TABLE "auth_user_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user__old" ("id") DEFERRABLE INITIALLY DEFERRED, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED);

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS "auth_user_user_permissions";
CREATE TABLE "auth_user_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user__old" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission__old" ("id") DEFERRABLE INITIALLY DEFERRED);

-- ----------------------------
-- Table structure for authorization_user
-- ----------------------------
DROP TABLE IF EXISTS "authorization_user";
CREATE TABLE "authorization_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "open_id" varchar(32) NOT NULL UNIQUE, "focus_cities" text NOT NULL, "focus_constellations" text NOT NULL, "focus_stocks" text NOT NULL, "nickname" varchar(256) NOT NULL);

-- ----------------------------
-- Records of authorization_user
-- ----------------------------
BEGIN;
INSERT INTO "authorization_user" VALUES (2, 'oSuQ75AB3wihUXLT1fUPAhG0h1Rw', '[{"province": "\u5e7f\u4e1c\u7701", "city": "\u5e7f\u5dde\u5e02", "area": "\u8354\u6e7e\u533a"}, {"province": "\u56db\u5ddd\u7701", "city": "\u6210\u90fd\u5e02", "area": "\u9526\u6c5f\u533a"}, {"province": "\u7518\u8083\u7701", "city": "\u5170\u5dde\u5e02", "area": "\u57ce\u5173\u533a"}]', '["\u767d\u7f8a\u5ea7", "\u5de8\u87f9\u5ea7", "\u53cc\u5b50\u5ea7"]', '[{"code": "000004", "name": "\u56fd\u519c\u79d1\u6280", "fullInfo": "\u6df1\u4ea4\u6240-\u56fd\u519c\u79d1\u6280(000004)", "market": "sz"}, {"code": "000007", "name": "\u5168\u65b0\u597d", "fullInfo": "\u6df1\u4ea4\u6240-\u5168\u65b0\u597d(000007)", "market": "sz"}, {"code": "000009", "name": "\u4e2d\u56fd\u5b9d\u5b89", "fullInfo": "\u6df1\u4ea4\u6240-\u4e2d\u56fd\u5b9d\u5b89(000009)", "market": "sz"}]', 'lnykeei');
COMMIT;

-- ----------------------------
-- Table structure for authorization_user_menu
-- ----------------------------
DROP TABLE IF EXISTS "authorization_user_menu";
CREATE TABLE "authorization_user_menu" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "authorization_user" ("id") DEFERRABLE INITIALLY DEFERRED, "app_id" varchar(32) NOT NULL REFERENCES "apis_app" ("appid") DEFERRABLE INITIALLY DEFERRED);

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS "django_admin_log";
CREATE TABLE "django_admin_log" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "action_flag" smallint unsigned NOT NULL, "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type__old" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL REFERENCES "auth_user__old" ("id") DEFERRABLE INITIALLY DEFERRED, "action_time" datetime NOT NULL);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS "django_content_type";
CREATE TABLE "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO "django_content_type" VALUES (1, 'admin', 'logentry');
INSERT INTO "django_content_type" VALUES (2, 'auth', 'permission');
INSERT INTO "django_content_type" VALUES (3, 'auth', 'group');
INSERT INTO "django_content_type" VALUES (4, 'auth', 'user');
INSERT INTO "django_content_type" VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO "django_content_type" VALUES (6, 'sessions', 'session');
INSERT INTO "django_content_type" VALUES (7, 'authorization', 'user');
INSERT INTO "django_content_type" VALUES (8, 'apis', 'app');
COMMIT;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS "django_migrations";
CREATE TABLE "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO "django_migrations" VALUES (1, 'contenttypes', '0001_initial', '2019-09-16 17:37:26.596535');
INSERT INTO "django_migrations" VALUES (2, 'auth', '0001_initial', '2019-09-16 17:37:26.613999');
INSERT INTO "django_migrations" VALUES (3, 'admin', '0001_initial', '2019-09-16 17:37:26.624089');
INSERT INTO "django_migrations" VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2019-09-16 17:37:26.635013');
INSERT INTO "django_migrations" VALUES (5, 'contenttypes', '0002_remove_content_type_name', '2019-09-16 17:37:26.654829');
INSERT INTO "django_migrations" VALUES (6, 'auth', '0002_alter_permission_name_max_length', '2019-09-16 17:37:26.663976');
INSERT INTO "django_migrations" VALUES (7, 'auth', '0003_alter_user_email_max_length', '2019-09-16 17:37:26.675016');
INSERT INTO "django_migrations" VALUES (8, 'auth', '0004_alter_user_username_opts', '2019-09-16 17:37:26.685757');
INSERT INTO "django_migrations" VALUES (9, 'auth', '0005_alter_user_last_login_null', '2019-09-16 17:37:26.696257');
INSERT INTO "django_migrations" VALUES (10, 'auth', '0006_require_contenttypes_0002', '2019-09-16 17:37:26.697610');
INSERT INTO "django_migrations" VALUES (11, 'auth', '0007_alter_validators_add_error_messages', '2019-09-16 17:37:26.707673');
INSERT INTO "django_migrations" VALUES (12, 'auth', '0008_alter_user_username_max_length', '2019-09-16 17:37:26.718026');
INSERT INTO "django_migrations" VALUES (13, 'auth', '0009_alter_user_last_name_max_length', '2019-09-16 17:37:26.730419');
INSERT INTO "django_migrations" VALUES (14, 'sessions', '0001_initial', '2019-09-16 17:37:26.733983');
INSERT INTO "django_migrations" VALUES (15, 'authorization', '0001_initial', '2019-09-16 18:15:37.123476');
INSERT INTO "django_migrations" VALUES (16, 'authorization', '0002_auto_20190916_1950', '2019-09-16 19:50:25.848124');
INSERT INTO "django_migrations" VALUES (17, 'authorization', '0003_auto_20190916_2003', '2019-09-16 20:03:52.481153');
INSERT INTO "django_migrations" VALUES (18, 'authorization', '0004_auto_20190917_0800', '2019-09-17 08:00:47.584297');
INSERT INTO "django_migrations" VALUES (19, 'apis', '0001_initial', '2019-10-05 02:50:45.202845');
INSERT INTO "django_migrations" VALUES (20, 'authorization', '0005_auto_20190924_1715', '2019-10-05 02:50:45.212778');
INSERT INTO "django_migrations" VALUES (21, 'authorization', '0006_auto_20190924_1718', '2019-10-05 02:50:45.223174');
INSERT INTO "django_migrations" VALUES (22, 'authorization', '0007_auto_20190924_1751', '2019-10-05 02:50:45.231678');
COMMIT;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS "django_session";
CREATE TABLE "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);

-- ----------------------------
-- Records of django_session
-- ----------------------------
BEGIN;
INSERT INTO "django_session" VALUES ('x0s7ydfeavb6g3qna0ibaxyxgrllkyui', 'MTBmZWRhMjhlZDA0NzhiZjg1YTVlYzljOWIyMzYyNzNmMDUxNmZmNzp7Im1lc3NhZ2UiOiJUZXN0IERqYW5nbyBTZXNzaW9uIE9rIn0=', '2019-09-30 17:37:31.816453');
INSERT INTO "django_session" VALUES ('63y33tj8owq31zx2fcb122iufy50ee2a', 'MTBmZWRhMjhlZDA0NzhiZjg1YTVlYzljOWIyMzYyNzNmMDUxNmZmNzp7Im1lc3NhZ2UiOiJUZXN0IERqYW5nbyBTZXNzaW9uIE9rIn0=', '2019-09-30 17:37:37.127852');
INSERT INTO "django_session" VALUES ('guiogykdrcxbo3akb06r9cq6xbnf67kk', 'MTBmZWRhMjhlZDA0NzhiZjg1YTVlYzljOWIyMzYyNzNmMDUxNmZmNzp7Im1lc3NhZ2UiOiJUZXN0IERqYW5nbyBTZXNzaW9uIE9rIn0=', '2019-09-30 17:38:02.118334');
INSERT INTO "django_session" VALUES ('726k8c69y1t7qe34cnp02mkkmbsivxwz', 'MTBmZWRhMjhlZDA0NzhiZjg1YTVlYzljOWIyMzYyNzNmMDUxNmZmNzp7Im1lc3NhZ2UiOiJUZXN0IERqYW5nbyBTZXNzaW9uIE9rIn0=', '2019-09-30 17:38:10.633653');
INSERT INTO "django_session" VALUES ('djuz26a3ukb1yh8brmpz8fqpb1ohwyqj', 'MTBmZWRhMjhlZDA0NzhiZjg1YTVlYzljOWIyMzYyNzNmMDUxNmZmNzp7Im1lc3NhZ2UiOiJUZXN0IERqYW5nbyBTZXNzaW9uIE9rIn0=', '2019-09-30 17:48:23.219104');
INSERT INTO "django_session" VALUES ('pqpre78zr6n111k4amkdnf5d908tyw0f', 'MTBmZWRhMjhlZDA0NzhiZjg1YTVlYzljOWIyMzYyNzNmMDUxNmZmNzp7Im1lc3NhZ2UiOiJUZXN0IERqYW5nbyBTZXNzaW9uIE9rIn0=', '2019-09-30 17:49:10.984101');
INSERT INTO "django_session" VALUES ('zzdsnhvyq7qoa0pfdm1xym508m6y2t0a', 'MTBmZWRhMjhlZDA0NzhiZjg1YTVlYzljOWIyMzYyNzNmMDUxNmZmNzp7Im1lc3NhZ2UiOiJUZXN0IERqYW5nbyBTZXNzaW9uIE9rIn0=', '2019-09-30 17:52:11.635412');
INSERT INTO "django_session" VALUES ('0bizqud2um2ncg1v62o9lp0x6vzsrty5', 'MTBmZWRhMjhlZDA0NzhiZjg1YTVlYzljOWIyMzYyNzNmMDUxNmZmNzp7Im1lc3NhZ2UiOiJUZXN0IERqYW5nbyBTZXNzaW9uIE9rIn0=', '2019-09-30 19:02:51.977230');
INSERT INTO "django_session" VALUES ('0urme7yqytjvjk0vidko0mudmvkvms0z', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-09-30 19:50:33.389662');
INSERT INTO "django_session" VALUES ('imzw8ksbsrkx8uo5ba3kith6sca1paba', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-09-30 20:16:59.515644');
INSERT INTO "django_session" VALUES ('8x8qu719phyx9xeh17d3i8clgk5mcwq4', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-01 07:29:17.297900');
INSERT INTO "django_session" VALUES ('odlf5krv3yjfqo3djyqtsijvpafpstv8', 'NWQ0MjExYmY1Y2JiMjc3ODliOWRkMjNmMzIyZjczOGZhMjZmMzcxZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZTAyNDZmYWZiZGMzZGY5YTJjYTBiY2Y1YWVmYjNhZDAwOWMzMDQ3In0=', '2019-10-01 07:40:11.456067');
INSERT INTO "django_session" VALUES ('xqlj2x7gwpjn83mwyifvxot7nuod3z95', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-01 07:47:28.546152');
INSERT INTO "django_session" VALUES ('663qz8euygr3h6iqkebnjgcjohkr9sam', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-01 07:53:17.280540');
INSERT INTO "django_session" VALUES ('6x6j5oa130ttrazx33fy07yxhevvjdls', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-01 07:55:56.307290');
INSERT INTO "django_session" VALUES ('dl0x504mfm51ra962jsc2rv0pzudg3x7', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-01 08:34:26.366424');
INSERT INTO "django_session" VALUES ('yoevsighlia9z752nvs0jkdk4u85jlpp', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-01 08:37:24.890278');
INSERT INTO "django_session" VALUES ('ds2338esxnpv74800otwlo6lci7i1x1e', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-01 09:25:39.795514');
INSERT INTO "django_session" VALUES ('4n17x7fpk057et6j87md1j5ig6utn8hp', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-01 09:25:57.848667');
INSERT INTO "django_session" VALUES ('cmmywby4u5unxkgu34ywln84eerln3uq', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-01 09:28:45.665698');
INSERT INTO "django_session" VALUES ('m4g0kp3fjgfa0u71xaoyr151qr51o4r3', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-01 09:29:46.994724');
INSERT INTO "django_session" VALUES ('lsrrgf5wfb2av7g61081dy9f1lx8o4ob', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-01 09:30:55.705523');
INSERT INTO "django_session" VALUES ('39o9f594jbhwbu2e4p6xhq7rwhr9rx37', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-01 09:31:16.287890');
INSERT INTO "django_session" VALUES ('yutvz4439cy3kx17r44i51fdo0f7oee9', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-01 09:31:56.840909');
INSERT INTO "django_session" VALUES ('vsx1wpkxup13il3wqeulazakg0bj9cmr', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-01 09:32:46.255703');
INSERT INTO "django_session" VALUES ('djs3hko2zms6ccx0m73b3nfixqhgru0m', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-01 09:32:58.280593');
INSERT INTO "django_session" VALUES ('vunqrs27wsbdfm359tkye5hu6mxs83mn', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-01 09:33:13.381014');
INSERT INTO "django_session" VALUES ('6ukrst5m3esjwqbufskhyipvqdjhf101', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-01 09:50:25.530770');
INSERT INTO "django_session" VALUES ('r6s6yzrfgz2azwrggd3kbeegqhm6zwtc', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-09-17 09:56:14.185777');
INSERT INTO "django_session" VALUES ('f600fowxf3lscq9ak92pshtdcxetapp7', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-09-17 09:59:27.495964');
INSERT INTO "django_session" VALUES ('lh765hm5s0vwbpa193s5kkbifql2ca5i', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-09-17 09:59:55.490577');
INSERT INTO "django_session" VALUES ('1oyul4h0c7wr11cxpkal7qsohz8lf8bx', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-09-17 10:00:16.906785');
INSERT INTO "django_session" VALUES ('u9mztk6f4t3qajcuovafj2idz4hgu6pz', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-09-17 10:06:06.078579');
INSERT INTO "django_session" VALUES ('qbe3k3dtjaojilsmj0iow81xgghbxxgi', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-09-17 21:11:47.599733');
INSERT INTO "django_session" VALUES ('nwt3d2d3fku0g4psrg7hfflk3hs2oh6y', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-09-17 21:12:10.805168');
INSERT INTO "django_session" VALUES ('6hv1xz6c0dh2nw6st79mp8p9omehk5o1', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-09-17 21:15:23.979593');
INSERT INTO "django_session" VALUES ('dc2dj9f3rn8w52gb73cyj7elgr92txvj', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-09-17 21:17:38.286537');
INSERT INTO "django_session" VALUES ('0wm99nldghdorckzdt1l2d8dy9k7nuf0', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-09-17 21:21:21.935314');
INSERT INTO "django_session" VALUES ('0nkpulyu8amp6psr2f6etup1wvt6p76h', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-09-17 21:23:20.431300');
INSERT INTO "django_session" VALUES ('6cxu58un6fwrov41nur8icvjn0h1ich4', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-09-17 21:52:23.264611');
INSERT INTO "django_session" VALUES ('uus2kbhv9e9r8rp0ktsj1hq92mgci5f0', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-09-17 22:14:17.371401');
INSERT INTO "django_session" VALUES ('fva6zqmwbu1lwijnwvmr9mz82uygfoqv', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-09-17 22:23:13.141309');
INSERT INTO "django_session" VALUES ('vxk9mkb20fjixh2ma5023z2ivjnuuatd', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-09-17 22:23:55.168421');
INSERT INTO "django_session" VALUES ('c6hnw5hcwgboto3y88c02qqonq1apply', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-09-17 22:24:55.665228');
INSERT INTO "django_session" VALUES ('eo6bcu1ofmrzvozghuon9cof8b7iruoh', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-09-17 22:26:22.897809');
INSERT INTO "django_session" VALUES ('nl7ivi5alk36f6t1aistvxw4byuxr1el', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-09-17 22:27:04.880314');
INSERT INTO "django_session" VALUES ('c7cymk4owk8samubujg4jsg7r50609q6', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-09-17 22:29:17.020044');
INSERT INTO "django_session" VALUES ('86li49ussss1l7bjj0em6mttgvb2gol1', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-09-17 22:30:10.217003');
INSERT INTO "django_session" VALUES ('q8z1vx2plmclubne417shyxx7yzrlta4', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-09-17 22:32:15.878746');
INSERT INTO "django_session" VALUES ('ze64n0jgxv903n8u0f8cnjltokrhbjfe', 'MDgwMjFiOWY1OTEzM2UzZTA5NzljMTk2Y2U3NTBjOGU5YzVkMWMzYzp7Im9wZW5faWQiOiJvU3VRNzVBQjN3aWhVWExUMWZVUEFoRzBoMVJ3IiwiaXNfYXV0aG9yaXplZCI6dHJ1ZX0=', '2019-10-06 03:01:01.209564');
INSERT INTO "django_session" VALUES ('hlqoeyoizggmrekg5047s602r5h6vitu', 'NWQ0MjExYmY1Y2JiMjc3ODliOWRkMjNmMzIyZjczOGZhMjZmMzcxZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZTAyNDZmYWZiZGMzZGY5YTJjYTBiY2Y1YWVmYjNhZDAwOWMzMDQ3In0=', '2019-10-06 03:06:13.914371');
COMMIT;

-- ----------------------------
-- Table structure for sqlite_sequence
-- ----------------------------
DROP TABLE IF EXISTS "sqlite_sequence";
CREATE TABLE sqlite_sequence(name,seq);

-- ----------------------------
-- Records of sqlite_sequence
-- ----------------------------
BEGIN;
INSERT INTO "sqlite_sequence" VALUES ('django_migrations', 22);
INSERT INTO "sqlite_sequence" VALUES ('django_admin_log', 0);
INSERT INTO "sqlite_sequence" VALUES ('django_content_type', 8);
INSERT INTO "sqlite_sequence" VALUES ('auth_permission', 24);
INSERT INTO "sqlite_sequence" VALUES ('auth_user', 1);
INSERT INTO "sqlite_sequence" VALUES ('authorization_user', 2);
COMMIT;

-- ----------------------------
-- Indexes structure for table auth_group_permissions
-- ----------------------------
CREATE INDEX "main"."auth_group_permissions_group_id_b120cbf9"
ON "auth_group_permissions" (
  "group_id" ASC
);
CREATE UNIQUE INDEX "main"."auth_group_permissions_group_id_permission_id_0cd325b0_uniq"
ON "auth_group_permissions" (
  "group_id" ASC,
  "permission_id" ASC
);
CREATE INDEX "main"."auth_group_permissions_permission_id_84c5c92e"
ON "auth_group_permissions" (
  "permission_id" ASC
);

-- ----------------------------
-- Auto increment value for auth_permission
-- ----------------------------
UPDATE "main"."sqlite_sequence" SET seq = 24 WHERE name = 'auth_permission';

-- ----------------------------
-- Indexes structure for table auth_permission
-- ----------------------------
CREATE INDEX "main"."auth_permission_content_type_id_2f476e4b"
ON "auth_permission" (
  "content_type_id" ASC
);
CREATE UNIQUE INDEX "main"."auth_permission_content_type_id_codename_01ab375a_uniq"
ON "auth_permission" (
  "content_type_id" ASC,
  "codename" ASC
);

-- ----------------------------
-- Auto increment value for auth_user
-- ----------------------------
UPDATE "main"."sqlite_sequence" SET seq = 1 WHERE name = 'auth_user';

-- ----------------------------
-- Indexes structure for table auth_user_groups
-- ----------------------------
CREATE INDEX "main"."auth_user_groups_group_id_97559544"
ON "auth_user_groups" (
  "group_id" ASC
);
CREATE INDEX "main"."auth_user_groups_user_id_6a12ed8b"
ON "auth_user_groups" (
  "user_id" ASC
);
CREATE UNIQUE INDEX "main"."auth_user_groups_user_id_group_id_94350c0c_uniq"
ON "auth_user_groups" (
  "user_id" ASC,
  "group_id" ASC
);

-- ----------------------------
-- Indexes structure for table auth_user_user_permissions
-- ----------------------------
CREATE INDEX "main"."auth_user_user_permissions_permission_id_1fbb5f2c"
ON "auth_user_user_permissions" (
  "permission_id" ASC
);
CREATE INDEX "main"."auth_user_user_permissions_user_id_a95ead1b"
ON "auth_user_user_permissions" (
  "user_id" ASC
);
CREATE UNIQUE INDEX "main"."auth_user_user_permissions_user_id_permission_id_14a6b632_uniq"
ON "auth_user_user_permissions" (
  "user_id" ASC,
  "permission_id" ASC
);

-- ----------------------------
-- Auto increment value for authorization_user
-- ----------------------------
UPDATE "main"."sqlite_sequence" SET seq = 2 WHERE name = 'authorization_user';

-- ----------------------------
-- Indexes structure for table authorization_user
-- ----------------------------
CREATE INDEX "main"."authorizati_open_id_5cfcc1_idx"
ON "authorization_user" (
  "open_id" ASC,
  "nickname" ASC
);

-- ----------------------------
-- Indexes structure for table authorization_user_menu
-- ----------------------------
CREATE INDEX "main"."authorization_user_menu_app_id_13ca5893"
ON "authorization_user_menu" (
  "app_id" ASC
);
CREATE UNIQUE INDEX "main"."authorization_user_menu_user_id_app_id_4d3d9382_uniq"
ON "authorization_user_menu" (
  "user_id" ASC,
  "app_id" ASC
);
CREATE INDEX "main"."authorization_user_menu_user_id_b7aaa9f0"
ON "authorization_user_menu" (
  "user_id" ASC
);

-- ----------------------------
-- Auto increment value for django_admin_log
-- ----------------------------

-- ----------------------------
-- Indexes structure for table django_admin_log
-- ----------------------------
CREATE INDEX "main"."django_admin_log_content_type_id_c4bce8eb"
ON "django_admin_log" (
  "content_type_id" ASC
);
CREATE INDEX "main"."django_admin_log_user_id_c564eba6"
ON "django_admin_log" (
  "user_id" ASC
);

-- ----------------------------
-- Auto increment value for django_content_type
-- ----------------------------
UPDATE "main"."sqlite_sequence" SET seq = 8 WHERE name = 'django_content_type';

-- ----------------------------
-- Indexes structure for table django_content_type
-- ----------------------------
CREATE UNIQUE INDEX "main"."django_content_type_app_label_model_76bd3d3b_uniq"
ON "django_content_type" (
  "app_label" ASC,
  "model" ASC
);

-- ----------------------------
-- Auto increment value for django_migrations
-- ----------------------------
UPDATE "main"."sqlite_sequence" SET seq = 22 WHERE name = 'django_migrations';

-- ----------------------------
-- Indexes structure for table django_session
-- ----------------------------
CREATE INDEX "main"."django_session_expire_date_a5c62663"
ON "django_session" (
  "expire_date" ASC
);

PRAGMA foreign_keys = true;
