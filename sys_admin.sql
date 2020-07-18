/*
Navicat MySQL Data Transfer

Source Server         : J2EE
Source Server Version : 80019
Source Host           : localhost:3306
Source Database       : sys_admin

Target Server Type    : MYSQL
Target Server Version : 80019
File Encoding         : 65001

Date: 2020-07-16 14:16:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for choose_lesson
-- ----------------------------
DROP TABLE IF EXISTS `choose_lesson`;
CREATE TABLE `choose_lesson` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `les_sche_id` int DEFAULT NULL COMMENT '课程表id',
  `choose_user` int DEFAULT NULL COMMENT '选课人id',
  `comment` varchar(100) DEFAULT NULL COMMENT '备注',
  `status` varchar(100) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='选课信息表';

-- ----------------------------
-- Records of choose_lesson
-- ----------------------------
INSERT INTO `choose_lesson` VALUES ('14', '7', '12', null, '未审核');
INSERT INTO `choose_lesson` VALUES ('15', '8', '14', null, '未审核');
INSERT INTO `choose_lesson` VALUES ('16', '9', '14', null, '未审核');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `CID` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `CName` varchar(100) DEFAULT NULL COMMENT '课程名称',
  `SubID` varchar(100) DEFAULT NULL COMMENT '学科名称',
  `LessonNum` smallint DEFAULT NULL COMMENT '节次号',
  `Price` smallint DEFAULT NULL COMMENT '价格',
  `Comment` varchar(512) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`CID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='课程表';

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('3', 'Java程序设计', '计算机科学', '1', '800', 'Java程序基础');
INSERT INTO `course` VALUES ('4', '数据库系统原理', '计算机科学', '5', '400', '1');

-- ----------------------------
-- Table structure for leave_course
-- ----------------------------
DROP TABLE IF EXISTS `leave_course`;
CREATE TABLE `leave_course` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `chls_id` int DEFAULT NULL COMMENT '已选课id',
  `levea_user` int DEFAULT NULL COMMENT '请假人id',
  `comment` varchar(500) DEFAULT NULL COMMENT '请假事由',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='课堂请假信息表';

-- ----------------------------
-- Records of leave_course
-- ----------------------------
INSERT INTO `leave_course` VALUES ('6', '14', '12', '该课已请假');
INSERT INTO `leave_course` VALUES ('7', '15', '14', '该课已请假');

-- ----------------------------
-- Table structure for lesson_schedule
-- ----------------------------
DROP TABLE IF EXISTS `lesson_schedule`;
CREATE TABLE `lesson_schedule` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `course_id` int DEFAULT NULL COMMENT '课程id',
  `week_id` int DEFAULT NULL COMMENT '上课周次id',
  `time_id` int DEFAULT NULL COMMENT '时间id',
  `comment` varchar(100) DEFAULT NULL COMMENT '备注',
  `teacher_id` varchar(100) DEFAULT NULL COMMENT '教师id',
  `status` varchar(100) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='教学班表';

-- ----------------------------
-- Records of lesson_schedule
-- ----------------------------
INSERT INTO `lesson_schedule` VALUES ('7', '3', '2', '1', '1', '13', null);
INSERT INTO `lesson_schedule` VALUES ('8', '4', '13', '3', '1', '15', null);
INSERT INTO `lesson_schedule` VALUES ('9', '4', '3', '2', '12', '13', null);

-- ----------------------------
-- Table structure for payinfo
-- ----------------------------
DROP TABLE IF EXISTS `payinfo`;
CREATE TABLE `payinfo` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `StudentId` int DEFAULT NULL COMMENT '学生id',
  `PayAmount` double(9,2) DEFAULT NULL COMMENT '支付账户',
  `PayTime` datetime DEFAULT NULL COMMENT '支付时间',
  PRIMARY KEY (`id`),
  KEY `FK_Relationship_14` (`StudentId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='订单信息';

-- ----------------------------
-- Records of payinfo
-- ----------------------------
INSERT INTO `payinfo` VALUES ('3', '12', '720.00', '2020-07-15 16:33:08');
INSERT INTO `payinfo` VALUES ('4', '14', '320.00', '2020-07-16 09:18:06');
INSERT INTO `payinfo` VALUES ('5', '14', '320.00', '2020-07-16 09:19:07');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `oper_method` varchar(250) DEFAULT NULL COMMENT '操作方法',
  `request_param` varchar(500) DEFAULT NULL COMMENT '操作参数',
  `oper_desc` varchar(255) DEFAULT NULL COMMENT '操作说明',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('44', '1', 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"permissionIds\":\",14,20,23,24,21,1,2,3,4,5,6,7,8,9,10,11,12,13,16,17,18,25,\",\"roleCode\":\"student\",\"roleName\":\"学生\"}', '保存角色操作', '2020-07-13 11:29:34', '2020-07-13 11:29:34');
INSERT INTO `sys_log` VALUES ('45', '1', 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"permissionIds\":\"\",\"roleCode\":\"teacher\",\"roleName\":\"教师\"}', '保存角色操作', '2020-07-13 13:07:33', '2020-07-13 13:07:33');
INSERT INTO `sys_log` VALUES ('46', '1', 'admin', 'com.xieke.admin.web.RoleController.delBatch', '[2]', '删除角色操作', '2020-07-13 13:07:38', '2020-07-13 13:07:38');
INSERT INTO `sys_log` VALUES ('47', '1', 'admin', 'com.xieke.admin.web.UserController.edit', '{\"id\":9,\"name\":\"test\",\"roleId\":3,\"state\":1}', '修改用户操作', '2020-07-13 13:07:54', '2020-07-13 13:07:54');
INSERT INTO `sys_log` VALUES ('48', '1', 'admin', 'com.xieke.admin.web.RoleController.delBatch', '[2]', '删除角色操作', '2020-07-13 13:08:13', '2020-07-13 13:08:13');
INSERT INTO `sys_log` VALUES ('49', '1', 'admin', 'com.xieke.admin.web.UserController.edit', '{\"id\":9,\"name\":\"stu1\",\"roleId\":3,\"state\":1}', '修改用户操作', '2020-07-13 13:15:01', '2020-07-13 13:15:01');
INSERT INTO `sys_log` VALUES ('50', '1', 'admin', 'com.xieke.admin.web.UserController.add', '{\"name\":\"tea1\",\"passWord\":\"123456\",\"roleId\":4,\"state\":1,\"userName\":\"tea1\"}', '添加用户操作', '2020-07-13 13:16:34', '2020-07-13 13:16:34');
INSERT INTO `sys_log` VALUES ('51', '1', 'admin', 'com.xieke.admin.web.UserController.edit', '{\"age\":22,\"email\":\"123@qq.com\",\"id\":1,\"name\":\"超级管理员\",\"phone\":\"13333334444\",\"qq\":\"123456\",\"rate\":1.0,\"roleId\":1,\"sex\":\"男\",\"state\":1}', '修改用户操作', '2020-07-13 13:55:39', '2020-07-13 13:55:39');
INSERT INTO `sys_log` VALUES ('52', '1', 'admin', 'com.xieke.admin.web.UserController.edit', '{\"age\":13,\"email\":\"774283093@qq.com\",\"id\":1,\"name\":\"超级管理员\",\"phone\":\"13333334444\",\"qq\":\"123456\",\"rate\":1.0,\"roleId\":1,\"sex\":\"男\",\"state\":1}', '修改用户操作', '2020-07-13 13:59:32', '2020-07-13 13:59:32');
INSERT INTO `sys_log` VALUES ('53', '1', 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":1,\"permissionIds\":\",14,20,23,24,21,1,2,3,4,5,6,7,8,9,10,11,12,13,26,34,35,36,16,17,18,25,\",\"roleCode\":\"admin\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2020-07-13 14:33:57', '2020-07-13 14:33:57');
INSERT INTO `sys_log` VALUES ('54', '1', 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":1,\"permissionIds\":\",14,20,23,24,21,1,2,3,4,5,6,7,8,9,10,11,12,13,26,34,35,36,16,17,18,25,\",\"roleCode\":\"admin\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2020-07-13 14:35:32', '2020-07-13 14:35:32');
INSERT INTO `sys_log` VALUES ('55', '1', 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":1,\"permissionIds\":\",14,20,23,24,21,1,2,3,4,5,6,7,8,9,10,11,12,13,26,34,35,36,37,38,39,40,41,42,43,44,16,17,18,25,\",\"roleCode\":\"admin\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2020-07-13 16:21:39', '2020-07-13 16:21:39');
INSERT INTO `sys_log` VALUES ('56', '1', 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":1,\"permissionIds\":\",14,20,23,24,21,1,2,3,4,5,6,7,8,9,10,11,12,13,26,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,16,17,18,25,\",\"roleCode\":\"admin\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2020-07-13 17:29:20', '2020-07-13 17:29:20');
INSERT INTO `sys_log` VALUES ('57', '1', 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":1,\"permissionIds\":\",1,2,3,4,5,6,7,8,9,10,11,12,13,26,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,25,\",\"roleCode\":\"admin\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2020-07-13 22:43:43', '2020-07-13 22:43:43');
INSERT INTO `sys_log` VALUES ('58', '1', 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":1,\"permissionIds\":\",1,2,3,4,5,6,7,8,9,10,11,12,13,26,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,25,57,58,\",\"roleCode\":\"admin\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2020-07-14 14:41:10', '2020-07-14 14:41:10');
INSERT INTO `sys_log` VALUES ('59', '1', 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":1,\"permissionIds\":\",1,2,3,4,5,6,7,8,9,10,11,12,13,26,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,59,60,61,62,25,57,58,\",\"roleCode\":\"admin\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2020-07-14 15:51:54', '2020-07-14 15:51:54');
INSERT INTO `sys_log` VALUES ('60', '1', 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":1,\"permissionIds\":\",1,2,3,4,5,6,7,8,9,10,11,12,13,26,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,59,60,61,62,25,57,58,63,64,\",\"roleCode\":\"admin\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2020-07-14 17:12:43', '2020-07-14 17:12:43');
INSERT INTO `sys_log` VALUES ('61', '1', 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":4,\"permissionIds\":\",1,58,64,\",\"roleCode\":\"teacher\",\"roleName\":\"教师\"}', '保存角色操作', '2020-07-14 19:58:23', '2020-07-14 19:58:23');
INSERT INTO `sys_log` VALUES ('62', '1', 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":1,\"permissionIds\":\",1,2,3,4,5,6,7,8,9,10,11,12,13,26,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,59,60,61,62,25,57,58,63,64,65,\",\"roleCode\":\"admin\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2020-07-15 10:32:33', '2020-07-15 10:32:33');
INSERT INTO `sys_log` VALUES ('63', '1', 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":1,\"permissionIds\":\",1,2,3,4,5,6,7,8,9,10,11,12,13,26,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,59,60,61,62,57,58,63,64,65,\",\"roleCode\":\"admin\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2020-07-15 10:33:18', '2020-07-15 10:33:18');
INSERT INTO `sys_log` VALUES ('64', '1', 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":3,\"permissionIds\":\",1,2,3,4,5,6,7,8,9,10,11,12,13,\",\"roleCode\":\"student\",\"roleName\":\"学生\"}', '保存角色操作', '2020-07-15 10:33:29', '2020-07-15 10:33:29');
INSERT INTO `sys_log` VALUES ('65', '1', 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":4,\"permissionIds\":\",1,58,64,\",\"roleCode\":\"teacher\",\"roleName\":\"教师\"}', '保存角色操作', '2020-07-15 10:33:34', '2020-07-15 10:33:34');
INSERT INTO `sys_log` VALUES ('66', '1', 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":1,\"permissionIds\":\",1,2,3,4,5,6,7,8,9,10,11,12,13,26,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,59,60,61,62,\",\"roleCode\":\"admin\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2020-07-15 10:36:23', '2020-07-15 10:36:23');
INSERT INTO `sys_log` VALUES ('67', '1', 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":3,\"permissionIds\":\",1,57,63,65,\",\"roleCode\":\"student\",\"roleName\":\"学生\"}', '保存角色操作', '2020-07-15 10:36:52', '2020-07-15 10:36:52');
INSERT INTO `sys_log` VALUES ('68', '1', 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":4,\"permissionIds\":\",1,45,46,47,48,58,64,\",\"roleCode\":\"teacher\",\"roleName\":\"教师\"}', '保存角色操作', '2020-07-15 10:37:19', '2020-07-15 10:37:19');
INSERT INTO `sys_log` VALUES ('69', '1', 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":4,\"permissionIds\":\",1,26,34,35,36,58,64,66,\",\"roleCode\":\"teacher\",\"roleName\":\"教师\"}', '保存角色操作', '2020-07-15 10:47:15', '2020-07-15 10:47:15');
INSERT INTO `sys_log` VALUES ('70', '1', 'admin', 'com.xieke.admin.web.UserController.delBatch', '[9]', '删除用户操作', '2020-07-15 10:47:37', '2020-07-15 10:47:37');
INSERT INTO `sys_log` VALUES ('71', '1', 'admin', 'com.xieke.admin.web.UserController.add', '{\"age\":21,\"amount\":9000.0,\"email\":\"123@qq.com\",\"name\":\"学生王\",\"passWord\":\"123456\",\"phone\":\"13333334444\",\"qq\":\"123456\",\"rate\":1.0,\"roleId\":3,\"sex\":\"男\",\"state\":1,\"userName\":\"stu1\"}', '添加用户操作', '2020-07-15 10:48:18', '2020-07-15 10:48:18');
INSERT INTO `sys_log` VALUES ('72', '1', 'admin', 'com.xieke.admin.web.UserController.delBatch', '[10,11]', '删除用户操作', '2020-07-15 16:23:00', '2020-07-15 16:23:00');
INSERT INTO `sys_log` VALUES ('73', '1', 'admin', 'com.xieke.admin.web.UserController.add', '{\"age\":20,\"amount\":800.0,\"email\":\"kittenstone@163.com\",\"name\":\"朱克磊\",\"passWord\":\"123456\",\"phone\":\"19916089409\",\"qq\":\"1840766790\",\"rate\":0.9,\"roleId\":3,\"sex\":\"男\",\"state\":1,\"userName\":\"zhukelei\"}', '添加用户操作', '2020-07-15 16:24:13', '2020-07-15 16:24:13');
INSERT INTO `sys_log` VALUES ('74', '1', 'admin', 'com.xieke.admin.web.UserController.add', '{\"age\":20,\"amount\":1233.0,\"email\":\"1320252689@qq.com\",\"name\":\"任康华\",\"passWord\":\"123456\",\"phone\":\"18720775793\",\"qq\":\"1320252689\",\"rate\":0.8,\"roleId\":4,\"sex\":\"男\",\"state\":1,\"userName\":\"renkanghua\"}', '添加用户操作', '2020-07-15 16:26:47', '2020-07-15 16:26:47');
INSERT INTO `sys_log` VALUES ('75', '1', 'admin', 'com.xieke.admin.web.UserController.add', '{\"age\":20,\"amount\":1234.0,\"email\":\"123@123.com\",\"name\":\"陈云\",\"passWord\":\"123456\",\"phone\":\"123\",\"qq\":\"123\",\"rate\":0.8,\"roleId\":3,\"sex\":\"男\",\"state\":1,\"userName\":\"chenyun\"}', '添加用户操作', '2020-07-15 16:28:06', '2020-07-15 16:28:06');
INSERT INTO `sys_log` VALUES ('76', '1', 'admin', 'com.xieke.admin.web.UserController.add', '{\"age\":20,\"amount\":888.0,\"email\":\"123@123.com\",\"name\":\"周靖宇\",\"passWord\":\"123456\",\"phone\":\"123\",\"qq\":\"123\",\"rate\":0.9,\"roleId\":4,\"sex\":\"男\",\"state\":1,\"userName\":\"zhoujingyu\"}', '添加用户操作', '2020-07-15 16:28:40', '2020-07-15 16:28:40');
INSERT INTO `sys_log` VALUES ('77', '1', 'admin', 'com.xieke.admin.web.PermissionController.delBatch', '[36]', '删除权限操作', '2020-07-15 18:29:54', '2020-07-15 18:29:54');
INSERT INTO `sys_log` VALUES ('78', '1', 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"id\":66,\"parentId\":1,\"permissionCode\":\"lessonSchedule:view\",\"permissionName\":\"选课(教师)\",\"resourceType\":\"menu\",\"url\":\"/lessonSchedule/list\"}', '保存权限操作', '2020-07-16 07:15:16', '2020-07-16 07:15:16');
INSERT INTO `sys_log` VALUES ('79', '1', 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"id\":66,\"parentId\":1,\"permissionCode\":\"lessonSchedule:view\",\"permissionName\":\"教学班信息(教师)\",\"resourceType\":\"menu\",\"url\":\"/lessonSchedule/list\"}', '保存权限操作', '2020-07-16 07:17:30', '2020-07-16 07:17:30');
INSERT INTO `sys_log` VALUES ('80', '1', 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"id\":66,\"parentId\":1,\"permissionCode\":\"lessonSchedule:view\",\"permissionName\":\"教学班信息(教师)\",\"resourceType\":\"menu\",\"url\":\"/lessonSchedule/teach_list\"}', '保存权限操作', '2020-07-16 07:17:52', '2020-07-16 07:17:52');
INSERT INTO `sys_log` VALUES ('81', '1', 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"id\":66,\"parentId\":1,\"permissionCode\":\"lessonSchedule:view\",\"permissionName\":\"选课(教师)\",\"resourceType\":\"menu\",\"url\":\"/lessonSchedule/teach_list\"}', '保存权限操作', '2020-07-16 07:19:32', '2020-07-16 07:19:32');
INSERT INTO `sys_log` VALUES ('82', '1', 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"id\":66,\"parentId\":1,\"permissionCode\":\"lessonSchedule:view\",\"permissionName\":\"选课(教师)\",\"resourceType\":\"menu\",\"url\":\"/lessonSchedule/teach_choose_list\"}', '保存权限操作', '2020-07-16 07:20:17', '2020-07-16 07:20:17');
INSERT INTO `sys_log` VALUES ('83', '1', 'admin', 'com.xieke.admin.web.UserController.add', '{\"age\":20,\"amount\":99999.0,\"email\":\"123@163.com\",\"name\":\"stu\",\"passWord\":\"123456\",\"phone\":\"123\",\"qq\":\"1227793396\",\"rate\":0.9,\"roleId\":3,\"sex\":\"男\",\"state\":1,\"userName\":\"stu\"}', '添加用户操作', '2020-07-16 09:14:37', '2020-07-16 09:14:37');

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `ip_address` varchar(50) DEFAULT NULL COMMENT 'IP地址',
  `geography_location` varchar(50) DEFAULT NULL COMMENT '地理位置',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8 COMMENT='登录日志';

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES ('71', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-13 10:51:56', '2020-07-13 10:51:56');
INSERT INTO `sys_login_log` VALUES ('72', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-13 10:55:11', '2020-07-13 10:55:11');
INSERT INTO `sys_login_log` VALUES ('73', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-13 11:29:34', '2020-07-13 11:29:34');
INSERT INTO `sys_login_log` VALUES ('74', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-13 13:07:13', '2020-07-13 13:07:13');
INSERT INTO `sys_login_log` VALUES ('75', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-13 13:35:23', '2020-07-13 13:35:23');
INSERT INTO `sys_login_log` VALUES ('76', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-13 13:44:04', '2020-07-13 13:44:04');
INSERT INTO `sys_login_log` VALUES ('77', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-13 14:25:42', '2020-07-13 14:25:42');
INSERT INTO `sys_login_log` VALUES ('78', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-13 14:31:17', '2020-07-13 14:31:17');
INSERT INTO `sys_login_log` VALUES ('79', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-13 14:34:11', '2020-07-13 14:34:11');
INSERT INTO `sys_login_log` VALUES ('80', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-13 16:01:39', '2020-07-13 16:01:39');
INSERT INTO `sys_login_log` VALUES ('81', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-13 16:21:47', '2020-07-13 16:21:47');
INSERT INTO `sys_login_log` VALUES ('82', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-13 16:55:35', '2020-07-13 16:55:35');
INSERT INTO `sys_login_log` VALUES ('83', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-13 17:29:08', '2020-07-13 17:29:08');
INSERT INTO `sys_login_log` VALUES ('84', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-13 17:29:33', '2020-07-13 17:29:33');
INSERT INTO `sys_login_log` VALUES ('85', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-13 19:53:38', '2020-07-13 19:53:38');
INSERT INTO `sys_login_log` VALUES ('86', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-13 20:26:04', '2020-07-13 20:26:04');
INSERT INTO `sys_login_log` VALUES ('87', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-13 21:36:58', '2020-07-13 21:36:58');
INSERT INTO `sys_login_log` VALUES ('88', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-13 22:10:02', '2020-07-13 22:10:02');
INSERT INTO `sys_login_log` VALUES ('89', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-13 22:33:32', '2020-07-13 22:33:32');
INSERT INTO `sys_login_log` VALUES ('90', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-13 22:43:54', '2020-07-13 22:43:54');
INSERT INTO `sys_login_log` VALUES ('91', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-14 09:54:26', '2020-07-14 09:54:26');
INSERT INTO `sys_login_log` VALUES ('92', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-14 10:29:19', '2020-07-14 10:29:19');
INSERT INTO `sys_login_log` VALUES ('93', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-14 10:40:19', '2020-07-14 10:40:19');
INSERT INTO `sys_login_log` VALUES ('94', '1', 'admin', '127.0.0.1', null, '2020-07-14 10:56:05', '2020-07-14 10:56:05');
INSERT INTO `sys_login_log` VALUES ('95', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-14 13:15:18', '2020-07-14 13:15:18');
INSERT INTO `sys_login_log` VALUES ('96', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-14 13:55:27', '2020-07-14 13:55:27');
INSERT INTO `sys_login_log` VALUES ('97', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-14 14:40:53', '2020-07-14 14:40:53');
INSERT INTO `sys_login_log` VALUES ('98', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-14 14:41:20', '2020-07-14 14:41:20');
INSERT INTO `sys_login_log` VALUES ('99', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-14 15:05:38', '2020-07-14 15:05:38');
INSERT INTO `sys_login_log` VALUES ('100', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-14 15:35:38', '2020-07-14 15:35:38');
INSERT INTO `sys_login_log` VALUES ('101', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-14 15:52:02', '2020-07-14 15:52:02');
INSERT INTO `sys_login_log` VALUES ('102', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-14 16:19:07', '2020-07-14 16:19:07');
INSERT INTO `sys_login_log` VALUES ('103', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-14 17:12:24', '2020-07-14 17:12:24');
INSERT INTO `sys_login_log` VALUES ('104', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-14 17:12:34', '2020-07-14 17:12:34');
INSERT INTO `sys_login_log` VALUES ('105', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-14 17:12:50', '2020-07-14 17:12:50');
INSERT INTO `sys_login_log` VALUES ('106', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-14 17:14:16', '2020-07-14 17:14:16');
INSERT INTO `sys_login_log` VALUES ('107', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-14 17:17:33', '2020-07-14 17:17:33');
INSERT INTO `sys_login_log` VALUES ('108', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-14 17:20:28', '2020-07-14 17:20:28');
INSERT INTO `sys_login_log` VALUES ('109', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-14 19:55:42', '2020-07-14 19:55:42');
INSERT INTO `sys_login_log` VALUES ('110', '10', 'tea1', '0:0:0:0:0:0:0:1', null, '2020-07-14 19:58:38', '2020-07-14 19:58:38');
INSERT INTO `sys_login_log` VALUES ('111', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-14 20:29:21', '2020-07-14 20:29:21');
INSERT INTO `sys_login_log` VALUES ('112', '10', 'tea1', '0:0:0:0:0:0:0:1', null, '2020-07-14 20:29:38', '2020-07-14 20:29:38');
INSERT INTO `sys_login_log` VALUES ('113', '10', 'tea1', '0:0:0:0:0:0:0:1', null, '2020-07-14 21:05:04', '2020-07-14 21:05:04');
INSERT INTO `sys_login_log` VALUES ('114', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-14 21:08:28', '2020-07-14 21:08:28');
INSERT INTO `sys_login_log` VALUES ('115', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-14 21:43:21', '2020-07-14 21:43:21');
INSERT INTO `sys_login_log` VALUES ('116', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-15 10:05:09', '2020-07-15 10:05:09');
INSERT INTO `sys_login_log` VALUES ('117', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-15 10:32:42', '2020-07-15 10:32:42');
INSERT INTO `sys_login_log` VALUES ('118', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-15 10:33:57', '2020-07-15 10:33:57');
INSERT INTO `sys_login_log` VALUES ('119', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-15 10:35:58', '2020-07-15 10:35:58');
INSERT INTO `sys_login_log` VALUES ('120', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-15 10:37:28', '2020-07-15 10:37:28');
INSERT INTO `sys_login_log` VALUES ('121', '10', 'tea1', '0:0:0:0:0:0:0:1', null, '2020-07-15 10:39:25', '2020-07-15 10:39:25');
INSERT INTO `sys_login_log` VALUES ('122', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-15 10:46:49', '2020-07-15 10:46:49');
INSERT INTO `sys_login_log` VALUES ('123', '11', 'stu1', '0:0:0:0:0:0:0:1', null, '2020-07-15 10:48:40', '2020-07-15 10:48:40');
INSERT INTO `sys_login_log` VALUES ('124', '10', 'tea1', '0:0:0:0:0:0:0:1', null, '2020-07-15 10:52:53', '2020-07-15 10:52:53');
INSERT INTO `sys_login_log` VALUES ('125', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-15 10:57:08', '2020-07-15 10:57:08');
INSERT INTO `sys_login_log` VALUES ('126', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-15 16:08:17', '2020-07-15 16:08:17');
INSERT INTO `sys_login_log` VALUES ('127', '11', 'stu1', '0:0:0:0:0:0:0:1', null, '2020-07-15 16:09:21', '2020-07-15 16:09:21');
INSERT INTO `sys_login_log` VALUES ('128', '10', 'tea1', '0:0:0:0:0:0:0:1', null, '2020-07-15 16:10:20', '2020-07-15 16:10:20');
INSERT INTO `sys_login_log` VALUES ('129', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-15 16:19:38', '2020-07-15 16:19:38');
INSERT INTO `sys_login_log` VALUES ('130', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-15 16:30:26', '2020-07-15 16:30:26');
INSERT INTO `sys_login_log` VALUES ('131', '12', 'zhukelei', '0:0:0:0:0:0:0:1', null, '2020-07-15 16:33:02', '2020-07-15 16:33:02');
INSERT INTO `sys_login_log` VALUES ('132', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-15 16:42:13', '2020-07-15 16:42:13');
INSERT INTO `sys_login_log` VALUES ('133', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-15 18:23:42', '2020-07-15 18:23:42');
INSERT INTO `sys_login_log` VALUES ('134', '12', 'zhukelei', '0:0:0:0:0:0:0:1', null, '2020-07-15 18:24:21', '2020-07-15 18:24:21');
INSERT INTO `sys_login_log` VALUES ('135', '15', 'zhoujingyu', '0:0:0:0:0:0:0:1', null, '2020-07-15 18:25:00', '2020-07-15 18:25:00');
INSERT INTO `sys_login_log` VALUES ('136', '13', 'renkanghua', '0:0:0:0:0:0:0:1', null, '2020-07-15 18:26:29', '2020-07-15 18:26:29');
INSERT INTO `sys_login_log` VALUES ('137', '15', 'zhoujingyu', '0:0:0:0:0:0:0:1', null, '2020-07-15 18:26:55', '2020-07-15 18:26:55');
INSERT INTO `sys_login_log` VALUES ('138', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-15 18:28:23', '2020-07-15 18:28:23');
INSERT INTO `sys_login_log` VALUES ('139', '15', 'zhoujingyu', '0:0:0:0:0:0:0:1', null, '2020-07-15 18:30:14', '2020-07-15 18:30:14');
INSERT INTO `sys_login_log` VALUES ('140', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-15 18:32:54', '2020-07-15 18:32:54');
INSERT INTO `sys_login_log` VALUES ('141', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-15 20:42:58', '2020-07-15 20:42:58');
INSERT INTO `sys_login_log` VALUES ('142', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-16 07:02:34', '2020-07-16 07:02:34');
INSERT INTO `sys_login_log` VALUES ('143', '12', 'zhukelei', '0:0:0:0:0:0:0:1', null, '2020-07-16 07:04:36', '2020-07-16 07:04:36');
INSERT INTO `sys_login_log` VALUES ('144', '13', 'renkanghua', '0:0:0:0:0:0:0:1', null, '2020-07-16 07:05:11', '2020-07-16 07:05:11');
INSERT INTO `sys_login_log` VALUES ('145', '15', 'zhoujingyu', '0:0:0:0:0:0:0:1', null, '2020-07-16 07:06:14', '2020-07-16 07:06:14');
INSERT INTO `sys_login_log` VALUES ('146', '15', 'zhoujingyu', '0:0:0:0:0:0:0:1', null, '2020-07-16 07:06:52', '2020-07-16 07:06:52');
INSERT INTO `sys_login_log` VALUES ('147', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-16 07:14:22', '2020-07-16 07:14:22');
INSERT INTO `sys_login_log` VALUES ('148', '15', 'zhoujingyu', '0:0:0:0:0:0:0:1', null, '2020-07-16 07:15:26', '2020-07-16 07:15:26');
INSERT INTO `sys_login_log` VALUES ('149', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-16 07:15:45', '2020-07-16 07:15:45');
INSERT INTO `sys_login_log` VALUES ('150', '15', 'zhoujingyu', '0:0:0:0:0:0:0:1', null, '2020-07-16 07:18:11', '2020-07-16 07:18:11');
INSERT INTO `sys_login_log` VALUES ('151', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-16 07:18:34', '2020-07-16 07:18:34');
INSERT INTO `sys_login_log` VALUES ('152', '15', 'zhoujingyu', '0:0:0:0:0:0:0:1', null, '2020-07-16 07:19:44', '2020-07-16 07:19:44');
INSERT INTO `sys_login_log` VALUES ('153', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-16 07:19:53', '2020-07-16 07:19:53');
INSERT INTO `sys_login_log` VALUES ('154', '15', 'zhoujingyu', '0:0:0:0:0:0:0:1', null, '2020-07-16 07:20:33', '2020-07-16 07:20:33');
INSERT INTO `sys_login_log` VALUES ('155', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-16 08:01:04', '2020-07-16 08:01:04');
INSERT INTO `sys_login_log` VALUES ('156', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-16 08:51:45', '2020-07-16 08:51:45');
INSERT INTO `sys_login_log` VALUES ('157', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-16 09:13:11', '2020-07-16 09:13:11');
INSERT INTO `sys_login_log` VALUES ('158', '12', 'zhukelei', '0:0:0:0:0:0:0:1', null, '2020-07-16 09:17:26', '2020-07-16 09:17:26');
INSERT INTO `sys_login_log` VALUES ('159', '14', 'chenyun', '0:0:0:0:0:0:0:1', null, '2020-07-16 09:17:58', '2020-07-16 09:17:58');
INSERT INTO `sys_login_log` VALUES ('160', '13', 'renkanghua', '0:0:0:0:0:0:0:1', null, '2020-07-16 09:19:44', '2020-07-16 09:19:44');
INSERT INTO `sys_login_log` VALUES ('161', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-16 09:20:57', '2020-07-16 09:20:57');
INSERT INTO `sys_login_log` VALUES ('162', '1', 'admin', '0:0:0:0:0:0:0:1', null, '2020-07-16 10:20:36', '2020-07-16 10:20:36');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `available` tinyint(1) DEFAULT NULL COMMENT '是否可用',
  `permission_name` varchar(50) DEFAULT NULL COMMENT '权限名称',
  `parent_id` int DEFAULT NULL COMMENT '父权限ID',
  `parent_ids` varchar(255) DEFAULT NULL COMMENT '父权限ID列表',
  `permission_code` varchar(50) DEFAULT NULL COMMENT '权限编码',
  `resource_type` varchar(50) DEFAULT NULL COMMENT '资源类型(top_directory/directory/menu/button)',
  `url` varchar(50) DEFAULT NULL COMMENT '资源路径',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='系统权限';

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', '1', '系统管理', '0', '0', 'system', 'top_directory', null, '2018-07-10 11:24:48', '2018-07-10 11:24:48');
INSERT INTO `sys_permission` VALUES ('2', '1', '用户管理', '1', '0/1', 'user:view', 'menu', '/user/list', '2018-07-10 11:24:48', '2018-07-10 11:24:48');
INSERT INTO `sys_permission` VALUES ('3', '1', '添加', '2', '0/1/2', 'user:add', 'button', '', '2018-07-10 11:25:40', '2018-07-10 11:25:40');
INSERT INTO `sys_permission` VALUES ('4', '1', '删除', '2', '0/1/2', 'user:del', 'button', '', '2018-07-10 11:27:10', '2018-07-10 11:27:10');
INSERT INTO `sys_permission` VALUES ('5', '1', '编辑', '2', '0/1/2', 'user:edit', 'button', '', '2018-11-17 14:54:52', '2018-07-10 11:27:36');
INSERT INTO `sys_permission` VALUES ('6', '1', '角色管理', '1', '0/1', 'role:view', 'menu', '/role/list', '2018-08-04 09:38:44', '2018-08-04 09:38:44');
INSERT INTO `sys_permission` VALUES ('7', '1', '添加', '6', '0/1/6', 'role:add', 'button', '', '2018-08-04 09:42:05', '2018-08-04 09:42:05');
INSERT INTO `sys_permission` VALUES ('8', '1', '删除', '6', '0/1/6', 'role:del', 'button', '', '2018-11-17 15:01:41', '2018-08-04 09:43:26');
INSERT INTO `sys_permission` VALUES ('9', '1', '编辑', '6', '0/1/6', 'role:edit', 'button', '', '2018-08-04 09:46:01', '2018-08-04 09:46:01');
INSERT INTO `sys_permission` VALUES ('10', '1', '菜单权限管理', '1', '0/1', 'permission:view', 'menu', '/permission/list', '2018-08-04 09:48:57', '2018-08-04 09:48:57');
INSERT INTO `sys_permission` VALUES ('11', '1', '添加', '10', '0/1/10', 'permission:add', 'button', '', '2018-08-04 09:50:50', '2018-08-04 09:50:50');
INSERT INTO `sys_permission` VALUES ('12', '1', '删除', '10', '0/1/10', 'permission:del', 'button', '', '2018-08-04 09:50:50', '2018-08-04 09:50:50');
INSERT INTO `sys_permission` VALUES ('13', '1', '编辑', '10', '0/1/10', 'permission:edit', 'button', '', '2018-08-23 11:33:34', '2018-08-23 11:33:34');
INSERT INTO `sys_permission` VALUES ('26', '1', '课程信息', '1', '0/1', 'course:view', 'menu', '/course/list', '2020-07-13 14:26:54', '2020-07-13 14:26:54');
INSERT INTO `sys_permission` VALUES ('34', '1', '添加', '26', '0/1/26', 'course:add', 'button', '', '2020-07-13 14:26:54', '2020-07-13 14:26:54');
INSERT INTO `sys_permission` VALUES ('35', '1', '编辑', '26', '0/1/26', 'course:edit', 'button', '', '2020-07-13 14:26:54', '2020-07-13 14:26:54');
INSERT INTO `sys_permission` VALUES ('37', '1', '教学时间-节次', '1', '0/1', 'teachTime:view', 'menu', '/teachTime/list', '2020-07-13 16:13:13', '2020-07-13 16:13:13');
INSERT INTO `sys_permission` VALUES ('38', '1', '添加', '37', '0/1/37', 'teachTime:add', 'button', '', '2020-07-13 16:13:13', '2020-07-13 16:13:13');
INSERT INTO `sys_permission` VALUES ('39', '1', '编辑', '37', '0/1/37', 'teachTime:edit', 'button', '', '2020-07-13 16:13:13', '2020-07-13 16:13:13');
INSERT INTO `sys_permission` VALUES ('40', '1', '删除', '37', '0/1/37', 'teachTime:del', 'button', '', '2020-07-13 16:13:13', '2020-07-13 16:13:13');
INSERT INTO `sys_permission` VALUES ('41', '1', '教学时间-周次', '1', '0/1', 'teachWeek:view', 'menu', '/teachWeek/list', '2020-07-13 16:13:30', '2020-07-13 16:13:30');
INSERT INTO `sys_permission` VALUES ('42', '1', '添加', '41', '0/1/41', 'teachWeek:add', 'button', '', '2020-07-13 16:13:30', '2020-07-13 16:13:30');
INSERT INTO `sys_permission` VALUES ('43', '1', '编辑', '41', '0/1/41', 'teachWeek:edit', 'button', '', '2020-07-13 16:13:30', '2020-07-13 16:13:30');
INSERT INTO `sys_permission` VALUES ('44', '1', '删除', '41', '0/1/41', 'teachWeek:del', 'button', '', '2020-07-13 16:13:30', '2020-07-13 16:13:30');
INSERT INTO `sys_permission` VALUES ('45', '1', '教学班信息', '1', '0/1', 'lessonSchedule:view', 'menu', '/lessonSchedule/list', '2020-07-13 17:23:01', '2020-07-13 17:23:01');
INSERT INTO `sys_permission` VALUES ('46', '1', '添加', '45', '0/1/45', 'lessonSchedule:add', 'button', '', '2020-07-13 17:23:01', '2020-07-13 17:23:01');
INSERT INTO `sys_permission` VALUES ('47', '1', '编辑', '45', '0/1/45', 'lessonSchedule:edit', 'button', '', '2020-07-13 17:23:01', '2020-07-13 17:23:01');
INSERT INTO `sys_permission` VALUES ('48', '1', '删除', '45', '0/1/45', 'lessonSchedule:del', 'button', '', '2020-07-13 17:23:01', '2020-07-13 17:23:01');
INSERT INTO `sys_permission` VALUES ('49', '1', '选课信息', '1', '0/1', 'chooseLesson:view', 'menu', '/chooseLesson/list', '2020-07-13 22:36:37', '2020-07-13 22:36:37');
INSERT INTO `sys_permission` VALUES ('50', '1', '添加', '49', '0/1/49', 'chooseLesson:add', 'button', '', '2020-07-13 22:36:37', '2020-07-13 22:36:37');
INSERT INTO `sys_permission` VALUES ('51', '1', '编辑', '49', '0/1/49', 'chooseLesson:edit', 'button', '', '2020-07-13 22:36:37', '2020-07-13 22:36:37');
INSERT INTO `sys_permission` VALUES ('52', '1', '删除', '49', '0/1/49', 'chooseLesson:del', 'button', '', '2020-07-13 22:36:37', '2020-07-13 22:36:37');
INSERT INTO `sys_permission` VALUES ('53', '1', '订单信息', '1', '0/1', 'payinfo:view', 'menu', '/payinfo/list', '2020-07-13 22:37:08', '2020-07-13 22:37:08');
INSERT INTO `sys_permission` VALUES ('54', '1', '添加', '53', '0/1/53', 'payinfo:add', 'button', '', '2020-07-13 22:37:08', '2020-07-13 22:37:08');
INSERT INTO `sys_permission` VALUES ('55', '1', '编辑', '53', '0/1/53', 'payinfo:edit', 'button', '', '2020-07-13 22:37:08', '2020-07-13 22:37:08');
INSERT INTO `sys_permission` VALUES ('56', '1', '删除', '53', '0/1/53', 'payinfo:del', 'button', '', '2020-07-13 22:37:08', '2020-07-13 22:37:08');
INSERT INTO `sys_permission` VALUES ('57', '1', '课程表-学生', '1', '0/1', 'chooseLesson:view', 'menu', '/chooseLesson/stu_list', '2020-07-14 14:38:01', '2020-07-14 14:38:01');
INSERT INTO `sys_permission` VALUES ('58', '1', '课程表-教师', '1', '0/1', 'chooseLesson:view', 'menu', '/chooseLesson/teach_list', '2020-07-14 14:39:05', '2020-07-14 14:39:05');
INSERT INTO `sys_permission` VALUES ('59', '1', '课堂请假信息', '1', '0/1', 'leaveCourse:view', 'menu', '/leaveCourse/list', '2020-07-14 15:48:29', '2020-07-14 15:48:29');
INSERT INTO `sys_permission` VALUES ('60', '1', '添加', '59', '0/1/59', 'leaveCourse:add', 'button', '', '2020-07-14 15:48:29', '2020-07-14 15:48:29');
INSERT INTO `sys_permission` VALUES ('61', '1', '编辑', '59', '0/1/59', 'leaveCourse:edit', 'button', '', '2020-07-14 15:48:29', '2020-07-14 15:48:29');
INSERT INTO `sys_permission` VALUES ('62', '1', '删除', '59', '0/1/59', 'leaveCourse:del', 'button', '', '2020-07-14 15:48:29', '2020-07-14 15:48:29');
INSERT INTO `sys_permission` VALUES ('63', '1', '我的请假(学生)', '1', '0/1', 'leaveCourse:view', 'menu', '/leaveCourse/stu_list', '2020-07-14 17:09:04', '2020-07-14 17:09:04');
INSERT INTO `sys_permission` VALUES ('64', '1', '请假人员(教师)', '1', '0/1', 'leaveCourse:view', 'menu', '/leaveCourse/teach_list', '2020-07-14 17:09:43', '2020-07-14 17:09:43');
INSERT INTO `sys_permission` VALUES ('65', '1', '选课（学生）', '1', '0/1', 'lessonSchedule:view', 'menu', '/lessonSchedule/stu_choose_list', '2020-07-15 10:30:49', '2020-07-15 10:30:49');
INSERT INTO `sys_permission` VALUES ('66', '1', '选课(教师)', '1', '0/1', 'lessonSchedule:view', 'menu', '/lessonSchedule/teach_choose_list', '2020-07-16 07:20:17', '2020-07-15 10:45:54');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `permission_ids` varchar(255) DEFAULT NULL COMMENT '权限ID列表',
  `available` tinyint(1) DEFAULT NULL COMMENT '是否可用',
  `role_name` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `role_code` varchar(50) DEFAULT NULL COMMENT '角色编号',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='系统角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', ',1,2,3,4,5,6,7,8,9,10,11,12,13,26,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,59,60,61,62,', '1', '超级管理员', 'admin', '2020-07-15 10:36:23', '2018-07-10 11:19:49');
INSERT INTO `sys_role` VALUES ('3', ',1,57,63,65,', '1', '学生', 'student', '2020-07-15 10:36:52', '2020-07-13 11:29:34');
INSERT INTO `sys_role` VALUES ('4', ',1,26,34,35,36,58,64,66,', '1', '教师', 'teacher', '2020-07-15 10:47:15', '2020-07-13 13:07:33');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `role_id` int DEFAULT NULL COMMENT '角色ID',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `pass_word` varchar(50) DEFAULT NULL COMMENT '密码',
  `salt` varchar(50) DEFAULT NULL COMMENT '盐值',
  `state` tinyint(1) DEFAULT NULL COMMENT '状态(0：禁用，1：启用，2：锁定)',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `age` int DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `rate` double(9,2) DEFAULT NULL,
  `amount` double(9,2) DEFAULT NULL COMMENT '账户余额',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '1', '超级管理员', 'admin', '90de4365c537fa959193d13ad8d07665', 'XZUY77Pq41M6jaGeR2q1yMaPOrmemy6A', '1', '2020-07-13 13:59:32', '2020-07-13 13:15:01', '13', '男', '123456', '123456', '77428309@qq.com', '1.00', '4500.00');
INSERT INTO `sys_user` VALUES ('12', '3', '朱克磊', 'zhukelei', '872743f08625f8844b432b50e9c9b88e', 'GvZEKpxWYOupMwgCzqmqGYBOKElK0cTX', '1', '2020-07-15 16:24:13', '2020-07-15 16:24:13', '20', '男', '1840766790', '19916089409', 'kittenstone@163.com', '0.90', '80.00');
INSERT INTO `sys_user` VALUES ('13', '4', '任康华', 'renkanghua', '437dbfeecca5a0071fc33f68d3729cc7', 'bPACPQ6urylq16QBuRClpJQN0Nf270Ta', '1', '2020-07-15 16:26:47', '2020-07-15 16:26:47', '20', '男', '1320252689', '18720775793', '1320252689@qq.com', '0.80', '1233.00');
INSERT INTO `sys_user` VALUES ('14', '3', '陈云', 'chenyun', 'd47693a85c3adc1f8208d40f48955a8b', 'ZX0BSVJ4WOEFnoL1mcTsMQvVu7oTsF8i', '1', '2020-07-15 16:28:06', '2020-07-15 16:28:06', '20', '男', '123', '123', '123@123.com', '0.80', '914.00');
INSERT INTO `sys_user` VALUES ('15', '4', '周靖宇', 'zhoujingyu', 'f5a853da914aa5070e62d94ec5b62c81', 'cuLaCxo1H91raGO7OdjCdau2ENYj3i26', '1', '2020-07-15 16:28:40', '2020-07-15 16:28:40', '20', '男', '123', '123', '123@123.com', '0.90', '888.00');
INSERT INTO `sys_user` VALUES ('16', '3', 'stu', 'stu', 'bd7a593f23f5379420ca3ecb25a762fb', 'WHTj7Qpg4lofpvseA5jW3vsjMFEmU0Pu', '1', '2020-07-16 09:14:37', '2020-07-16 09:14:37', '20', '男', '1227793396', '123', '123@163.com', '0.90', '99999.00');

-- ----------------------------
-- Table structure for teach_time
-- ----------------------------
DROP TABLE IF EXISTS `teach_time`;
CREATE TABLE `teach_time` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `teach_num` int DEFAULT NULL COMMENT '上课节次',
  `start_time` varchar(255) DEFAULT NULL COMMENT '开始时间',
  `end_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='教学时间-节次';

-- ----------------------------
-- Records of teach_time
-- ----------------------------
INSERT INTO `teach_time` VALUES ('1', '1', '08:00:00', '08:50:00');
INSERT INTO `teach_time` VALUES ('2', '2', '08:55:00', '09:45:00');
INSERT INTO `teach_time` VALUES ('3', '3', '10:15:00', '11:05:00');
INSERT INTO `teach_time` VALUES ('4', '4', '11:10:00', '12:00:00');
INSERT INTO `teach_time` VALUES ('5', '5', '14:00:00', '14:50:00');
INSERT INTO `teach_time` VALUES ('6', '6', '14:55:00', '15:45:00');

-- ----------------------------
-- Table structure for teach_week
-- ----------------------------
DROP TABLE IF EXISTS `teach_week`;
CREATE TABLE `teach_week` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `weeks` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='教学时间-周次';

-- ----------------------------
-- Records of teach_week
-- ----------------------------
INSERT INTO `teach_week` VALUES ('2', '1');
INSERT INTO `teach_week` VALUES ('3', '2');
INSERT INTO `teach_week` VALUES ('4', '3');
INSERT INTO `teach_week` VALUES ('5', '4');
INSERT INTO `teach_week` VALUES ('6', '5');
INSERT INTO `teach_week` VALUES ('7', '6');
INSERT INTO `teach_week` VALUES ('8', '7');
INSERT INTO `teach_week` VALUES ('9', '8');
INSERT INTO `teach_week` VALUES ('10', '9');
INSERT INTO `teach_week` VALUES ('11', '10');
INSERT INTO `teach_week` VALUES ('12', '11');
INSERT INTO `teach_week` VALUES ('13', '12');
INSERT INTO `teach_week` VALUES ('14', '13');
INSERT INTO `teach_week` VALUES ('15', '14');
INSERT INTO `teach_week` VALUES ('16', '15');
INSERT INTO `teach_week` VALUES ('17', '16');
INSERT INTO `teach_week` VALUES ('18', '17');
INSERT INTO `teach_week` VALUES ('19', '18');
INSERT INTO `teach_week` VALUES ('20', '19');
INSERT INTO `teach_week` VALUES ('21', '20');
