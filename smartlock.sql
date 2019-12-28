/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : smartlock

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 01/06/2019 17:04:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for code_sms
-- ----------------------------
DROP TABLE IF EXISTS `code_sms`;
CREATE TABLE `code_sms`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `action_sign` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作签名',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '验证码',
  `valid_second` int(11) NOT NULL COMMENT '有效时间，单位：秒',
  `created_at` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of code_sms
-- ----------------------------
INSERT INTO `code_sms` VALUES (1, 'register', '13156533607', '330531', 180, '2019-05-22 22:19:28');
INSERT INTO `code_sms` VALUES (2, 'register', '13156533607', '394477', 180, '2019-05-22 22:48:47');
INSERT INTO `code_sms` VALUES (3, 'register', '13156533607', '372383', 180, '2019-05-22 22:54:07');
INSERT INTO `code_sms` VALUES (4, 'help', '13156533607', '420125', 180, '2019-05-23 09:06:09');
INSERT INTO `code_sms` VALUES (5, 'register', '13156533607', '768604', 180, '2019-05-23 09:06:09');
INSERT INTO `code_sms` VALUES (6, 'update_password', '13156533607', '166953', 180, '2019-05-23 09:06:10');
INSERT INTO `code_sms` VALUES (7, 'update_password', '13156533607', '598679', 180, '2019-05-23 09:07:37');
INSERT INTO `code_sms` VALUES (8, 'update_password', '13156533607', '173166', 180, '2019-05-23 09:08:41');
INSERT INTO `code_sms` VALUES (9, 'register', '13156533607', '201828', 180, '2019-05-23 09:31:49');
INSERT INTO `code_sms` VALUES (10, 'help', '13156533607', '261698', 180, '2019-05-23 09:31:49');
INSERT INTO `code_sms` VALUES (11, 'update_password', '13156533607', '164701', 180, '2019-05-23 09:31:50');
INSERT INTO `code_sms` VALUES (12, 'register', '13156533607', '249113', 180, '2019-05-23 09:54:30');
INSERT INTO `code_sms` VALUES (13, 'register', '13156533607', '845252', 180, '2019-05-23 09:59:25');
INSERT INTO `code_sms` VALUES (14, 'register', '18652960609', '350947', 180, '2019-05-23 10:01:04');
INSERT INTO `code_sms` VALUES (15, 'register', '18652960609', '229180', 180, '2019-05-27 09:19:01');
INSERT INTO `code_sms` VALUES (16, 'register', '13156533607', '669292', 180, '2019-05-27 09:19:23');
INSERT INTO `code_sms` VALUES (17, 'update_password', '13156533607', '130027', 180, '2019-05-27 09:42:23');
INSERT INTO `code_sms` VALUES (18, 'register', '15351990037', '663754', 180, '2019-05-29 15:50:17');
INSERT INTO `code_sms` VALUES (19, 'register', '15351990037', '863400', 180, '2019-05-30 09:17:44');
INSERT INTO `code_sms` VALUES (20, 'update_password', '13156533607', '678155', 180, '2019-05-30 09:17:47');
INSERT INTO `code_sms` VALUES (21, 'update_password', '13156533607', '148142', 180, '2019-05-31 13:41:20');
INSERT INTO `code_sms` VALUES (22, 'update_password', '13156533607', '483925', 180, '2019-05-31 14:07:20');

-- ----------------------------
-- Table structure for door_help_order
-- ----------------------------
DROP TABLE IF EXISTS `door_help_order`;
CREATE TABLE `door_help_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `helper` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '帮助者姓名',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '帮助理由',
  `contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `help_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '帮助口令',
  `auditor_id` bigint(20) NULL DEFAULT NULL COMMENT '审核员',
  `status` int(1) NULL DEFAULT NULL COMMENT '0：未审核  1：审核通过  2：审核拒绝',
  `getui_cid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个推CID',
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_modified_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for door_info
-- ----------------------------
DROP TABLE IF EXISTS `door_info`;
CREATE TABLE `door_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `room_id` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `door_id` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门编号',
  `BLT_MAC` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '蓝牙MAC地址',
  `owner_id` bigint(20) NULL DEFAULT NULL COMMENT '管理员id',
  `pre_pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上次密码',
  `next_pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下次密码',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门的描述',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_modified_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of door_info
-- ----------------------------
INSERT INTO `door_info` VALUES (1, 'QF1', 'QF11', NULL, 1, '100000', '424917', '前工院一楼西门', NULL, NULL, NULL, NULL);
INSERT INTO `door_info` VALUES (2, 'Q-401', 'Q-401-0', '78:04:73:CF:D4:EA', 1, '100000', '424917', '前工院401西门', NULL, NULL, NULL, NULL);
INSERT INTO `door_info` VALUES (3, 'Q-401', 'Q-401-1', '78:04:73:CE:F5:E4', 1, '100000', '424917', '前工院401东门', NULL, NULL, NULL, NULL);
INSERT INTO `door_info` VALUES (4, 'Q-402', 'Q-402', '78:04:73:CF:76:08', 1, '100000', '424917', '前工院402', NULL, NULL, NULL, NULL);
INSERT INTO `door_info` VALUES (5, 'Q-404', 'Q-404-0', '38:81:D7:1C:55:83', 1, '100000', '424917', '前工院404西门', NULL, NULL, NULL, NULL);
INSERT INTO `door_info` VALUES (6, 'Q-404', 'Q-404-1', '38:81:D7:1C:55:83', 1, '100000', '424917', '前工院404东门', NULL, NULL, NULL, NULL);
INSERT INTO `door_info` VALUES (7, 'Q-405', 'Q-405-0', NULL, 1, '100000', '424917', '前工院405西门', NULL, NULL, NULL, NULL);
INSERT INTO `door_info` VALUES (8, 'Q-405', 'Q-405-1', '78:04:73:CE:F5:DD', 1, '100000', '424917', '前工院405东门', NULL, NULL, NULL, NULL);
INSERT INTO `door_info` VALUES (9, 'Q-406', 'Q-406-0', '38:81:D7:1C:55:EF', 1, '100000', '424917', '前工院406西门', NULL, NULL, NULL, NULL);
INSERT INTO `door_info` VALUES (10, 'Q-406', 'Q-406-1', '38:81:D7:1C:5A:27', 1, '100000', '424917', '前工院406东门', NULL, NULL, NULL, NULL);
INSERT INTO `door_info` VALUES (11, 'Q-407', 'Q-407-0', '38:81:D7:1C:5A:24', 1, '100000', '424917', '前工院407西门', NULL, NULL, NULL, NULL);
INSERT INTO `door_info` VALUES (12, 'Q-407', 'Q-407-1', '38:81:D7:1C:5F:EC', 1, '100000', '424917', '前工院407东门', NULL, NULL, NULL, NULL);
INSERT INTO `door_info` VALUES (13, 'Q-408', 'Q-408-0', NULL, 1, '100000', '424917', '前工院408西门', NULL, NULL, NULL, NULL);
INSERT INTO `door_info` VALUES (14, 'Q-408', 'Q-408-1', '78:04:73:CF:AC:0E', 1, '100000', '424917', '前工院408东门', NULL, NULL, NULL, NULL);
INSERT INTO `door_info` VALUES (15, 'Q-411', 'Q-411', NULL, 1, '100000', '424917', '会议室411', NULL, NULL, NULL, NULL);
INSERT INTO `door_info` VALUES (16, 'Q-412', 'Q-412', NULL, 1, '100000', '424917', '会议室412', NULL, NULL, NULL, NULL);
INSERT INTO `door_info` VALUES (17, 'Q-413', 'Q-413', NULL, 1, '100000', '424917', '会议室413', NULL, NULL, NULL, NULL);
INSERT INTO `door_info` VALUES (18, 'QF4', 'QF41', '78:04:73:CF:AC:0E', 1, '100000', '424917', '前工院4楼西门', NULL, NULL, NULL, NULL);
INSERT INTO `door_info` VALUES (19, 'QF4', 'QF42', '78:04:73:CF:D4:A3', 1, '100000', '424917', '前工院4楼中门', NULL, NULL, NULL, NULL);
INSERT INTO `door_info` VALUES (20, 'QF4', 'QF43', '78:04:73:CF:B0:B5', 1, '100000', '424917', '前工院4楼东门', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for door_open_log
-- ----------------------------
DROP TABLE IF EXISTS `door_open_log`;
CREATE TABLE `door_open_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户名',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `door_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门编号',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of door_open_log
-- ----------------------------
INSERT INTO `door_open_log` VALUES (1, 1, '熊琅钰', 'Q-401-1', '2019-05-28 12:46:10', '2019-05-28 12:46:10');
INSERT INTO `door_open_log` VALUES (2, 1, '熊琅钰', 'Q-401-1', '2019-05-28 12:55:54', '2019-05-28 12:55:54');
INSERT INTO `door_open_log` VALUES (3, 1, '熊琅钰', 'Q-401-1', '2019-05-28 17:28:07', '2019-05-28 17:28:07');

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence`  (
  `next_val` bigint(20) NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
INSERT INTO `hibernate_sequence` VALUES (40);

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `stuid` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学号',
  `status` int(11) NULL DEFAULT NULL COMMENT '注册状态 1:已激活 0:未激活',
  `telephone` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码hash值',
  `cid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个推 cid',
  `help_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'help_token',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `last_login_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES (1, '熊琅钰', '174519', 1, '13156533607', '$2a$10$rdVo9Zo8gqyejS7XKZeIn.YkdO18aXb9eKLRpnTf7d1z1bpBF4RBW', 'ecddddec14f4e7a67338ff73730436f7', '天王盖地虎', '2019-05-27 14:49:51', '2019-05-29 15:43:23');
INSERT INTO `member` VALUES (3, '张熠', '184777', 1, '15351990037', '$2a$10$moXRD9FYPKmbBy5UEw0U8utrzLctTaN8AuWZ9.p3IfX9xuFuGQ7..', '58fcabffeffd0a48545882fd49ef332', '宝塔镇河妖', '2019-05-28 20:51:21', '2019-05-31 14:07:19');

-- ----------------------------
-- Table structure for member_login_log
-- ----------------------------
DROP TABLE IF EXISTS `member_login_log`;
CREATE TABLE `member_login_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 61 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member_login_log
-- ----------------------------
INSERT INTO `member_login_log` VALUES (1, 1, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-01-19 15:00:20');
INSERT INTO `member_login_log` VALUES (2, 1, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-03-19 10:10:21');
INSERT INTO `member_login_log` VALUES (3, 2, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-03-27 20:04:59');
INSERT INTO `member_login_log` VALUES (4, 1, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-03-27 20:12:04');
INSERT INTO `member_login_log` VALUES (5, 2, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-03-28 20:32:17');
INSERT INTO `member_login_log` VALUES (6, 2, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-03-28 20:53:44');
INSERT INTO `member_login_log` VALUES (7, 2, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-03-28 21:31:08');
INSERT INTO `member_login_log` VALUES (8, 3, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-04-08 10:23:22');
INSERT INTO `member_login_log` VALUES (9, 3, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-04-08 10:23:51');
INSERT INTO `member_login_log` VALUES (10, 3, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-04-08 10:37:34');
INSERT INTO `member_login_log` VALUES (11, 3, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-04-08 11:16:09');
INSERT INTO `member_login_log` VALUES (12, 3, NULL, '61.160.111.82', NULL, '2019-05-10 09:41:01');
INSERT INTO `member_login_log` VALUES (13, 4, NULL, '61.160.111.82', NULL, '2019-05-10 10:03:17');
INSERT INTO `member_login_log` VALUES (14, 4, NULL, '61.160.111.82', NULL, '2019-05-10 10:04:05');
INSERT INTO `member_login_log` VALUES (15, 4, NULL, '61.160.111.82', NULL, '2019-05-10 10:05:57');
INSERT INTO `member_login_log` VALUES (16, 3, NULL, '61.160.111.82', NULL, '2019-05-10 10:12:29');
INSERT INTO `member_login_log` VALUES (17, 3, NULL, '61.160.111.82', NULL, '2019-05-22 17:27:25');
INSERT INTO `member_login_log` VALUES (18, 3, NULL, '127.0.0.1', NULL, '2019-05-22 17:27:40');
INSERT INTO `member_login_log` VALUES (19, 4, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-27 09:43:33');
INSERT INTO `member_login_log` VALUES (20, 4, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-27 09:45:27');
INSERT INTO `member_login_log` VALUES (21, 4, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-27 10:33:12');
INSERT INTO `member_login_log` VALUES (22, 4, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-27 10:33:19');
INSERT INTO `member_login_log` VALUES (23, 3, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-27 10:34:01');
INSERT INTO `member_login_log` VALUES (24, 3, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-27 10:38:36');
INSERT INTO `member_login_log` VALUES (25, 4, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-27 10:38:49');
INSERT INTO `member_login_log` VALUES (26, 4, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-27 10:39:21');
INSERT INTO `member_login_log` VALUES (27, 5, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-27 10:42:29');
INSERT INTO `member_login_log` VALUES (28, 5, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-27 10:57:06');
INSERT INTO `member_login_log` VALUES (29, 5, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-27 10:57:29');
INSERT INTO `member_login_log` VALUES (30, 5, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-27 10:58:12');
INSERT INTO `member_login_log` VALUES (31, 5, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-27 10:58:35');
INSERT INTO `member_login_log` VALUES (32, 5, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-27 10:59:11');
INSERT INTO `member_login_log` VALUES (33, 5, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-27 11:16:42');
INSERT INTO `member_login_log` VALUES (34, 5, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-27 11:20:35');
INSERT INTO `member_login_log` VALUES (35, 5, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-27 11:21:05');
INSERT INTO `member_login_log` VALUES (36, 5, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-27 11:22:49');
INSERT INTO `member_login_log` VALUES (37, 5, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-27 11:23:02');
INSERT INTO `member_login_log` VALUES (38, 5, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-27 11:23:19');
INSERT INTO `member_login_log` VALUES (39, 5, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-27 11:23:25');
INSERT INTO `member_login_log` VALUES (40, 5, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-27 11:24:37');
INSERT INTO `member_login_log` VALUES (41, 8, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-27 13:30:29');
INSERT INTO `member_login_log` VALUES (42, 8, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-27 13:30:37');
INSERT INTO `member_login_log` VALUES (43, 8, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-27 13:30:48');
INSERT INTO `member_login_log` VALUES (44, 1, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-27 14:50:08');
INSERT INTO `member_login_log` VALUES (45, 1, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-28 16:05:23');
INSERT INTO `member_login_log` VALUES (46, 2, NULL, '61.160.111.82', NULL, '2019-05-28 20:04:22');
INSERT INTO `member_login_log` VALUES (47, 2, NULL, '61.160.111.82', NULL, '2019-05-28 20:07:01');
INSERT INTO `member_login_log` VALUES (48, 2, NULL, '61.160.111.82', NULL, '2019-05-28 20:08:49');
INSERT INTO `member_login_log` VALUES (49, 3, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-28 20:59:51');
INSERT INTO `member_login_log` VALUES (50, 3, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-28 21:38:56');
INSERT INTO `member_login_log` VALUES (51, 3, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-28 22:03:30');
INSERT INTO `member_login_log` VALUES (52, 3, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-29 14:00:04');
INSERT INTO `member_login_log` VALUES (53, 3, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-29 14:21:12');
INSERT INTO `member_login_log` VALUES (54, 1, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-29 15:43:23');
INSERT INTO `member_login_log` VALUES (55, 3, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-29 15:48:46');
INSERT INTO `member_login_log` VALUES (56, 3, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-29 22:24:32');
INSERT INTO `member_login_log` VALUES (57, 3, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-29 22:29:22');
INSERT INTO `member_login_log` VALUES (58, 3, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-30 09:17:46');
INSERT INTO `member_login_log` VALUES (59, 3, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-31 13:41:19');
INSERT INTO `member_login_log` VALUES (60, 3, NULL, '0:0:0:0:0:0:0:1', NULL, '2019-05-31 14:07:19');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', NULL, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016B121697D87874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RenrenScheduler', 'Linton-PC1559379295291', 1559379883220, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INT_PROP_1` int(11) NULL DEFAULT NULL,
  `INT_PROP_2` int(11) NULL DEFAULT NULL,
  `LONG_PROP_1` bigint(20) NULL DEFAULT NULL,
  `LONG_PROP_2` bigint(20) NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PRIORITY` int(11) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', NULL, 1559381400000, 1559379600000, 5, 'WAITING', 'CRON', 1559376704000, 0, NULL, 2, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016B121697D87874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for room_info
-- ----------------------------
DROP TABLE IF EXISTS `room_info`;
CREATE TABLE `room_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `room_id` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '房间编号',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '房间描述',
  `owner` bigint(20) NULL DEFAULT NULL COMMENT '房间的管理者的user_id',
  `tag` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类别 lab, meeting, dining, activity',
  `building` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'QGY: 前工院；DNY：东南院；ZDY：中大院',
  `floor` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '楼层号',
  `room` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '房间号',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `last_modified_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room_info
-- ----------------------------
INSERT INTO `room_info` VALUES (1, 'Q-401', '前工院401', 1, 'lab', 'QGY', '4', '401', NULL, '2019-01-12 00:00:00', NULL, NULL);
INSERT INTO `room_info` VALUES (2, 'Q-402', '前工院402', 1, 'lab', 'QGY', '4', '402', NULL, '2019-01-12 00:00:00', NULL, NULL);
INSERT INTO `room_info` VALUES (3, 'Q-403', '前工院403', 1, 'lab', 'QGY', '4', '403', NULL, '2019-01-12 00:00:00', NULL, NULL);
INSERT INTO `room_info` VALUES (4, 'Q-404', '前工院404', 1, 'lab', 'QGY', '4', '404', NULL, '2019-01-12 00:00:00', NULL, NULL);
INSERT INTO `room_info` VALUES (5, 'Q-405', '前工院405', 1, 'lab', 'QGY', '4', '405', NULL, '2019-01-12 00:00:00', NULL, NULL);
INSERT INTO `room_info` VALUES (6, 'Q-406', '前工院406', 1, 'lab', 'QGY', '4', '406', NULL, '2019-01-12 00:00:00', NULL, NULL);
INSERT INTO `room_info` VALUES (7, 'Q-407', '前工院407', 1, 'lab', 'QGY', '4', '407', NULL, '2019-01-12 00:00:00', NULL, NULL);
INSERT INTO `room_info` VALUES (8, 'Q-408', '前工院408', 1, 'lab', 'QGY', '4', '408', NULL, '2019-01-12 00:00:00', NULL, NULL);
INSERT INTO `room_info` VALUES (9, 'Q-411', '会议室411', 1, 'meeting', 'QGY', '4', '411', NULL, '2019-01-12 00:00:00', NULL, NULL);
INSERT INTO `room_info` VALUES (10, 'Q-412', '会议室412', 1, 'meeting', 'QGY', '4', '412', NULL, '2019-01-12 00:00:00', NULL, NULL);
INSERT INTO `room_info` VALUES (11, 'Q-413', '会议室413', 1, 'meeting', 'QGY', '4', '413', NULL, '2019-01-12 00:00:00', NULL, NULL);
INSERT INTO `room_info` VALUES (12, 'QF4', '前工院4楼', 1, 'floor', 'QGY', '4', '0', NULL, '2019-01-12 00:00:00', NULL, NULL);
INSERT INTO `room_info` VALUES (13, 'Z-209', '中大院209', 1, 'lab', 'ZDY', '2', '209', NULL, '2019-01-12 00:00:00', NULL, NULL);

-- ----------------------------
-- Table structure for room_order
-- ----------------------------
DROP TABLE IF EXISTS `room_order`;
CREATE TABLE `room_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `room_id` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '房间编号',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '预订的用户 id',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预定者的姓名',
  `theme` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预订原因',
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '0: 待审核 1: 审核通过 2：审核未过 3:已过期',
  `auditor_id` bigint(20) NULL DEFAULT NULL COMMENT '审核员',
  `auditor_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核者姓名',
  `start_time` datetime(0) NOT NULL COMMENT '预定开始时间',
  `end_time` datetime(0) NOT NULL COMMENT '预定结束时间 ',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_modified_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of room_order
-- ----------------------------
INSERT INTO `room_order` VALUES (13, 'QF4', 1, '熊琅钰', '开启4楼大门', 3, 1, '熊琅钰', '2019-01-12 14:00:00', '2019-02-12 14:00:00', '2019-05-27 20:33:14', '2019-05-28 10:14:22', '熊琅钰', '熊琅钰');
INSERT INTO `room_order` VALUES (14, 'QF4', 1, '熊琅钰', '开启4楼大门', 0, 1, '熊琅钰', '2019-01-12 14:00:00', '2019-02-12 14:00:00', '2019-05-27 20:39:02', '2019-05-27 20:39:02', '熊琅钰', '熊琅钰');
INSERT INTO `room_order` VALUES (15, 'Q-411', 1, '熊琅钰', '预定会议室', 1, 1, '熊琅钰', '2019-01-12 14:00:00', '2019-02-12 14:00:00', '2019-05-28 10:57:24', '2019-05-28 10:57:24', '熊琅钰', '熊琅钰');
INSERT INTO `room_order` VALUES (16, 'Q-411', 1, '熊琅钰', '预定会议室', 0, 1, '熊琅钰', '2019-01-12 14:00:00', '2019-02-12 14:00:00', '2019-05-28 10:58:21', '2019-05-28 10:58:21', '熊琅钰', '熊琅钰');
INSERT INTO `room_order` VALUES (17, 'Q-411', 1, '熊琅钰', '预定会议室', 0, 1, '熊琅钰', '2019-01-12 14:00:00', '2019-02-12 14:00:00', '2019-05-28 10:59:17', '2019-05-28 10:59:17', '熊琅钰', '熊琅钰');
INSERT INTO `room_order` VALUES (18, 'Q-411', 1, '熊琅钰', '预定会议室', 0, 1, '熊琅钰', '2019-01-12 14:00:00', '2019-02-12 14:00:00', '2019-05-28 11:03:57', '2019-05-28 11:03:57', '熊琅钰', '熊琅钰');
INSERT INTO `room_order` VALUES (19, 'Q-412', 1, '熊琅钰', '预定会议室', 0, 1, '熊琅钰', '2019-01-12 14:00:00', '2019-02-12 14:00:00', '2019-05-28 11:16:47', '2019-05-28 11:16:47', '熊琅钰', '熊琅钰');
INSERT INTO `room_order` VALUES (20, 'QF4', 1, '熊琅钰', '预定会议室', 0, 1, '熊琅钰', '2019-01-12 14:00:00', '2019-02-12 14:00:00', '2019-05-28 11:17:08', '2019-05-28 11:17:08', '熊琅钰', '熊琅钰');
INSERT INTO `room_order` VALUES (21, 'Q-401', 1, '熊琅钰', '预定4楼大门', 3, 1, '熊琅钰', '2019-01-12 14:00:00', '2019-02-12 14:00:00', '2019-05-28 12:32:01', '2019-05-28 12:32:01', '熊琅钰', '熊琅钰');
INSERT INTO `room_order` VALUES (22, 'Q-401', 1, '熊琅钰', '预定4楼大门', 1, 1, '熊琅钰', '2019-01-12 14:00:00', '2019-07-12 14:00:00', '2019-05-28 12:33:22', '2019-05-28 12:33:22', '熊琅钰', '熊琅钰');
INSERT INTO `room_order` VALUES (23, 'Q-401', 1, '熊琅钰', '预定4楼大门', 0, 1, '熊琅钰', '2019-01-12 14:00:00', '2019-07-12 14:00:00', '2019-05-28 12:41:08', '2019-05-28 12:41:08', '熊琅钰', '熊琅钰');
INSERT INTO `room_order` VALUES (24, 'Q-401', 1, '熊琅钰', '预定4楼大门', 0, 1, '熊琅钰', '2019-01-12 14:00:00', '2019-07-12 14:00:00', '2019-05-28 16:02:44', '2019-05-28 16:02:44', 'drelang', 'drelang');
INSERT INTO `room_order` VALUES (25, 'Q-401', 1, '熊琅钰', '预定4楼大门', 1, 1, '熊琅钰', '2019-01-12 14:00:00', '2019-07-12 14:00:00', '2019-05-28 16:10:36', '2019-05-28 16:11:30', 'drelang', 'drelang');
INSERT INTO `room_order` VALUES (26, 'Q-401', 1, '熊琅钰', '预定4楼大门', 0, 1, '熊琅钰', '2019-01-12 14:00:00', '2019-07-12 14:00:00', '2019-05-28 16:19:59', '2019-05-28 16:19:59', '熊琅钰', '熊琅钰');
INSERT INTO `room_order` VALUES (27, 'Q-408', 3, '张熠', '需要在该房间学习', 0, 1, '熊琅钰', '2019-01-12 14:00:00', '2020-01-12 14:00:00', '2019-05-29 14:34:15', '2019-05-29 14:34:15', '张熠', '张熠');
INSERT INTO `room_order` VALUES (28, 'Q-401', 3, '张熠', '预定4楼大门', 0, 1, '熊琅钰', '2019-01-12 14:00:00', '2019-07-12 14:00:00', '2019-05-29 14:42:11', '2019-05-29 14:42:11', '张熠', '张熠');
INSERT INTO `room_order` VALUES (29, 'Q-401', 3, '张熠', '预定4楼大门', 0, 1, '熊琅钰', '2019-01-12 14:00:00', '2019-07-12 14:00:00', '2019-05-31 13:41:24', '2019-05-31 13:41:24', '张熠', '张熠');
INSERT INTO `room_order` VALUES (30, 'Q-401', 3, '张熠', '预定4楼大门', 0, 1, '熊琅钰', '2019-01-12 14:00:00', '2019-07-12 14:00:00', '2019-05-31 14:07:22', '2019-05-31 14:07:22', '张熠', '张熠');

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES (1, 'testTask', 'renren', '0 0/30 * * * ?', 0, '参数测试', '2019-06-01 16:09:59');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log`  (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `job_id`(`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES (1, 1, 'testTask', 'renren', 0, NULL, 2, '2019-06-01 17:00:00');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `param_key`(`param_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', 0, '云存储配置信息');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, 0, '东南大学', 0, 0);
INSERT INTO `sys_dept` VALUES (2, 1, '无锡分校', 1, 0);
INSERT INTO `sys_dept` VALUES (3, 1, 'GoodwayHouse实验室', 2, 0);
INSERT INTO `sys_dept` VALUES (4, 3, '软件部', 0, 0);
INSERT INTO `sys_dept` VALUES (5, 3, '硬件部', 1, 0);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典名称',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典类型',
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典码',
  `value` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典值',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NULL DEFAULT 0 COMMENT '删除标记  -1：已删除  0：正常',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `type`(`type`, `code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1, '性别', 'sex', '0', '女', 0, NULL, 0);
INSERT INTO `sys_dict` VALUES (2, '性别', 'sex', '1', '男', 1, NULL, 0);
INSERT INTO `sys_dict` VALUES (3, '性别', 'sex', '2', '未知', 3, NULL, 0);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{\"userId\":1,\"username\":\"linton\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[],\"createTime\":\"Nov 11, 2016 11:11:11 AM\",\"deptId\":1,\"deptName\":\"人人开源集团\"}', 288, '0:0:0:0:0:0:0:1', '2019-06-01 16:18:57');
INSERT INTO `sys_log` VALUES (2, 'Linton', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":51,\"parentId\":1,\"parentName\":\"系统管理\",\"name\":\"门锁使用记录\",\"url\":\"modules/info/dooropenlog.html\",\"type\":1,\"icon\":\"fa fa-file-code-o\",\"orderNum\":0}', 138, '0:0:0:0:0:0:0:1', '2019-06-01 16:48:02');
INSERT INTO `sys_log` VALUES (3, 'Linton', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '{\"menuId\":52,\"parentId\":0,\"parentName\":\"一级菜单\",\"name\":\"智能锁后台信息\",\"type\":0,\"icon\":\"fa-info\",\"orderNum\":0}', 125, '0:0:0:0:0:0:0:1', '2019-06-01 16:51:29');
INSERT INTO `sys_log` VALUES (4, 'Linton', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '{\"menuId\":51,\"parentId\":52,\"parentName\":\"智能锁后台信息\",\"name\":\"门锁使用记录\",\"url\":\"modules/info/dooropenlog.html\",\"type\":1,\"icon\":\"fa-user-secret\",\"orderNum\":0}', 135, '0:0:0:0:0:0:0:1', '2019-06-01 16:52:21');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', NULL, NULL, 0, 'fa fa-cog', 0);
INSERT INTO `sys_menu` VALUES (2, 1, '管理员管理', 'modules/sys/user.html', NULL, 1, 'fa fa-user', 1);
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'modules/sys/role.html', NULL, 1, 'fa fa-user-secret', 2);
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 'modules/sys/menu.html', NULL, 1, 'fa fa-th-list', 3);
INSERT INTO `sys_menu` VALUES (5, 1, 'SQL监控', 'druid/sql.html', NULL, 1, 'fa fa-bug', 4);
INSERT INTO `sys_menu` VALUES (6, 1, '定时任务', 'modules/job/schedule.html', NULL, 1, 'fa fa-tasks', 5);
INSERT INTO `sys_menu` VALUES (7, 6, '查看', NULL, 'sys:schedule:list,sys:schedule:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (8, 6, '新增', NULL, 'sys:schedule:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (9, 6, '修改', NULL, 'sys:schedule:update', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (10, 6, '删除', NULL, 'sys:schedule:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (11, 6, '暂停', NULL, 'sys:schedule:pause', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (12, 6, '恢复', NULL, 'sys:schedule:resume', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (13, 6, '立即执行', NULL, 'sys:schedule:run', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (14, 6, '日志列表', NULL, 'sys:schedule:log', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:perms', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:perms', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (27, 1, '参数管理', 'modules/sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'fa fa-sun-o', 6);
INSERT INTO `sys_menu` VALUES (29, 1, '系统日志', 'modules/sys/log.html', 'sys:log:list', 1, 'fa fa-file-text-o', 7);
INSERT INTO `sys_menu` VALUES (30, 1, '文件上传', 'modules/oss/oss.html', 'sys:oss:all', 1, 'fa fa-file-image-o', 6);
INSERT INTO `sys_menu` VALUES (31, 1, '部门管理', 'modules/sys/dept.html', NULL, 1, 'fa fa-file-code-o', 1);
INSERT INTO `sys_menu` VALUES (32, 31, '查看', NULL, 'sys:dept:list,sys:dept:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (33, 31, '新增', NULL, 'sys:dept:save,sys:dept:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (34, 31, '修改', NULL, 'sys:dept:update,sys:dept:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (35, 31, '删除', NULL, 'sys:dept:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (36, 1, '字典管理', 'modules/sys/dict.html', NULL, 1, 'fa fa-bookmark-o', 6);
INSERT INTO `sys_menu` VALUES (37, 36, '查看', NULL, 'sys:dict:list,sys:dict:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (38, 36, '新增', NULL, 'sys:dict:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (39, 36, '修改', NULL, 'sys:dict:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (40, 36, '删除', NULL, 'sys:dict:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (41, 1, '', 'modules/info/dooropenlog.html', NULL, 1, 'fa fa-file-code-o', 6);
INSERT INTO `sys_menu` VALUES (42, 41, '查看', NULL, 'info:dooropenlog:list,info:dooropenlog:info', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (43, 41, '新增', NULL, 'info:dooropenlog:save', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (44, 41, '修改', NULL, 'info:dooropenlog:update', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (45, 41, '删除', NULL, 'info:dooropenlog:delete', 2, NULL, 6);
INSERT INTO `sys_menu` VALUES (51, 52, '门锁使用记录', 'modules/info/dooropenlog.html', NULL, 1, 'fa fa-bookmark-o', 0);
INSERT INTO `sys_menu` VALUES (52, 0, '智能锁后台信息', NULL, NULL, 0, 'fa fa-file-text-o', 0);

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件上传' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与部门对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与菜单对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盐',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'Linton', 'e1153123d7d180ceeb820d577ff119876678732a68eef4e6ffc0b1f06a01f91b', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', 1, 1, '2016-11-11 11:11:11');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与角色对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tencent_cos
-- ----------------------------
DROP TABLE IF EXISTS `tencent_cos`;
CREATE TABLE `tencent_cos`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `class` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'url 类型',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件url',
  `created_at` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tencent_cos
-- ----------------------------
INSERT INTO `tencent_cos` VALUES (42, 'help', 'https://smartlock-1251883428.cos.ap-shanghai.myqcloud.com/Helper-0.1.0.0.apk', NULL);
INSERT INTO `tencent_cos` VALUES (43, 'user', 'https://smartlock-1251883428.cos.ap-shanghai.myqcloud.com/Ulocked-0.1.0.0.apk', NULL);
INSERT INTO `tencent_cos` VALUES (44, 'help', 'https://smartlock-1251883428.cos.ap-shanghai.myqcloud.com/Android_APK/Helper-0.1.0.0.apk', NULL);
INSERT INTO `tencent_cos` VALUES (45, 'user', 'https://smartlock-1251883428.cos.ap-shanghai.myqcloud.com/Android_APK/Ulocked-0.1.0.0.apk', NULL);
INSERT INTO `tencent_cos` VALUES (46, 'user', 'https://smartlock-1251883428.cos.ap-shanghai.myqcloud.com/Android_APK/Normal-0.1.1.apk', NULL);
INSERT INTO `tencent_cos` VALUES (47, 'user', 'https://smartlock-1251883428.cos.ap-shanghai.myqcloud.com/Android_APK/Elock_normal-0.2.0.apk', NULL);
INSERT INTO `tencent_cos` VALUES (48, 'user', 'https://smartlock-1251883428.cos.ap-shanghai.myqcloud.com/Android_APK/Elock_normal-v0.2.1.apk', NULL);

SET FOREIGN_KEY_CHECKS = 1;
