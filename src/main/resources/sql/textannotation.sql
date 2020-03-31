/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 80012
Source Host           : 127.0.0.1:3306
Source Database       : textannotation

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2020-04-01 00:02:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for document
-- ----------------------------
DROP TABLE IF EXISTS `document`;
CREATE TABLE `document` (
  `did` int(11) NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `filename` varchar(100) DEFAULT NULL COMMENT '文件名',
  `filetype` varchar(30) DEFAULT NULL COMMENT '文件类型',
  `filesize` int(11) DEFAULT NULL COMMENT '文件大小',
  `relativepath` varchar(255) DEFAULT NULL COMMENT '相对路径',
  `absolutepath` varchar(255) DEFAULT NULL COMMENT '绝对路径',
  `docuploadtime` varchar(50) DEFAULT NULL COMMENT '上传时间',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`did`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `document_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of document
-- ----------------------------
INSERT INTO `document` VALUES ('1', '文本分类1-邮件.docx', '.docx', '15603', '', '', null, '2');
INSERT INTO `document` VALUES ('2', '文本分类2-邮件.doc', '.doc', '61440', '', '', null, '2');
INSERT INTO `document` VALUES ('4', '文本分类-错误格式文件.docx', '.docx', '11048', '', '', null, '2');
INSERT INTO `document` VALUES ('5', '爬虫文本-匹配1.docx', '.docx', '13612', '', '', '2019-03-12 15:43:03', '2');
INSERT INTO `document` VALUES ('6', '爬虫文本-匹配2.docx', '.docx', '13499', '', '', '2019-03-12 15:43:03', '2');
INSERT INTO `document` VALUES ('7', '爬虫文本-匹配1.docx', '.docx', '13612', '', '', '2019-03-12 15:43:23', '2');
INSERT INTO `document` VALUES ('8', '爬虫文本-匹配2.docx', '.docx', '13499', '', '', '2019-03-12 15:43:23', '2');
INSERT INTO `document` VALUES ('9', '爬虫文本-匹配1.docx', '.docx', '13612', '', '', '2019-03-12 15:43:43', '2');
INSERT INTO `document` VALUES ('10', '爬虫文本-匹配2.docx', '.docx', '13499', '', '', '2019-03-12 15:43:44', '2');
INSERT INTO `document` VALUES ('11', '辽阳市弓长岭区人民检察院指控 - 副本.docx', '.docx', '13622', '', '', '2019-03-12 15:44:02', '2');
INSERT INTO `document` VALUES ('12', '辽阳市弓长岭区人民检察院指控.docx', '.docx', '13622', '', '', '2019-03-12 15:44:02', '2');
INSERT INTO `document` VALUES ('13', '辽阳市弓长岭区人民检察院指控 - 副本.docx', '.docx', '13622', '', '', '2019-03-12 16:45:15', '2');
INSERT INTO `document` VALUES ('14', '辽阳市弓长岭区人民检察院指控.docx', '.docx', '13622', '', '', '2019-03-12 16:45:16', '2');
INSERT INTO `document` VALUES ('15', '信息抽取测试文本.docx', '.docx', '12546', '', '', null, '2');
INSERT INTO `document` VALUES ('16', '文本关系 - 副本.docx', '.docx', '13471', '', '', '2019-03-13 11:03:42', '2');
INSERT INTO `document` VALUES ('17', '文本关系.docx', '.docx', '13471', '', '', '2019-03-13 11:03:42', '2');
INSERT INTO `document` VALUES ('18', '文本关系 - 副本.docx', '.docx', '13471', '', '', '2019-03-13 11:06:43', '2');
INSERT INTO `document` VALUES ('19', '文本关系.docx', '.docx', '13471', '', '', '2019-03-13 11:06:43', '2');
INSERT INTO `document` VALUES ('20', '信息抽取1.docx', '.docx', '20040', '', '', null, '2');
INSERT INTO `document` VALUES ('21', '信息抽取2.docx', '.docx', '14350', '', '', null, '2');
INSERT INTO `document` VALUES ('22', '文本关系 - 副本.docx', '.docx', '13471', '', '', '2019-04-06 22:35:33', '2');
INSERT INTO `document` VALUES ('23', '文本关系.docx', '.docx', '13471', '', '', '2019-04-06 22:35:33', '2');
INSERT INTO `document` VALUES ('24', '文本1.docx', '.docx', '17684', '', '', '2019-04-06 22:43:50', '2');
INSERT INTO `document` VALUES ('25', '爬虫文本-匹配2.docx', '.docx', '13499', '', '', '2019-04-06 22:43:50', '2');
INSERT INTO `document` VALUES ('26', '文本分类1-邮件.docx', '.docx', '17314', '', '', null, '2');
INSERT INTO `document` VALUES ('27', '信息抽取1.docx', '.docx', '20040', '', '', null, '2');
INSERT INTO `document` VALUES ('28', '辽阳市弓长岭区人民检察院指控.docx', '.docx', '13622', '', '', '2019-04-18 19:44:56', '2');
INSERT INTO `document` VALUES ('29', '辽阳市弓长岭区人民检察院指控.docx', '.docx', '13622', '', '', '2019-04-18 19:45:37', '2');
INSERT INTO `document` VALUES ('30', '信息抽取1.docx', '.docx', '20040', '', '', null, '2');
INSERT INTO `document` VALUES ('31', '信息抽取2.docx', '.docx', '14350', '', '', null, '2');
INSERT INTO `document` VALUES ('32', '信息抽取1.docx', '.docx', '14933', '', '', null, '4');
INSERT INTO `document` VALUES ('33', '信息抽取2.docx', '.docx', '14933', '', '', null, '4');
INSERT INTO `document` VALUES ('34', '信息抽取3.docx', '.docx', '14887', '', '', null, '4');
INSERT INTO `document` VALUES ('38', '信息抽取1.docx', '.docx', '14933', '', '', null, '3');
INSERT INTO `document` VALUES ('49', '信息抽取1.docx', '.docx', '14903', '', '', null, '4');
INSERT INTO `document` VALUES ('50', '信息抽取2 - 副本 (2).docx', '.docx', '14933', '', '', null, '4');
INSERT INTO `document` VALUES ('51', '信息抽取2 - 副本.docx', '.docx', '14933', '', '', null, '4');
INSERT INTO `document` VALUES ('52', '信息抽取2.docx', '.docx', '14933', '', '', null, '4');
INSERT INTO `document` VALUES ('53', '信息抽取3 - 副本.docx', '.docx', '14887', '', '', null, '4');
INSERT INTO `document` VALUES ('54', '信息抽取1 - 副本.docx', '.docx', '14933', '', '', null, '4');
INSERT INTO `document` VALUES ('55', '信息抽取1.docx', '.docx', '14903', '', '', null, '4');
INSERT INTO `document` VALUES ('56', '信息抽取2 - 副本 (2).docx', '.docx', '14933', '', '', null, '4');
INSERT INTO `document` VALUES ('61', '信息抽取-data.xls', '.xls', '22528', '', '', '2019-12-23 19:47:05', '4');
INSERT INTO `document` VALUES ('65', '信息抽取-data.xls', '.xls', '22528', '', '', '2019-12-23 20:00:48', '4');
INSERT INTO `document` VALUES ('67', '信息抽取-data.xls', '.xls', '22528', '', '', '2019-12-23 20:03:33', '4');
INSERT INTO `document` VALUES ('69', '信息抽取-data.xls', '.xls', '22528', '', '', '2019-12-23 20:05:52', '4');
INSERT INTO `document` VALUES ('72', '信息抽取-data.xls', '.xls', '22528', '', '', '2019-12-23 20:30:16', '4');
INSERT INTO `document` VALUES ('74', '信息抽取-data.xls', '.xls', '22528', '', '', '2019-12-23 20:32:34', '4');
INSERT INTO `document` VALUES ('75', '信息抽取-answer.xls', '.xls', '21504', '', '', '2019-12-23 20:32:34', '4');
INSERT INTO `document` VALUES ('77', '信息抽取-data.xls', '.xls', '22528', '', '', '2019-12-23 21:11:03', '4');
INSERT INTO `document` VALUES ('79', '信息抽取-data.xls', '.xls', '22528', '', '', '2019-12-23 21:16:25', '4');
INSERT INTO `document` VALUES ('81', '信息抽取-data.xls', '.xls', '22528', '', '', '2019-12-23 21:18:36', '4');
INSERT INTO `document` VALUES ('83', '信息抽取-data.xls', '.xls', '22528', '', '', '2019-12-23 21:26:25', '4');
INSERT INTO `document` VALUES ('85', '信息抽取-data.xls', '.xls', '22528', '', '', '2019-12-23 21:27:51', '4');
INSERT INTO `document` VALUES ('86', '信息抽取-answer.xls', '.xls', '21504', '', '', '2019-12-23 21:27:52', '4');
INSERT INTO `document` VALUES ('88', '信息抽取-data.xls', '.xls', '22528', '', '', '2019-12-24 09:40:08', '4');
INSERT INTO `document` VALUES ('89', '信息抽取-answer.xls', '.xls', '21504', '', '', '2019-12-24 09:40:08', '4');
INSERT INTO `document` VALUES ('91', '信息抽取-data.xls', '.xls', '22528', '', '', '2019-12-24 09:42:49', '4');
INSERT INTO `document` VALUES ('92', '信息抽取-answer.xls', '.xls', '21504', '', '', '2019-12-24 09:42:49', '4');
INSERT INTO `document` VALUES ('94', '信息抽取-data.xls', '.xls', '22528', '', '', '2019-12-24 09:45:38', '4');
INSERT INTO `document` VALUES ('95', '信息抽取-answer.xls', '.xls', '21504', '', '', '2019-12-24 09:45:38', '4');
INSERT INTO `document` VALUES ('97', '信息抽取-data.xls', '.xls', '22528', '', '', '2019-12-24 09:51:51', '4');
INSERT INTO `document` VALUES ('98', '信息抽取-answer.xls', '.xls', '21504', '', '', '2019-12-24 09:51:51', '4');
INSERT INTO `document` VALUES ('100', '信息抽取-data.xls', '.xls', '22528', '', '', '2019-12-24 09:53:30', '4');
INSERT INTO `document` VALUES ('101', '信息抽取-answer.xls', '.xls', '21504', '', '', '2019-12-24 09:53:31', '4');
INSERT INTO `document` VALUES ('103', '信息抽取-data.xls', '.xls', '22528', '', '', '2019-12-24 09:55:02', '4');
INSERT INTO `document` VALUES ('104', '信息抽取-answer.xls', '.xls', '21504', '', '', '2019-12-24 09:55:02', '4');
INSERT INTO `document` VALUES ('106', '信息抽取-data.xls', '.xls', '22528', '', '', '2019-12-24 09:58:37', '4');
INSERT INTO `document` VALUES ('107', '信息抽取-answer.xls', '.xls', '21504', '', '', '2019-12-24 09:58:37', '4');
INSERT INTO `document` VALUES ('109', '信息抽取-data.xls', '.xls', '22528', '', '', '2019-12-24 09:59:59', '4');
INSERT INTO `document` VALUES ('110', '信息抽取-answer.xls', '.xls', '21504', '', '', '2019-12-24 09:59:59', '4');
INSERT INTO `document` VALUES ('112', '信息抽取-data.xls', '.xls', '22528', '', '', '2019-12-24 10:01:10', '4');
INSERT INTO `document` VALUES ('113', '信息抽取-answer.xls', '.xls', '21504', '', '', '2019-12-24 10:01:11', '4');
INSERT INTO `document` VALUES ('114', '信息抽取1.docx', '.docx', '14903', '', '', null, '4');
INSERT INTO `document` VALUES ('115', '信息抽取-data.xls', '.xls', '22528', '', '', '2019-12-24 10:06:59', '4');
INSERT INTO `document` VALUES ('116', '信息抽取-answer.xls', '.xls', '21504', '', '', '2019-12-24 10:06:59', '4');
INSERT INTO `document` VALUES ('117', '信息抽取1.docx', '.docx', '14903', '', '', null, '4');
INSERT INTO `document` VALUES ('118', '信息抽取-data.xls', '.xls', '22528', '', '', '2019-12-29 14:10:11', '4');
INSERT INTO `document` VALUES ('119', '信息抽取-answer.xls', '.xls', '21504', '', '', '2019-12-29 14:10:11', '4');
INSERT INTO `document` VALUES ('121', '文本分类测试.xls', '.xls', '19456', '', '', '2020-01-09 21:28:32', '4');
INSERT INTO `document` VALUES ('123', '文本分类测试.xls', '.xls', '19456', '', '', '2020-01-09 21:31:27', '4');
INSERT INTO `document` VALUES ('125', '文本关系-data.xls', '.xls', '21504', '', '', '2020-01-10 14:45:20', '4');
INSERT INTO `document` VALUES ('127', '文本关系-data.xls', '.xls', '21504', '', '', '2020-01-10 14:51:45', '4');
INSERT INTO `document` VALUES ('129', '文本关系-data.xls', '.xls', '21504', '', '', '2020-01-10 14:58:52', '4');
INSERT INTO `document` VALUES ('135', '文本关系-data.xls', '.xls', '21504', '', '', '2020-01-10 15:03:56', '4');
INSERT INTO `document` VALUES ('136', '文本关系-answer.xls', '.xls', '19968', '', '', '2020-01-10 15:03:56', '4');
INSERT INTO `document` VALUES ('138', '文本关系-data.xls', '.xls', '21504', '', '', '2020-01-10 15:09:05', '4');
INSERT INTO `document` VALUES ('139', '文本关系-answer.xls', '.xls', '19456', '', '', '2020-01-10 15:09:05', '4');
INSERT INTO `document` VALUES ('141', '文本关系-data.xls', '.xls', '21504', '', '', '2020-01-10 15:13:03', '4');
INSERT INTO `document` VALUES ('142', '文本关系-answer.xls', '.xls', '19456', '', '', '2020-01-10 15:13:03', '4');
INSERT INTO `document` VALUES ('144', '测试数据.xls', '.xls', '19456', '', '', '2020-01-10 16:29:23', '4');
INSERT INTO `document` VALUES ('146', '文本排序.xls', '.xls', '19968', '', '', '2020-01-10 16:52:47', '4');
INSERT INTO `document` VALUES ('148', '文本排序.xls', '.xls', '19968', '', '', '2020-01-10 16:54:39', '4');
INSERT INTO `document` VALUES ('149', '文本排序.doc', '.doc', '11264', '', '', '2020-01-10 16:58:43', '4');
INSERT INTO `document` VALUES ('150', '文本排序.xls', '.xls', '19968', '', '', '2020-01-10 16:58:43', '4');
INSERT INTO `document` VALUES ('152', '类比排序.xls', '.xls', '23040', '', '', '2020-01-10 17:09:04', '4');
INSERT INTO `document` VALUES ('154', '文本分类测试.xls', '.xls', '19456', '', '', '2020-01-10 20:10:03', '4');
INSERT INTO `document` VALUES ('156', '文本分类测试.xls', '.xls', '19456', '', '', '2020-01-10 20:16:06', '4');
INSERT INTO `document` VALUES ('158', '文本分类测试.xls', '.xls', '19456', '', '', '2020-01-11 10:18:56', '4');
INSERT INTO `document` VALUES ('159', '类比排序.xls', '.xls', '20992', '', '', '2020-02-22 21:42:43', '4');
INSERT INTO `document` VALUES ('160', '类比排序.xls', '.xls', '20992', '', '', '2020-02-22 21:54:55', '4');
INSERT INTO `document` VALUES ('167', '文本关系.xls', '.xls', '21504', '', '', '2020-02-23 00:45:40', '4');
INSERT INTO `document` VALUES ('168', '文本关系.xls', '.xls', '21504', '', '', '2020-02-23 00:51:46', '4');
INSERT INTO `document` VALUES ('169', '文本关系.xls', '.xls', '21504', '', '', '2020-02-23 00:58:51', '4');
INSERT INTO `document` VALUES ('170', '文本关系.xls', '.xls', '21504', '', '', '2020-02-23 01:23:37', '4');
INSERT INTO `document` VALUES ('171', '文本配对.xls', '.xls', '22528', '', '', '2020-02-23 02:34:31', '4');
INSERT INTO `document` VALUES ('172', '文本配对.xls', '.xls', '22528', '', '', '2020-02-23 02:34:58', '4');
INSERT INTO `document` VALUES ('173', '文本配对.xls', '.xls', '22528', '', '', '2020-02-23 02:37:30', '4');
INSERT INTO `document` VALUES ('174', '文本配对.xls', '.xls', '21504', '', '', '2020-02-23 02:39:56', '4');
INSERT INTO `document` VALUES ('176', '文本关系.xls', '.xls', '21504', '', '', '2020-02-23 12:52:58', '4');
INSERT INTO `document` VALUES ('177', '文本关系.xls', '.xls', '21504', '', '', null, '4');
INSERT INTO `document` VALUES ('178', '文本关系.xls', '.xls', '21504', '', '', '2020-02-23 13:03:59', '4');
INSERT INTO `document` VALUES ('179', '信息抽取1.docx', '.docx', '15115', '', '', null, '4');
INSERT INTO `document` VALUES ('180', '信息抽取2.docx', '.docx', '14933', '', '', null, '4');
INSERT INTO `document` VALUES ('182', '信息抽取-data.xls', '.xls', '22528', '', '', '2020-03-21 17:07:26', '4');
INSERT INTO `document` VALUES ('183', '信息抽取-answer.xls', '.xls', '21504', '', '', '2020-03-21 17:07:26', '4');
INSERT INTO `document` VALUES ('184', '信息抽取1.docx', '.docx', '15115', '', '', null, '4');
INSERT INTO `document` VALUES ('185', '信息抽取-data.xls', '.xls', '22528', '', '', '2020-03-21 17:57:29', '4');
INSERT INTO `document` VALUES ('186', '信息抽取-answer.xls', '.xls', '21504', '', '', '2020-03-21 17:57:29', '4');
INSERT INTO `document` VALUES ('187', '信息抽取1.docx', '.docx', '15055', '', '', null, '4');
INSERT INTO `document` VALUES ('188', '信息抽取2.docx', '.docx', '14933', '', '', null, '4');
INSERT INTO `document` VALUES ('189', '信息抽取1.docx', '.docx', '15055', '', '', null, '4');
INSERT INTO `document` VALUES ('190', '信息抽取2.docx', '.docx', '14933', '', '', null, '4');
INSERT INTO `document` VALUES ('193', '信息抽取1.docx', '.docx', '15055', '', '', null, '4');
INSERT INTO `document` VALUES ('194', '信息抽取2.docx', '.docx', '14933', '', '', null, '4');
INSERT INTO `document` VALUES ('195', '信息抽取1.docx', '.docx', '15055', '', '', null, '4');
INSERT INTO `document` VALUES ('196', '信息抽取1.docx', '.docx', '15055', '', '', null, '4');
INSERT INTO `document` VALUES ('197', '信息抽取1 - 副本.docx', '.docx', '14933', '', '', null, '4');
INSERT INTO `document` VALUES ('198', '信息抽取1 - 副本.docx', '.docx', '14933', '', '', null, '4');
INSERT INTO `document` VALUES ('199', '文本分类.xls', '.xls', '19456', '', '', null, '4');
INSERT INTO `document` VALUES ('200', '文本分类.xls', '.xls', '19456', '', '', null, '4');
INSERT INTO `document` VALUES ('201', '文本分类.xls', '.xls', '19456', '', '', '2020-03-30 10:26:58', '4');
INSERT INTO `document` VALUES ('202', '文本关系.xls', '.xls', '21504', '', '', '2020-03-30 10:35:59', '4');
INSERT INTO `document` VALUES ('203', '文本关系.xls', '.xls', '21504', '', '', null, '4');
INSERT INTO `document` VALUES ('204', '文本配对.xls', '.xls', '21504', '', '', '2020-03-30 10:36:54', '4');
INSERT INTO `document` VALUES ('205', '文本配对.xls', '.xls', '21504', '', '', '2020-03-30 10:51:04', '4');
INSERT INTO `document` VALUES ('206', '文本配对.xls', '.xls', '21504', '', '', '2020-03-30 11:06:01', '4');
INSERT INTO `document` VALUES ('207', '文本配对.xls', '.xls', '21504', '', '', '2020-03-30 11:06:01', '4');
INSERT INTO `document` VALUES ('208', '文本排序.xls', '.xls', '19968', '', '', '2020-03-30 11:06:43', '4');
INSERT INTO `document` VALUES ('209', '文本排序.xls', '.xls', '19968', '', '', '2020-03-30 11:06:44', '4');
INSERT INTO `document` VALUES ('210', '类比排序.xls', '.xls', '20992', '', '', '2020-03-30 11:07:23', '4');
INSERT INTO `document` VALUES ('211', '类比排序.xls', '.xls', '20992', '', '', '2020-03-30 11:07:24', '4');
INSERT INTO `document` VALUES ('212', '文本分类.xls', '.xls', '19456', '', '', null, '4');
INSERT INTO `document` VALUES ('213', '文本分类.xls', '.xls', '19456', '', '', null, '4');
INSERT INTO `document` VALUES ('214', '文本配对.xls', '.xls', '21504', '', '', '2020-03-30 12:56:13', '4');
INSERT INTO `document` VALUES ('215', '文本配对.xls', '.xls', '21504', '', '', '2020-03-30 12:56:13', '4');
INSERT INTO `document` VALUES ('217', '文本关系.xls', '.xls', '21504', '', '', null, '4');
INSERT INTO `document` VALUES ('218', '文本关系.xls', '.xls', '21504', '', '', '2020-03-30 14:48:24', '4');
INSERT INTO `document` VALUES ('219', '文本关系.xls', '.xls', '21504', '', '', '2020-03-30 14:48:25', '4');
INSERT INTO `document` VALUES ('220', '文本排序.xls', '.xls', '19968', '', '', '2020-03-30 15:03:54', '4');
INSERT INTO `document` VALUES ('221', '文本排序.xls', '.xls', '19968', '', '', '2020-03-30 15:03:55', '4');
INSERT INTO `document` VALUES ('222', '类比排序.xls', '.xls', '20992', '', '', '2020-03-30 15:05:04', '4');
INSERT INTO `document` VALUES ('223', '类比排序.xls', '.xls', '20992', '', '', '2020-03-30 15:05:05', '4');
INSERT INTO `document` VALUES ('224', '文本配对.xls', '.xls', '21504', '', '', '2020-03-30 19:15:13', '4');
INSERT INTO `document` VALUES ('225', '文本配对.xls', '.xls', '21504', '', '', '2020-03-30 19:15:14', '4');
INSERT INTO `document` VALUES ('226', '文本配对.xls', '.xls', '25088', '', '', '2020-03-30 23:52:51', '4');
INSERT INTO `document` VALUES ('227', '文本配对.xls', '.xls', '25088', '', '', '2020-03-30 23:52:51', '4');

-- ----------------------------
-- Table structure for dtasktype
-- ----------------------------
DROP TABLE IF EXISTS `dtasktype`;
CREATE TABLE `dtasktype` (
  `dty_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '该类型是否可以做任务的ID',
  `tasktype` int(11) NOT NULL COMMENT '任务类别',
  `typevalue` int(11) NOT NULL COMMENT '该类型是否可以做任务的值',
  `u_id` int(11) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`dty_id`),
  KEY `u_id` (`u_id`),
  CONSTRAINT `dtasktype_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dtasktype
-- ----------------------------
INSERT INTO `dtasktype` VALUES ('1', '1', '1', '5');
INSERT INTO `dtasktype` VALUES ('2', '2', '1', '5');
INSERT INTO `dtasktype` VALUES ('3', '3', '1', '5');
INSERT INTO `dtasktype` VALUES ('4', '4', '1', '5');
INSERT INTO `dtasktype` VALUES ('5', '5', '1', '5');
INSERT INTO `dtasktype` VALUES ('6', '6', '1', '5');

-- ----------------------------
-- Table structure for dtu_comment
-- ----------------------------
DROP TABLE IF EXISTS `dtu_comment`;
CREATE TABLE `dtu_comment` (
  `dtu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '做任务详细描述ID',
  `dtd_id` int(11) NOT NULL COMMENT '做任务ID',
  `u_id` int(11) DEFAULT NULL COMMENT '做任务详细描述标签ID',
  `cnum` int(11) DEFAULT NULL COMMENT 'label对应的content开始位置',
  PRIMARY KEY (`dtu_id`),
  KEY `dtd_id` (`dtd_id`),
  KEY `u_id` (`u_id`),
  CONSTRAINT `dtu_comment_ibfk_1` FOREIGN KEY (`dtd_id`) REFERENCES `dt_classify` (`dtd_id`),
  CONSTRAINT `dtu_comment_ibfk_2` FOREIGN KEY (`u_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dtu_comment
-- ----------------------------
INSERT INTO `dtu_comment` VALUES ('31', '3', '2', '1');
INSERT INTO `dtu_comment` VALUES ('32', '3', '2', '1');

-- ----------------------------
-- Table structure for dt_classify
-- ----------------------------
DROP TABLE IF EXISTS `dt_classify`;
CREATE TABLE `dt_classify` (
  `dtd_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '做任务详细描述ID',
  `task_id` int(11) DEFAULT NULL COMMENT '做任务ID',
  `subtask_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `label_id` int(11) DEFAULT NULL COMMENT '做任务详细描述标签ID',
  `goodlabel` int(11) DEFAULT NULL,
  `badlabel` int(11) DEFAULT NULL,
  PRIMARY KEY (`dtd_id`),
  KEY `dt_id` (`task_id`),
  KEY `label_id` (`label_id`),
  CONSTRAINT `dt_classify_ibfk_2` FOREIGN KEY (`label_id`) REFERENCES `label` (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_classify
-- ----------------------------
INSERT INTO `dt_classify` VALUES ('1', '1', null, null, '1', '4', '2');
INSERT INTO `dt_classify` VALUES ('2', '1', null, null, '1', '5', '6');
INSERT INTO `dt_classify` VALUES ('3', '2', null, null, '5', '3', '1');
INSERT INTO `dt_classify` VALUES ('4', '77', '559', '4', '2', '0', '0');
INSERT INTO `dt_classify` VALUES ('5', '77', '559', '4', '1', '0', '0');

-- ----------------------------
-- Table structure for dt_extraction
-- ----------------------------
DROP TABLE IF EXISTS `dt_extraction`;
CREATE TABLE `dt_extraction` (
  `dt_eid` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `subtask_id` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `entity_id` varchar(255) DEFAULT NULL,
  `entity_name` varchar(255) DEFAULT NULL,
  `startindex` int(11) DEFAULT NULL,
  `endindex` int(11) DEFAULT NULL,
  `entity` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dt_eid`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_extraction
-- ----------------------------
INSERT INTO `dt_extraction` VALUES ('2', '38', '31', '4', '0-0', '公司', '9', '14', 'Aptiv');
INSERT INTO `dt_extraction` VALUES ('3', '38', '31', '4', '0-1', '公司', '52', '64', 'HyundaiMotor');
INSERT INTO `dt_extraction` VALUES ('4', '38', '31', '4', '0-0', '公司', '9', '14', 'Aptiv');
INSERT INTO `dt_extraction` VALUES ('5', '38', '31', '4', '0-1', '公司', '150', '162', 'HyundaiMotor');
INSERT INTO `dt_extraction` VALUES ('6', '38', '31', '4', '0-0', '公司', '9', '14', 'Aptiv');
INSERT INTO `dt_extraction` VALUES ('7', '38', '31', '4', '0-1', '公司', '150', '162', 'HyundaiMotor');
INSERT INTO `dt_extraction` VALUES ('8', '38', '31', '4', '0-0', '公司', '9', '14', 'Aptiv');
INSERT INTO `dt_extraction` VALUES ('9', '38', '31', '4', '0-1', '公司', '150', '162', 'HyundaiMotor');
INSERT INTO `dt_extraction` VALUES ('10', '38', '31', '4', '0-0', '公司', '75', '80', 'Aptiv');
INSERT INTO `dt_extraction` VALUES ('11', '38', '31', '4', '0-1', '公司', '150', '162', 'HyundaiMotor');
INSERT INTO `dt_extraction` VALUES ('12', '38', '31', '4', '0-0', '公司', '9', '14', 'Aptiv');
INSERT INTO `dt_extraction` VALUES ('13', '38', '31', '4', '0-1', '公司', '52', '64', 'HyundaiMotor');
INSERT INTO `dt_extraction` VALUES ('14', '38', '31', '4', '0-0', '公司', '9', '14', 'Aptiv');
INSERT INTO `dt_extraction` VALUES ('15', '38', '31', '4', '0-1', '公司', '52', '64', 'HyundaiMotor');
INSERT INTO `dt_extraction` VALUES ('16', '70', '420', '4', '0-0', '时间', '9', '12', '单资格');
INSERT INTO `dt_extraction` VALUES ('17', '70', '421', '4', '0-0', '时间', '15', '19', '南京大学');
INSERT INTO `dt_extraction` VALUES ('18', '70', '421', '4', '0-1', '时间', '28', '33', '3月11号');
INSERT INTO `dt_extraction` VALUES ('19', '70', '421', '4', '1-0', '地点', '45', '66', '南京大学-仙林校区-计算机科学技术楼111');
INSERT INTO `dt_extraction` VALUES ('20', '70', '422', '4', '0-0', '时间', '21', '24', '这里退');
INSERT INTO `dt_extraction` VALUES ('21', '70', '420', '4', '0-0', '时间', '15', '18', '家庭装');
INSERT INTO `dt_extraction` VALUES ('22', '70', '421', '4', '0-0', '时间', '28', '39', '3月11号18：30 ');
INSERT INTO `dt_extraction` VALUES ('23', '70', '421', '4', '1-0', '地点', '15', '19', '南京大学');
INSERT INTO `dt_extraction` VALUES ('24', '70', '422', '4', '0-0', '时间', '10', '13', '品的推');
INSERT INTO `dt_extraction` VALUES ('25', '70', '420', '4', '0-0', '时间', '17', '19', '装湿');
INSERT INTO `dt_extraction` VALUES ('26', '70', '420', '4', '0-0', '时间', '17', '20', '装湿巾');
INSERT INTO `dt_extraction` VALUES ('27', '70', '421', '4', '0-0', '时间', '17', '20', '装湿巾');
INSERT INTO `dt_extraction` VALUES ('28', '70', '421', '4', '0-1', '时间', '89', '93', '：游戏研');
INSERT INTO `dt_extraction` VALUES ('29', '70', '420', '4', '0-0', '时间', '11', '16', '格！3包家');
INSERT INTO `dt_extraction` VALUES ('30', '70', '421', '4', '1-0', '地点', '15', '19', '南京大学');
INSERT INTO `dt_extraction` VALUES ('31', '70', '422', '4', '0-0', '时间', '11', '40', '的推荐邮件，请点击 这里退订 《阴阳师》二周年庆重磅开启！');
INSERT INTO `dt_extraction` VALUES ('32', '70', '421', '4', '0-0', '时间', '5', '10', '10月2日');
INSERT INTO `dt_extraction` VALUES ('33', '70', '421', '4', '1-0', '点点', '3', '5', '北京');
INSERT INTO `dt_extraction` VALUES ('34', '70', '422', '4', '0-0', '时间', '4', '7', '方队亮');
INSERT INTO `dt_extraction` VALUES ('35', '70', '422', '4', '1-0', '点点', '12', '17', '象征着国威');
INSERT INTO `dt_extraction` VALUES ('36', '70', '423', '4', '0-0', '时间', '5', '8', '80年');
INSERT INTO `dt_extraction` VALUES ('37', '70', '423', '4', '1-0', '点点', '160', '162', '中国');
INSERT INTO `dt_extraction` VALUES ('38', '70', '424', '4', '0-0', '时间', '11', '14', '罗斯总');
INSERT INTO `dt_extraction` VALUES ('39', '70', '425', '4', '0-0', '时间', '47', '49', '规导');
INSERT INTO `dt_extraction` VALUES ('40', '70', '426', '4', '0-0', '时间', '179', '179', '安街，象征着国威军威的大国长剑昂首向天、威震寰宇。16枚东风-17常规导弹');
INSERT INTO `dt_extraction` VALUES ('41', '70', '427', '4', '0-0', '时间', '50', '54', '成立35');
INSERT INTO `dt_extraction` VALUES ('42', '70', '428', '4', '0-0', '时间', '5', '11', '80年代初期');
INSERT INTO `dt_extraction` VALUES ('43', '70', '429', '4', '0-0', '时间', '16', '49', '程控电话，但装一部固定电话要五六千块钱，这可不是小数。后来有了BP');
INSERT INTO `dt_extraction` VALUES ('44', '70', '430', '4', '0-0', '时间', '11', '14', '2G时');
INSERT INTO `dt_extraction` VALUES ('45', '70', '431', '4', '0-0', '时间', '43', '46', '无产业');
INSERT INTO `dt_extraction` VALUES ('46', '70', '432', '4', '0-0', '时间', '52', '57', 'CDMA和');
INSERT INTO `dt_extraction` VALUES ('47', '70', '433', '4', '0-0', '时间', '2', '6', '4G时代');
INSERT INTO `dt_extraction` VALUES ('48', '70', '434', '4', '0-0', '时间', '6', '13', '（2020年代');
INSERT INTO `dt_extraction` VALUES ('49', '70', '435', '4', '0-0', '时间', '3', '8', '10月7日');
INSERT INTO `dt_extraction` VALUES ('50', '70', '436', '4', '0-0', '时间', '9', '11', '相信');
INSERT INTO `dt_extraction` VALUES ('51', '70', '437', '4', '0-0', '时间', '14', '16', '示，');
INSERT INTO `dt_extraction` VALUES ('52', '70', '438', '4', '0-0', '时间', '11', '15', '过？此前');
INSERT INTO `dt_extraction` VALUES ('53', '73', '515', '4', '0-0', '时间', '258', '260', '今天');
INSERT INTO `dt_extraction` VALUES ('54', '73', '515', '4', '1-0', '地点', '6', '9', '长安街');
INSERT INTO `dt_extraction` VALUES ('55', '73', '515', '4', '0-1', '时间', '5', '10', '10月2日');
INSERT INTO `dt_extraction` VALUES ('56', '73', '515', '4', '1-0', '地点', '3', '5', '北京');
INSERT INTO `dt_extraction` VALUES ('57', '73', '515', '4', '0-0', '时间', '22', '27', '10月1日');
INSERT INTO `dt_extraction` VALUES ('58', '73', '515', '4', '0-1', '时间', '5', '10', '10月2日');
INSERT INTO `dt_extraction` VALUES ('59', '73', '516', '4', '0-0', '时间', '38', '44', '17常规导弹');
INSERT INTO `dt_extraction` VALUES ('60', '73', '516', '4', '0-1', '时间', '141', '144', '人丁兴');
INSERT INTO `dt_extraction` VALUES ('61', '73', '517', '4', '0-0', '时间', '2', '10', '上世纪80年代初');
INSERT INTO `dt_extraction` VALUES ('62', '73', '517', '4', '0-1', '时间', '200', '206', '90年代初期');
INSERT INTO `dt_extraction` VALUES ('63', '73', '518', '4', '0-0', '时间', '2', '10', '上世纪80年代初');
INSERT INTO `dt_extraction` VALUES ('64', '73', '518', '4', '0-1', '时间', '200', '206', '90年代初期');
INSERT INTO `dt_extraction` VALUES ('65', '73', '518', '4', '0-2', '时间', '0', '9', '今天（10月7日）');
INSERT INTO `dt_extraction` VALUES ('68', '75', '523', '4', '1-0', '地点', '8', '11', '长安街');
INSERT INTO `dt_extraction` VALUES ('69', '76', '536', '4', '0-0', '时间', '5', '10', '10月2日');
INSERT INTO `dt_extraction` VALUES ('70', '76', '537', '4', '1-0', '地点', '8', '11', '长安街');
INSERT INTO `dt_extraction` VALUES ('71', '76', '538', '4', '1-0', '地点', '2', '5', '长安街');
INSERT INTO `dt_extraction` VALUES ('72', '74', '519', '4', '0-0', '时间', '6', '9', '长安街');
INSERT INTO `dt_extraction` VALUES ('73', '74', '519', '4', '1-0', '地点', '81', '89', '东风-41核导弹');

-- ----------------------------
-- Table structure for dt_extraction_relation
-- ----------------------------
DROP TABLE IF EXISTS `dt_extraction_relation`;
CREATE TABLE `dt_extraction_relation` (
  `dt_erid` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `subtask_id` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `relation_id` varchar(255) DEFAULT NULL,
  `relation` varchar(255) DEFAULT NULL,
  `headentity` varchar(255) DEFAULT NULL,
  `tailentity` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dt_erid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_extraction_relation
-- ----------------------------
INSERT INTO `dt_extraction_relation` VALUES ('1', '38', '31', '4', '1-0', '投资', null, null);
INSERT INTO `dt_extraction_relation` VALUES ('2', '38', '31', '4', '1-0', '投资', '0-0', '0-1');
INSERT INTO `dt_extraction_relation` VALUES ('3', '70', '421', '4', '0-0', '测试', '1-0', '0-0');
INSERT INTO `dt_extraction_relation` VALUES ('4', '70', '422', '4', '0-0', '测试', '0-0', '1-0');
INSERT INTO `dt_extraction_relation` VALUES ('5', '73', '515', '4', '0-0', '事件', '1-0', '0-0');
INSERT INTO `dt_extraction_relation` VALUES ('6', '73', '515', '4', '0-0', '事件', '1-0', '0-1');
INSERT INTO `dt_extraction_relation` VALUES ('7', '73', '515', '4', '0-0', '事件', '0-1', '0-0');
INSERT INTO `dt_extraction_relation` VALUES ('8', '73', '516', '4', '0-0', '事件', '0-0', '0-1');
INSERT INTO `dt_extraction_relation` VALUES ('10', '74', '519', '4', '0-0', '事件', '0-0', '1-0');

-- ----------------------------
-- Table structure for dt_pairing
-- ----------------------------
DROP TABLE IF EXISTS `dt_pairing`;
CREATE TABLE `dt_pairing` (
  `dtd_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '做任务详细描述ID',
  `task_id` int(11) NOT NULL COMMENT '做任务ID',
  `subtask_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `a_litemid` int(11) DEFAULT NULL COMMENT 'listitemID',
  `b_litemid` int(11) DEFAULT NULL COMMENT 'listitemID',
  PRIMARY KEY (`dtd_id`),
  KEY `dt_id` (`task_id`),
  KEY `a_litemid` (`a_litemid`),
  KEY `b_litemid` (`b_litemid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_pairing
-- ----------------------------
INSERT INTO `dt_pairing` VALUES ('1', '2', null, null, '49', '51');
INSERT INTO `dt_pairing` VALUES ('2', '7', null, null, '1', '3');
INSERT INTO `dt_pairing` VALUES ('3', '12', null, null, '145', '157');
INSERT INTO `dt_pairing` VALUES ('4', '13', null, null, '158', '165');
INSERT INTO `dt_pairing` VALUES ('5', '13', null, null, '159', '167');
INSERT INTO `dt_pairing` VALUES ('6', '12', null, null, '149', '153');
INSERT INTO `dt_pairing` VALUES ('7', '14', null, null, '147', '153');
INSERT INTO `dt_pairing` VALUES ('8', '14', null, null, '148', '155');
INSERT INTO `dt_pairing` VALUES ('9', '14', null, null, '149', '157');
INSERT INTO `dt_pairing` VALUES ('10', '15', null, null, '161', '169');
INSERT INTO `dt_pairing` VALUES ('11', '15', null, null, '162', '170');
INSERT INTO `dt_pairing` VALUES ('12', '15', null, null, '160', '167');
INSERT INTO `dt_pairing` VALUES ('13', '15', null, null, '160', '165');
INSERT INTO `dt_pairing` VALUES ('14', '16', null, null, '172', '176');
INSERT INTO `dt_pairing` VALUES ('15', '16', null, null, '173', '177');
INSERT INTO `dt_pairing` VALUES ('16', '5', null, null, '97', '100');
INSERT INTO `dt_pairing` VALUES ('17', '2', null, null, '50', '52');
INSERT INTO `dt_pairing` VALUES ('18', '17', null, null, '195', '198');
INSERT INTO `dt_pairing` VALUES ('19', '17', null, null, '196', '197');
INSERT INTO `dt_pairing` VALUES ('21', '79', '162', '4', '271', '274');
INSERT INTO `dt_pairing` VALUES ('22', '79', '162', '4', '273', '276');
INSERT INTO `dt_pairing` VALUES ('23', '79', '162', '4', '275', '272');
INSERT INTO `dt_pairing` VALUES ('24', '79', '163', '4', '277', '280');
INSERT INTO `dt_pairing` VALUES ('25', '79', '163', '4', '279', '282');
INSERT INTO `dt_pairing` VALUES ('26', '79', '163', '4', '281', '278');
INSERT INTO `dt_pairing` VALUES ('27', '88', '183', '4', '295', '298');
INSERT INTO `dt_pairing` VALUES ('28', '88', '183', '4', '297', '300');
INSERT INTO `dt_pairing` VALUES ('29', '88', '183', '4', '299', '296');
INSERT INTO `dt_pairing` VALUES ('30', '88', '184', '4', '301', '304');
INSERT INTO `dt_pairing` VALUES ('31', '88', '184', '4', '303', '306');
INSERT INTO `dt_pairing` VALUES ('32', '88', '184', '4', '305', '302');
INSERT INTO `dt_pairing` VALUES ('33', '89', '185', '4', '307', '310');
INSERT INTO `dt_pairing` VALUES ('34', '89', '185', '4', '309', '312');
INSERT INTO `dt_pairing` VALUES ('35', '89', '185', '4', '311', '308');
INSERT INTO `dt_pairing` VALUES ('36', '89', '186', '4', '313', '316');
INSERT INTO `dt_pairing` VALUES ('37', '89', '186', '4', '315', '318');
INSERT INTO `dt_pairing` VALUES ('38', '89', '186', '4', '317', '314');
INSERT INTO `dt_pairing` VALUES ('39', '90', '187', '4', '319', '322');
INSERT INTO `dt_pairing` VALUES ('40', '90', '187', '4', '321', '324');
INSERT INTO `dt_pairing` VALUES ('41', '90', '187', '4', '323', '320');

-- ----------------------------
-- Table structure for dt_relation
-- ----------------------------
DROP TABLE IF EXISTS `dt_relation`;
CREATE TABLE `dt_relation` (
  `dtd_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '做任务详细描述ID',
  `task_id` int(11) NOT NULL COMMENT '做任务ID',
  `subtask_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `labeltype` varchar(80) DEFAULT NULL COMMENT '仅可取值instance#item1#item2',
  `label_id` int(11) DEFAULT NULL COMMENT '标签ID',
  PRIMARY KEY (`dtd_id`),
  KEY `dt_id` (`task_id`),
  KEY `label_id` (`label_id`),
  CONSTRAINT `dt_relation_ibfk_2` FOREIGN KEY (`label_id`) REFERENCES `label` (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_relation
-- ----------------------------
INSERT INTO `dt_relation` VALUES ('1', '8', null, null, 'item1', '16');
INSERT INTO `dt_relation` VALUES ('2', '8', null, null, 'item1', '17');
INSERT INTO `dt_relation` VALUES ('3', '8', null, null, 'item2', '19');
INSERT INTO `dt_relation` VALUES ('4', '8', null, null, 'item2', '20');
INSERT INTO `dt_relation` VALUES ('5', '10', null, null, 'instance', '28');
INSERT INTO `dt_relation` VALUES ('6', '10', null, null, 'instance', '29');
INSERT INTO `dt_relation` VALUES ('7', '10', null, null, 'item1', '31');
INSERT INTO `dt_relation` VALUES ('8', '10', null, null, 'item2', '30');
INSERT INTO `dt_relation` VALUES ('9', '11', null, null, 'instance', '29');
INSERT INTO `dt_relation` VALUES ('10', '11', null, null, 'item1', '30');
INSERT INTO `dt_relation` VALUES ('12', '11', null, null, 'item2', '30');
INSERT INTO `dt_relation` VALUES ('13', '82', '169', '4', 'instance', '57');
INSERT INTO `dt_relation` VALUES ('14', '82', '169', '4', 'item1', '58');
INSERT INTO `dt_relation` VALUES ('15', '82', '169', '4', 'item2', '59');

-- ----------------------------
-- Table structure for dt_sorting
-- ----------------------------
DROP TABLE IF EXISTS `dt_sorting`;
CREATE TABLE `dt_sorting` (
  `dtd_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '做任务详细描述ID',
  `task_id` int(11) DEFAULT NULL COMMENT '做任务ID',
  `subtask_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL COMMENT 'itemID',
  `newindex` int(11) DEFAULT NULL COMMENT 'newindex',
  PRIMARY KEY (`dtd_id`),
  UNIQUE KEY `dt_id` (`task_id`,`item_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `dt_sorting_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`itid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dt_sorting
-- ----------------------------
INSERT INTO `dt_sorting` VALUES ('1', '6', null, null, '56', '1');
INSERT INTO `dt_sorting` VALUES ('2', '6', null, null, '57', '2');
INSERT INTO `dt_sorting` VALUES ('3', '6', null, null, '58', '3');
INSERT INTO `dt_sorting` VALUES ('4', '9', null, null, '57', '1');
INSERT INTO `dt_sorting` VALUES ('5', '9', null, null, '56', '2');
INSERT INTO `dt_sorting` VALUES ('6', '9', null, null, '58', '3');
INSERT INTO `dt_sorting` VALUES ('7', '84', '175', '4', '391', '1');
INSERT INTO `dt_sorting` VALUES ('8', '84', '175', '4', '393', '2');
INSERT INTO `dt_sorting` VALUES ('9', '84', '175', '4', '390', '3');
INSERT INTO `dt_sorting` VALUES ('10', '84', '175', '4', '392', '4');
INSERT INTO `dt_sorting` VALUES ('11', '86', '179', '4', '409', '1');
INSERT INTO `dt_sorting` VALUES ('12', '86', '179', '4', '410', '2');
INSERT INTO `dt_sorting` VALUES ('13', '86', '179', '4', '407', '3');
INSERT INTO `dt_sorting` VALUES ('14', '86', '179', '4', '408', '4');

-- ----------------------------
-- Table structure for d_instance
-- ----------------------------
DROP TABLE IF EXISTS `d_instance`;
CREATE TABLE `d_instance` (
  `dtid` int(11) NOT NULL AUTO_INCREMENT COMMENT '做任务唯一标识ID',
  `document_id` int(11) NOT NULL COMMENT '文件ID',
  `instance_id` int(11) NOT NULL COMMENT '做任务段落ID',
  `dotime` varchar(40) DEFAULT NULL COMMENT '开始做日期',
  `comptime` varchar(40) DEFAULT NULL COMMENT '完成日期',
  `dtstatus` varchar(40) DEFAULT NULL COMMENT '任务进行状态',
  `dtask_id` int(11) NOT NULL COMMENT '做任务taskid',
  PRIMARY KEY (`dtid`),
  KEY `instance_id` (`instance_id`),
  KEY `document_id` (`document_id`),
  KEY `dtask_id` (`dtask_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_instance
-- ----------------------------
INSERT INTO `d_instance` VALUES ('1', '7', '13', '2019-03-12 16:34:40', null, '进行中', '48');
INSERT INTO `d_instance` VALUES ('2', '7', '10', '2019-03-12 16:34:54', null, '进行中', '48');
INSERT INTO `d_instance` VALUES ('3', '7', '15', '2019-03-12 16:35:47', null, '进行中', '48');
INSERT INTO `d_instance` VALUES ('4', '7', '12', '2019-03-12 16:37:17', null, '进行中', '48');
INSERT INTO `d_instance` VALUES ('5', '9', '19', '2019-03-12 16:38:04', null, '已完成', '49');
INSERT INTO `d_instance` VALUES ('6', '13', '38', '2019-03-12 16:47:41', null, '已完成', '50');
INSERT INTO `d_instance` VALUES ('7', '5', '1', '2019-03-13 10:55:25', null, '已完成', '52');
INSERT INTO `d_instance` VALUES ('8', '18', '60', '2019-03-13 11:09:21', null, '已完成', '53');
INSERT INTO `d_instance` VALUES ('9', '13', '38', '2019-03-27 19:13:56', null, '进行中', '55');
INSERT INTO `d_instance` VALUES ('10', '22', '72', '2019-04-06 22:35:57', null, '进行中', '57');
INSERT INTO `d_instance` VALUES ('11', '22', '73', '2019-04-06 22:37:50', null, '进行中', '57');
INSERT INTO `d_instance` VALUES ('12', '24', '84', '2019-04-06 22:46:03', null, '进行中', '58');
INSERT INTO `d_instance` VALUES ('13', '24', '85', '2019-04-06 22:47:36', null, '进行中', '58');
INSERT INTO `d_instance` VALUES ('14', '24', '84', '2019-04-18 15:22:05', null, '进行中', '59');
INSERT INTO `d_instance` VALUES ('15', '24', '85', '2019-04-18 15:22:15', null, '进行中', '59');
INSERT INTO `d_instance` VALUES ('16', '25', '86', '2019-04-18 15:50:55', null, '进行中', '58');
INSERT INTO `d_instance` VALUES ('17', '143', '115', '2020-01-10 21:08:37', null, '进行中', '81');

-- ----------------------------
-- Table structure for d_paragraph
-- ----------------------------
DROP TABLE IF EXISTS `d_paragraph`;
CREATE TABLE `d_paragraph` (
  `dtid` int(11) NOT NULL AUTO_INCREMENT COMMENT '做任务唯一标识ID',
  `document_id` int(11) NOT NULL COMMENT '文件ID',
  `paragraph_id` int(11) NOT NULL COMMENT '做任务段落ID',
  `dotime` varchar(40) DEFAULT NULL COMMENT '开始做日期',
  `comptime` varchar(40) DEFAULT NULL COMMENT '完成日期',
  `dtstatus` varchar(40) DEFAULT NULL COMMENT '任务进行状态',
  `dtask_id` int(11) NOT NULL COMMENT '做任务taskid',
  PRIMARY KEY (`dtid`),
  KEY `paragraph_id` (`paragraph_id`),
  KEY `document_id` (`document_id`),
  KEY `dtask_id` (`dtask_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_paragraph
-- ----------------------------
INSERT INTO `d_paragraph` VALUES ('1', '1', '1', '2019-03-12 16:14:48', null, '已完成', '47');
INSERT INTO `d_paragraph` VALUES ('2', '1', '2', '2019-03-12 16:16:30', null, '已完成', '47');
INSERT INTO `d_paragraph` VALUES ('3', '1', '9', '2019-03-12 16:20:00', null, '已完成', '47');
INSERT INTO `d_paragraph` VALUES ('4', '1', '8', '2019-03-12 16:20:35', null, '已完成', '47');
INSERT INTO `d_paragraph` VALUES ('5', '15', '21', '2019-03-12 18:40:59', null, '进行中', '51');
INSERT INTO `d_paragraph` VALUES ('6', '1', '3', '2019-03-26 16:36:57', null, '已完成', '47');
INSERT INTO `d_paragraph` VALUES ('7', '1', '4', '2019-03-26 16:37:02', null, '已完成', '47');
INSERT INTO `d_paragraph` VALUES ('8', '1', '5', '2019-03-26 16:37:06', null, '已完成', '47');
INSERT INTO `d_paragraph` VALUES ('9', '1', '6', '2019-03-26 16:37:12', null, '已完成', '47');
INSERT INTO `d_paragraph` VALUES ('10', '1', '7', '2019-03-26 16:37:17', null, '已完成', '47');
INSERT INTO `d_paragraph` VALUES ('11', '2', '10', '2019-03-26 16:37:32', null, '已完成', '47');
INSERT INTO `d_paragraph` VALUES ('12', '2', '11', '2019-03-26 16:37:36', null, '已完成', '47');
INSERT INTO `d_paragraph` VALUES ('13', '2', '12', '2019-03-26 20:51:17', null, '已完成', '47');
INSERT INTO `d_paragraph` VALUES ('14', '2', '13', '2019-03-26 20:51:26', null, '已完成', '47');
INSERT INTO `d_paragraph` VALUES ('15', '2', '14', '2019-03-26 20:51:32', null, '已完成', '47');
INSERT INTO `d_paragraph` VALUES ('16', '2', '15', '2019-03-26 20:51:43', null, '已完成', '47');
INSERT INTO `d_paragraph` VALUES ('17', '2', '16', '2019-03-26 20:51:49', null, '已完成', '47');
INSERT INTO `d_paragraph` VALUES ('18', '2', '17', '2019-03-26 20:51:55', null, '已完成', '47');
INSERT INTO `d_paragraph` VALUES ('19', '2', '18', '2019-03-26 20:52:00', null, '已完成', '47');
INSERT INTO `d_paragraph` VALUES ('20', '1', '1', '2019-03-27 19:13:33', null, '已完成', '54');
INSERT INTO `d_paragraph` VALUES ('21', '1', '2', '2019-03-27 19:13:40', null, '进行中', '54');
INSERT INTO `d_paragraph` VALUES ('22', '20', '28', '2019-04-06 22:27:52', null, '进行中', '56');
INSERT INTO `d_paragraph` VALUES ('23', '1', '1', '2019-07-08 15:20:12', null, '已完成', '60');
INSERT INTO `d_paragraph` VALUES ('24', '1', '3', '2019-07-08 21:04:02', null, '已完成', '54');
INSERT INTO `d_paragraph` VALUES ('25', '1', '4', '2019-07-08 21:04:27', null, '进行中', '54');
INSERT INTO `d_paragraph` VALUES ('27', '15', '21', '2019-10-31 16:52:14', null, '进行中', '63');
INSERT INTO `d_paragraph` VALUES ('28', '155', '43', '2020-01-10 20:18:35', null, '进行中', '80');

-- ----------------------------
-- Table structure for d_task
-- ----------------------------
DROP TABLE IF EXISTS `d_task`;
CREATE TABLE `d_task` (
  `tkid` int(11) NOT NULL AUTO_INCREMENT COMMENT '做任务唯一标识ID',
  `user_id` int(11) DEFAULT NULL COMMENT '做任务的用户ID',
  `task_id` int(11) DEFAULT NULL COMMENT '任务ID',
  `dotime` varchar(40) DEFAULT NULL COMMENT '开始做日期',
  `dcomptime` varchar(40) DEFAULT NULL COMMENT '完成日期',
  `dstatus` varchar(40) DEFAULT NULL COMMENT '任务进行状态',
  `dpercent` varchar(40) DEFAULT NULL COMMENT '任务完成百分比',
  `alreadypart` int(11) DEFAULT NULL,
  `totalpart` int(11) DEFAULT NULL,
  `currentstatus` varchar(255) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `accuracy` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `totaltest` int(11) DEFAULT NULL,
  PRIMARY KEY (`tkid`),
  KEY `user_id` (`user_id`),
  KEY `task_id` (`task_id`),
  CONSTRAINT `d_task_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `d_task_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `task` (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of d_task
-- ----------------------------
INSERT INTO `d_task` VALUES ('47', '2', '1', '2019-03-12 16:14:48', null, '已完成', '0%', '0', '18', null, null, null, null);
INSERT INTO `d_task` VALUES ('48', '2', '5', '2019-03-12 16:34:40', null, '进行中', '0%', '0', '9', null, null, null, null);
INSERT INTO `d_task` VALUES ('49', '2', '6', '2019-03-12 16:38:04', null, '进行中', '11.1%', '1', '9', null, null, null, null);
INSERT INTO `d_task` VALUES ('50', '2', '8', '2019-03-12 16:47:41', null, '进行中', '10.0%', '1', '10', null, null, null, null);
INSERT INTO `d_task` VALUES ('51', '2', '9', '2019-03-12 18:40:59', null, '进行中', '0%', '0', '7', null, null, '1', null);
INSERT INTO `d_task` VALUES ('52', '2', '4', '2019-03-13 10:55:25', null, '进行中', '11.1%', '1', '9', null, null, '1', null);
INSERT INTO `d_task` VALUES ('53', '2', '10', '2019-03-13 11:09:21', null, '进行中', '8.3%', '1', '12', null, null, '1', null);
INSERT INTO `d_task` VALUES ('54', '1', '1', '2019-03-27 19:13:33', null, '进行中', '11.1%', '2', '18', null, null, '1', null);
INSERT INTO `d_task` VALUES ('55', '1', '8', '2019-03-27 19:13:56', null, '进行中', '0%', '0', '10', null, null, '1', null);
INSERT INTO `d_task` VALUES ('56', '2', '11', '2019-04-06 22:27:52', null, '进行中', '0%', '0', '11', null, null, '1', null);
INSERT INTO `d_task` VALUES ('57', '2', '12', '2019-04-06 22:35:57', null, '进行中', '0%', '0', '12', null, null, '1', null);
INSERT INTO `d_task` VALUES ('58', '2', '13', '2019-04-06 22:46:03', null, '进行中', '0%', '0', '5', null, null, '1', null);
INSERT INTO `d_task` VALUES ('59', '1', '13', '2019-04-18 15:22:05', null, '进行中', '0%', '0', '5', null, null, '1', null);
INSERT INTO `d_task` VALUES ('60', '4', '1', '2019-07-08 15:20:12', null, '进行中', '5.6%', '1', '18', null, '2', '1', null);
INSERT INTO `d_task` VALUES ('63', '4', '9', '2019-10-31 16:52:14', null, '进行中', '0%', '0', '7', null, null, '1', null);
INSERT INTO `d_task` VALUES ('71', '3', '20', '2019-12-02 09:13:16', null, '进行中', '0%', '0', '14', null, '20', '1', '0');
INSERT INTO `d_task` VALUES ('72', '4', '38', '2019-12-24 11:26:25', null, '进行中', '0%', '0', '4', 'notest', '391', '1', '0');
INSERT INTO `d_task` VALUES ('75', '4', '39', '2020-01-09 20:44:39', null, '进行中', '0%', '0', '4', 'notest', null, '1', '1');
INSERT INTO `d_task` VALUES ('85', '4', '68', '2020-02-23 13:02:38', null, '进行中', '0%', '0', '3', 'notest', '417', '1', '0');
INSERT INTO `d_task` VALUES ('88', '4', '70', '2020-03-21 16:39:33', null, '进行中', '0', '18', '18', 'notest', null, '1', '0');
INSERT INTO `d_task` VALUES ('90', '4', '71', '2020-03-21 17:57:36', null, '进行中', '0', '0', '4', 'notest', null, '0.0', '1');
INSERT INTO `d_task` VALUES ('96', '4', '73', '2020-03-24 20:43:43', null, '进行中', '0', '4', '4', 'notest', null, '1', '0');
INSERT INTO `d_task` VALUES ('99', '4', '76', '2020-03-25 03:16:28', null, '进行中', '0', '3', '14', 'notest', '539', '1', '0');
INSERT INTO `d_task` VALUES ('100', '4', '74', '2020-03-26 20:50:26', null, '进行中', '0', '1', '4', 'notest', '521', '1', '0');
INSERT INTO `d_task` VALUES ('102', '4', '79', '2020-03-30 12:56:23', null, '进行中', '0', '2', '2', 'notest', null, '1', '0');
INSERT INTO `d_task` VALUES ('103', '4', '82', '2020-03-30 14:49:19', null, '进行中', '0', '1', '3', 'notest', '170', '1', '0');
INSERT INTO `d_task` VALUES ('104', '4', '84', '2020-03-30 15:04:01', null, '进行中', '0', '1', '2', 'notest', '176', '1', '0');
INSERT INTO `d_task` VALUES ('105', '4', '86', '2020-03-30 15:05:10', null, '进行中', '0', '1', '2', 'notest', null, '1', '0');
INSERT INTO `d_task` VALUES ('106', '4', '77', '2020-03-30 16:49:33', null, '进行中', '0', '1', '3', 'notest', '560', '1', '0');
INSERT INTO `d_task` VALUES ('107', '4', '88', '2020-03-30 19:39:45', null, '进行中', '0', '2', '2', 'notest', null, '1', '0');
INSERT INTO `d_task` VALUES ('108', '4', '89', '2020-03-30 23:33:22', null, '进行中', '0', '2', '2', 'notest', null, '1', '0');
INSERT INTO `d_task` VALUES ('109', '4', '90', '2020-03-30 23:52:59', null, '进行中', '0', '1', '6', 'notest', '188', '1', '0');

-- ----------------------------
-- Table structure for extraction_relationlabel
-- ----------------------------
DROP TABLE IF EXISTS `extraction_relationlabel`;
CREATE TABLE `extraction_relationlabel` (
  `rela_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `relation` varchar(255) DEFAULT NULL,
  `head_entity` varchar(255) DEFAULT NULL,
  `tail_entity` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rela_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of extraction_relationlabel
-- ----------------------------
INSERT INTO `extraction_relationlabel` VALUES ('1', '38', '任职', null, null);
INSERT INTO `extraction_relationlabel` VALUES ('2', '38', '投资', null, null);
INSERT INTO `extraction_relationlabel` VALUES ('3', '38', '技术关系', null, null);
INSERT INTO `extraction_relationlabel` VALUES ('4', '39', '投资', null, null);
INSERT INTO `extraction_relationlabel` VALUES ('5', '39', '技术关系', null, null);
INSERT INTO `extraction_relationlabel` VALUES ('6', '66', '雇佣', null, null);
INSERT INTO `extraction_relationlabel` VALUES ('7', '70', '测试', null, null);
INSERT INTO `extraction_relationlabel` VALUES ('8', '73', '事件', null, null);
INSERT INTO `extraction_relationlabel` VALUES ('9', '74', '事件', null, null);

-- ----------------------------
-- Table structure for instance
-- ----------------------------
DROP TABLE IF EXISTS `instance`;
CREATE TABLE `instance` (
  `instid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'instanceID',
  `instindex` int(11) DEFAULT NULL COMMENT 'doc里的第几段，1、2、3等等',
  `document_id` int(11) NOT NULL COMMENT '文件ID',
  `labelnum` int(11) DEFAULT NULL COMMENT '发布者选择做任务贴几个标签',
  PRIMARY KEY (`instid`),
  KEY `document_id` (`document_id`),
  CONSTRAINT `instance_ibfk_1` FOREIGN KEY (`document_id`) REFERENCES `document` (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of instance
-- ----------------------------
INSERT INTO `instance` VALUES ('1', '1', '5', null);
INSERT INTO `instance` VALUES ('2', '2', '5', null);
INSERT INTO `instance` VALUES ('3', '3', '5', null);
INSERT INTO `instance` VALUES ('4', '4', '5', null);
INSERT INTO `instance` VALUES ('5', '5', '5', null);
INSERT INTO `instance` VALUES ('6', '6', '5', null);
INSERT INTO `instance` VALUES ('7', '1', '6', null);
INSERT INTO `instance` VALUES ('8', '2', '6', null);
INSERT INTO `instance` VALUES ('9', '3', '6', null);
INSERT INTO `instance` VALUES ('10', '1', '7', null);
INSERT INTO `instance` VALUES ('11', '2', '7', null);
INSERT INTO `instance` VALUES ('12', '3', '7', null);
INSERT INTO `instance` VALUES ('13', '4', '7', null);
INSERT INTO `instance` VALUES ('14', '5', '7', null);
INSERT INTO `instance` VALUES ('15', '6', '7', null);
INSERT INTO `instance` VALUES ('16', '1', '8', null);
INSERT INTO `instance` VALUES ('17', '2', '8', null);
INSERT INTO `instance` VALUES ('18', '3', '8', null);
INSERT INTO `instance` VALUES ('19', '1', '9', null);
INSERT INTO `instance` VALUES ('20', '2', '9', null);
INSERT INTO `instance` VALUES ('21', '3', '9', null);
INSERT INTO `instance` VALUES ('22', '4', '9', null);
INSERT INTO `instance` VALUES ('23', '5', '9', null);
INSERT INTO `instance` VALUES ('24', '6', '9', null);
INSERT INTO `instance` VALUES ('25', '1', '10', null);
INSERT INTO `instance` VALUES ('26', '2', '10', null);
INSERT INTO `instance` VALUES ('27', '3', '10', null);
INSERT INTO `instance` VALUES ('28', '1', '11', null);
INSERT INTO `instance` VALUES ('29', '2', '11', null);
INSERT INTO `instance` VALUES ('30', '3', '11', null);
INSERT INTO `instance` VALUES ('31', '4', '11', null);
INSERT INTO `instance` VALUES ('32', '5', '11', null);
INSERT INTO `instance` VALUES ('33', '1', '12', null);
INSERT INTO `instance` VALUES ('34', '2', '12', null);
INSERT INTO `instance` VALUES ('35', '3', '12', null);
INSERT INTO `instance` VALUES ('36', '4', '12', null);
INSERT INTO `instance` VALUES ('37', '5', '12', null);
INSERT INTO `instance` VALUES ('38', '1', '13', null);
INSERT INTO `instance` VALUES ('39', '2', '13', null);
INSERT INTO `instance` VALUES ('40', '3', '13', null);
INSERT INTO `instance` VALUES ('41', '4', '13', null);
INSERT INTO `instance` VALUES ('42', '5', '13', null);
INSERT INTO `instance` VALUES ('43', '1', '14', null);
INSERT INTO `instance` VALUES ('44', '2', '14', null);
INSERT INTO `instance` VALUES ('45', '3', '14', null);
INSERT INTO `instance` VALUES ('46', '4', '14', null);
INSERT INTO `instance` VALUES ('47', '5', '14', null);
INSERT INTO `instance` VALUES ('48', '1', '16', '2');
INSERT INTO `instance` VALUES ('49', '2', '16', '2');
INSERT INTO `instance` VALUES ('50', '3', '16', '2');
INSERT INTO `instance` VALUES ('51', '4', '16', '2');
INSERT INTO `instance` VALUES ('52', '5', '16', '2');
INSERT INTO `instance` VALUES ('53', '6', '16', '2');
INSERT INTO `instance` VALUES ('54', '1', '17', '2');
INSERT INTO `instance` VALUES ('55', '2', '17', '2');
INSERT INTO `instance` VALUES ('56', '3', '17', '2');
INSERT INTO `instance` VALUES ('57', '4', '17', '2');
INSERT INTO `instance` VALUES ('58', '5', '17', '2');
INSERT INTO `instance` VALUES ('59', '6', '17', '2');
INSERT INTO `instance` VALUES ('60', '1', '18', '2');
INSERT INTO `instance` VALUES ('61', '2', '18', '2');
INSERT INTO `instance` VALUES ('62', '3', '18', '2');
INSERT INTO `instance` VALUES ('63', '4', '18', '2');
INSERT INTO `instance` VALUES ('64', '5', '18', '2');
INSERT INTO `instance` VALUES ('65', '6', '18', '2');
INSERT INTO `instance` VALUES ('66', '1', '19', '2');
INSERT INTO `instance` VALUES ('67', '2', '19', '2');
INSERT INTO `instance` VALUES ('68', '3', '19', '2');
INSERT INTO `instance` VALUES ('69', '4', '19', '2');
INSERT INTO `instance` VALUES ('70', '5', '19', '2');
INSERT INTO `instance` VALUES ('71', '6', '19', '2');
INSERT INTO `instance` VALUES ('72', '1', '22', '2');
INSERT INTO `instance` VALUES ('73', '2', '22', '2');
INSERT INTO `instance` VALUES ('74', '3', '22', '2');
INSERT INTO `instance` VALUES ('75', '4', '22', '2');
INSERT INTO `instance` VALUES ('76', '5', '22', '2');
INSERT INTO `instance` VALUES ('77', '6', '22', '2');
INSERT INTO `instance` VALUES ('78', '1', '23', '2');
INSERT INTO `instance` VALUES ('79', '2', '23', '2');
INSERT INTO `instance` VALUES ('80', '3', '23', '2');
INSERT INTO `instance` VALUES ('81', '4', '23', '2');
INSERT INTO `instance` VALUES ('82', '5', '23', '2');
INSERT INTO `instance` VALUES ('83', '6', '23', '2');
INSERT INTO `instance` VALUES ('84', '1', '24', null);
INSERT INTO `instance` VALUES ('85', '2', '24', null);
INSERT INTO `instance` VALUES ('86', '1', '25', null);
INSERT INTO `instance` VALUES ('87', '2', '25', null);
INSERT INTO `instance` VALUES ('88', '3', '25', null);
INSERT INTO `instance` VALUES ('89', '1', '28', null);
INSERT INTO `instance` VALUES ('90', '2', '28', null);
INSERT INTO `instance` VALUES ('91', '3', '28', null);
INSERT INTO `instance` VALUES ('92', '4', '28', null);
INSERT INTO `instance` VALUES ('93', '5', '28', null);
INSERT INTO `instance` VALUES ('94', '1', '29', null);
INSERT INTO `instance` VALUES ('95', '2', '29', null);
INSERT INTO `instance` VALUES ('96', '3', '29', null);
INSERT INTO `instance` VALUES ('97', '4', '29', null);
INSERT INTO `instance` VALUES ('98', '5', '29', null);
INSERT INTO `instance` VALUES ('118', '1', '149', null);
INSERT INTO `instance` VALUES ('124', '1', '167', '1');
INSERT INTO `instance` VALUES ('125', '1', '168', '1');
INSERT INTO `instance` VALUES ('126', '1', '169', '1');
INSERT INTO `instance` VALUES ('127', '1', '170', '1');
INSERT INTO `instance` VALUES ('128', '2', '170', '1');
INSERT INTO `instance` VALUES ('129', '3', '170', '1');
INSERT INTO `instance` VALUES ('130', '1', '171', null);
INSERT INTO `instance` VALUES ('131', '1', '172', null);
INSERT INTO `instance` VALUES ('132', '1', '173', null);
INSERT INTO `instance` VALUES ('133', '2', '173', null);
INSERT INTO `instance` VALUES ('134', '1', '174', null);
INSERT INTO `instance` VALUES ('135', '2', '174', null);
INSERT INTO `instance` VALUES ('136', '1', '176', '1');
INSERT INTO `instance` VALUES ('137', '2', '176', '1');
INSERT INTO `instance` VALUES ('138', '3', '176', '1');
INSERT INTO `instance` VALUES ('139', '1', '178', '1');
INSERT INTO `instance` VALUES ('140', '2', '178', '1');
INSERT INTO `instance` VALUES ('141', '3', '178', '1');
INSERT INTO `instance` VALUES ('142', '1', '201', '1');
INSERT INTO `instance` VALUES ('143', '1', '202', '1');
INSERT INTO `instance` VALUES ('144', '2', '202', '1');
INSERT INTO `instance` VALUES ('145', '3', '202', '1');
INSERT INTO `instance` VALUES ('146', '1', '204', null);
INSERT INTO `instance` VALUES ('147', '2', '204', null);
INSERT INTO `instance` VALUES ('148', '1', '205', null);
INSERT INTO `instance` VALUES ('149', '2', '205', null);
INSERT INTO `instance` VALUES ('150', '1', '206', null);
INSERT INTO `instance` VALUES ('151', '2', '206', null);
INSERT INTO `instance` VALUES ('152', '1', '207', null);
INSERT INTO `instance` VALUES ('153', '2', '207', null);
INSERT INTO `instance` VALUES ('154', '1', '208', null);
INSERT INTO `instance` VALUES ('155', '2', '208', null);
INSERT INTO `instance` VALUES ('156', '1', '209', null);
INSERT INTO `instance` VALUES ('157', '2', '209', null);
INSERT INTO `instance` VALUES ('158', '1', '210', null);
INSERT INTO `instance` VALUES ('159', '2', '210', null);
INSERT INTO `instance` VALUES ('160', '1', '211', null);
INSERT INTO `instance` VALUES ('161', '2', '211', null);
INSERT INTO `instance` VALUES ('162', '1', '214', null);
INSERT INTO `instance` VALUES ('163', '2', '214', null);
INSERT INTO `instance` VALUES ('164', '1', '215', null);
INSERT INTO `instance` VALUES ('165', '2', '215', null);
INSERT INTO `instance` VALUES ('169', '1', '218', '1');
INSERT INTO `instance` VALUES ('170', '2', '218', '1');
INSERT INTO `instance` VALUES ('171', '3', '218', '1');
INSERT INTO `instance` VALUES ('172', '1', '219', '1');
INSERT INTO `instance` VALUES ('173', '2', '219', '1');
INSERT INTO `instance` VALUES ('174', '3', '219', '1');
INSERT INTO `instance` VALUES ('175', '1', '220', null);
INSERT INTO `instance` VALUES ('176', '2', '220', null);
INSERT INTO `instance` VALUES ('177', '1', '221', null);
INSERT INTO `instance` VALUES ('178', '2', '221', null);
INSERT INTO `instance` VALUES ('179', '1', '222', null);
INSERT INTO `instance` VALUES ('180', '2', '222', null);
INSERT INTO `instance` VALUES ('181', '1', '223', null);
INSERT INTO `instance` VALUES ('182', '2', '223', null);
INSERT INTO `instance` VALUES ('183', '1', '224', null);
INSERT INTO `instance` VALUES ('184', '2', '224', null);
INSERT INTO `instance` VALUES ('185', '1', '225', null);
INSERT INTO `instance` VALUES ('186', '2', '225', null);
INSERT INTO `instance` VALUES ('187', '1', '226', null);
INSERT INTO `instance` VALUES ('188', '2', '226', null);
INSERT INTO `instance` VALUES ('189', '3', '226', null);
INSERT INTO `instance` VALUES ('190', '4', '226', null);
INSERT INTO `instance` VALUES ('191', '5', '226', null);
INSERT INTO `instance` VALUES ('192', '6', '226', null);
INSERT INTO `instance` VALUES ('193', '1', '227', null);
INSERT INTO `instance` VALUES ('194', '2', '227', null);
INSERT INTO `instance` VALUES ('195', '3', '227', null);
INSERT INTO `instance` VALUES ('196', '4', '227', null);
INSERT INTO `instance` VALUES ('197', '5', '227', null);
INSERT INTO `instance` VALUES ('198', '6', '227', null);

-- ----------------------------
-- Table structure for instance_label
-- ----------------------------
DROP TABLE IF EXISTS `instance_label`;
CREATE TABLE `instance_label` (
  `task_id` int(11) NOT NULL COMMENT '任务ID',
  `labeltype` varchar(11) NOT NULL COMMENT '标签类别：item1#item2#instance',
  `label_id` int(11) NOT NULL COMMENT '标签id',
  KEY `label_id` (`label_id`),
  KEY `task_id` (`task_id`),
  CONSTRAINT `instance_label_ibfk_1` FOREIGN KEY (`label_id`) REFERENCES `label` (`lid`),
  CONSTRAINT `instance_label_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `task` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of instance_label
-- ----------------------------
INSERT INTO `instance_label` VALUES ('10', 'instance', '12');
INSERT INTO `instance_label` VALUES ('10', 'instance', '13');
INSERT INTO `instance_label` VALUES ('10', 'instance', '14');
INSERT INTO `instance_label` VALUES ('10', 'item1', '15');
INSERT INTO `instance_label` VALUES ('10', 'item1', '16');
INSERT INTO `instance_label` VALUES ('10', 'item1', '17');
INSERT INTO `instance_label` VALUES ('10', 'item2', '18');
INSERT INTO `instance_label` VALUES ('10', 'item2', '19');
INSERT INTO `instance_label` VALUES ('10', 'item2', '20');
INSERT INTO `instance_label` VALUES ('10', 'item2', '21');
INSERT INTO `instance_label` VALUES ('12', 'instance', '28');
INSERT INTO `instance_label` VALUES ('12', 'instance', '29');
INSERT INTO `instance_label` VALUES ('12', 'item1', '30');
INSERT INTO `instance_label` VALUES ('12', 'item1', '31');
INSERT INTO `instance_label` VALUES ('12', 'item2', '30');
INSERT INTO `instance_label` VALUES ('12', 'item2', '31');
INSERT INTO `instance_label` VALUES ('64', 'instance', '57');
INSERT INTO `instance_label` VALUES ('64', 'item1', '58');
INSERT INTO `instance_label` VALUES ('64', 'item2', '59');
INSERT INTO `instance_label` VALUES ('67', 'instance', '57');
INSERT INTO `instance_label` VALUES ('67', 'item1', '58');
INSERT INTO `instance_label` VALUES ('67', 'item2', '59');
INSERT INTO `instance_label` VALUES ('69', 'instance', '57');
INSERT INTO `instance_label` VALUES ('69', 'item1', '58');
INSERT INTO `instance_label` VALUES ('69', 'item1', '59');
INSERT INTO `instance_label` VALUES ('69', 'item2', '58');
INSERT INTO `instance_label` VALUES ('69', 'item2', '59');
INSERT INTO `instance_label` VALUES ('82', 'instance', '57');
INSERT INTO `instance_label` VALUES ('82', 'item1', '58');
INSERT INTO `instance_label` VALUES ('82', 'item1', '59');
INSERT INTO `instance_label` VALUES ('82', 'item2', '58');
INSERT INTO `instance_label` VALUES ('82', 'item2', '59');
INSERT INTO `instance_label` VALUES ('83', 'instance', '57');
INSERT INTO `instance_label` VALUES ('83', 'item1', '58');
INSERT INTO `instance_label` VALUES ('83', 'item1', '59');
INSERT INTO `instance_label` VALUES ('83', 'item2', '58');
INSERT INTO `instance_label` VALUES ('83', 'item2', '59');

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `itid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'itemID',
  `itemcontent` varchar(20000) DEFAULT NULL COMMENT 'item内容',
  `itemindex` int(11) NOT NULL COMMENT '取值1或2',
  `instance_id` int(11) DEFAULT NULL COMMENT '对应instanceID',
  `labelnum` int(11) DEFAULT NULL COMMENT '发布者选择做任务贴几个标签',
  PRIMARY KEY (`itid`),
  KEY `instance_id` (`instance_id`),
  CONSTRAINT `item_ibfk_1` FOREIGN KEY (`instance_id`) REFERENCES `instance` (`instid`)
) ENGINE=InnoDB AUTO_INCREMENT=426 DEFAULT CHARSET=utf8 COMMENT='类比排序item存储';

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('1', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '1', '28', null);
INSERT INTO `item` VALUES ('2', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '2', '28', null);
INSERT INTO `item` VALUES ('3', '该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。', '3', '28', null);
INSERT INTO `item` VALUES ('4', '公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；', '4', '28', null);
INSERT INTO `item` VALUES ('5', '鉴定意见：辽阳市公安局刑事技术鉴定书、车辆检验报告及照片、辽阳襄平法医司法鉴定所检验报告；被告人宋X的供述与辩解等证据证明。', '1', '29', null);
INSERT INTO `item` VALUES ('6', '据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。', '2', '29', null);
INSERT INTO `item` VALUES ('7', '各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；', '3', '29', null);
INSERT INTO `item` VALUES ('8', '交通费2000元；衣物及摩托车损失费2000元。共计赔偿人民币616131元。', '4', '29', null);
INSERT INTO `item` VALUES ('9', '附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。', '5', '29', null);
INSERT INTO `item` VALUES ('10', '关于刑事部分，被告人宋X对公诉机关指控的犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。', '6', '29', null);
INSERT INTO `item` VALUES ('11', '附带民事诉讼被告保险公司的委托代理人同意在交强险保额内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。', '7', '29', null);
INSERT INTO `item` VALUES ('12', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '1', '30', null);
INSERT INTO `item` VALUES ('13', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '2', '30', null);
INSERT INTO `item` VALUES ('14', '该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 被告人宋X案后到公安机关投案。', '3', '30', null);
INSERT INTO `item` VALUES ('15', '上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。', '4', '30', null);
INSERT INTO `item` VALUES ('16', '2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。', '5', '30', null);
INSERT INTO `item` VALUES ('17', '3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '6', '30', null);
INSERT INTO `item` VALUES ('18', '4、机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。', '1', '31', null);
INSERT INTO `item` VALUES ('19', '被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。', '2', '31', null);
INSERT INTO `item` VALUES ('20', '5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '3', '31', null);
INSERT INTO `item` VALUES ('21', '6、死亡证明，能证明被害人王XX因交通肇事而死亡。', '4', '31', null);
INSERT INTO `item` VALUES ('22', '7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '5', '31', null);
INSERT INTO `item` VALUES ('23', '8、鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '1', '32', null);
INSERT INTO `item` VALUES ('24', '9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。', '2', '32', null);
INSERT INTO `item` VALUES ('25', '10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。', '3', '32', null);
INSERT INTO `item` VALUES ('26', '11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。', '4', '32', null);
INSERT INTO `item` VALUES ('27', '12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '5', '32', null);
INSERT INTO `item` VALUES ('28', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '1', '33', null);
INSERT INTO `item` VALUES ('29', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '2', '33', null);
INSERT INTO `item` VALUES ('30', '该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。', '3', '33', null);
INSERT INTO `item` VALUES ('31', '公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；', '4', '33', null);
INSERT INTO `item` VALUES ('32', '鉴定意见：辽阳市公安局刑事技术鉴定书、车辆检验报告及照片、辽阳襄平法医司法鉴定所检验报告；被告人宋X的供述与辩解等证据证明。', '1', '34', null);
INSERT INTO `item` VALUES ('33', '据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。', '2', '34', null);
INSERT INTO `item` VALUES ('34', '各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；', '3', '34', null);
INSERT INTO `item` VALUES ('35', '交通费2000元；衣物及摩托车损失费2000元。共计赔偿人民币616131元。', '4', '34', null);
INSERT INTO `item` VALUES ('36', '附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。', '5', '34', null);
INSERT INTO `item` VALUES ('37', '关于刑事部分，被告人宋X对公诉机关指控的犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。', '6', '34', null);
INSERT INTO `item` VALUES ('38', '附带民事诉讼被告保险公司的委托代理人同意在交强险保额内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。', '7', '34', null);
INSERT INTO `item` VALUES ('39', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '1', '35', null);
INSERT INTO `item` VALUES ('40', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '2', '35', null);
INSERT INTO `item` VALUES ('41', '该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 被告人宋X案后到公安机关投案。', '3', '35', null);
INSERT INTO `item` VALUES ('42', '上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。', '4', '35', null);
INSERT INTO `item` VALUES ('43', '2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。', '5', '35', null);
INSERT INTO `item` VALUES ('44', '3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '6', '35', null);
INSERT INTO `item` VALUES ('45', '4、机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。', '1', '36', null);
INSERT INTO `item` VALUES ('46', '被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。', '2', '36', null);
INSERT INTO `item` VALUES ('47', '5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '3', '36', null);
INSERT INTO `item` VALUES ('48', '6、死亡证明，能证明被害人王XX因交通肇事而死亡。', '4', '36', null);
INSERT INTO `item` VALUES ('49', '7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '5', '36', null);
INSERT INTO `item` VALUES ('50', '8、鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '1', '37', null);
INSERT INTO `item` VALUES ('51', '9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。', '2', '37', null);
INSERT INTO `item` VALUES ('52', '10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。', '3', '37', null);
INSERT INTO `item` VALUES ('53', '11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。', '4', '37', null);
INSERT INTO `item` VALUES ('54', '12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '5', '37', null);
INSERT INTO `item` VALUES ('55', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '0', '38', null);
INSERT INTO `item` VALUES ('56', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '1', '38', null);
INSERT INTO `item` VALUES ('57', '该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。', '2', '38', null);
INSERT INTO `item` VALUES ('58', '公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；', '3', '38', null);
INSERT INTO `item` VALUES ('59', '鉴定意见：辽阳市公安局刑事技术鉴定书、车辆检验报告及照片、辽阳襄平法医司法鉴定所检验报告；被告人宋X的供述与辩解等证据证明。', '0', '39', null);
INSERT INTO `item` VALUES ('60', '据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。', '1', '39', null);
INSERT INTO `item` VALUES ('61', '各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；', '2', '39', null);
INSERT INTO `item` VALUES ('62', '交通费2000元；衣物及摩托车损失费2000元。共计赔偿人民币616131元。', '3', '39', null);
INSERT INTO `item` VALUES ('63', '附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。', '4', '39', null);
INSERT INTO `item` VALUES ('64', '关于刑事部分，被告人宋X对公诉机关指控的犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。', '5', '39', null);
INSERT INTO `item` VALUES ('65', '附带民事诉讼被告保险公司的委托代理人同意在交强险保额内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。', '6', '39', null);
INSERT INTO `item` VALUES ('66', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '0', '40', null);
INSERT INTO `item` VALUES ('67', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '1', '40', null);
INSERT INTO `item` VALUES ('68', '该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 被告人宋X案后到公安机关投案。', '2', '40', null);
INSERT INTO `item` VALUES ('69', '上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。', '3', '40', null);
INSERT INTO `item` VALUES ('70', '2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。', '4', '40', null);
INSERT INTO `item` VALUES ('71', '3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '5', '40', null);
INSERT INTO `item` VALUES ('72', '4、机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。', '0', '41', null);
INSERT INTO `item` VALUES ('73', '被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。', '1', '41', null);
INSERT INTO `item` VALUES ('74', '5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '2', '41', null);
INSERT INTO `item` VALUES ('75', '6、死亡证明，能证明被害人王XX因交通肇事而死亡。', '3', '41', null);
INSERT INTO `item` VALUES ('76', '7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '4', '41', null);
INSERT INTO `item` VALUES ('77', '8、鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '0', '42', null);
INSERT INTO `item` VALUES ('78', '9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。', '1', '42', null);
INSERT INTO `item` VALUES ('79', '10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。', '2', '42', null);
INSERT INTO `item` VALUES ('80', '11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。', '3', '42', null);
INSERT INTO `item` VALUES ('81', '12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '4', '42', null);
INSERT INTO `item` VALUES ('82', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '0', '43', null);
INSERT INTO `item` VALUES ('83', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '1', '43', null);
INSERT INTO `item` VALUES ('84', '该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。', '2', '43', null);
INSERT INTO `item` VALUES ('85', '公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；', '3', '43', null);
INSERT INTO `item` VALUES ('86', '鉴定意见：辽阳市公安局刑事技术鉴定书、车辆检验报告及照片、辽阳襄平法医司法鉴定所检验报告；被告人宋X的供述与辩解等证据证明。', '0', '44', null);
INSERT INTO `item` VALUES ('87', '据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。', '1', '44', null);
INSERT INTO `item` VALUES ('88', '各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；', '2', '44', null);
INSERT INTO `item` VALUES ('89', '交通费2000元；衣物及摩托车损失费2000元。共计赔偿人民币616131元。', '3', '44', null);
INSERT INTO `item` VALUES ('90', '附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。', '4', '44', null);
INSERT INTO `item` VALUES ('91', '关于刑事部分，被告人宋X对公诉机关指控的犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。', '5', '44', null);
INSERT INTO `item` VALUES ('92', '附带民事诉讼被告保险公司的委托代理人同意在交强险保额内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。', '6', '44', null);
INSERT INTO `item` VALUES ('93', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '0', '45', null);
INSERT INTO `item` VALUES ('94', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '1', '45', null);
INSERT INTO `item` VALUES ('95', '该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 被告人宋X案后到公安机关投案。', '2', '45', null);
INSERT INTO `item` VALUES ('96', '上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。', '3', '45', null);
INSERT INTO `item` VALUES ('97', '2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。', '4', '45', null);
INSERT INTO `item` VALUES ('98', '3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '5', '45', null);
INSERT INTO `item` VALUES ('99', '4、机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。', '0', '46', null);
INSERT INTO `item` VALUES ('100', '被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。', '1', '46', null);
INSERT INTO `item` VALUES ('101', '5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '2', '46', null);
INSERT INTO `item` VALUES ('102', '6、死亡证明，能证明被害人王XX因交通肇事而死亡。', '3', '46', null);
INSERT INTO `item` VALUES ('103', '7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '4', '46', null);
INSERT INTO `item` VALUES ('104', '8、鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '0', '47', null);
INSERT INTO `item` VALUES ('105', '9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。', '1', '47', null);
INSERT INTO `item` VALUES ('106', '10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。', '2', '47', null);
INSERT INTO `item` VALUES ('107', '11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。', '3', '47', null);
INSERT INTO `item` VALUES ('108', '12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '4', '47', null);
INSERT INTO `item` VALUES ('109', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '1', '48', '2');
INSERT INTO `item` VALUES ('110', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。', '2', '48', '2');
INSERT INTO `item` VALUES ('111', '公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；', '1', '49', '2');
INSERT INTO `item` VALUES ('112', '鉴定意见：辽阳市公安局刑事技术鉴定书、车辆检验报告及照片、辽阳襄平法医司法鉴定所检验报告；被告人宋X的供述与辩解等证据证明。据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。', '2', '49', '2');
INSERT INTO `item` VALUES ('113', '各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；交通费2000元；衣物及摩托车损失费2000元。共计赔偿人民币616131元。 附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。', '1', '50', '2');
INSERT INTO `item` VALUES ('114', '关于刑事部分，被告人宋X对公诉机关指控的犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。 附带民事诉讼被告保险公司的委托代理人同意在交强险保额内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。', '2', '50', '2');
INSERT INTO `item` VALUES ('115', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '51', '2');
INSERT INTO `item` VALUES ('116', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '51', '2');
INSERT INTO `item` VALUES ('117', '4、机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '52', '2');
INSERT INTO `item` VALUES ('118', '6、死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '52', '2');
INSERT INTO `item` VALUES ('119', '8、鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '53', '2');
INSERT INTO `item` VALUES ('120', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '53', '2');
INSERT INTO `item` VALUES ('121', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '1', '54', '2');
INSERT INTO `item` VALUES ('122', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。', '2', '54', '2');
INSERT INTO `item` VALUES ('123', '公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；', '1', '55', '2');
INSERT INTO `item` VALUES ('124', '鉴定意见：辽阳市公安局刑事技术鉴定书、车辆检验报告及照片、辽阳襄平法医司法鉴定所检验报告；被告人宋X的供述与辩解等证据证明。据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。', '2', '55', '2');
INSERT INTO `item` VALUES ('125', '各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；交通费2000元；衣物及摩托车损失费2000元。共计赔偿人民币616131元。 附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。', '1', '56', '2');
INSERT INTO `item` VALUES ('126', '关于刑事部分，被告人宋X对公诉机关指控的犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。 附带民事诉讼被告保险公司的委托代理人同意在交强险保额内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。', '2', '56', '2');
INSERT INTO `item` VALUES ('127', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '57', '2');
INSERT INTO `item` VALUES ('128', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '57', '2');
INSERT INTO `item` VALUES ('129', '4、机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '58', '2');
INSERT INTO `item` VALUES ('130', '6、死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '58', '2');
INSERT INTO `item` VALUES ('131', '8、鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '59', '2');
INSERT INTO `item` VALUES ('132', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '59', '2');
INSERT INTO `item` VALUES ('133', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '1', '60', '1');
INSERT INTO `item` VALUES ('134', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。', '2', '60', '3');
INSERT INTO `item` VALUES ('135', '公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；', '1', '61', '1');
INSERT INTO `item` VALUES ('136', '鉴定意见：辽阳市公安局刑事技术鉴定书、车辆检验报告及照片、辽阳襄平法医司法鉴定所检验报告；被告人宋X的供述与辩解等证据证明。据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。', '2', '61', '3');
INSERT INTO `item` VALUES ('137', '各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；交通费2000元；衣物及摩托车损失费2000元。共计赔偿人民币616131元。 附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。', '1', '62', '1');
INSERT INTO `item` VALUES ('138', '关于刑事部分，被告人宋X对公诉机关指控的犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。 附带民事诉讼被告保险公司的委托代理人同意在交强险保额内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。', '2', '62', '3');
INSERT INTO `item` VALUES ('139', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '63', '1');
INSERT INTO `item` VALUES ('140', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '63', '3');
INSERT INTO `item` VALUES ('141', '4、机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '64', '1');
INSERT INTO `item` VALUES ('142', '6、死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '64', '3');
INSERT INTO `item` VALUES ('143', '8、鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '65', '1');
INSERT INTO `item` VALUES ('144', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '65', '3');
INSERT INTO `item` VALUES ('145', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '1', '66', '1');
INSERT INTO `item` VALUES ('146', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。', '2', '66', '3');
INSERT INTO `item` VALUES ('147', '公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；', '1', '67', '1');
INSERT INTO `item` VALUES ('148', '鉴定意见：辽阳市公安局刑事技术鉴定书、车辆检验报告及照片、辽阳襄平法医司法鉴定所检验报告；被告人宋X的供述与辩解等证据证明。据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。', '2', '67', '3');
INSERT INTO `item` VALUES ('149', '各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；交通费2000元；衣物及摩托车损失费2000元。共计赔偿人民币616131元。 附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。', '1', '68', '1');
INSERT INTO `item` VALUES ('150', '关于刑事部分，被告人宋X对公诉机关指控的犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。 附带民事诉讼被告保险公司的委托代理人同意在交强险保额内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。', '2', '68', '3');
INSERT INTO `item` VALUES ('151', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '69', '1');
INSERT INTO `item` VALUES ('152', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '69', '3');
INSERT INTO `item` VALUES ('153', '4、机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '70', '1');
INSERT INTO `item` VALUES ('154', '6、死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '70', '3');
INSERT INTO `item` VALUES ('155', '8、鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '71', '1');
INSERT INTO `item` VALUES ('156', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '71', '3');
INSERT INTO `item` VALUES ('157', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '1', '72', '2');
INSERT INTO `item` VALUES ('158', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。', '2', '72', '2');
INSERT INTO `item` VALUES ('159', '公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；', '1', '73', '2');
INSERT INTO `item` VALUES ('160', '鉴定意见：辽阳市公安局刑事技术鉴定书、车辆检验报告及照片、辽阳襄平法医司法鉴定所检验报告；被告人宋X的供述与辩解等证据证明。据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。', '2', '73', '2');
INSERT INTO `item` VALUES ('161', '各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；交通费2000元；衣物及摩托车损失费2000元。共计赔偿人民币616131元。 附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。', '1', '74', '2');
INSERT INTO `item` VALUES ('162', '关于刑事部分，被告人宋X对公诉机关指控的犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。 附带民事诉讼被告保险公司的委托代理人同意在交强险保额内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。', '2', '74', '2');
INSERT INTO `item` VALUES ('163', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '75', '2');
INSERT INTO `item` VALUES ('164', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '75', '2');
INSERT INTO `item` VALUES ('165', '4、机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '76', '2');
INSERT INTO `item` VALUES ('166', '6、死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '76', '2');
INSERT INTO `item` VALUES ('167', '8、鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '77', '2');
INSERT INTO `item` VALUES ('168', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '77', '2');
INSERT INTO `item` VALUES ('169', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '1', '78', '2');
INSERT INTO `item` VALUES ('170', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。', '2', '78', '2');
INSERT INTO `item` VALUES ('171', '公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；', '1', '79', '2');
INSERT INTO `item` VALUES ('172', '鉴定意见：辽阳市公安局刑事技术鉴定书、车辆检验报告及照片、辽阳襄平法医司法鉴定所检验报告；被告人宋X的供述与辩解等证据证明。据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。', '2', '79', '2');
INSERT INTO `item` VALUES ('173', '各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；交通费2000元；衣物及摩托车损失费2000元。共计赔偿人民币616131元。 附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。', '1', '80', '2');
INSERT INTO `item` VALUES ('174', '关于刑事部分，被告人宋X对公诉机关指控的犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。 附带民事诉讼被告保险公司的委托代理人同意在交强险保额内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。', '2', '80', '2');
INSERT INTO `item` VALUES ('175', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '81', '2');
INSERT INTO `item` VALUES ('176', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '81', '2');
INSERT INTO `item` VALUES ('177', '4、机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '82', '2');
INSERT INTO `item` VALUES ('178', '6、死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '82', '2');
INSERT INTO `item` VALUES ('179', '8、鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '83', '2');
INSERT INTO `item` VALUES ('180', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '83', '2');
INSERT INTO `item` VALUES ('181', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '1', '89', null);
INSERT INTO `item` VALUES ('182', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '2', '89', null);
INSERT INTO `item` VALUES ('183', '该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。', '3', '89', null);
INSERT INTO `item` VALUES ('184', '公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；', '4', '89', null);
INSERT INTO `item` VALUES ('185', '鉴定意见：辽阳市公安局刑事技术鉴定书、车辆检验报告及照片、辽阳襄平法医司法鉴定所检验报告；被告人宋X的供述与辩解等证据证明。', '1', '90', null);
INSERT INTO `item` VALUES ('186', '据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。', '2', '90', null);
INSERT INTO `item` VALUES ('187', '各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；', '3', '90', null);
INSERT INTO `item` VALUES ('188', '交通费2000元；衣物及摩托车损失费2000元。共计赔偿人民币616131元。', '4', '90', null);
INSERT INTO `item` VALUES ('189', '附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。', '5', '90', null);
INSERT INTO `item` VALUES ('190', '关于刑事部分，被告人宋X对公诉机关指控的犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。', '6', '90', null);
INSERT INTO `item` VALUES ('191', '附带民事诉讼被告保险公司的委托代理人同意在交强险保额内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。', '7', '90', null);
INSERT INTO `item` VALUES ('192', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '1', '91', null);
INSERT INTO `item` VALUES ('193', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '2', '91', null);
INSERT INTO `item` VALUES ('194', '该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 被告人宋X案后到公安机关投案。', '3', '91', null);
INSERT INTO `item` VALUES ('195', '上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。', '4', '91', null);
INSERT INTO `item` VALUES ('196', '2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。', '5', '91', null);
INSERT INTO `item` VALUES ('197', '3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '6', '91', null);
INSERT INTO `item` VALUES ('198', '4、机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。', '1', '92', null);
INSERT INTO `item` VALUES ('199', '被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。', '2', '92', null);
INSERT INTO `item` VALUES ('200', '5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '3', '92', null);
INSERT INTO `item` VALUES ('201', '6、死亡证明，能证明被害人王XX因交通肇事而死亡。', '4', '92', null);
INSERT INTO `item` VALUES ('202', '7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '5', '92', null);
INSERT INTO `item` VALUES ('203', '8、鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '1', '93', null);
INSERT INTO `item` VALUES ('204', '9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。', '2', '93', null);
INSERT INTO `item` VALUES ('205', '10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。', '3', '93', null);
INSERT INTO `item` VALUES ('206', '11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。', '4', '93', null);
INSERT INTO `item` VALUES ('207', '12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '5', '93', null);
INSERT INTO `item` VALUES ('208', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '1', '94', null);
INSERT INTO `item` VALUES ('209', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '2', '94', null);
INSERT INTO `item` VALUES ('210', '该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。', '3', '94', null);
INSERT INTO `item` VALUES ('211', '公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；', '4', '94', null);
INSERT INTO `item` VALUES ('212', '鉴定意见：辽阳市公安局刑事技术鉴定书、车辆检验报告及照片、辽阳襄平法医司法鉴定所检验报告；被告人宋X的供述与辩解等证据证明。', '1', '95', null);
INSERT INTO `item` VALUES ('213', '据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。', '2', '95', null);
INSERT INTO `item` VALUES ('214', '各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；', '3', '95', null);
INSERT INTO `item` VALUES ('215', '交通费2000元；衣物及摩托车损失费2000元。共计赔偿人民币616131元。', '4', '95', null);
INSERT INTO `item` VALUES ('216', '附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。', '5', '95', null);
INSERT INTO `item` VALUES ('217', '关于刑事部分，被告人宋X对公诉机关指控的犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。', '6', '95', null);
INSERT INTO `item` VALUES ('218', '附带民事诉讼被告保险公司的委托代理人同意在交强险保额内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。', '7', '95', null);
INSERT INTO `item` VALUES ('219', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '1', '96', null);
INSERT INTO `item` VALUES ('220', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '2', '96', null);
INSERT INTO `item` VALUES ('221', '该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 被告人宋X案后到公安机关投案。', '3', '96', null);
INSERT INTO `item` VALUES ('222', '上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。', '4', '96', null);
INSERT INTO `item` VALUES ('223', '2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。', '5', '96', null);
INSERT INTO `item` VALUES ('224', '3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '6', '96', null);
INSERT INTO `item` VALUES ('225', '4、机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。', '1', '97', null);
INSERT INTO `item` VALUES ('226', '被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。', '2', '97', null);
INSERT INTO `item` VALUES ('227', '5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '3', '97', null);
INSERT INTO `item` VALUES ('228', '6、死亡证明，能证明被害人王XX因交通肇事而死亡。', '4', '97', null);
INSERT INTO `item` VALUES ('229', '7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '5', '97', null);
INSERT INTO `item` VALUES ('230', '8、鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '1', '98', null);
INSERT INTO `item` VALUES ('231', '9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。', '2', '98', null);
INSERT INTO `item` VALUES ('232', '10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。', '3', '98', null);
INSERT INTO `item` VALUES ('233', '11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。', '4', '98', null);
INSERT INTO `item` VALUES ('234', '12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '5', '98', null);
INSERT INTO `item` VALUES ('273', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '1', '118', null);
INSERT INTO `item` VALUES ('274', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '2', '118', null);
INSERT INTO `item` VALUES ('275', '该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。', '3', '118', null);
INSERT INTO `item` VALUES ('308', '', '1', '124', '1');
INSERT INTO `item` VALUES ('309', '', '1', '125', '1');
INSERT INTO `item` VALUES ('310', '', '1', '126', '1');
INSERT INTO `item` VALUES ('312', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '127', '1');
INSERT INTO `item` VALUES ('313', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '127', '1');
INSERT INTO `item` VALUES ('314', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '128', '1');
INSERT INTO `item` VALUES ('315', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '128', '1');
INSERT INTO `item` VALUES ('316', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '129', '1');
INSERT INTO `item` VALUES ('317', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '129', '1');
INSERT INTO `item` VALUES ('318', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '136', '1');
INSERT INTO `item` VALUES ('319', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '136', '1');
INSERT INTO `item` VALUES ('320', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '137', '1');
INSERT INTO `item` VALUES ('321', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '137', '1');
INSERT INTO `item` VALUES ('322', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '138', '1');
INSERT INTO `item` VALUES ('323', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '138', '1');
INSERT INTO `item` VALUES ('324', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '139', '2');
INSERT INTO `item` VALUES ('325', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '139', '2');
INSERT INTO `item` VALUES ('326', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '140', '2');
INSERT INTO `item` VALUES ('327', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '140', '2');
INSERT INTO `item` VALUES ('328', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '141', '2');
INSERT INTO `item` VALUES ('329', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '141', '2');
INSERT INTO `item` VALUES ('330', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '143', '2');
INSERT INTO `item` VALUES ('331', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '143', '2');
INSERT INTO `item` VALUES ('332', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '144', '2');
INSERT INTO `item` VALUES ('333', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '144', '2');
INSERT INTO `item` VALUES ('334', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '145', '2');
INSERT INTO `item` VALUES ('335', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '145', '2');
INSERT INTO `item` VALUES ('336', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '1', '154', null);
INSERT INTO `item` VALUES ('337', '该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。', '2', '154', null);
INSERT INTO `item` VALUES ('338', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '3', '154', null);
INSERT INTO `item` VALUES ('339', '公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；', '4', '154', null);
INSERT INTO `item` VALUES ('340', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '1', '155', null);
INSERT INTO `item` VALUES ('341', '该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。', '2', '155', null);
INSERT INTO `item` VALUES ('342', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '3', '155', null);
INSERT INTO `item` VALUES ('343', '公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；', '4', '155', null);
INSERT INTO `item` VALUES ('344', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '1', '156', null);
INSERT INTO `item` VALUES ('345', '该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。', '2', '156', null);
INSERT INTO `item` VALUES ('346', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '3', '156', null);
INSERT INTO `item` VALUES ('347', '公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；', '4', '156', null);
INSERT INTO `item` VALUES ('348', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '1', '157', null);
INSERT INTO `item` VALUES ('349', '该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。', '2', '157', null);
INSERT INTO `item` VALUES ('350', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '3', '157', null);
INSERT INTO `item` VALUES ('351', '公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；', '4', '157', null);
INSERT INTO `item` VALUES ('352', '据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。\n各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；\n交通费2000元；衣物及摩托车损失费2000元。共计赔偿人民币616131元。\n附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。\n关于刑事部分，被告人宋X对公诉机关指控的犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。\n附带民事诉讼被告保险公司的委托代理人同意在交强险保额内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。', '0', '158', null);
INSERT INTO `item` VALUES ('353', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '1', '158', null);
INSERT INTO `item` VALUES ('354', '该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。', '2', '158', null);
INSERT INTO `item` VALUES ('355', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '3', '158', null);
INSERT INTO `item` VALUES ('356', '公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；', '4', '158', null);
INSERT INTO `item` VALUES ('357', '据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。\n各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；\n交通费2000元；衣物及摩托车损失费2000元。共计赔偿人民币616131元。\n附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。\n关于刑事部分，被告人宋X对公诉机关指控的犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。\n附带民事诉讼被告保险公司的委托代理人同意在交强险保额内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。', '0', '159', null);
INSERT INTO `item` VALUES ('358', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '1', '159', null);
INSERT INTO `item` VALUES ('359', '该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。', '2', '159', null);
INSERT INTO `item` VALUES ('360', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '3', '159', null);
INSERT INTO `item` VALUES ('361', '公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；', '4', '159', null);
INSERT INTO `item` VALUES ('362', '据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。\n各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；\n交通费2000元；衣物及摩托车损失费2000元。共计赔偿人民币616131元。\n附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。\n关于刑事部分，被告人宋X对公诉机关指控的犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。\n附带民事诉讼被告保险公司的委托代理人同意在交强险保额内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。', '0', '160', null);
INSERT INTO `item` VALUES ('363', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '1', '160', null);
INSERT INTO `item` VALUES ('364', '该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。', '2', '160', null);
INSERT INTO `item` VALUES ('365', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '3', '160', null);
INSERT INTO `item` VALUES ('366', '公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；', '4', '160', null);
INSERT INTO `item` VALUES ('367', '据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。\n各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；\n交通费2000元；衣物及摩托车损失费2000元。共计赔偿人民币616131元。\n附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。\n关于刑事部分，被告人宋X对公诉机关指控的犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。\n附带民事诉讼被告保险公司的委托代理人同意在交强险保额内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。', '0', '161', null);
INSERT INTO `item` VALUES ('368', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '1', '161', null);
INSERT INTO `item` VALUES ('369', '该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。', '2', '161', null);
INSERT INTO `item` VALUES ('370', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '3', '161', null);
INSERT INTO `item` VALUES ('371', '公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；', '4', '161', null);
INSERT INTO `item` VALUES ('378', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '169', '2');
INSERT INTO `item` VALUES ('379', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '169', '2');
INSERT INTO `item` VALUES ('380', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '170', '2');
INSERT INTO `item` VALUES ('381', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '170', '2');
INSERT INTO `item` VALUES ('382', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '171', '2');
INSERT INTO `item` VALUES ('383', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '171', '2');
INSERT INTO `item` VALUES ('384', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '172', '2');
INSERT INTO `item` VALUES ('385', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '172', '2');
INSERT INTO `item` VALUES ('386', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '173', '2');
INSERT INTO `item` VALUES ('387', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '173', '2');
INSERT INTO `item` VALUES ('388', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '174', '2');
INSERT INTO `item` VALUES ('389', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '174', '2');
INSERT INTO `item` VALUES ('390', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '1', '175', null);
INSERT INTO `item` VALUES ('391', '该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。', '2', '175', null);
INSERT INTO `item` VALUES ('392', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '3', '175', null);
INSERT INTO `item` VALUES ('393', '公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；', '4', '175', null);
INSERT INTO `item` VALUES ('394', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '1', '176', null);
INSERT INTO `item` VALUES ('395', '该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。', '2', '176', null);
INSERT INTO `item` VALUES ('396', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '3', '176', null);
INSERT INTO `item` VALUES ('397', '公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；', '4', '176', null);
INSERT INTO `item` VALUES ('398', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '1', '177', null);
INSERT INTO `item` VALUES ('399', '该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。', '2', '177', null);
INSERT INTO `item` VALUES ('400', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '3', '177', null);
INSERT INTO `item` VALUES ('401', '公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；', '4', '177', null);
INSERT INTO `item` VALUES ('402', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '1', '178', null);
INSERT INTO `item` VALUES ('403', '该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。', '2', '178', null);
INSERT INTO `item` VALUES ('404', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '3', '178', null);
INSERT INTO `item` VALUES ('405', '公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；', '4', '178', null);
INSERT INTO `item` VALUES ('406', '据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。\n各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；\n交通费2000元；衣物及摩托车损失费2000元。共计赔偿人民币616131元。\n附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。\n关于刑事部分，被告人宋X对公诉机关指控的犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。\n附带民事诉讼被告保险公司的委托代理人同意在交强险保额内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。', '0', '179', null);
INSERT INTO `item` VALUES ('407', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '1', '179', null);
INSERT INTO `item` VALUES ('408', '该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。', '2', '179', null);
INSERT INTO `item` VALUES ('409', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '3', '179', null);
INSERT INTO `item` VALUES ('410', '公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；', '4', '179', null);
INSERT INTO `item` VALUES ('411', '据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。\n各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；\n交通费2000元；衣物及摩托车损失费2000元。共计赔偿人民币616131元。\n附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。\n关于刑事部分，被告人宋X对公诉机关指控的犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。\n附带民事诉讼被告保险公司的委托代理人同意在交强险保额内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。', '0', '180', null);
INSERT INTO `item` VALUES ('412', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '1', '180', null);
INSERT INTO `item` VALUES ('413', '该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。', '2', '180', null);
INSERT INTO `item` VALUES ('414', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '3', '180', null);
INSERT INTO `item` VALUES ('415', '公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；', '4', '180', null);
INSERT INTO `item` VALUES ('416', '据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。\n各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；\n交通费2000元；衣物及摩托车损失费2000元。共计赔偿人民币616131元。\n附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。\n关于刑事部分，被告人宋X对公诉机关指控的犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。\n附带民事诉讼被告保险公司的委托代理人同意在交强险保额内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。', '0', '181', null);
INSERT INTO `item` VALUES ('417', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '1', '181', null);
INSERT INTO `item` VALUES ('418', '该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。', '2', '181', null);
INSERT INTO `item` VALUES ('419', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '3', '181', null);
INSERT INTO `item` VALUES ('420', '公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；', '4', '181', null);
INSERT INTO `item` VALUES ('421', '据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。\n各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；\n交通费2000元；衣物及摩托车损失费2000元。共计赔偿人民币616131元。\n附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。\n关于刑事部分，被告人宋X对公诉机关指控的犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。\n附带民事诉讼被告保险公司的委托代理人同意在交强险保额内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。', '0', '182', null);
INSERT INTO `item` VALUES ('422', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '1', '182', null);
INSERT INTO `item` VALUES ('423', '该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。', '2', '182', null);
INSERT INTO `item` VALUES ('424', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '3', '182', null);
INSERT INTO `item` VALUES ('425', '公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；', '4', '182', null);

-- ----------------------------
-- Table structure for label
-- ----------------------------
DROP TABLE IF EXISTS `label`;
CREATE TABLE `label` (
  `lid` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签ID',
  `labelname` varchar(255) DEFAULT NULL COMMENT '标签名称',
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of label
-- ----------------------------
INSERT INTO `label` VALUES ('1', '广告邮件');
INSERT INTO `label` VALUES ('2', '垃圾邮件');
INSERT INTO `label` VALUES ('3', '消息推送');
INSERT INTO `label` VALUES ('4', '购物推荐');
INSERT INTO `label` VALUES ('5', '招聘信息');
INSERT INTO `label` VALUES ('6', '无效信息');
INSERT INTO `label` VALUES ('7', '有害邮件');
INSERT INTO `label` VALUES ('8', '测试2');
INSERT INTO `label` VALUES ('9', 'CESHI 2');
INSERT INTO `label` VALUES ('10', '测试');
INSERT INTO `label` VALUES ('11', '测试服3');
INSERT INTO `label` VALUES ('12', 'e');
INSERT INTO `label` VALUES ('13', 'ee');
INSERT INTO `label` VALUES ('14', 'eee');
INSERT INTO `label` VALUES ('15', 'c');
INSERT INTO `label` VALUES ('16', 'cc');
INSERT INTO `label` VALUES ('17', 'ccc');
INSERT INTO `label` VALUES ('18', 'w');
INSERT INTO `label` VALUES ('19', 'ww');
INSERT INTO `label` VALUES ('20', 'www');
INSERT INTO `label` VALUES ('21', 'wwwww');
INSERT INTO `label` VALUES ('22', '事故时间');
INSERT INTO `label` VALUES ('23', '肇事者');
INSERT INTO `label` VALUES ('24', '肇事车辆');
INSERT INTO `label` VALUES ('25', '受害人');
INSERT INTO `label` VALUES ('26', '受害人工具');
INSERT INTO `label` VALUES ('27', '受害人工具车牌号');
INSERT INTO `label` VALUES ('28', '案由');
INSERT INTO `label` VALUES ('29', '法院处理意见');
INSERT INTO `label` VALUES ('30', '相关');
INSERT INTO `label` VALUES ('31', '不相关');
INSERT INTO `label` VALUES ('32', '2');
INSERT INTO `label` VALUES ('33', '调完');
INSERT INTO `label` VALUES ('34', '23');
INSERT INTO `label` VALUES ('35', '二');
INSERT INTO `label` VALUES ('36', 'er');
INSERT INTO `label` VALUES ('37', '军事');
INSERT INTO `label` VALUES ('38', '国际');
INSERT INTO `label` VALUES ('39', '国内');
INSERT INTO `label` VALUES ('40', '国外');
INSERT INTO `label` VALUES ('41', '日期');
INSERT INTO `label` VALUES ('42', '实体1');
INSERT INTO `label` VALUES ('43', '实体2');
INSERT INTO `label` VALUES ('44', '时间');
INSERT INTO `label` VALUES ('45', '地点');
INSERT INTO `label` VALUES ('46', '其他');
INSERT INTO `label` VALUES ('47', '1');
INSERT INTO `label` VALUES ('48', '汽车');
INSERT INTO `label` VALUES ('49', '3');
INSERT INTO `label` VALUES ('50', '123');
INSERT INTO `label` VALUES ('51', '12');
INSERT INTO `label` VALUES ('52', '公司');
INSERT INTO `label` VALUES ('53', '人名');
INSERT INTO `label` VALUES ('54', '技术');
INSERT INTO `label` VALUES ('55', '产品');
INSERT INTO `label` VALUES ('56', '投资');
INSERT INTO `label` VALUES ('57', '因果关系');
INSERT INTO `label` VALUES ('58', '原因');
INSERT INTO `label` VALUES ('59', '结果');
INSERT INTO `label` VALUES ('60', '点点');
INSERT INTO `label` VALUES ('61', '人物');
INSERT INTO `label` VALUES ('62', '地名');
INSERT INTO `label` VALUES ('63', '就业邮件');
INSERT INTO `label` VALUES ('64', '就业推荐邮件');

-- ----------------------------
-- Table structure for listitem
-- ----------------------------
DROP TABLE IF EXISTS `listitem`;
CREATE TABLE `listitem` (
  `ltid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'listitemID',
  `litemcontent` varchar(20000) DEFAULT NULL COMMENT 'listitem内容',
  `list_index` int(11) NOT NULL COMMENT '取值1或2,属于第一个list还是第二个list',
  `litemindex` int(11) DEFAULT NULL COMMENT '取值1、2、3等,属于第几个item',
  `instance_id` int(11) DEFAULT NULL COMMENT '对应instanceID',
  PRIMARY KEY (`ltid`),
  KEY `instance_id` (`instance_id`),
  CONSTRAINT `listitem_ibfk_1` FOREIGN KEY (`instance_id`) REFERENCES `instance` (`instid`)
) ENGINE=InnoDB AUTO_INCREMENT=391 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of listitem
-- ----------------------------
INSERT INTO `listitem` VALUES ('1', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，', '1', '1', '1');
INSERT INTO `listitem` VALUES ('2', '因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '1', '2', '1');
INSERT INTO `listitem` VALUES ('3', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，', '2', '1', '1');
INSERT INTO `listitem` VALUES ('4', '被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。', '2', '2', '1');
INSERT INTO `listitem` VALUES ('5', '公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、', '1', '1', '2');
INSERT INTO `listitem` VALUES ('6', '二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；', '1', '2', '2');
INSERT INTO `listitem` VALUES ('7', '鉴定意见：辽阳市公安局刑事技术鉴定书、车辆检验报告及照片、辽阳襄平法医司法鉴定所检验报告；被告人宋X的供述与辩解等证据证明。', '2', '1', '2');
INSERT INTO `listitem` VALUES ('8', '据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。', '2', '2', '2');
INSERT INTO `listitem` VALUES ('9', '各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；交通费2000元；', '1', '1', '3');
INSERT INTO `listitem` VALUES ('10', '衣物及摩托车损失费2000元。共计赔偿人民币616131元。 附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。', '1', '2', '3');
INSERT INTO `listitem` VALUES ('11', '关于刑事部分，被告人宋X对公诉机关指控的犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。', '2', '1', '3');
INSERT INTO `listitem` VALUES ('12', '附带民事诉讼被告保险公司的委托代理人同意在交强险保额内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。', '2', '2', '3');
INSERT INTO `listitem` VALUES ('13', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，', '1', '1', '4');
INSERT INTO `listitem` VALUES ('14', '造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '2', '4');
INSERT INTO `listitem` VALUES ('15', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。', '2', '1', '4');
INSERT INTO `listitem` VALUES ('16', '2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '2', '4');
INSERT INTO `listitem` VALUES ('17', '4、机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。', '1', '1', '5');
INSERT INTO `listitem` VALUES ('18', '被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '2', '5');
INSERT INTO `listitem` VALUES ('19', '6、死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。', '2', '1', '5');
INSERT INTO `listitem` VALUES ('20', '此外，当日其没有喝酒。', '2', '2', '5');
INSERT INTO `listitem` VALUES ('21', '8、鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '1', '1', '6');
INSERT INTO `listitem` VALUES ('22', '9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '2', '6');
INSERT INTO `listitem` VALUES ('23', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。', '2', '1', '6');
INSERT INTO `listitem` VALUES ('24', '11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '2', '6');
INSERT INTO `listitem` VALUES ('25', '责任。 案后，被告人宋X到公安机关投案。 公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车', '1', '1', '7');
INSERT INTO `listitem` VALUES ('26', '驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任', '1', '2', '7');
INSERT INTO `listitem` VALUES ('27', '认定书、道路交通事故现场勘查笔录及照片；鉴定意见：辽阳市公安局刑事技术鉴定书、车辆检验报告及照片、辽阳襄平法医司法', '1', '3', '7');
INSERT INTO `listitem` VALUES ('28', '鉴定所检验报告；被告人宋X的供述与辩解等证据证明。据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法', '1', '4', '7');
INSERT INTO `listitem` VALUES ('29', '》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。 各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407', '2', '1', '7');
INSERT INTO `listitem` VALUES ('30', '148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；交通费2000元；衣物及摩托车损失费2000元。共计赔偿人民币616131元。 附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。 关于刑事部分，被告人宋X对公诉机关指控的', '2', '2', '7');
INSERT INTO `listitem` VALUES ('31', '犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。 附带民事', '2', '3', '7');
INSERT INTO `listitem` VALUES ('32', '诉讼被告保险公司的委托代理人同意在交强险保额', '2', '4', '7');
INSERT INTO `listitem` VALUES ('33', '内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。 经审理查明： 2015年7月8日22时35分，', '1', '1', '8');
INSERT INTO `listitem` VALUES ('34', '被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王', '1', '2', '8');
INSERT INTO `listitem` VALUES ('35', 'XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '1', '3', '8');
INSERT INTO `listitem` VALUES ('36', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引', '1', '4', '8');
INSERT INTO `listitem` VALUES ('37', '起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故', '1', '5', '8');
INSERT INTO `listitem` VALUES ('38', '全部责任，王XX无责任。 被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽', '2', '1', '8');
INSERT INTO `listitem` VALUES ('39', '阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实', '2', '2', '8');
INSERT INTO `listitem` VALUES ('40', '。 3、身份证复印件、户籍证明，能证明被告人宋X的出', '2', '3', '8');
INSERT INTO `listitem` VALUES ('41', '生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。 4、机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证', '2', '4', '8');
INSERT INTO `listitem` VALUES ('42', '复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾', '2', '5', '8');
INSERT INTO `listitem` VALUES ('43', '驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资', '1', '1', '9');
INSERT INTO `listitem` VALUES ('44', '格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K', '1', '2', '9');
INSERT INTO `listitem` VALUES ('45', '105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K', '1', '3', '9');
INSERT INTO `listitem` VALUES ('46', '392XX的小型轿车在华泰财产保险公司', '2', '1', '9');
INSERT INTO `listitem` VALUES ('47', '辽阳中心支公司投保交通强制保险。 6、死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解', '2', '2', '9');
INSERT INTO `listitem` VALUES ('48', '证明，2015年7月8日22时30分', '2', '3', '9');
INSERT INTO `listitem` VALUES ('49', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，', '1', '1', '10');
INSERT INTO `listitem` VALUES ('50', '因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '1', '2', '10');
INSERT INTO `listitem` VALUES ('51', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，', '2', '1', '10');
INSERT INTO `listitem` VALUES ('52', '被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。', '2', '2', '10');
INSERT INTO `listitem` VALUES ('53', '公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、', '1', '1', '11');
INSERT INTO `listitem` VALUES ('54', '二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；', '1', '2', '11');
INSERT INTO `listitem` VALUES ('55', '鉴定意见：辽阳市公安局刑事技术鉴定书、车辆检验报告及照片、辽阳襄平法医司法鉴定所检验报告；被告人宋X的供述与辩解等证据证明。', '2', '1', '11');
INSERT INTO `listitem` VALUES ('56', '据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。', '2', '2', '11');
INSERT INTO `listitem` VALUES ('57', '各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；交通费2000元；', '1', '1', '12');
INSERT INTO `listitem` VALUES ('58', '衣物及摩托车损失费2000元。共计赔偿人民币616131元。 附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。', '1', '2', '12');
INSERT INTO `listitem` VALUES ('59', '关于刑事部分，被告人宋X对公诉机关指控的犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。', '2', '1', '12');
INSERT INTO `listitem` VALUES ('60', '附带民事诉讼被告保险公司的委托代理人同意在交强险保额内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。', '2', '2', '12');
INSERT INTO `listitem` VALUES ('61', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，', '1', '1', '13');
INSERT INTO `listitem` VALUES ('62', '造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '2', '13');
INSERT INTO `listitem` VALUES ('63', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。', '2', '1', '13');
INSERT INTO `listitem` VALUES ('64', '2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '2', '13');
INSERT INTO `listitem` VALUES ('65', '4、机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。', '1', '1', '14');
INSERT INTO `listitem` VALUES ('66', '被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '2', '14');
INSERT INTO `listitem` VALUES ('67', '6、死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。', '2', '1', '14');
INSERT INTO `listitem` VALUES ('68', '此外，当日其没有喝酒。', '2', '2', '14');
INSERT INTO `listitem` VALUES ('69', '8、鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '1', '1', '15');
INSERT INTO `listitem` VALUES ('70', '9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '2', '15');
INSERT INTO `listitem` VALUES ('71', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。', '2', '1', '15');
INSERT INTO `listitem` VALUES ('72', '11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '2', '15');
INSERT INTO `listitem` VALUES ('73', '责任。 案后，被告人宋X到公安机关投案。 公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车', '1', '1', '16');
INSERT INTO `listitem` VALUES ('74', '驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任', '1', '2', '16');
INSERT INTO `listitem` VALUES ('75', '认定书、道路交通事故现场勘查笔录及照片；鉴定意见：辽阳市公安局刑事技术鉴定书、车辆检验报告及照片、辽阳襄平法医司法', '1', '3', '16');
INSERT INTO `listitem` VALUES ('76', '鉴定所检验报告；被告人宋X的供述与辩解等证据证明。据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法', '1', '4', '16');
INSERT INTO `listitem` VALUES ('77', '》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。 各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407', '2', '1', '16');
INSERT INTO `listitem` VALUES ('78', '148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；交通费2000元；衣物及摩托车损失费2000元。共计赔偿人民币616131元。 附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。 关于刑事部分，被告人宋X对公诉机关指控的', '2', '2', '16');
INSERT INTO `listitem` VALUES ('79', '犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。 附带民事', '2', '3', '16');
INSERT INTO `listitem` VALUES ('80', '诉讼被告保险公司的委托代理人同意在交强险保额', '2', '4', '16');
INSERT INTO `listitem` VALUES ('81', '内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。 经审理查明： 2015年7月8日22时35分，', '1', '1', '17');
INSERT INTO `listitem` VALUES ('82', '被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王', '1', '2', '17');
INSERT INTO `listitem` VALUES ('83', 'XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '1', '3', '17');
INSERT INTO `listitem` VALUES ('84', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引', '1', '4', '17');
INSERT INTO `listitem` VALUES ('85', '起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故', '1', '5', '17');
INSERT INTO `listitem` VALUES ('86', '全部责任，王XX无责任。 被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽', '2', '1', '17');
INSERT INTO `listitem` VALUES ('87', '阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实', '2', '2', '17');
INSERT INTO `listitem` VALUES ('88', '。 3、身份证复印件、户籍证明，能证明被告人宋X的出', '2', '3', '17');
INSERT INTO `listitem` VALUES ('89', '生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。 4、机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证', '2', '4', '17');
INSERT INTO `listitem` VALUES ('90', '复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾', '2', '5', '17');
INSERT INTO `listitem` VALUES ('91', '驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资', '1', '1', '18');
INSERT INTO `listitem` VALUES ('92', '格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K', '1', '2', '18');
INSERT INTO `listitem` VALUES ('93', '105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K', '1', '3', '18');
INSERT INTO `listitem` VALUES ('94', '392XX的小型轿车在华泰财产保险公司', '2', '1', '18');
INSERT INTO `listitem` VALUES ('95', '辽阳中心支公司投保交通强制保险。 6、死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解', '2', '2', '18');
INSERT INTO `listitem` VALUES ('96', '证明，2015年7月8日22时30分', '2', '3', '18');
INSERT INTO `listitem` VALUES ('97', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，', '1', '1', '19');
INSERT INTO `listitem` VALUES ('98', '因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '1', '2', '19');
INSERT INTO `listitem` VALUES ('99', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，', '2', '1', '19');
INSERT INTO `listitem` VALUES ('100', '被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。', '2', '2', '19');
INSERT INTO `listitem` VALUES ('101', '公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、', '1', '1', '20');
INSERT INTO `listitem` VALUES ('102', '二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；', '1', '2', '20');
INSERT INTO `listitem` VALUES ('103', '鉴定意见：辽阳市公安局刑事技术鉴定书、车辆检验报告及照片、辽阳襄平法医司法鉴定所检验报告；被告人宋X的供述与辩解等证据证明。', '2', '1', '20');
INSERT INTO `listitem` VALUES ('104', '据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。', '2', '2', '20');
INSERT INTO `listitem` VALUES ('105', '各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；交通费2000元；', '1', '1', '21');
INSERT INTO `listitem` VALUES ('106', '衣物及摩托车损失费2000元。共计赔偿人民币616131元。 附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。', '1', '2', '21');
INSERT INTO `listitem` VALUES ('107', '关于刑事部分，被告人宋X对公诉机关指控的犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。', '2', '1', '21');
INSERT INTO `listitem` VALUES ('108', '附带民事诉讼被告保险公司的委托代理人同意在交强险保额内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。', '2', '2', '21');
INSERT INTO `listitem` VALUES ('109', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，', '1', '1', '22');
INSERT INTO `listitem` VALUES ('110', '造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '2', '22');
INSERT INTO `listitem` VALUES ('111', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。', '2', '1', '22');
INSERT INTO `listitem` VALUES ('112', '2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '2', '22');
INSERT INTO `listitem` VALUES ('113', '4、机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。', '1', '1', '23');
INSERT INTO `listitem` VALUES ('114', '被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '2', '23');
INSERT INTO `listitem` VALUES ('115', '6、死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。', '2', '1', '23');
INSERT INTO `listitem` VALUES ('116', '此外，当日其没有喝酒。', '2', '2', '23');
INSERT INTO `listitem` VALUES ('117', '8、鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '1', '1', '24');
INSERT INTO `listitem` VALUES ('118', '9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '2', '24');
INSERT INTO `listitem` VALUES ('119', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。', '2', '1', '24');
INSERT INTO `listitem` VALUES ('120', '11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '2', '24');
INSERT INTO `listitem` VALUES ('121', '责任。 案后，被告人宋X到公安机关投案。 公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车', '1', '1', '25');
INSERT INTO `listitem` VALUES ('122', '驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任', '1', '2', '25');
INSERT INTO `listitem` VALUES ('123', '认定书、道路交通事故现场勘查笔录及照片；鉴定意见：辽阳市公安局刑事技术鉴定书、车辆检验报告及照片、辽阳襄平法医司法', '1', '3', '25');
INSERT INTO `listitem` VALUES ('124', '鉴定所检验报告；被告人宋X的供述与辩解等证据证明。据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法', '1', '4', '25');
INSERT INTO `listitem` VALUES ('125', '》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。 各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407', '2', '1', '25');
INSERT INTO `listitem` VALUES ('126', '148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；交通费2000元；衣物及摩托车损失费2000元。共计赔偿人民币616131元。 附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。 关于刑事部分，被告人宋X对公诉机关指控的', '2', '2', '25');
INSERT INTO `listitem` VALUES ('127', '犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。 附带民事', '2', '3', '25');
INSERT INTO `listitem` VALUES ('128', '诉讼被告保险公司的委托代理人同意在交强险保额', '2', '4', '25');
INSERT INTO `listitem` VALUES ('129', '内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。 经审理查明： 2015年7月8日22时35分，', '1', '1', '26');
INSERT INTO `listitem` VALUES ('130', '被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王', '1', '2', '26');
INSERT INTO `listitem` VALUES ('131', 'XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '1', '3', '26');
INSERT INTO `listitem` VALUES ('132', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引', '1', '4', '26');
INSERT INTO `listitem` VALUES ('133', '起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故', '1', '5', '26');
INSERT INTO `listitem` VALUES ('134', '全部责任，王XX无责任。 被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽', '2', '1', '26');
INSERT INTO `listitem` VALUES ('135', '阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实', '2', '2', '26');
INSERT INTO `listitem` VALUES ('136', '。 3、身份证复印件、户籍证明，能证明被告人宋X的出', '2', '3', '26');
INSERT INTO `listitem` VALUES ('137', '生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。 4、机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证', '2', '4', '26');
INSERT INTO `listitem` VALUES ('138', '复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾', '2', '5', '26');
INSERT INTO `listitem` VALUES ('139', '驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资', '1', '1', '27');
INSERT INTO `listitem` VALUES ('140', '格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K', '1', '2', '27');
INSERT INTO `listitem` VALUES ('141', '105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K', '1', '3', '27');
INSERT INTO `listitem` VALUES ('142', '392XX的小型轿车在华泰财产保险公司', '2', '1', '27');
INSERT INTO `listitem` VALUES ('143', '辽阳中心支公司投保交通强制保险。 6、死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解', '2', '2', '27');
INSERT INTO `listitem` VALUES ('144', '证明，2015年7月8日22时30分', '2', '3', '27');
INSERT INTO `listitem` VALUES ('145', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，', '1', '1', '84');
INSERT INTO `listitem` VALUES ('146', '因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '1', '2', '84');
INSERT INTO `listitem` VALUES ('147', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '1', '3', '84');
INSERT INTO `listitem` VALUES ('148', '该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。', '1', '4', '84');
INSERT INTO `listitem` VALUES ('149', '公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；', '1', '5', '84');
INSERT INTO `listitem` VALUES ('150', '鉴定意见：辽阳市公安局刑事技术鉴定书、车辆检验报告及照片、辽阳襄平法医司法鉴定所检验报告；被告人宋X的供述与辩解等证据证明。', '1', '6', '84');
INSERT INTO `listitem` VALUES ('151', '据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。', '1', '7', '84');
INSERT INTO `listitem` VALUES ('152', '各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；交通费2000元；衣物及摩托车损失费2000元。共计赔偿人民币616131元。', '2', '1', '84');
INSERT INTO `listitem` VALUES ('153', '附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。', '2', '2', '84');
INSERT INTO `listitem` VALUES ('154', '关于刑事部分，被告人宋X对公诉机关指控的犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；', '2', '3', '84');
INSERT INTO `listitem` VALUES ('155', '关于民事部分，被告人宋X无异议。 附带民事诉讼被告保险公司的委托代理人同意在交强险保额内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；', '2', '4', '84');
INSERT INTO `listitem` VALUES ('156', '要求赔偿的被抚养人不是附带民事原告人，不予赔偿。', '2', '5', '84');
INSERT INTO `listitem` VALUES ('157', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '2', '6', '84');
INSERT INTO `listitem` VALUES ('158', '被告人宋X案后到公安机关投案。上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据：', '1', '1', '85');
INSERT INTO `listitem` VALUES ('159', '1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。', '1', '2', '85');
INSERT INTO `listitem` VALUES ('160', '2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。', '1', '3', '85');
INSERT INTO `listitem` VALUES ('161', '3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '1', '4', '85');
INSERT INTO `listitem` VALUES ('162', '4、机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。', '1', '5', '85');
INSERT INTO `listitem` VALUES ('163', '5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '6', '85');
INSERT INTO `listitem` VALUES ('164', '6、死亡证明，能证明被害人王XX因交通肇事而死亡。', '1', '7', '85');
INSERT INTO `listitem` VALUES ('165', '7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '1', '85');
INSERT INTO `listitem` VALUES ('166', '8、鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '2', '2', '85');
INSERT INTO `listitem` VALUES ('167', '9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。', '2', '3', '85');
INSERT INTO `listitem` VALUES ('168', '10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。', '2', '4', '85');
INSERT INTO `listitem` VALUES ('169', '11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。', '2', '5', '85');
INSERT INTO `listitem` VALUES ('170', '12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '6', '85');
INSERT INTO `listitem` VALUES ('171', '责任。 案后，被告人宋X到公安机关投案。 公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车', '1', '1', '86');
INSERT INTO `listitem` VALUES ('172', '驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任', '1', '2', '86');
INSERT INTO `listitem` VALUES ('173', '认定书、道路交通事故现场勘查笔录及照片；鉴定意见：辽阳市公安局刑事技术鉴定书、车辆检验报告及照片、辽阳襄平法医司法', '1', '3', '86');
INSERT INTO `listitem` VALUES ('174', '鉴定所检验报告；被告人宋X的供述与辩解等证据证明。据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法', '1', '4', '86');
INSERT INTO `listitem` VALUES ('175', '》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。 各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407', '2', '1', '86');
INSERT INTO `listitem` VALUES ('176', '148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；交通费2000元；衣物及摩托车损失费2000元。共计赔偿人民币616131元。 附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。 关于刑事部分，被告人宋X对公诉机关指控的', '2', '2', '86');
INSERT INTO `listitem` VALUES ('177', '犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。 附带民事', '2', '3', '86');
INSERT INTO `listitem` VALUES ('178', '诉讼被告保险公司的委托代理人同意在交强险保额', '2', '4', '86');
INSERT INTO `listitem` VALUES ('179', '内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。 经审理查明： 2015年7月8日22时35分，', '1', '1', '87');
INSERT INTO `listitem` VALUES ('180', '被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王', '1', '2', '87');
INSERT INTO `listitem` VALUES ('181', 'XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '1', '3', '87');
INSERT INTO `listitem` VALUES ('182', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引', '1', '4', '87');
INSERT INTO `listitem` VALUES ('183', '起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故', '1', '5', '87');
INSERT INTO `listitem` VALUES ('184', '全部责任，王XX无责任。 被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽', '2', '1', '87');
INSERT INTO `listitem` VALUES ('185', '阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实', '2', '2', '87');
INSERT INTO `listitem` VALUES ('186', '。 3、身份证复印件、户籍证明，能证明被告人宋X的出', '2', '3', '87');
INSERT INTO `listitem` VALUES ('187', '生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。 4、机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证', '2', '4', '87');
INSERT INTO `listitem` VALUES ('188', '复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾', '2', '5', '87');
INSERT INTO `listitem` VALUES ('189', '驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资', '1', '1', '88');
INSERT INTO `listitem` VALUES ('190', '格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K', '1', '2', '88');
INSERT INTO `listitem` VALUES ('191', '105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K', '1', '3', '88');
INSERT INTO `listitem` VALUES ('192', '392XX的小型轿车在华泰财产保险公司', '2', '1', '88');
INSERT INTO `listitem` VALUES ('193', '辽阳中心支公司投保交通强制保险。 6、死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解', '2', '2', '88');
INSERT INTO `listitem` VALUES ('194', '证明，2015年7月8日22时30分', '2', '3', '88');
INSERT INTO `listitem` VALUES ('199', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '1', '132');
INSERT INTO `listitem` VALUES ('200', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '1', '132');
INSERT INTO `listitem` VALUES ('201', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '2', '132');
INSERT INTO `listitem` VALUES ('202', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '2', '132');
INSERT INTO `listitem` VALUES ('203', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '3', '132');
INSERT INTO `listitem` VALUES ('204', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '3', '132');
INSERT INTO `listitem` VALUES ('205', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '1', '133');
INSERT INTO `listitem` VALUES ('206', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '1', '133');
INSERT INTO `listitem` VALUES ('207', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '2', '133');
INSERT INTO `listitem` VALUES ('208', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '2', '133');
INSERT INTO `listitem` VALUES ('209', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '3', '133');
INSERT INTO `listitem` VALUES ('210', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '3', '133');
INSERT INTO `listitem` VALUES ('211', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '1', '134');
INSERT INTO `listitem` VALUES ('212', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '1', '134');
INSERT INTO `listitem` VALUES ('213', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '2', '134');
INSERT INTO `listitem` VALUES ('214', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '2', '134');
INSERT INTO `listitem` VALUES ('215', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '3', '134');
INSERT INTO `listitem` VALUES ('216', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '3', '134');
INSERT INTO `listitem` VALUES ('217', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '1', '135');
INSERT INTO `listitem` VALUES ('218', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '1', '135');
INSERT INTO `listitem` VALUES ('219', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '2', '135');
INSERT INTO `listitem` VALUES ('220', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '2', '135');
INSERT INTO `listitem` VALUES ('221', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '3', '135');
INSERT INTO `listitem` VALUES ('222', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '3', '135');
INSERT INTO `listitem` VALUES ('223', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '1', '146');
INSERT INTO `listitem` VALUES ('224', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '1', '146');
INSERT INTO `listitem` VALUES ('225', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '2', '146');
INSERT INTO `listitem` VALUES ('226', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '2', '146');
INSERT INTO `listitem` VALUES ('227', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '3', '146');
INSERT INTO `listitem` VALUES ('228', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '3', '146');
INSERT INTO `listitem` VALUES ('229', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '1', '147');
INSERT INTO `listitem` VALUES ('230', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '1', '147');
INSERT INTO `listitem` VALUES ('231', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '2', '147');
INSERT INTO `listitem` VALUES ('232', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '2', '147');
INSERT INTO `listitem` VALUES ('233', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '3', '147');
INSERT INTO `listitem` VALUES ('234', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '3', '147');
INSERT INTO `listitem` VALUES ('235', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '1', '148');
INSERT INTO `listitem` VALUES ('236', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '1', '148');
INSERT INTO `listitem` VALUES ('237', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '2', '148');
INSERT INTO `listitem` VALUES ('238', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '2', '148');
INSERT INTO `listitem` VALUES ('239', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '3', '148');
INSERT INTO `listitem` VALUES ('240', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '3', '148');
INSERT INTO `listitem` VALUES ('241', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '1', '149');
INSERT INTO `listitem` VALUES ('242', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '1', '149');
INSERT INTO `listitem` VALUES ('243', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '2', '149');
INSERT INTO `listitem` VALUES ('244', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '2', '149');
INSERT INTO `listitem` VALUES ('245', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '3', '149');
INSERT INTO `listitem` VALUES ('246', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '3', '149');
INSERT INTO `listitem` VALUES ('247', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '1', '150');
INSERT INTO `listitem` VALUES ('248', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '1', '150');
INSERT INTO `listitem` VALUES ('249', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '2', '150');
INSERT INTO `listitem` VALUES ('250', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '2', '150');
INSERT INTO `listitem` VALUES ('251', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '3', '150');
INSERT INTO `listitem` VALUES ('252', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '3', '150');
INSERT INTO `listitem` VALUES ('253', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '1', '151');
INSERT INTO `listitem` VALUES ('254', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '1', '151');
INSERT INTO `listitem` VALUES ('255', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '2', '151');
INSERT INTO `listitem` VALUES ('256', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '2', '151');
INSERT INTO `listitem` VALUES ('257', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '3', '151');
INSERT INTO `listitem` VALUES ('258', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '3', '151');
INSERT INTO `listitem` VALUES ('259', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '1', '152');
INSERT INTO `listitem` VALUES ('260', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '1', '152');
INSERT INTO `listitem` VALUES ('261', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '2', '152');
INSERT INTO `listitem` VALUES ('262', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '2', '152');
INSERT INTO `listitem` VALUES ('263', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '3', '152');
INSERT INTO `listitem` VALUES ('264', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '3', '152');
INSERT INTO `listitem` VALUES ('265', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '1', '153');
INSERT INTO `listitem` VALUES ('266', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '1', '153');
INSERT INTO `listitem` VALUES ('267', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '2', '153');
INSERT INTO `listitem` VALUES ('268', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '2', '153');
INSERT INTO `listitem` VALUES ('269', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '3', '153');
INSERT INTO `listitem` VALUES ('270', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '3', '153');
INSERT INTO `listitem` VALUES ('271', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '1', '162');
INSERT INTO `listitem` VALUES ('272', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '1', '162');
INSERT INTO `listitem` VALUES ('273', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '2', '162');
INSERT INTO `listitem` VALUES ('274', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '2', '162');
INSERT INTO `listitem` VALUES ('275', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '3', '162');
INSERT INTO `listitem` VALUES ('276', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '3', '162');
INSERT INTO `listitem` VALUES ('277', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '1', '163');
INSERT INTO `listitem` VALUES ('278', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '1', '163');
INSERT INTO `listitem` VALUES ('279', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '2', '163');
INSERT INTO `listitem` VALUES ('280', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '2', '163');
INSERT INTO `listitem` VALUES ('281', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '3', '163');
INSERT INTO `listitem` VALUES ('282', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '3', '163');
INSERT INTO `listitem` VALUES ('283', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '1', '164');
INSERT INTO `listitem` VALUES ('284', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '1', '164');
INSERT INTO `listitem` VALUES ('285', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '2', '164');
INSERT INTO `listitem` VALUES ('286', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '2', '164');
INSERT INTO `listitem` VALUES ('287', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '3', '164');
INSERT INTO `listitem` VALUES ('288', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '3', '164');
INSERT INTO `listitem` VALUES ('289', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '1', '165');
INSERT INTO `listitem` VALUES ('290', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '1', '165');
INSERT INTO `listitem` VALUES ('291', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '2', '165');
INSERT INTO `listitem` VALUES ('292', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '2', '165');
INSERT INTO `listitem` VALUES ('293', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '3', '165');
INSERT INTO `listitem` VALUES ('294', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '3', '165');
INSERT INTO `listitem` VALUES ('295', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '1', '183');
INSERT INTO `listitem` VALUES ('296', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '1', '183');
INSERT INTO `listitem` VALUES ('297', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '2', '183');
INSERT INTO `listitem` VALUES ('298', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '2', '183');
INSERT INTO `listitem` VALUES ('299', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '3', '183');
INSERT INTO `listitem` VALUES ('300', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '3', '183');
INSERT INTO `listitem` VALUES ('301', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '1', '184');
INSERT INTO `listitem` VALUES ('302', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '1', '184');
INSERT INTO `listitem` VALUES ('303', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '2', '184');
INSERT INTO `listitem` VALUES ('304', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '2', '184');
INSERT INTO `listitem` VALUES ('305', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '3', '184');
INSERT INTO `listitem` VALUES ('306', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '3', '184');
INSERT INTO `listitem` VALUES ('307', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '1', '185');
INSERT INTO `listitem` VALUES ('308', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '1', '185');
INSERT INTO `listitem` VALUES ('309', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '2', '185');
INSERT INTO `listitem` VALUES ('310', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '2', '185');
INSERT INTO `listitem` VALUES ('311', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '3', '185');
INSERT INTO `listitem` VALUES ('312', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '3', '185');
INSERT INTO `listitem` VALUES ('313', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '1', '186');
INSERT INTO `listitem` VALUES ('314', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '1', '186');
INSERT INTO `listitem` VALUES ('315', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '2', '186');
INSERT INTO `listitem` VALUES ('316', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '2', '186');
INSERT INTO `listitem` VALUES ('317', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '3', '186');
INSERT INTO `listitem` VALUES ('318', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '3', '186');
INSERT INTO `listitem` VALUES ('319', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '1', '187');
INSERT INTO `listitem` VALUES ('320', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '1', '187');
INSERT INTO `listitem` VALUES ('321', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '2', '187');
INSERT INTO `listitem` VALUES ('322', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '2', '187');
INSERT INTO `listitem` VALUES ('323', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '3', '187');
INSERT INTO `listitem` VALUES ('324', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '3', '187');
INSERT INTO `listitem` VALUES ('325', '2经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '1', '188');
INSERT INTO `listitem` VALUES ('326', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '1', '188');
INSERT INTO `listitem` VALUES ('327', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '2', '188');
INSERT INTO `listitem` VALUES ('328', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '2', '188');
INSERT INTO `listitem` VALUES ('329', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '3', '188');
INSERT INTO `listitem` VALUES ('330', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '3', '188');
INSERT INTO `listitem` VALUES ('331', '3经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '1', '189');
INSERT INTO `listitem` VALUES ('332', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '1', '189');
INSERT INTO `listitem` VALUES ('333', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '2', '189');
INSERT INTO `listitem` VALUES ('334', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '2', '189');
INSERT INTO `listitem` VALUES ('335', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '3', '189');
INSERT INTO `listitem` VALUES ('336', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '3', '189');
INSERT INTO `listitem` VALUES ('337', '4经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '1', '190');
INSERT INTO `listitem` VALUES ('338', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '1', '190');
INSERT INTO `listitem` VALUES ('339', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '2', '190');
INSERT INTO `listitem` VALUES ('340', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '2', '190');
INSERT INTO `listitem` VALUES ('341', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '3', '190');
INSERT INTO `listitem` VALUES ('342', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '3', '190');
INSERT INTO `listitem` VALUES ('343', '5经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '1', '191');
INSERT INTO `listitem` VALUES ('344', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '1', '191');
INSERT INTO `listitem` VALUES ('345', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '2', '191');
INSERT INTO `listitem` VALUES ('346', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '2', '191');
INSERT INTO `listitem` VALUES ('347', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '3', '191');
INSERT INTO `listitem` VALUES ('348', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '3', '191');
INSERT INTO `listitem` VALUES ('349', '6经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '1', '192');
INSERT INTO `listitem` VALUES ('350', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '1', '192');
INSERT INTO `listitem` VALUES ('351', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '2', '192');
INSERT INTO `listitem` VALUES ('352', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '2', '192');
INSERT INTO `listitem` VALUES ('353', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '3', '192');
INSERT INTO `listitem` VALUES ('354', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '3', '192');
INSERT INTO `listitem` VALUES ('355', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '1', '193');
INSERT INTO `listitem` VALUES ('356', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '1', '193');
INSERT INTO `listitem` VALUES ('357', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '2', '193');
INSERT INTO `listitem` VALUES ('358', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '2', '193');
INSERT INTO `listitem` VALUES ('359', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '3', '193');
INSERT INTO `listitem` VALUES ('360', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '3', '193');
INSERT INTO `listitem` VALUES ('361', '2经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '1', '194');
INSERT INTO `listitem` VALUES ('362', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '1', '194');
INSERT INTO `listitem` VALUES ('363', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '2', '194');
INSERT INTO `listitem` VALUES ('364', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '2', '194');
INSERT INTO `listitem` VALUES ('365', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '3', '194');
INSERT INTO `listitem` VALUES ('366', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '3', '194');
INSERT INTO `listitem` VALUES ('367', '3经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '1', '195');
INSERT INTO `listitem` VALUES ('368', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '1', '195');
INSERT INTO `listitem` VALUES ('369', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '2', '195');
INSERT INTO `listitem` VALUES ('370', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '2', '195');
INSERT INTO `listitem` VALUES ('371', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '3', '195');
INSERT INTO `listitem` VALUES ('372', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '3', '195');
INSERT INTO `listitem` VALUES ('373', '4经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '1', '196');
INSERT INTO `listitem` VALUES ('374', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '1', '196');
INSERT INTO `listitem` VALUES ('375', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '2', '196');
INSERT INTO `listitem` VALUES ('376', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '2', '196');
INSERT INTO `listitem` VALUES ('377', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '3', '196');
INSERT INTO `listitem` VALUES ('378', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '3', '196');
INSERT INTO `listitem` VALUES ('379', '5经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '1', '197');
INSERT INTO `listitem` VALUES ('380', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '1', '197');
INSERT INTO `listitem` VALUES ('381', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '2', '197');
INSERT INTO `listitem` VALUES ('382', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '2', '197');
INSERT INTO `listitem` VALUES ('383', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '3', '197');
INSERT INTO `listitem` VALUES ('384', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '3', '197');
INSERT INTO `listitem` VALUES ('385', '6经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '1', '198');
INSERT INTO `listitem` VALUES ('386', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '2', '1', '198');
INSERT INTO `listitem` VALUES ('387', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '1', '2', '198');
INSERT INTO `listitem` VALUES ('388', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '2', '2', '198');
INSERT INTO `listitem` VALUES ('389', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '1', '3', '198');
INSERT INTO `listitem` VALUES ('390', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '2', '3', '198');

-- ----------------------------
-- Table structure for paragraph
-- ----------------------------
DROP TABLE IF EXISTS `paragraph`;
CREATE TABLE `paragraph` (
  `pid` int(11) NOT NULL AUTO_INCREMENT COMMENT '段落内容ID',
  `paracontent` varchar(20000) DEFAULT NULL COMMENT '段落内容',
  `paraindex` int(11) NOT NULL COMMENT '段落索引',
  `document_id` int(11) NOT NULL COMMENT '文件ID',
  PRIMARY KEY (`pid`),
  KEY `document_id` (`document_id`),
  CONSTRAINT `paragraph_ibfk_1` FOREIGN KEY (`document_id`) REFERENCES `document` (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=568 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paragraph
-- ----------------------------
INSERT INTO `paragraph` VALUES ('1', '腾讯打造的专业办公工具，80%的中国500强企业已开通。请认准此标志，拥有此标志的才是发自腾讯公司的系统邮件。', '1', '1');
INSERT INTO `paragraph` VALUES ('2', '【我们是谁】\nSHEIN，成立于2008年，聚焦快时尚，是一家集商品设计、仓储供应链、互联网研发及线上运营于一体的B2C跨境电商互联网企业。\n【我们的发展】\n1.5亿 APP下载量\n2个国际独立品牌：SHEIN、ROWME\n服务17种语言：英、法、德、西、意、葡、俄、土、泰、荷兰、越南、印尼、瑞典、希伯来、阿拉伯等\n覆盖100+国家：美国、欧洲、中东、印度、东南亚等\n7000W 活跃用户\n营业额过100亿\n国内员工5000+\n【加入我们】\n广阔前景、坐标一线、大牛云集、丰厚薪酬、导师帮带、快速晋升、五险一金、带薪年假、弹性工作\n更多精彩，等你出现~', '2', '1');
INSERT INTO `paragraph` VALUES ('3', '恭喜！您获得一个免单资格！3包家庭装湿巾0元领', '3', '1');
INSERT INTO `paragraph` VALUES ('4', '网易邮箱使用数据账单 2018年12月。温馨提示：由于业务调整，账单服务将暂停维护\n1.下月起数据账单更新的消息将不再通过邮件发送，如需继续访问可直接访问用户俱乐部\n2.账单页面数据每月仍定时更新，可能出现数据异常问题，相关数据仅供参考，网易不保证其完全精确～', '4', '1');
INSERT INTO `paragraph` VALUES ('5', '【注意】你的双11价提前享福利，就要过期了！恭喜！您获得一个免单资格！请尽快使用！', '5', '1');
INSERT INTO `paragraph` VALUES ('6', '如果你不想再收到该产品的推荐邮件，请点击 这里退订\n《阴阳师》二周年庆重磅开启！', '6', '1');
INSERT INTO `paragraph` VALUES ('7', '节日福利】网易自营电商，为您提供国庆必备服饰配件5.5折起福利！', '7', '1');
INSERT INTO `paragraph` VALUES ('8', '网易游戏雷火事业群技术宣讲会（南京大学）\n\n宣讲会时间：3月11号18：30\n宣讲会地点：南京大学-仙林校区-计算机科学技术楼111\n宣讲福利：现场拿笔试资格\n招聘职位：\n技术类：游戏研发、游戏AI、游戏测试、前端/平台开发、数据挖掘、游戏运维、技术音频等\n非技术类：虚拟世界架构师（游戏策划）、项目管理、用户体验、交互设计、市场营销、数据分析等\n艺术类：界面动效/美术设计师（GUI）、场景/角色原画、场景/角色制作、游戏特效/动作、官网视觉、动画动效等\n工作地点：杭州\n面向对象：2020届&2019届', '8', '1');
INSERT INTO `paragraph` VALUES ('9', '感谢您在雅诗兰黛中国网站上订购产品。 \n感谢您的惠顾。\n感谢您惠顾雅诗兰黛。\n订单发送后，您将收到确认通知。如果有任何问题，请拨打400-820-7000联系我们的客户服务部门。\n\n\n\n\n送货地址	王涛 \n江苏省\n南京市\n鼓楼区\n江苏省南京市鼓楼区南京大学鼓楼校区陶园一舍\n210093\n手机: 18852000838 	送货日期和时间	送货备注	没有送货说明。 	送货时间	任何时间 	礼品选项	本订单不是做为礼物赠送他人。', '9', '1');
INSERT INTO `paragraph` VALUES ('10', 'xx，您好： \r刚刚有人使用您的 Apple ID ( 在 App Store 中下载了“哔哩哔哩HD-弹幕番剧直播高清视频”。此操作是在一台之前未使用过的电脑或设备上进行的。如果您在上次购买后重设过密码，您可能也会收到此邮件。如果您下载了此项目，请忽略此邮件。发送此邮件只是为了提醒您注意，以防他此下载非您本人所为。如果您没有下载此项目，我们建议您前往 iforgot.apple.com (​http:​/​​/​iforgot.apple.com\" \\t \"https:​/​​/​mail.qq.com​/​cgi-bin​/​_blank​) 更改您的密码，然后参阅 Apple ID：安全性和 Apple ID (​http:​/​​/​support.apple.com​/​kb​/​HT4232?viewlocale=zh_CN\" \\t \"https:​/​​/​mail.qq.com​/​cgi-bin​/​_blank​) 以获取进一步帮助。此致\r\nApple', '1', '2');
INSERT INTO `paragraph` VALUES ('11', '激活锁”要求您在“iPad”(iPad Pro) 上输入您的密码。 \r\n“查找我的 iPhone”包含“激活锁”功能：所有人都需要输入您的 Apple ID 和密码或您的设备密码，才能重新激活并使用您的设备。如果您正在设置此设备，只需在提供的字段中输入您的 Apple ID 和密码即可。 \r\n忘记您的密码？ (​https:​/​​/​support.apple.com​/​zh-cn​/​HT201487\" \\t \"https:​/​​/​mail.qq.com​/​cgi-bin​/​_blank​)\r\n了解如何重设您的 Apple ID 密码。\r\n\r\n已将此设备赠与他人？ (​https:​/​​/​support.apple.com​/​zh-cn​/​HT201351\" \\t \"https:​/​​/​mail.qq.com​/​cgi-bin​/​_blank​)\r\n了解如何帮助他们设置设备，以及日后出售或赠送设备前该做什么。\r\n\r\niPad 丢失或被盗？ (​https:​/​​/​support.apple.com​/​zh-cn​/​HT201472\" \\t \"https:​/​​/​mail.qq.com​/​cgi-bin​/​_blank​)\r\n请将您的设备设置为“丢失模式”，以确保其被清晰地标记为已丢失。 \r\n\r\n\riCloud 是 Apple 的一项服务。中国内地的 iCloud 由云上贵州运营。 Apple ID  (​https:​/​​/​appleid.apple.com​/​choose-your-country​/​\" \\t \"https:​/​​/​mail.qq.com​/​cgi-bin​/​_blank​)| 支持  (​https:​/​​/​www.apple.com​/​support​/​icloud​/​ww\" \\t \"https:​/​​/​mail.qq.com​/​cgi-bin​/​_blank​)| 条款与条件  (​https:​/​​/​www.apple.com​/​legal​/​internet-services​/​icloud​/​ww​/​\" \\t \"https:​/​​/​mail.qq.com​/​cgi-bin​/​_blank​)| 客户隐私政策  (​https:​/​​/​www.apple.com​/​legal​/​privacy​/​szh​/​\" \\t \"https:​/​​/​mail.qq.com​/​cgi-bin​/​_blank​)', '2', '2');
INSERT INTO `paragraph` VALUES ('12', '尊敬的用户您好， 您申请注册的【专利检索及分析系统】邮件验证码为： 5866 ，请尽快完成注册', '3', '2');
INSERT INTO `paragraph` VALUES ('13', '未来的南研华为er您好：\r\n首先非常感谢您选择了华为~为了您能够最大化的选择到心仪的入职班次，特做此项调查\r\n请您花一分钟的时间填写一下问卷调查哦：http://www.huawei.com/audience/answer.do?u=1006194 (​http:​/​​/​www.huawei.com​/​audience​/​answer.do?u=1006194\" \\t \"https:​/​​/​mail.qq.com​/​cgi-bin​/​_blank​)\r\n问卷调查补充说明：华为公司能够入职必须具备如下材料，所以在选择您心仪的入职时间前，请您结合您能够拿到如下材料的时间一起考虑哦：）', '4', '2');
INSERT INTO `paragraph` VALUES ('14', '【勇敢新世界导航计划】今晚8点，“双旦特别活动”第一波抽奖强势来袭！说不定你就是那个幸运儿~速戳↓↓↓', '5', '2');
INSERT INTO `paragraph` VALUES ('15', '双12特惠：清华大学数据科学认证项目直降600', '6', '2');
INSERT INTO `paragraph` VALUES ('16', 'Hi:\r\n斗转星移，新年将至。\r\n2019，邮箱仍与你同行。\r\n新年新气象，不如写一张贺卡，\r\n就现在，让问候从指间轻轻启程。', '7', '2');
INSERT INTO `paragraph` VALUES ('17', '您好！您于2018年10月28日在中国铁路客户服务中心网站(12306.cn (​http:​/​​/​www.12306.cn\" \\t \"https:​/​​/​mail.qq.com​/​cgi-bin​/​_blank​)) 成功购买了1张车票，票款共计34.00元，订单号码 。 所购车票信息如下： \r\n为了确保旅客人身安全和列车运行秩序，车站将在开车时间之前提前停止售票、检票，请合理安排出行时间，提前到乘车站办理换票、安检、验证并到指定场所候车，以免耽误乘车。', '8', '2');
INSERT INTO `paragraph` VALUES ('18', '温馨提示\r\n（1）请牢记 12306.cn (​http:​/​​/​www.12306.cn\" \\t \"https:​/​​/​mail.qq.com​/​cgi-bin​/​_blank​) 网站提供的订单号码 ，并妥善保管，以确保您的购票信息安全。 （2）选择车票快递服务的，请准备有效身份证件原件。您可在“已完成订单”-> “订单详情”-> “快递详情”中查看你的快递状态。当车票处于“待制票”状态时，用户可进行以下变更操作： \r\n1>取消车票快递服务：您可单独选择取消车票快递服务，系统自动退还快递服务费。车票快递服务一经取消，同一订单无法再次提供车票快递服务。 \r\n2>改签、变更到站、退票及换取纸质车票：您可自行办理车票的改签、变更到站、退票、换取纸质车票等业务。变更后符合快递服务条件的车票将按照原约定继续提供快递服务；变更后整件不符合快递服务条件的车票将取消快递服务，同时系统自动退还快递服务费。 \r\n当车票处于“已制票”、 “派件中”状态时，您不能在网站办理取消车票快递服务及办理车票的改签、变更到站、退票、换票等业务，如有特殊情况可联系快递（物流）企业客户代表。', '9', '2');
INSERT INTO `paragraph` VALUES ('20', '这是一个错误格式示例', '1', '4');
INSERT INTO `paragraph` VALUES ('21', '经审理查明，2015年8月12日12时50分许，被告人袁某某驾驶皖KH0766号重型自卸货车，沿着省道216线由北向南行驶至淮滨县王店乡北庙村向阳路口男200米处时，由于观察不周、操作不当，与庞某甲驾驶两轮电动车发生碰撞，造成庞某甲当场死亡的事故。经淮滨县公安局交警大队认定：袁某某负此次事故的全部责任。', '1', '15');
INSERT INTO `paragraph` VALUES ('22', '事故发生后，被告人袁某某在现场等候处理。本案在审理过程中，被告人袁某某家人补偿了被害人家人各项损失共计45000元，取得了被害人家人的谅解。 上述事实，被告人袁某某在开庭审理过程中并无异议，并有下列经当庭质证的证据可以证实：', '2', '15');
INSERT INTO `paragraph` VALUES ('23', '1．书证：受案登记表、立案决定书、接处警记录表、被告人袁某某户籍证明、前科证明、谅解书、协议书、到案经过、驾驶人信息查询结果、机动车信息查询结果单、机动车行驶证复印件、被告人袁某某的驾驶证复印件、被害人庞某甲的户籍证明及其注销证明、道路交通事故认定书及送达回执；', '3', '15');
INSERT INTO `paragraph` VALUES ('24', '2．道路交通事故现场图以及照片、道路交通事故现场勘查笔录；', '4', '15');
INSERT INTO `paragraph` VALUES ('25', '3．鉴定意见：（淮）公（法医）鉴（尸检）字（2015）039号淮滨县公安局物证鉴定室庞某甲尸检报告；', '5', '15');
INSERT INTO `paragraph` VALUES ('26', '4．证人程磊、庞某某证言；', '6', '15');
INSERT INTO `paragraph` VALUES ('27', '5．被告人袁某某供述等证据证实。 以上证据，经当庭质证、认证，确实、充分，足以认定。', '7', '15');
INSERT INTO `paragraph` VALUES ('28', '经审理查明，2015年8月12日12时50分许，被告人袁某某驾驶皖KH0766号重型自卸货车，沿着省道216线由北向南行驶至淮滨县王店乡北庙村向阳路口男200米处时，由于观察不周、操作不当，与庞某甲驾驶两轮电动车发生碰撞，造成庞某甲当场死亡的事故。经淮滨县公安局交警大队认定：袁某某负此次事故的全部责任。 事故发生后，被告人袁某某在现场等候处理。本案在审理过程中，被告人袁某某家人补偿了被害人家人各项损失共计45000元，取得了被害人家人的谅解。 上述事实，被告人袁某某在开庭审理过程中并无异议，并有下列经当庭质证的证据可以证实：1．书证：受案登记表、立案决定书、接处警记录表、被告人袁某某户籍证明、前科证明、谅解书、协议书、到案经过、驾驶人信息查询结果、机动车信息查询结果单、机动车行驶证复印件、被告人袁某某的驾驶证复印件、被害人庞某甲的户籍证明及其注销证明、道路交通事故认定书及送达回执；2．道路交通事故现场图以及照片、道路交通事故现场勘查笔录；3．鉴定意见：（淮）公（法医）鉴（尸检）字（2015）039号淮滨县公安局物证鉴定室庞某甲尸检报告；4．证人程磊、庞某某证言；5．被告人袁某某供述等证据证实。 以上证据，经当庭质证、认证，确实、充分，足以认定。', '1', '20');
INSERT INTO `paragraph` VALUES ('29', '经审理查明：2015年8月20日7时20分左右，被告人傅某驾驶皖M14826重型半挂牵引车（赣K×××××挂）沿滁州市创业路由南向北行驶到会峰路交叉口右转弯时，刮碰后碾压骑行电动车被害人宋某，致宋某当场死亡。该事故经滁州市公安局交通巡逻警察支队二大队认定，被告人傅某负事故的全部责任，宋某无事故责任。 另查明：案发后，被告人傅某打电话报警，并在现场等候，归案后如实供述自己的犯罪事实。被告人支付被害人亲属谅解费6万元，被害人亲属对被告人的行为予以谅解，不追究被告人的刑事责任。 上述事实，有下列经庭审举证、质证的证据证明，本院予以确认： 1、道路交通事故现场勘查笔录证明：案发现场情况。 2、道路交通事故尸表检验报告、道路交通事故尸体处理通知书证明：宋某因交通事故死亡。 3、道路交通事故认定书证明：傅某负事故的全部责任，宋某无事故责任。 4、122受理单证明：电话151××××3905（傅某）于2015年8月20日7时27分32秒、2015年8月20日7时23分17秒打电话报警。 5、驾驶人信息查询结果单、机动车信息查询结果单证明：傅某准驾车型为A2，皖M×××××车辆登记信息。 6、道路交通事故损害赔偿协议暨谅解书、收条、承诺书证明：傅某付宋某亲属谅解费6万元，获得被害人亲属的谅解。 7、归案经过证明：2015年8月20日7时28分，滁州市公安局交警支队直属二大队事故中队民警接110指令，驱车赶往现场后，发现肇事驾驶员傅某在事故现场，现场勘察完毕后，傅某随民警到交警二大队事故中队进行相关调查。 8、人口基本信息证明：傅某、宋某的自然身份情况。 9、证人张某的证言证明：他与死者宋某是夫妻关系。2015年8月20日早上在会峰路与创业路发生的交通事故，他是事后知道的。 10、证人王向的证言证明：2015年8月20日7点十几分左右，一个女的骑电动车沿创业路由南向北行驶到会峰路路口过马路，正好有一个半挂车由南向北在路上往东面拐弯，电动车和女的被带到车轮底下了。 11、被告人傅某的供述证明：2015年8月20日7时20分左右，他驾驶皖M×××××重型半挂牵引车沿创业路由南向北行驶到路口右转弯，准备上会峰路，听到后面有撞击声音，就刹车停下来，看到人和电动车在车底下，就报警了。', '2', '20');
INSERT INTO `paragraph` VALUES ('30', '<AJJBQK value=\" 辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。 公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；鉴定意见：辽阳市公安局刑事技术鉴定书、车辆检验报告及照片、辽阳襄平法医司法鉴定所检验报告；被告人宋X的供述与辩解等证据证明。据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。 各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；交通费2000元；衣物及摩托车损失费2000元。共计赔偿人民币616131元。 附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。 关于刑事部分，被告人宋X对公诉机关指控的犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。 附带民事诉讼被告保险公司的委托代理人同意在交强险保额内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。 经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。 4、机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。 6、死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。 8、鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '3', '20');
INSERT INTO `paragraph` VALUES ('31', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '4', '20');
INSERT INTO `paragraph` VALUES ('32', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '1', '21');
INSERT INTO `paragraph` VALUES ('33', '该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。 公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；鉴定意见：辽阳市公安局刑事技术鉴定书、车辆检验报告及照片、辽阳襄平法医司法鉴定所检验报告；被告人宋X的供述与辩解等证据证明。', '2', '21');
INSERT INTO `paragraph` VALUES ('34', '据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。 各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；交通费2000元；衣物及摩托车损失费2000元。共计赔偿人民币616131元。 附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。 关于刑事部分，被告人宋X对公诉机关指控的犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。 附带民事诉讼被告保险公司的委托代理人同意在交强险保额内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。 经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 被告人宋X案后到公安机关投案。', '3', '21');
INSERT INTO `paragraph` VALUES ('35', '上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。', '4', '21');
INSERT INTO `paragraph` VALUES ('36', '3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。 4、机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。', '5', '21');
INSERT INTO `paragraph` VALUES ('37', '5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。 6、死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '6', '21');
INSERT INTO `paragraph` VALUES ('38', '8、鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '7', '21');
INSERT INTO `paragraph` VALUES ('39', '山西省太原市小店区人民法院 刑事判决书 （2015）小店刑初字第00295号 公诉机关太原市小店区人民检察院。 被告人杜某，无业。2014年12月12日因涉嫌犯交通肇事罪被太原市公安局刑事拘留，同年12月15日因拘留期限届满被太原市公安局释放，12月17日被太原市公安局取保候审。 太原市小店区人民检察院以并小检公刑诉（2015）172号起诉书指控被告人杜某犯交通肇事罪，于2015年4月15日向本院提起公诉。', '1', '26');
INSERT INTO `paragraph` VALUES ('40', '本院依法适用简易程序，组成合议庭，公开开庭审理了本案。太原市小店区人民检察院指派代理检察员李志一出庭支持公诉，被告人杜某到庭参加了诉讼。现已审理终结。 太原市小店区人民检察院指控，2014年11月23日12时40分，在太原市小店区长风街，被告人杜某驾驶未挂号牌（晋A×××××）的帕萨特牌小型轿车由西向东行驶至并州南路口时，与骑自行车的被害人周某发生碰撞，造成周某经医院抢救无效于当日死亡的交通事故。', '2', '26');
INSERT INTO `paragraph` VALUES ('41', '经依法鉴定，周某符合车祸致其胸腔脏器损伤呼吸循环衰竭而死亡。经依法认定，杜某对该起事故承担全部责任，周某无责任。 2014年12月13日，被告人杜某的家属与被害人周某的家属达成调解协议，由被告人杜某家属一次性支付被害人亲属各项经济损失共计人民币48万元，周某的家属对杜某的交通肇事行为予以谅解。', '3', '26');
INSERT INTO `paragraph` VALUES ('42', '上述事实，被告人杜某在开庭审理过程中亦无异议，且有太原市公安局警情信息、受理道路交通事故案件登记表、道路交通事故现场图、道路交通事故现场勘查笔录、道路交通事故照片、公安交通管理行政强制措施凭证、扣押物品清单、当事双方证件复印件及网上查询比对结果、证人证言、当事人血样（尿样）提取登记表、晋安司法鉴定报告书、居民死亡证明书、车辆技术司法鉴定意见书、车辆痕迹司法鉴定意见书、尸体检验意见书、交通事故认定书、受案登记表、归案经过、协议书、谅解书、收条、被告人杜某的供述及其户籍证明等证据证实，足以认定。', '4', '26');
INSERT INTO `paragraph` VALUES ('43', '本院认为，被告人杜某违反交通管理法规，驾驶无号牌机动车发生重大事故，致一人死亡，且负事故的全部责任，其行为构成交通肇事罪。公诉机关指控的罪名成立。被告人杜某案发后主动报警，保护现场并积极抢救伤者，归案后如实供述自己的犯罪事实，应当认定为自首，可以从轻处罚；其民事部分达成赔偿协议并履行，被害人周某的家属对被告人杜某予以谅解，可酌情从轻处罚。', '5', '26');
INSERT INTO `paragraph` VALUES ('44', '依照《中华人民共和国刑法》第一百三十三条、第六十七条第一款、第七十二条第一款、第七十三条第二款及第三款、第六十一条的规定，判决如下： 被告人杜某犯交通肇事罪，判处有期徒刑一年，缓刑一年。 缓刑考验期限，从判决确定之日起计算。', '6', '26');
INSERT INTO `paragraph` VALUES ('45', '如不服本判决，可在接到判决书的第二日起十日内，通过本院或者直接向太原市中级人民法院提出上诉。书面上诉的，应当提交上诉状正本一份，副本二份。 审判长田荣川 人民陪审员王小梅 人民陪审员李小兰 二〇一五年五月二十五日 书记员李婧 第3页共3页', '7', '26');
INSERT INTO `paragraph` VALUES ('46', '经审理查明，2015年8月12日12时50分许，被告人袁某某驾驶皖KH0766号重型自卸货车，沿着省道216线由北向南行驶至淮滨县王店乡北庙村向阳路口男200米处时，由于观察不周、操作不当，与庞某甲驾驶两轮电动车发生碰撞，造成庞某甲当场死亡的事故。经淮滨县公安局交警大队认定：袁某某负此次事故的全部责任。 事故发生后，被告人袁某某在现场等候处理。本案在审理过程中，被告人袁某某家人补偿了被害人家人各项损失共计45000元，取得了被害人家人的谅解。 上述事实，被告人袁某某在开庭审理过程中并无异议，并有下列经当庭质证的证据可以证实：1．书证：受案登记表、立案决定书、接处警记录表、被告人袁某某户籍证明、前科证明、谅解书、协议书、到案经过、驾驶人信息查询结果、机动车信息查询结果单、机动车行驶证复印件、被告人袁某某的驾驶证复印件、被害人庞某甲的户籍证明及其注销证明、道路交通事故认定书及送达回执；2．道路交通事故现场图以及照片、道路交通事故现场勘查笔录；3．鉴定意见：（淮）公（法医）鉴（尸检）字（2015）039号淮滨县公安局物证鉴定室庞某甲尸检报告；4．证人程磊、庞某某证言；5．被告人袁某某供述等证据证实。 以上证据，经当庭质证、认证，确实、充分，足以认定。', '1', '27');
INSERT INTO `paragraph` VALUES ('47', '经审理查明：2015年8月20日7时20分左右，被告人傅某驾驶皖M14826重型半挂牵引车（赣K×××××挂）沿滁州市创业路由南向北行驶到会峰路交叉口右转弯时，刮碰后碾压骑行电动车被害人宋某，致宋某当场死亡。该事故经滁州市公安局交通巡逻警察支队二大队认定，被告人傅某负事故的全部责任，宋某无事故责任。 另查明：案发后，被告人傅某打电话报警，并在现场等候，归案后如实供述自己的犯罪事实。被告人支付被害人亲属谅解费6万元，被害人亲属对被告人的行为予以谅解，不追究被告人的刑事责任。 上述事实，有下列经庭审举证、质证的证据证明，本院予以确认： 1、道路交通事故现场勘查笔录证明：案发现场情况。 2、道路交通事故尸表检验报告、道路交通事故尸体处理通知书证明：宋某因交通事故死亡。 3、道路交通事故认定书证明：傅某负事故的全部责任，宋某无事故责任。 4、122受理单证明：电话151××××3905（傅某）于2015年8月20日7时27分32秒、2015年8月20日7时23分17秒打电话报警。 5、驾驶人信息查询结果单、机动车信息查询结果单证明：傅某准驾车型为A2，皖M×××××车辆登记信息。 6、道路交通事故损害赔偿协议暨谅解书、收条、承诺书证明：傅某付宋某亲属谅解费6万元，获得被害人亲属的谅解。 7、归案经过证明：2015年8月20日7时28分，滁州市公安局交警支队直属二大队事故中队民警接110指令，驱车赶往现场后，发现肇事驾驶员傅某在事故现场，现场勘察完毕后，傅某随民警到交警二大队事故中队进行相关调查。 8、人口基本信息证明：傅某、宋某的自然身份情况。 9、证人张某的证言证明：他与死者宋某是夫妻关系。2015年8月20日早上在会峰路与创业路发生的交通事故，他是事后知道的。 10、证人王向的证言证明：2015年8月20日7点十几分左右，一个女的骑电动车沿创业路由南向北行驶到会峰路路口过马路，正好有一个半挂车由南向北在路上往东面拐弯，电动车和女的被带到车轮底下了。 11、被告人傅某的供述证明：2015年8月20日7时20分左右，他驾驶皖M×××××重型半挂牵引车沿创业路由南向北行驶到路口右转弯，准备上会峰路，听到后面有撞击声音，就刹车停下来，看到人和电动车在车底下，就报警了。', '2', '27');
INSERT INTO `paragraph` VALUES ('48', '<AJJBQK value=\" 辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。 公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；鉴定意见：辽阳市公安局刑事技术鉴定书、车辆检验报告及照片、辽阳襄平法医司法鉴定所检验报告；被告人宋X的供述与辩解等证据证明。据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。 各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；交通费2000元；衣物及摩托车损失费2000元。共计赔偿人民币616131元。 附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。 关于刑事部分，被告人宋X对公诉机关指控的犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。 附带民事诉讼被告保险公司的委托代理人同意在交强险保额内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。 经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。 4、机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。 6、死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。 8、鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '3', '27');
INSERT INTO `paragraph` VALUES ('49', '', '4', '27');
INSERT INTO `paragraph` VALUES ('50', '经审理查明，2015年8月12日12时50分许，被告人袁某某驾驶皖KH0766号重型自卸货车，沿着省道216线由北向南行驶至淮滨县王店乡北庙村向阳路口男200米处时，由于观察不周、操作不当，与庞某甲驾驶两轮电动车发生碰撞，造成庞某甲当场死亡的事故。经淮滨县公安局交警大队认定：袁某某负此次事故的全部责任。 事故发生后，被告人袁某某在现场等候处理。本案在审理过程中，被告人袁某某家人补偿了被害人家人各项损失共计45000元，取得了被害人家人的谅解。 上述事实，被告人袁某某在开庭审理过程中并无异议，并有下列经当庭质证的证据可以证实：1．书证：受案登记表、立案决定书、接处警记录表、被告人袁某某户籍证明、前科证明、谅解书、协议书、到案经过、驾驶人信息查询结果、机动车信息查询结果单、机动车行驶证复印件、被告人袁某某的驾驶证复印件、被害人庞某甲的户籍证明及其注销证明、道路交通事故认定书及送达回执；2．道路交通事故现场图以及照片、道路交通事故现场勘查笔录；3．鉴定意见：（淮）公（法医）鉴（尸检）字（2015）039号淮滨县公安局物证鉴定室庞某甲尸检报告；4．证人程磊、庞某某证言；5．被告人袁某某供述等证据证实。 以上证据，经当庭质证、认证，确实、充分，足以认定。', '1', '30');
INSERT INTO `paragraph` VALUES ('51', '经审理查明：2015年8月20日7时20分左右，被告人傅某驾驶皖M14826重型半挂牵引车（赣K×××××挂）沿滁州市创业路由南向北行驶到会峰路交叉口右转弯时，刮碰后碾压骑行电动车被害人宋某，致宋某当场死亡。该事故经滁州市公安局交通巡逻警察支队二大队认定，被告人傅某负事故的全部责任，宋某无事故责任。 另查明：案发后，被告人傅某打电话报警，并在现场等候，归案后如实供述自己的犯罪事实。被告人支付被害人亲属谅解费6万元，被害人亲属对被告人的行为予以谅解，不追究被告人的刑事责任。 上述事实，有下列经庭审举证、质证的证据证明，本院予以确认： 1、道路交通事故现场勘查笔录证明：案发现场情况。 2、道路交通事故尸表检验报告、道路交通事故尸体处理通知书证明：宋某因交通事故死亡。 3、道路交通事故认定书证明：傅某负事故的全部责任，宋某无事故责任。 4、122受理单证明：电话151××××3905（傅某）于2015年8月20日7时27分32秒、2015年8月20日7时23分17秒打电话报警。 5、驾驶人信息查询结果单、机动车信息查询结果单证明：傅某准驾车型为A2，皖M×××××车辆登记信息。 6、道路交通事故损害赔偿协议暨谅解书、收条、承诺书证明：傅某付宋某亲属谅解费6万元，获得被害人亲属的谅解。 7、归案经过证明：2015年8月20日7时28分，滁州市公安局交警支队直属二大队事故中队民警接110指令，驱车赶往现场后，发现肇事驾驶员傅某在事故现场，现场勘察完毕后，傅某随民警到交警二大队事故中队进行相关调查。 8、人口基本信息证明：傅某、宋某的自然身份情况。 9、证人张某的证言证明：他与死者宋某是夫妻关系。2015年8月20日早上在会峰路与创业路发生的交通事故，他是事后知道的。 10、证人王向的证言证明：2015年8月20日7点十几分左右，一个女的骑电动车沿创业路由南向北行驶到会峰路路口过马路，正好有一个半挂车由南向北在路上往东面拐弯，电动车和女的被带到车轮底下了。 11、被告人傅某的供述证明：2015年8月20日7时20分左右，他驾驶皖M×××××重型半挂牵引车沿创业路由南向北行驶到路口右转弯，准备上会峰路，听到后面有撞击声音，就刹车停下来，看到人和电动车在车底下，就报警了。', '2', '30');
INSERT INTO `paragraph` VALUES ('52', '<AJJBQK value=\" 辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。 公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；鉴定意见：辽阳市公安局刑事技术鉴定书、车辆检验报告及照片、辽阳襄平法医司法鉴定所检验报告；被告人宋X的供述与辩解等证据证明。据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。 各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；交通费2000元；衣物及摩托车损失费2000元。共计赔偿人民币616131元。 附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。 关于刑事部分，被告人宋X对公诉机关指控的犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。 附带民事诉讼被告保险公司的委托代理人同意在交强险保额内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。 经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。 4、机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。 6、死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。 8、鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '3', '30');
INSERT INTO `paragraph` VALUES ('53', '', '4', '30');
INSERT INTO `paragraph` VALUES ('54', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '1', '31');
INSERT INTO `paragraph` VALUES ('55', '该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。 公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；鉴定意见：辽阳市公安局刑事技术鉴定书、车辆检验报告及照片、辽阳襄平法医司法鉴定所检验报告；被告人宋X的供述与辩解等证据证明。', '2', '31');
INSERT INTO `paragraph` VALUES ('56', '据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。 各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；交通费2000元；衣物及摩托车损失费2000元。共计赔偿人民币616131元。 附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。 关于刑事部分，被告人宋X对公诉机关指控的犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。 附带民事诉讼被告保险公司的委托代理人同意在交强险保额内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。 经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 被告人宋X案后到公安机关投案。', '3', '31');
INSERT INTO `paragraph` VALUES ('57', '上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。', '4', '31');
INSERT INTO `paragraph` VALUES ('58', '3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。 4、机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。', '5', '31');
INSERT INTO `paragraph` VALUES ('59', '5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。 6、死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '6', '31');
INSERT INTO `paragraph` VALUES ('60', '8、鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '7', '31');
INSERT INTO `paragraph` VALUES ('61', '新华社北京10月2日电（记者张选杰、李兵峰）10月1日上午，在国庆70周年阅兵中，东风-17常规导弹、长剑-100巡航导弹、东风-41核导弹首次揭开神秘面纱，成为万众聚焦的“明星”。新型导弹武器不断入列，也标志着火箭军已经成为维护和平的重要力量。', '1', '32');
INSERT INTO `paragraph` VALUES ('62', '　　受阅方队亮相长安街，象征着国威军威的大国长剑昂首向天、威震寰宇。16枚东风-17常规导弹行进在导弹方阵的最前列，是未来战场决战决胜的先锋利刃。被誉为最新大国重器的东风-41核导弹，作为此次火箭军受阅的压轴巨阵，是中国战略核力量的中流砥柱。随着火箭军武器装备不断更新换代，“东风家族”人丁兴旺、日益壮大，核心战斗力持续攀升，部队整体作战能力实现历史性跨越。', '2', '32');
INSERT INTO `paragraph` VALUES ('63', '十里长安街，见证新时代。受邀前来观礼的人群，目送一辆辆导弹战车隆隆驶过。一名观众激动地说：“在新中国成立35周年阅兵式上，我们只有1个导弹方队3种型号导弹受阅，今天一次就展示了火箭军的6种新型导弹武器，折射出这支部队从无到有、从弱到强的发展历程，也象征着军队的不断强大、国力的日益强盛。”', '3', '32');
INSERT INTO `paragraph` VALUES ('64', '我是上世纪80年代初期上的大学，当时身边几乎所有人，也包括我在内，都以为北京邮电学院（现北京邮电大学）大学毕业后是要去送信的。那时候，通信是一个很稀有的服务。打电话要去电话局排队，如果在小地方，要到县城才能打一个长途电话。如果确有什么急事需要和外地联络，通常都是去邮局发电报，打电话是很奢侈的事情。', '4', '32');
INSERT INTO `paragraph` VALUES ('65', '　　到80年代末期，中国开始有了程控电话，但装一部固定电话要五六千块钱，这可不是小数。后来有了BP机，到90年代初期，开始有了采用模拟通信技术的第一代移动电话，俗称“大哥大”，要两三万元一部，在那个刚刚有 “万元户”的年代，这可是一种身份的象征。', '5', '32');
INSERT INTO `paragraph` VALUES ('66', '　　随着数字移动电话和2G时代来临，“手机”才变小，价格也越来越低。后来，3G和4G时代到来，网速越来越快，手机性能越来越好，现在，智能手机已经成为每个人工作生活必不可少的一部分，甚至一刻都离不开。', '6', '32');
INSERT INTO `paragraph` VALUES ('67', '　　从技术角度看，中国的移动通信技术在1G时代（1980年代）是空白，无标准、无技术、无产业。2G时代（1990年代）是跟随，这时标准虽然还是被欧美所掌控，但中国已经有了全球最大的移动网络，也开始培育本土的通信制造商。', '7', '32');
INSERT INTO `paragraph` VALUES ('68', '　　3G时代（2000年代）是突破，中国拥有了首个移动通信国际标准，实现了标准的从无到有，与欧洲主导的WCDMA和美国主导的CDMA2000一起形成全球三大3G国际标准。期间，中国移动承担了建设运营TD-SCDMA“中国标准”的使命，虽然面临很多挑战，但通过持续的技术创新和不懈的努力，成功建成了可运营、高质量的TD-SCDMA网络，并实现了国内“三分天下有其一”的发展目标。更为重要的是，3G时代对各种能力的锻造和积累，为4G时代打翻身仗做了充分准备。', '8', '32');
INSERT INTO `paragraph` VALUES ('69', '　　4G时代（2010年代）是并跑，中国主导的国际标准首次成为主流，华为、中兴等中国通信设备企业已经迎头赶上，并开始走出去，移动互联网应用蓬勃兴起，中国在移动电商、移动支付、移动出行等很多领域成为全球创新的典范，实现了“4G改变生活”。', '9', '32');
INSERT INTO `paragraph` VALUES ('70', '到了5G时代（2020年代）是力争引领，中国在5G技术、标准、产业、应用等方面显现出引领的态势，而且5G时代通信将开始深入产业，目标是实现“5G改变社会”。', '10', '32');
INSERT INTO `paragraph` VALUES ('71', '今天（10月7日）是俄罗斯总统普京的67岁生日。据俄罗斯卫星通讯社报道，白俄罗斯总统新闻办公室7日发布消息称，白俄罗斯总统卢卡申科向普京送上生日祝福，他同时表示，普京在国际舞台上具有极高的威望和巨大的影响力。', '11', '32');
INSERT INTO `paragraph` VALUES ('72', '消息还称，卢卡申科相信，俄白在盟国和欧亚经济联盟框架下深化一体化，将进一步推动两国经济发展，提升两国人民福祉，并将为保障欧亚空间安全与稳定做出重大贡献。', '12', '32');
INSERT INTO `paragraph` VALUES ('73', '　　白俄罗斯总统新闻办公室表示，卢卡申科祝愿普京身体健康，生活幸福，常有志同道合者支持，万事顺意。', '13', '32');
INSERT INTO `paragraph` VALUES ('74', '　　普京67岁生日怎么过？此前，据克里姆林宫新闻秘书佩斯科夫透露，普京今天将与亲朋好友在大自然中庆生。', '14', '32');
INSERT INTO `paragraph` VALUES ('75', '新华社北京10月2日电（记者张选杰、李兵峰）10月1日上午，在国庆70周年阅兵中，东风-17常规导弹、长剑-100巡航导弹、东风-41核导弹首次揭开神秘面纱，成为万众聚焦的“明星”。新型导弹武器不断入列，也标志着火箭军已经成为维护和平的重要力量。', '1', '33');
INSERT INTO `paragraph` VALUES ('76', '　　受阅方队亮相长安街，象征着国威军威的大国长剑昂首向天、威震寰宇。16枚东风-17常规导弹行进在导弹方阵的最前列，是未来战场决战决胜的先锋利刃。被誉为最新大国重器的东风-41核导弹，作为此次火箭军受阅的压轴巨阵，是中国战略核力量的中流砥柱。随着火箭军武器装备不断更新换代，“东风家族”人丁兴旺、日益壮大，核心战斗力持续攀升，部队整体作战能力实现历史性跨越。', '2', '33');
INSERT INTO `paragraph` VALUES ('77', '十里长安街，见证新时代。受邀前来观礼的人群，目送一辆辆导弹战车隆隆驶过。一名观众激动地说：“在新中国成立35周年阅兵式上，我们只有1个导弹方队3种型号导弹受阅，今天一次就展示了火箭军的6种新型导弹武器，折射出这支部队从无到有、从弱到强的发展历程，也象征着军队的不断强大、国力的日益强盛。”', '3', '33');
INSERT INTO `paragraph` VALUES ('78', '我是上世纪80年代初期上的大学，当时身边几乎所有人，也包括我在内，都以为北京邮电学院（现北京邮电大学）大学毕业后是要去送信的。那时候，通信是一个很稀有的服务。打电话要去电话局排队，如果在小地方，要到县城才能打一个长途电话。如果确有什么急事需要和外地联络，通常都是去邮局发电报，打电话是很奢侈的事情。', '4', '33');
INSERT INTO `paragraph` VALUES ('79', '　　到80年代末期，中国开始有了程控电话，但装一部固定电话要五六千块钱，这可不是小数。后来有了BP机，到90年代初期，开始有了采用模拟通信技术的第一代移动电话，俗称“大哥大”，要两三万元一部，在那个刚刚有 “万元户”的年代，这可是一种身份的象征。', '5', '33');
INSERT INTO `paragraph` VALUES ('80', '　　随着数字移动电话和2G时代来临，“手机”才变小，价格也越来越低。后来，3G和4G时代到来，网速越来越快，手机性能越来越好，现在，智能手机已经成为每个人工作生活必不可少的一部分，甚至一刻都离不开。', '6', '33');
INSERT INTO `paragraph` VALUES ('81', '　　从技术角度看，中国的移动通信技术在1G时代（1980年代）是空白，无标准、无技术、无产业。2G时代（1990年代）是跟随，这时标准虽然还是被欧美所掌控，但中国已经有了全球最大的移动网络，也开始培育本土的通信制造商。', '7', '33');
INSERT INTO `paragraph` VALUES ('82', '　　3G时代（2000年代）是突破，中国拥有了首个移动通信国际标准，实现了标准的从无到有，与欧洲主导的WCDMA和美国主导的CDMA2000一起形成全球三大3G国际标准。期间，中国移动承担了建设运营TD-SCDMA“中国标准”的使命，虽然面临很多挑战，但通过持续的技术创新和不懈的努力，成功建成了可运营、高质量的TD-SCDMA网络，并实现了国内“三分天下有其一”的发展目标。更为重要的是，3G时代对各种能力的锻造和积累，为4G时代打翻身仗做了充分准备。', '8', '33');
INSERT INTO `paragraph` VALUES ('83', '　　4G时代（2010年代）是并跑，中国主导的国际标准首次成为主流，华为、中兴等中国通信设备企业已经迎头赶上，并开始走出去，移动互联网应用蓬勃兴起，中国在移动电商、移动支付、移动出行等很多领域成为全球创新的典范，实现了“4G改变生活”。', '9', '33');
INSERT INTO `paragraph` VALUES ('84', '到了5G时代（2020年代）是力争引领，中国在5G技术、标准、产业、应用等方面显现出引领的态势，而且5G时代通信将开始深入产业，目标是实现“5G改变社会”。', '10', '33');
INSERT INTO `paragraph` VALUES ('85', '今天（10月7日）是俄罗斯总统普京的67岁生日。据俄罗斯卫星通讯社报道，白俄罗斯总统新闻办公室7日发布消息称，白俄罗斯总统卢卡申科向普京送上生日祝福，他同时表示，普京在国际舞台上具有极高的威望和巨大的影响力。', '11', '33');
INSERT INTO `paragraph` VALUES ('86', '消息还称，卢卡申科相信，俄白在盟国和欧亚经济联盟框架下深化一体化，将进一步推动两国经济发展，提升两国人民福祉，并将为保障欧亚空间安全与稳定做出重大贡献。', '12', '33');
INSERT INTO `paragraph` VALUES ('87', '　　白俄罗斯总统新闻办公室表示，卢卡申科祝愿普京身体健康，生活幸福，常有志同道合者支持，万事顺意。', '13', '33');
INSERT INTO `paragraph` VALUES ('88', '　　普京67岁生日怎么过？此前，据克里姆林宫新闻秘书佩斯科夫透露，普京今天将与亲朋好友在大自然中庆生。', '14', '33');
INSERT INTO `paragraph` VALUES ('89', '新华社北京10月2日电（记者张选杰、李兵峰）10月1日上午，在国庆70周年阅兵中，东风-17常规导弹、长剑-100巡航导弹、东风-41核导弹首次揭开神秘面纱，成为万众聚焦的“明星”。新型导弹武器不断入列，也标志着火箭军已经成为维护和平的重要力量。\n　　受阅方队亮相长安街，象征着国威军威的大国长剑昂首向天、威震寰宇。16枚东风-17常规导弹行进在导弹方阵的最前列，是未来战场决战决胜的先锋利刃。被誉为最新大国重器的东风-41核导弹，作为此次火箭军受阅的压轴巨阵，是中国战略核力量的中流砥柱。随着火箭军武器装备不断更新换代，“东风家族”人丁兴旺、日益壮大，核心战斗力持续攀升，部队整体作战能力实现历史性跨越。\n十里长安街，见证新时代。受邀前来观礼的人群，目送一辆辆导弹战车隆隆驶过。一名观众激动地说：“在新中国成立35周年阅兵式上，我们只有1个导弹方队3种型号导弹受阅，今天一次就展示了火箭军的6种新型导弹武器，折射出这支部队从无到有、从弱到强的发展历程，也象征着军队的不断强大、国力的日益强盛。”', '1', '34');
INSERT INTO `paragraph` VALUES ('90', '我是上世纪80年代初期上的大学，当时身边几乎所有人，也包括我在内，都以为北京邮电学院（现北京邮电大学）大学毕业后是要去送信的。那时候，通信是一个很稀有的服务。打电话要去电话局排队，如果在小地方，要到县城才能打一个长途电话。如果确有什么急事需要和外地联络，通常都是去邮局发电报，打电话是很奢侈的事情。\n　　到80年代末期，中国开始有了程控电话，但装一部固定电话要五六千块钱，这可不是小数。后来有了BP机，到90年代初期，开始有了采用模拟通信技术的第一代移动电话，俗称“大哥大”，要两三万元一部，在那个刚刚有 “万元户”的年代，这可是一种身份的象征。', '2', '34');
INSERT INTO `paragraph` VALUES ('91', '　　随着数字移动电话和2G时代来临，“手机”才变小，价格也越来越低。后来，3G和4G时代到来，网速越来越快，手机性能越来越好，现在，智能手机已经成为每个人工作生活必不可少的一部分，甚至一刻都离不开。\n　　从技术角度看，中国的移动通信技术在1G时代（1980年代）是空白，无标准、无技术、无产业。2G时代（1990年代）是跟随，这时标准虽然还是被欧美所掌控，但中国已经有了全球最大的移动网络，也开始培育本土的通信制造商。\n　　3G时代（2000年代）是突破，中国拥有了首个移动通信国际标准，实现了标准的从无到有，与欧洲主导的WCDMA和美国主导的CDMA2000一起形成全球三大3G国际标准。期间，中国移动承担了建设运营TD-SCDMA“中国标准”的使命，虽然面临很多挑战，但通过持续的技术创新和不懈的努力，成功建成了可运营、高质量的TD-SCDMA网络，并实现了国内“三分天下有其一”的发展目标。更为重要的是，3G时代对各种能力的锻造和积累，为4G时代打翻身仗做了充分准备。\n　　4G时代（2010年代）是并跑，中国主导的国际标准首次成为主流，华为、中兴等中国通信设备企业已经迎头赶上，并开始走出去，移动互联网应用蓬勃兴起，中国在移动电商、移动支付、移动出行等很多领域成为全球创新的典范，实现了“4G改变生活”。\n到了5G时代（2020年代）是力争引领，中国在5G技术、标准、产业、应用等方面显现出引领的态势，而且5G时代通信将开始深入产业，目标是实现“5G改变社会”。', '3', '34');
INSERT INTO `paragraph` VALUES ('92', '今天（10月7日）是俄罗斯总统普京的67岁生日。据俄罗斯卫星通讯社报道，白俄罗斯总统新闻办公室7日发布消息称，白俄罗斯总统卢卡申科向普京送上生日祝福，他同时表示，普京在国际舞台上具有极高的威望和巨大的影响力。\n消息还称，卢卡申科相信，俄白在盟国和欧亚经济联盟框架下深化一体化，将进一步推动两国经济发展，提升两国人民福祉，并将为保障欧亚空间安全与稳定做出重大贡献。\n　　白俄罗斯总统新闻办公室表示，卢卡申科祝愿普京身体健康，生活幸福，常有志同道合者支持，万事顺意。\n　　普京67岁生日怎么过？此前，据克里姆林宫新闻秘书佩斯科夫透露，普京今天将与亲朋好友在大自然中庆生。', '4', '34');
INSERT INTO `paragraph` VALUES ('125', '新华社北京10月2日电（记者张选杰、李兵峰）10月1日上午，在国庆70周年阅兵中，东风-17常规导弹、长剑-100巡航导弹、东风-41核导弹首次揭开神秘面纱，成为万众聚焦的“明星”。新型导弹武器不断入列，也标志着火箭军已经成为维护和平的重要力量。', '1', '38');
INSERT INTO `paragraph` VALUES ('126', '　　受阅方队亮相长安街，象征着国威军威的大国长剑昂首向天、威震寰宇。16枚东风-17常规导弹行进在导弹方阵的最前列，是未来战场决战决胜的先锋利刃。被誉为最新大国重器的东风-41核导弹，作为此次火箭军受阅的压轴巨阵，是中国战略核力量的中流砥柱。随着火箭军武器装备不断更新换代，“东风家族”人丁兴旺、日益壮大，核心战斗力持续攀升，部队整体作战能力实现历史性跨越。', '2', '38');
INSERT INTO `paragraph` VALUES ('127', '十里长安街，见证新时代。受邀前来观礼的人群，目送一辆辆导弹战车隆隆驶过。一名观众激动地说：“在新中国成立35周年阅兵式上，我们只有1个导弹方队3种型号导弹受阅，今天一次就展示了火箭军的6种新型导弹武器，折射出这支部队从无到有、从弱到强的发展历程，也象征着军队的不断强大、国力的日益强盛。”', '3', '38');
INSERT INTO `paragraph` VALUES ('128', '我是上世纪80年代初期上的大学，当时身边几乎所有人，也包括我在内，都以为北京邮电学院（现北京邮电大学）大学毕业后是要去送信的。那时候，通信是一个很稀有的服务。打电话要去电话局排队，如果在小地方，要到县城才能打一个长途电话。如果确有什么急事需要和外地联络，通常都是去邮局发电报，打电话是很奢侈的事情。', '4', '38');
INSERT INTO `paragraph` VALUES ('129', '　　到80年代末期，中国开始有了程控电话，但装一部固定电话要五六千块钱，这可不是小数。后来有了BP机，到90年代初期，开始有了采用模拟通信技术的第一代移动电话，俗称“大哥大”，要两三万元一部，在那个刚刚有 “万元户”的年代，这可是一种身份的象征。', '5', '38');
INSERT INTO `paragraph` VALUES ('130', '　　随着数字移动电话和2G时代来临，“手机”才变小，价格也越来越低。后来，3G和4G时代到来，网速越来越快，手机性能越来越好，现在，智能手机已经成为每个人工作生活必不可少的一部分，甚至一刻都离不开。', '6', '38');
INSERT INTO `paragraph` VALUES ('131', '　　从技术角度看，中国的移动通信技术在1G时代（1980年代）是空白，无标准、无技术、无产业。2G时代（1990年代）是跟随，这时标准虽然还是被欧美所掌控，但中国已经有了全球最大的移动网络，也开始培育本土的通信制造商。', '7', '38');
INSERT INTO `paragraph` VALUES ('132', '　　3G时代（2000年代）是突破，中国拥有了首个移动通信国际标准，实现了标准的从无到有，与欧洲主导的WCDMA和美国主导的CDMA2000一起形成全球三大3G国际标准。期间，中国移动承担了建设运营TD-SCDMA“中国标准”的使命，虽然面临很多挑战，但通过持续的技术创新和不懈的努力，成功建成了可运营、高质量的TD-SCDMA网络，并实现了国内“三分天下有其一”的发展目标。更为重要的是，3G时代对各种能力的锻造和积累，为4G时代打翻身仗做了充分准备。', '8', '38');
INSERT INTO `paragraph` VALUES ('133', '　　4G时代（2010年代）是并跑，中国主导的国际标准首次成为主流，华为、中兴等中国通信设备企业已经迎头赶上，并开始走出去，移动互联网应用蓬勃兴起，中国在移动电商、移动支付、移动出行等很多领域成为全球创新的典范，实现了“4G改变生活”。', '9', '38');
INSERT INTO `paragraph` VALUES ('134', '到了5G时代（2020年代）是力争引领，中国在5G技术、标准、产业、应用等方面显现出引领的态势，而且5G时代通信将开始深入产业，目标是实现“5G改变社会”。', '10', '38');
INSERT INTO `paragraph` VALUES ('135', '今天（10月7日）是俄罗斯总统普京的67岁生日。据俄罗斯卫星通讯社报道，白俄罗斯总统新闻办公室7日发布消息称，白俄罗斯总统卢卡申科向普京送上生日祝福，他同时表示，普京在国际舞台上具有极高的威望和巨大的影响力。', '11', '38');
INSERT INTO `paragraph` VALUES ('136', '消息还称，卢卡申科相信，俄白在盟国和欧亚经济联盟框架下深化一体化，将进一步推动两国经济发展，提升两国人民福祉，并将为保障欧亚空间安全与稳定做出重大贡献。', '12', '38');
INSERT INTO `paragraph` VALUES ('137', '　　白俄罗斯总统新闻办公室表示，卢卡申科祝愿普京身体健康，生活幸福，常有志同道合者支持，万事顺意。', '13', '38');
INSERT INTO `paragraph` VALUES ('138', '　　普京67岁生日怎么过？此前，据克里姆林宫新闻秘书佩斯科夫透露，普京今天将与亲朋好友在大自然中庆生。', '14', '38');
INSERT INTO `paragraph` VALUES ('247', '新华社北京10月2日电（记者张选杰、李兵峰）10月1日上午，在国庆70周年阅兵中，东风-17常规导弹、长剑-100巡航导弹、东风-41核导弹首次揭开神秘面纱，成为万众聚焦的“明星”。新型导弹武器不断入列，也标志着火箭军已经成为维护和平的重要力量。', '1', '49');
INSERT INTO `paragraph` VALUES ('248', '　　受阅方队亮相长安街，象征着国威军威的大国长剑昂首向天、威震寰宇。16枚东风-17常规导弹行进在导弹方阵的最前列，是未来战场决战决胜的先锋利刃。被誉为最新大国重器的东风-41核导弹，作为此次火箭军受阅的压轴巨阵，是中国战略核力量的中流砥柱。随着火箭军武器装备不断更新换代，“东风家族”人丁兴旺、日益壮大，核心战斗力持续攀升，部队整体作战能力实现历史性跨越。\n十里长安街，见证新时代。受邀前来观礼的人群，目送一辆辆导弹战车隆隆驶过。一名观众激动地说：“在新中国成立35周年阅兵式上，我们只有1个导弹方队3种型号导弹受阅，今天一次就展示了火箭军的6种新型导弹武器，折射出这支部队从无到有、从弱到强的发展历程，也象征着军队的不断强大、国力的日益强盛。”', '2', '49');
INSERT INTO `paragraph` VALUES ('249', '我是上世纪80年代初期上的大学，当时身边几乎所有人，也包括我在内，都以为北京邮电学院（现北京邮电大学）大学毕业后是要去送信的。那时候，通信是一个很稀有的服务。打电话要去电话局排队，如果在小地方，要到县城才能打一个长途电话。如果确有什么急事需要和外地联络，通常都是去邮局发电报，打电话是很奢侈的事情。\n　　到80年代末期，中国开始有了程控电话，但装一部固定电话要五六千块钱，这可不是小数。后来有了BP机，到90年代初期，开始有了采用模拟通信技术的第一代移动电话，俗称“大哥大”，要两三万元一部，在那个刚刚有 “万元户”的年代，这可是一种身份的象征。\n　　随着数字移动电话和2G时代来临，“手机”才变小，价格也越来越低。后来，3G和4G时代到来，网速越来越快，手机性能越来越好，现在，智能手机已经成为每个人工作生活必不可少的一部分，甚至一刻都离不开。\n　　从技术角度看，中国的移动通信技术在1G时代（1980年代）是空白，无标准、无技术、无产业。2G时代（1990年代）是跟随，这时标准虽然还是被欧美所掌控，但中国已经有了全球最大的移动网络，也开始培育本土的通信制造商。\n　　3G时代（2000年代）是突破，中国拥有了首个移动通信国际标准，实现了标准的从无到有，与欧洲主导的WCDMA和美国主导的CDMA2000一起形成全球三大3G国际标准。期间，中国移动承担了建设运营TD-SCDMA“中国标准”的使命，虽然面临很多挑战，但通过持续的技术创新和不懈的努力，成功建成了可运营、高质量的TD-SCDMA网络，并实现了国内“三分天下有其一”的发展目标。更为重要的是，3G时代对各种能力的锻造和积累，为4G时代打翻身仗做了充分准备。\n　　4G时代（2010年代）是并跑，中国主导的国际标准首次成为主流，华为、中兴等中国通信设备企业已经迎头赶上，并开始走出去，移动互联网应用蓬勃兴起，中国在移动电商、移动支付、移动出行等很多领域成为全球创新的典范，实现了“4G改变生活”。\n到了5G时代（2020年代）是力争引领，中国在5G技术、标准、产业、应用等方面显现出引领的态势，而且5G时代通信将开始深入产业，目标是实现“5G改变社会”。', '3', '49');
INSERT INTO `paragraph` VALUES ('250', '今天（10月7日）是俄罗斯总统普京的67岁生日。据俄罗斯卫星通讯社报道，白俄罗斯总统新闻办公室7日发布消息称，白俄罗斯总统卢卡申科向普京送上生日祝福，他同时表示，普京在国际舞台上具有极高的威望和巨大的影响力。\n消息还称，卢卡申科相信，俄白在盟国和欧亚经济联盟框架下深化一体化，将进一步推动两国经济发展，提升两国人民福祉，并将为保障欧亚空间安全与稳定做出重大贡献。\n　　白俄罗斯总统新闻办公室表示，卢卡申科祝愿普京身体健康，生活幸福，常有志同道合者支持，万事顺意。\n　　普京67岁生日怎么过？此前，据克里姆林宫新闻秘书佩斯科夫透露，普京今天将与亲朋好友在大自然中庆生。', '4', '49');
INSERT INTO `paragraph` VALUES ('251', '新华社北京10月2日电（记者张选杰、李兵峰）10月1日上午，在国庆70周年阅兵中，东风-17常规导弹、长剑-100巡航导弹、东风-41核导弹首次揭开神秘面纱，成为万众聚焦的“明星”。新型导弹武器不断入列，也标志着火箭军已经成为维护和平的重要力量。', '1', '50');
INSERT INTO `paragraph` VALUES ('252', '　　受阅方队亮相长安街，象征着国威军威的大国长剑昂首向天、威震寰宇。16枚东风-17常规导弹行进在导弹方阵的最前列，是未来战场决战决胜的先锋利刃。被誉为最新大国重器的东风-41核导弹，作为此次火箭军受阅的压轴巨阵，是中国战略核力量的中流砥柱。随着火箭军武器装备不断更新换代，“东风家族”人丁兴旺、日益壮大，核心战斗力持续攀升，部队整体作战能力实现历史性跨越。', '2', '50');
INSERT INTO `paragraph` VALUES ('253', '十里长安街，见证新时代。受邀前来观礼的人群，目送一辆辆导弹战车隆隆驶过。一名观众激动地说：“在新中国成立35周年阅兵式上，我们只有1个导弹方队3种型号导弹受阅，今天一次就展示了火箭军的6种新型导弹武器，折射出这支部队从无到有、从弱到强的发展历程，也象征着军队的不断强大、国力的日益强盛。”', '3', '50');
INSERT INTO `paragraph` VALUES ('254', '我是上世纪80年代初期上的大学，当时身边几乎所有人，也包括我在内，都以为北京邮电学院（现北京邮电大学）大学毕业后是要去送信的。那时候，通信是一个很稀有的服务。打电话要去电话局排队，如果在小地方，要到县城才能打一个长途电话。如果确有什么急事需要和外地联络，通常都是去邮局发电报，打电话是很奢侈的事情。', '4', '50');
INSERT INTO `paragraph` VALUES ('255', '　　到80年代末期，中国开始有了程控电话，但装一部固定电话要五六千块钱，这可不是小数。后来有了BP机，到90年代初期，开始有了采用模拟通信技术的第一代移动电话，俗称“大哥大”，要两三万元一部，在那个刚刚有 “万元户”的年代，这可是一种身份的象征。', '5', '50');
INSERT INTO `paragraph` VALUES ('256', '　　随着数字移动电话和2G时代来临，“手机”才变小，价格也越来越低。后来，3G和4G时代到来，网速越来越快，手机性能越来越好，现在，智能手机已经成为每个人工作生活必不可少的一部分，甚至一刻都离不开。', '6', '50');
INSERT INTO `paragraph` VALUES ('257', '　　从技术角度看，中国的移动通信技术在1G时代（1980年代）是空白，无标准、无技术、无产业。2G时代（1990年代）是跟随，这时标准虽然还是被欧美所掌控，但中国已经有了全球最大的移动网络，也开始培育本土的通信制造商。', '7', '50');
INSERT INTO `paragraph` VALUES ('258', '　　3G时代（2000年代）是突破，中国拥有了首个移动通信国际标准，实现了标准的从无到有，与欧洲主导的WCDMA和美国主导的CDMA2000一起形成全球三大3G国际标准。期间，中国移动承担了建设运营TD-SCDMA“中国标准”的使命，虽然面临很多挑战，但通过持续的技术创新和不懈的努力，成功建成了可运营、高质量的TD-SCDMA网络，并实现了国内“三分天下有其一”的发展目标。更为重要的是，3G时代对各种能力的锻造和积累，为4G时代打翻身仗做了充分准备。', '8', '50');
INSERT INTO `paragraph` VALUES ('259', '　　4G时代（2010年代）是并跑，中国主导的国际标准首次成为主流，华为、中兴等中国通信设备企业已经迎头赶上，并开始走出去，移动互联网应用蓬勃兴起，中国在移动电商、移动支付、移动出行等很多领域成为全球创新的典范，实现了“4G改变生活”。', '9', '50');
INSERT INTO `paragraph` VALUES ('260', '到了5G时代（2020年代）是力争引领，中国在5G技术、标准、产业、应用等方面显现出引领的态势，而且5G时代通信将开始深入产业，目标是实现“5G改变社会”。', '10', '50');
INSERT INTO `paragraph` VALUES ('261', '今天（10月7日）是俄罗斯总统普京的67岁生日。据俄罗斯卫星通讯社报道，白俄罗斯总统新闻办公室7日发布消息称，白俄罗斯总统卢卡申科向普京送上生日祝福，他同时表示，普京在国际舞台上具有极高的威望和巨大的影响力。', '11', '50');
INSERT INTO `paragraph` VALUES ('262', '消息还称，卢卡申科相信，俄白在盟国和欧亚经济联盟框架下深化一体化，将进一步推动两国经济发展，提升两国人民福祉，并将为保障欧亚空间安全与稳定做出重大贡献。', '12', '50');
INSERT INTO `paragraph` VALUES ('263', '　　白俄罗斯总统新闻办公室表示，卢卡申科祝愿普京身体健康，生活幸福，常有志同道合者支持，万事顺意。', '13', '50');
INSERT INTO `paragraph` VALUES ('264', '　　普京67岁生日怎么过？此前，据克里姆林宫新闻秘书佩斯科夫透露，普京今天将与亲朋好友在大自然中庆生。', '14', '50');
INSERT INTO `paragraph` VALUES ('265', '新华社北京10月2日电（记者张选杰、李兵峰）10月1日上午，在国庆70周年阅兵中，东风-17常规导弹、长剑-100巡航导弹、东风-41核导弹首次揭开神秘面纱，成为万众聚焦的“明星”。新型导弹武器不断入列，也标志着火箭军已经成为维护和平的重要力量。', '1', '51');
INSERT INTO `paragraph` VALUES ('266', '　　受阅方队亮相长安街，象征着国威军威的大国长剑昂首向天、威震寰宇。16枚东风-17常规导弹行进在导弹方阵的最前列，是未来战场决战决胜的先锋利刃。被誉为最新大国重器的东风-41核导弹，作为此次火箭军受阅的压轴巨阵，是中国战略核力量的中流砥柱。随着火箭军武器装备不断更新换代，“东风家族”人丁兴旺、日益壮大，核心战斗力持续攀升，部队整体作战能力实现历史性跨越。', '2', '51');
INSERT INTO `paragraph` VALUES ('267', '十里长安街，见证新时代。受邀前来观礼的人群，目送一辆辆导弹战车隆隆驶过。一名观众激动地说：“在新中国成立35周年阅兵式上，我们只有1个导弹方队3种型号导弹受阅，今天一次就展示了火箭军的6种新型导弹武器，折射出这支部队从无到有、从弱到强的发展历程，也象征着军队的不断强大、国力的日益强盛。”', '3', '51');
INSERT INTO `paragraph` VALUES ('268', '我是上世纪80年代初期上的大学，当时身边几乎所有人，也包括我在内，都以为北京邮电学院（现北京邮电大学）大学毕业后是要去送信的。那时候，通信是一个很稀有的服务。打电话要去电话局排队，如果在小地方，要到县城才能打一个长途电话。如果确有什么急事需要和外地联络，通常都是去邮局发电报，打电话是很奢侈的事情。', '4', '51');
INSERT INTO `paragraph` VALUES ('269', '　　到80年代末期，中国开始有了程控电话，但装一部固定电话要五六千块钱，这可不是小数。后来有了BP机，到90年代初期，开始有了采用模拟通信技术的第一代移动电话，俗称“大哥大”，要两三万元一部，在那个刚刚有 “万元户”的年代，这可是一种身份的象征。', '5', '51');
INSERT INTO `paragraph` VALUES ('270', '　　随着数字移动电话和2G时代来临，“手机”才变小，价格也越来越低。后来，3G和4G时代到来，网速越来越快，手机性能越来越好，现在，智能手机已经成为每个人工作生活必不可少的一部分，甚至一刻都离不开。', '6', '51');
INSERT INTO `paragraph` VALUES ('271', '　　从技术角度看，中国的移动通信技术在1G时代（1980年代）是空白，无标准、无技术、无产业。2G时代（1990年代）是跟随，这时标准虽然还是被欧美所掌控，但中国已经有了全球最大的移动网络，也开始培育本土的通信制造商。', '7', '51');
INSERT INTO `paragraph` VALUES ('272', '　　3G时代（2000年代）是突破，中国拥有了首个移动通信国际标准，实现了标准的从无到有，与欧洲主导的WCDMA和美国主导的CDMA2000一起形成全球三大3G国际标准。期间，中国移动承担了建设运营TD-SCDMA“中国标准”的使命，虽然面临很多挑战，但通过持续的技术创新和不懈的努力，成功建成了可运营、高质量的TD-SCDMA网络，并实现了国内“三分天下有其一”的发展目标。更为重要的是，3G时代对各种能力的锻造和积累，为4G时代打翻身仗做了充分准备。', '8', '51');
INSERT INTO `paragraph` VALUES ('273', '　　4G时代（2010年代）是并跑，中国主导的国际标准首次成为主流，华为、中兴等中国通信设备企业已经迎头赶上，并开始走出去，移动互联网应用蓬勃兴起，中国在移动电商、移动支付、移动出行等很多领域成为全球创新的典范，实现了“4G改变生活”。', '9', '51');
INSERT INTO `paragraph` VALUES ('274', '到了5G时代（2020年代）是力争引领，中国在5G技术、标准、产业、应用等方面显现出引领的态势，而且5G时代通信将开始深入产业，目标是实现“5G改变社会”。', '10', '51');
INSERT INTO `paragraph` VALUES ('275', '今天（10月7日）是俄罗斯总统普京的67岁生日。据俄罗斯卫星通讯社报道，白俄罗斯总统新闻办公室7日发布消息称，白俄罗斯总统卢卡申科向普京送上生日祝福，他同时表示，普京在国际舞台上具有极高的威望和巨大的影响力。', '11', '51');
INSERT INTO `paragraph` VALUES ('276', '消息还称，卢卡申科相信，俄白在盟国和欧亚经济联盟框架下深化一体化，将进一步推动两国经济发展，提升两国人民福祉，并将为保障欧亚空间安全与稳定做出重大贡献。', '12', '51');
INSERT INTO `paragraph` VALUES ('277', '　　白俄罗斯总统新闻办公室表示，卢卡申科祝愿普京身体健康，生活幸福，常有志同道合者支持，万事顺意。', '13', '51');
INSERT INTO `paragraph` VALUES ('278', '　　普京67岁生日怎么过？此前，据克里姆林宫新闻秘书佩斯科夫透露，普京今天将与亲朋好友在大自然中庆生。', '14', '51');
INSERT INTO `paragraph` VALUES ('279', '新华社北京10月2日电（记者张选杰、李兵峰）10月1日上午，在国庆70周年阅兵中，东风-17常规导弹、长剑-100巡航导弹、东风-41核导弹首次揭开神秘面纱，成为万众聚焦的“明星”。新型导弹武器不断入列，也标志着火箭军已经成为维护和平的重要力量。', '1', '52');
INSERT INTO `paragraph` VALUES ('280', '　　受阅方队亮相长安街，象征着国威军威的大国长剑昂首向天、威震寰宇。16枚东风-17常规导弹行进在导弹方阵的最前列，是未来战场决战决胜的先锋利刃。被誉为最新大国重器的东风-41核导弹，作为此次火箭军受阅的压轴巨阵，是中国战略核力量的中流砥柱。随着火箭军武器装备不断更新换代，“东风家族”人丁兴旺、日益壮大，核心战斗力持续攀升，部队整体作战能力实现历史性跨越。', '2', '52');
INSERT INTO `paragraph` VALUES ('281', '十里长安街，见证新时代。受邀前来观礼的人群，目送一辆辆导弹战车隆隆驶过。一名观众激动地说：“在新中国成立35周年阅兵式上，我们只有1个导弹方队3种型号导弹受阅，今天一次就展示了火箭军的6种新型导弹武器，折射出这支部队从无到有、从弱到强的发展历程，也象征着军队的不断强大、国力的日益强盛。”', '3', '52');
INSERT INTO `paragraph` VALUES ('282', '我是上世纪80年代初期上的大学，当时身边几乎所有人，也包括我在内，都以为北京邮电学院（现北京邮电大学）大学毕业后是要去送信的。那时候，通信是一个很稀有的服务。打电话要去电话局排队，如果在小地方，要到县城才能打一个长途电话。如果确有什么急事需要和外地联络，通常都是去邮局发电报，打电话是很奢侈的事情。', '4', '52');
INSERT INTO `paragraph` VALUES ('283', '　　到80年代末期，中国开始有了程控电话，但装一部固定电话要五六千块钱，这可不是小数。后来有了BP机，到90年代初期，开始有了采用模拟通信技术的第一代移动电话，俗称“大哥大”，要两三万元一部，在那个刚刚有 “万元户”的年代，这可是一种身份的象征。', '5', '52');
INSERT INTO `paragraph` VALUES ('284', '　　随着数字移动电话和2G时代来临，“手机”才变小，价格也越来越低。后来，3G和4G时代到来，网速越来越快，手机性能越来越好，现在，智能手机已经成为每个人工作生活必不可少的一部分，甚至一刻都离不开。', '6', '52');
INSERT INTO `paragraph` VALUES ('285', '　　从技术角度看，中国的移动通信技术在1G时代（1980年代）是空白，无标准、无技术、无产业。2G时代（1990年代）是跟随，这时标准虽然还是被欧美所掌控，但中国已经有了全球最大的移动网络，也开始培育本土的通信制造商。', '7', '52');
INSERT INTO `paragraph` VALUES ('286', '　　3G时代（2000年代）是突破，中国拥有了首个移动通信国际标准，实现了标准的从无到有，与欧洲主导的WCDMA和美国主导的CDMA2000一起形成全球三大3G国际标准。期间，中国移动承担了建设运营TD-SCDMA“中国标准”的使命，虽然面临很多挑战，但通过持续的技术创新和不懈的努力，成功建成了可运营、高质量的TD-SCDMA网络，并实现了国内“三分天下有其一”的发展目标。更为重要的是，3G时代对各种能力的锻造和积累，为4G时代打翻身仗做了充分准备。', '8', '52');
INSERT INTO `paragraph` VALUES ('287', '　　4G时代（2010年代）是并跑，中国主导的国际标准首次成为主流，华为、中兴等中国通信设备企业已经迎头赶上，并开始走出去，移动互联网应用蓬勃兴起，中国在移动电商、移动支付、移动出行等很多领域成为全球创新的典范，实现了“4G改变生活”。', '9', '52');
INSERT INTO `paragraph` VALUES ('288', '到了5G时代（2020年代）是力争引领，中国在5G技术、标准、产业、应用等方面显现出引领的态势，而且5G时代通信将开始深入产业，目标是实现“5G改变社会”。', '10', '52');
INSERT INTO `paragraph` VALUES ('289', '今天（10月7日）是俄罗斯总统普京的67岁生日。据俄罗斯卫星通讯社报道，白俄罗斯总统新闻办公室7日发布消息称，白俄罗斯总统卢卡申科向普京送上生日祝福，他同时表示，普京在国际舞台上具有极高的威望和巨大的影响力。', '11', '52');
INSERT INTO `paragraph` VALUES ('290', '消息还称，卢卡申科相信，俄白在盟国和欧亚经济联盟框架下深化一体化，将进一步推动两国经济发展，提升两国人民福祉，并将为保障欧亚空间安全与稳定做出重大贡献。', '12', '52');
INSERT INTO `paragraph` VALUES ('291', '　　白俄罗斯总统新闻办公室表示，卢卡申科祝愿普京身体健康，生活幸福，常有志同道合者支持，万事顺意。', '13', '52');
INSERT INTO `paragraph` VALUES ('292', '　　普京67岁生日怎么过？此前，据克里姆林宫新闻秘书佩斯科夫透露，普京今天将与亲朋好友在大自然中庆生。', '14', '52');
INSERT INTO `paragraph` VALUES ('293', '新华社北京10月2日电（记者张选杰、李兵峰）10月1日上午，在国庆70周年阅兵中，东风-17常规导弹、长剑-100巡航导弹、东风-41核导弹首次揭开神秘面纱，成为万众聚焦的“明星”。新型导弹武器不断入列，也标志着火箭军已经成为维护和平的重要力量。\n　　受阅方队亮相长安街，象征着国威军威的大国长剑昂首向天、威震寰宇。16枚东风-17常规导弹行进在导弹方阵的最前列，是未来战场决战决胜的先锋利刃。被誉为最新大国重器的东风-41核导弹，作为此次火箭军受阅的压轴巨阵，是中国战略核力量的中流砥柱。随着火箭军武器装备不断更新换代，“东风家族”人丁兴旺、日益壮大，核心战斗力持续攀升，部队整体作战能力实现历史性跨越。\n十里长安街，见证新时代。受邀前来观礼的人群，目送一辆辆导弹战车隆隆驶过。一名观众激动地说：“在新中国成立35周年阅兵式上，我们只有1个导弹方队3种型号导弹受阅，今天一次就展示了火箭军的6种新型导弹武器，折射出这支部队从无到有、从弱到强的发展历程，也象征着军队的不断强大、国力的日益强盛。”', '1', '53');
INSERT INTO `paragraph` VALUES ('294', '我是上世纪80年代初期上的大学，当时身边几乎所有人，也包括我在内，都以为北京邮电学院（现北京邮电大学）大学毕业后是要去送信的。那时候，通信是一个很稀有的服务。打电话要去电话局排队，如果在小地方，要到县城才能打一个长途电话。如果确有什么急事需要和外地联络，通常都是去邮局发电报，打电话是很奢侈的事情。\n　　到80年代末期，中国开始有了程控电话，但装一部固定电话要五六千块钱，这可不是小数。后来有了BP机，到90年代初期，开始有了采用模拟通信技术的第一代移动电话，俗称“大哥大”，要两三万元一部，在那个刚刚有 “万元户”的年代，这可是一种身份的象征。', '2', '53');
INSERT INTO `paragraph` VALUES ('295', '　　随着数字移动电话和2G时代来临，“手机”才变小，价格也越来越低。后来，3G和4G时代到来，网速越来越快，手机性能越来越好，现在，智能手机已经成为每个人工作生活必不可少的一部分，甚至一刻都离不开。\n　　从技术角度看，中国的移动通信技术在1G时代（1980年代）是空白，无标准、无技术、无产业。2G时代（1990年代）是跟随，这时标准虽然还是被欧美所掌控，但中国已经有了全球最大的移动网络，也开始培育本土的通信制造商。\n　　3G时代（2000年代）是突破，中国拥有了首个移动通信国际标准，实现了标准的从无到有，与欧洲主导的WCDMA和美国主导的CDMA2000一起形成全球三大3G国际标准。期间，中国移动承担了建设运营TD-SCDMA“中国标准”的使命，虽然面临很多挑战，但通过持续的技术创新和不懈的努力，成功建成了可运营、高质量的TD-SCDMA网络，并实现了国内“三分天下有其一”的发展目标。更为重要的是，3G时代对各种能力的锻造和积累，为4G时代打翻身仗做了充分准备。\n　　4G时代（2010年代）是并跑，中国主导的国际标准首次成为主流，华为、中兴等中国通信设备企业已经迎头赶上，并开始走出去，移动互联网应用蓬勃兴起，中国在移动电商、移动支付、移动出行等很多领域成为全球创新的典范，实现了“4G改变生活”。\n到了5G时代（2020年代）是力争引领，中国在5G技术、标准、产业、应用等方面显现出引领的态势，而且5G时代通信将开始深入产业，目标是实现“5G改变社会”。', '3', '53');
INSERT INTO `paragraph` VALUES ('296', '今天（10月7日）是俄罗斯总统普京的67岁生日。据俄罗斯卫星通讯社报道，白俄罗斯总统新闻办公室7日发布消息称，白俄罗斯总统卢卡申科向普京送上生日祝福，他同时表示，普京在国际舞台上具有极高的威望和巨大的影响力。\n消息还称，卢卡申科相信，俄白在盟国和欧亚经济联盟框架下深化一体化，将进一步推动两国经济发展，提升两国人民福祉，并将为保障欧亚空间安全与稳定做出重大贡献。\n　　白俄罗斯总统新闻办公室表示，卢卡申科祝愿普京身体健康，生活幸福，常有志同道合者支持，万事顺意。\n　　普京67岁生日怎么过？此前，据克里姆林宫新闻秘书佩斯科夫透露，普京今天将与亲朋好友在大自然中庆生。', '4', '53');
INSERT INTO `paragraph` VALUES ('297', '新华社北京10月2日电（记者张选杰、李兵峰）10月1日上午，在国庆70周年阅兵中，东风-17常规导弹、长剑-100巡航导弹、东风-41核导弹首次揭开神秘面纱，成为万众聚焦的“明星”。新型导弹武器不断入列，也标志着火箭军已经成为维护和平的重要力量。', '1', '54');
INSERT INTO `paragraph` VALUES ('298', '　　受阅方队亮相长安街，象征着国威军威的大国长剑昂首向天、威震寰宇。16枚东风-17常规导弹行进在导弹方阵的最前列，是未来战场决战决胜的先锋利刃。被誉为最新大国重器的东风-41核导弹，作为此次火箭军受阅的压轴巨阵，是中国战略核力量的中流砥柱。随着火箭军武器装备不断更新换代，“东风家族”人丁兴旺、日益壮大，核心战斗力持续攀升，部队整体作战能力实现历史性跨越。', '2', '54');
INSERT INTO `paragraph` VALUES ('299', '十里长安街，见证新时代。受邀前来观礼的人群，目送一辆辆导弹战车隆隆驶过。一名观众激动地说：“在新中国成立35周年阅兵式上，我们只有1个导弹方队3种型号导弹受阅，今天一次就展示了火箭军的6种新型导弹武器，折射出这支部队从无到有、从弱到强的发展历程，也象征着军队的不断强大、国力的日益强盛。”', '3', '54');
INSERT INTO `paragraph` VALUES ('300', '我是上世纪80年代初期上的大学，当时身边几乎所有人，也包括我在内，都以为北京邮电学院（现北京邮电大学）大学毕业后是要去送信的。那时候，通信是一个很稀有的服务。打电话要去电话局排队，如果在小地方，要到县城才能打一个长途电话。如果确有什么急事需要和外地联络，通常都是去邮局发电报，打电话是很奢侈的事情。', '4', '54');
INSERT INTO `paragraph` VALUES ('301', '　　到80年代末期，中国开始有了程控电话，但装一部固定电话要五六千块钱，这可不是小数。后来有了BP机，到90年代初期，开始有了采用模拟通信技术的第一代移动电话，俗称“大哥大”，要两三万元一部，在那个刚刚有 “万元户”的年代，这可是一种身份的象征。', '5', '54');
INSERT INTO `paragraph` VALUES ('302', '　　随着数字移动电话和2G时代来临，“手机”才变小，价格也越来越低。后来，3G和4G时代到来，网速越来越快，手机性能越来越好，现在，智能手机已经成为每个人工作生活必不可少的一部分，甚至一刻都离不开。', '6', '54');
INSERT INTO `paragraph` VALUES ('303', '　　从技术角度看，中国的移动通信技术在1G时代（1980年代）是空白，无标准、无技术、无产业。2G时代（1990年代）是跟随，这时标准虽然还是被欧美所掌控，但中国已经有了全球最大的移动网络，也开始培育本土的通信制造商。', '7', '54');
INSERT INTO `paragraph` VALUES ('304', '　　3G时代（2000年代）是突破，中国拥有了首个移动通信国际标准，实现了标准的从无到有，与欧洲主导的WCDMA和美国主导的CDMA2000一起形成全球三大3G国际标准。期间，中国移动承担了建设运营TD-SCDMA“中国标准”的使命，虽然面临很多挑战，但通过持续的技术创新和不懈的努力，成功建成了可运营、高质量的TD-SCDMA网络，并实现了国内“三分天下有其一”的发展目标。更为重要的是，3G时代对各种能力的锻造和积累，为4G时代打翻身仗做了充分准备。', '8', '54');
INSERT INTO `paragraph` VALUES ('305', '　　4G时代（2010年代）是并跑，中国主导的国际标准首次成为主流，华为、中兴等中国通信设备企业已经迎头赶上，并开始走出去，移动互联网应用蓬勃兴起，中国在移动电商、移动支付、移动出行等很多领域成为全球创新的典范，实现了“4G改变生活”。', '9', '54');
INSERT INTO `paragraph` VALUES ('306', '到了5G时代（2020年代）是力争引领，中国在5G技术、标准、产业、应用等方面显现出引领的态势，而且5G时代通信将开始深入产业，目标是实现“5G改变社会”。', '10', '54');
INSERT INTO `paragraph` VALUES ('307', '今天（10月7日）是俄罗斯总统普京的67岁生日。据俄罗斯卫星通讯社报道，白俄罗斯总统新闻办公室7日发布消息称，白俄罗斯总统卢卡申科向普京送上生日祝福，他同时表示，普京在国际舞台上具有极高的威望和巨大的影响力。', '11', '54');
INSERT INTO `paragraph` VALUES ('308', '消息还称，卢卡申科相信，俄白在盟国和欧亚经济联盟框架下深化一体化，将进一步推动两国经济发展，提升两国人民福祉，并将为保障欧亚空间安全与稳定做出重大贡献。', '12', '54');
INSERT INTO `paragraph` VALUES ('309', '　　白俄罗斯总统新闻办公室表示，卢卡申科祝愿普京身体健康，生活幸福，常有志同道合者支持，万事顺意。', '13', '54');
INSERT INTO `paragraph` VALUES ('310', '　　普京67岁生日怎么过？此前，据克里姆林宫新闻秘书佩斯科夫透露，普京今天将与亲朋好友在大自然中庆生。', '14', '54');
INSERT INTO `paragraph` VALUES ('311', '新华社北京10月2日电（记者张选杰、李兵峰）10月1日上午，在国庆70周年阅兵中，东风-17常规导弹、长剑-100巡航导弹、东风-41核导弹首次揭开神秘面纱，成为万众聚焦的“明星”。新型导弹武器不断入列，也标志着火箭军已经成为维护和平的重要力量。', '1', '55');
INSERT INTO `paragraph` VALUES ('312', '　　受阅方队亮相长安街，象征着国威军威的大国长剑昂首向天、威震寰宇。16枚东风-17常规导弹行进在导弹方阵的最前列，是未来战场决战决胜的先锋利刃。被誉为最新大国重器的东风-41核导弹，作为此次火箭军受阅的压轴巨阵，是中国战略核力量的中流砥柱。随着火箭军武器装备不断更新换代，“东风家族”人丁兴旺、日益壮大，核心战斗力持续攀升，部队整体作战能力实现历史性跨越。\n十里长安街，见证新时代。受邀前来观礼的人群，目送一辆辆导弹战车隆隆驶过。一名观众激动地说：“在新中国成立35周年阅兵式上，我们只有1个导弹方队3种型号导弹受阅，今天一次就展示了火箭军的6种新型导弹武器，折射出这支部队从无到有、从弱到强的发展历程，也象征着军队的不断强大、国力的日益强盛。”', '2', '55');
INSERT INTO `paragraph` VALUES ('313', '我是上世纪80年代初期上的大学，当时身边几乎所有人，也包括我在内，都以为北京邮电学院（现北京邮电大学）大学毕业后是要去送信的。那时候，通信是一个很稀有的服务。打电话要去电话局排队，如果在小地方，要到县城才能打一个长途电话。如果确有什么急事需要和外地联络，通常都是去邮局发电报，打电话是很奢侈的事情。\n　　到80年代末期，中国开始有了程控电话，但装一部固定电话要五六千块钱，这可不是小数。后来有了BP机，到90年代初期，开始有了采用模拟通信技术的第一代移动电话，俗称“大哥大”，要两三万元一部，在那个刚刚有 “万元户”的年代，这可是一种身份的象征。\n　　随着数字移动电话和2G时代来临，“手机”才变小，价格也越来越低。后来，3G和4G时代到来，网速越来越快，手机性能越来越好，现在，智能手机已经成为每个人工作生活必不可少的一部分，甚至一刻都离不开。\n　　从技术角度看，中国的移动通信技术在1G时代（1980年代）是空白，无标准、无技术、无产业。2G时代（1990年代）是跟随，这时标准虽然还是被欧美所掌控，但中国已经有了全球最大的移动网络，也开始培育本土的通信制造商。\n　　3G时代（2000年代）是突破，中国拥有了首个移动通信国际标准，实现了标准的从无到有，与欧洲主导的WCDMA和美国主导的CDMA2000一起形成全球三大3G国际标准。期间，中国移动承担了建设运营TD-SCDMA“中国标准”的使命，虽然面临很多挑战，但通过持续的技术创新和不懈的努力，成功建成了可运营、高质量的TD-SCDMA网络，并实现了国内“三分天下有其一”的发展目标。更为重要的是，3G时代对各种能力的锻造和积累，为4G时代打翻身仗做了充分准备。\n　　4G时代（2010年代）是并跑，中国主导的国际标准首次成为主流，华为、中兴等中国通信设备企业已经迎头赶上，并开始走出去，移动互联网应用蓬勃兴起，中国在移动电商、移动支付、移动出行等很多领域成为全球创新的典范，实现了“4G改变生活”。\n到了5G时代（2020年代）是力争引领，中国在5G技术、标准、产业、应用等方面显现出引领的态势，而且5G时代通信将开始深入产业，目标是实现“5G改变社会”。', '3', '55');
INSERT INTO `paragraph` VALUES ('314', '今天（10月7日）是俄罗斯总统普京的67岁生日。据俄罗斯卫星通讯社报道，白俄罗斯总统新闻办公室7日发布消息称，白俄罗斯总统卢卡申科向普京送上生日祝福，他同时表示，普京在国际舞台上具有极高的威望和巨大的影响力。\n消息还称，卢卡申科相信，俄白在盟国和欧亚经济联盟框架下深化一体化，将进一步推动两国经济发展，提升两国人民福祉，并将为保障欧亚空间安全与稳定做出重大贡献。\n　　白俄罗斯总统新闻办公室表示，卢卡申科祝愿普京身体健康，生活幸福，常有志同道合者支持，万事顺意。\n　　普京67岁生日怎么过？此前，据克里姆林宫新闻秘书佩斯科夫透露，普京今天将与亲朋好友在大自然中庆生。', '4', '55');
INSERT INTO `paragraph` VALUES ('315', '新华社北京10月2日电（记者张选杰、李兵峰）10月1日上午，在国庆70周年阅兵中，东风-17常规导弹、长剑-100巡航导弹、东风-41核导弹首次揭开神秘面纱，成为万众聚焦的“明星”。新型导弹武器不断入列，也标志着火箭军已经成为维护和平的重要力量。', '1', '56');
INSERT INTO `paragraph` VALUES ('316', '　　受阅方队亮相长安街，象征着国威军威的大国长剑昂首向天、威震寰宇。16枚东风-17常规导弹行进在导弹方阵的最前列，是未来战场决战决胜的先锋利刃。被誉为最新大国重器的东风-41核导弹，作为此次火箭军受阅的压轴巨阵，是中国战略核力量的中流砥柱。随着火箭军武器装备不断更新换代，“东风家族”人丁兴旺、日益壮大，核心战斗力持续攀升，部队整体作战能力实现历史性跨越。', '2', '56');
INSERT INTO `paragraph` VALUES ('317', '十里长安街，见证新时代。受邀前来观礼的人群，目送一辆辆导弹战车隆隆驶过。一名观众激动地说：“在新中国成立35周年阅兵式上，我们只有1个导弹方队3种型号导弹受阅，今天一次就展示了火箭军的6种新型导弹武器，折射出这支部队从无到有、从弱到强的发展历程，也象征着军队的不断强大、国力的日益强盛。”', '3', '56');
INSERT INTO `paragraph` VALUES ('318', '我是上世纪80年代初期上的大学，当时身边几乎所有人，也包括我在内，都以为北京邮电学院（现北京邮电大学）大学毕业后是要去送信的。那时候，通信是一个很稀有的服务。打电话要去电话局排队，如果在小地方，要到县城才能打一个长途电话。如果确有什么急事需要和外地联络，通常都是去邮局发电报，打电话是很奢侈的事情。', '4', '56');
INSERT INTO `paragraph` VALUES ('319', '　　到80年代末期，中国开始有了程控电话，但装一部固定电话要五六千块钱，这可不是小数。后来有了BP机，到90年代初期，开始有了采用模拟通信技术的第一代移动电话，俗称“大哥大”，要两三万元一部，在那个刚刚有 “万元户”的年代，这可是一种身份的象征。', '5', '56');
INSERT INTO `paragraph` VALUES ('320', '　　随着数字移动电话和2G时代来临，“手机”才变小，价格也越来越低。后来，3G和4G时代到来，网速越来越快，手机性能越来越好，现在，智能手机已经成为每个人工作生活必不可少的一部分，甚至一刻都离不开。', '6', '56');
INSERT INTO `paragraph` VALUES ('321', '　　从技术角度看，中国的移动通信技术在1G时代（1980年代）是空白，无标准、无技术、无产业。2G时代（1990年代）是跟随，这时标准虽然还是被欧美所掌控，但中国已经有了全球最大的移动网络，也开始培育本土的通信制造商。', '7', '56');
INSERT INTO `paragraph` VALUES ('322', '　　3G时代（2000年代）是突破，中国拥有了首个移动通信国际标准，实现了标准的从无到有，与欧洲主导的WCDMA和美国主导的CDMA2000一起形成全球三大3G国际标准。期间，中国移动承担了建设运营TD-SCDMA“中国标准”的使命，虽然面临很多挑战，但通过持续的技术创新和不懈的努力，成功建成了可运营、高质量的TD-SCDMA网络，并实现了国内“三分天下有其一”的发展目标。更为重要的是，3G时代对各种能力的锻造和积累，为4G时代打翻身仗做了充分准备。', '8', '56');
INSERT INTO `paragraph` VALUES ('323', '　　4G时代（2010年代）是并跑，中国主导的国际标准首次成为主流，华为、中兴等中国通信设备企业已经迎头赶上，并开始走出去，移动互联网应用蓬勃兴起，中国在移动电商、移动支付、移动出行等很多领域成为全球创新的典范，实现了“4G改变生活”。', '9', '56');
INSERT INTO `paragraph` VALUES ('324', '到了5G时代（2020年代）是力争引领，中国在5G技术、标准、产业、应用等方面显现出引领的态势，而且5G时代通信将开始深入产业，目标是实现“5G改变社会”。', '10', '56');
INSERT INTO `paragraph` VALUES ('325', '今天（10月7日）是俄罗斯总统普京的67岁生日。据俄罗斯卫星通讯社报道，白俄罗斯总统新闻办公室7日发布消息称，白俄罗斯总统卢卡申科向普京送上生日祝福，他同时表示，普京在国际舞台上具有极高的威望和巨大的影响力。', '11', '56');
INSERT INTO `paragraph` VALUES ('326', '消息还称，卢卡申科相信，俄白在盟国和欧亚经济联盟框架下深化一体化，将进一步推动两国经济发展，提升两国人民福祉，并将为保障欧亚空间安全与稳定做出重大贡献。', '12', '56');
INSERT INTO `paragraph` VALUES ('327', '　　白俄罗斯总统新闻办公室表示，卢卡申科祝愿普京身体健康，生活幸福，常有志同道合者支持，万事顺意。', '13', '56');
INSERT INTO `paragraph` VALUES ('328', '　　普京67岁生日怎么过？此前，据克里姆林宫新闻秘书佩斯科夫透露，普京今天将与亲朋好友在大自然中庆生。', '14', '56');
INSERT INTO `paragraph` VALUES ('391', '新华社北京10月2日电（记者张选杰、李兵峰）10月1日上午，在国庆70周年阅兵中，东风-17常规导弹、长剑-100巡航导弹、东风-41核导弹首次揭开神秘面纱，成为万众聚焦的“明星”。新型导弹武器不断入列，也标志着火箭军已经成为维护和平的重要力量。', '1', '114');
INSERT INTO `paragraph` VALUES ('392', '　　受阅方队亮相长安街，象征着国威军威的大国长剑昂首向天、威震寰宇。16枚东风-17常规导弹行进在导弹方阵的最前列，是未来战场决战决胜的先锋利刃。被誉为最新大国重器的东风-41核导弹，作为此次火箭军受阅的压轴巨阵，是中国战略核力量的中流砥柱。随着火箭军武器装备不断更新换代，“东风家族”人丁兴旺、日益壮大，核心战斗力持续攀升，部队整体作战能力实现历史性跨越。\n十里长安街，见证新时代。受邀前来观礼的人群，目送一辆辆导弹战车隆隆驶过。一名观众激动地说：“在新中国成立35周年阅兵式上，我们只有1个导弹方队3种型号导弹受阅，今天一次就展示了火箭军的6种新型导弹武器，折射出这支部队从无到有、从弱到强的发展历程，也象征着军队的不断强大、国力的日益强盛。”', '2', '114');
INSERT INTO `paragraph` VALUES ('393', '我是上世纪80年代初期上的大学，当时身边几乎所有人，也包括我在内，都以为北京邮电学院（现北京邮电大学）大学毕业后是要去送信的。那时候，通信是一个很稀有的服务。打电话要去电话局排队，如果在小地方，要到县城才能打一个长途电话。如果确有什么急事需要和外地联络，通常都是去邮局发电报，打电话是很奢侈的事情。\n　　到80年代末期，中国开始有了程控电话，但装一部固定电话要五六千块钱，这可不是小数。后来有了BP机，到90年代初期，开始有了采用模拟通信技术的第一代移动电话，俗称“大哥大”，要两三万元一部，在那个刚刚有 “万元户”的年代，这可是一种身份的象征。\n　　随着数字移动电话和2G时代来临，“手机”才变小，价格也越来越低。后来，3G和4G时代到来，网速越来越快，手机性能越来越好，现在，智能手机已经成为每个人工作生活必不可少的一部分，甚至一刻都离不开。\n　　从技术角度看，中国的移动通信技术在1G时代（1980年代）是空白，无标准、无技术、无产业。2G时代（1990年代）是跟随，这时标准虽然还是被欧美所掌控，但中国已经有了全球最大的移动网络，也开始培育本土的通信制造商。\n　　3G时代（2000年代）是突破，中国拥有了首个移动通信国际标准，实现了标准的从无到有，与欧洲主导的WCDMA和美国主导的CDMA2000一起形成全球三大3G国际标准。期间，中国移动承担了建设运营TD-SCDMA“中国标准”的使命，虽然面临很多挑战，但通过持续的技术创新和不懈的努力，成功建成了可运营、高质量的TD-SCDMA网络，并实现了国内“三分天下有其一”的发展目标。更为重要的是，3G时代对各种能力的锻造和积累，为4G时代打翻身仗做了充分准备。\n　　4G时代（2010年代）是并跑，中国主导的国际标准首次成为主流，华为、中兴等中国通信设备企业已经迎头赶上，并开始走出去，移动互联网应用蓬勃兴起，中国在移动电商、移动支付、移动出行等很多领域成为全球创新的典范，实现了“4G改变生活”。\n到了5G时代（2020年代）是力争引领，中国在5G技术、标准、产业、应用等方面显现出引领的态势，而且5G时代通信将开始深入产业，目标是实现“5G改变社会”。', '3', '114');
INSERT INTO `paragraph` VALUES ('394', '今天（10月7日）是俄罗斯总统普京的67岁生日。据俄罗斯卫星通讯社报道，白俄罗斯总统新闻办公室7日发布消息称，白俄罗斯总统卢卡申科向普京送上生日祝福，他同时表示，普京在国际舞台上具有极高的威望和巨大的影响力。\n消息还称，卢卡申科相信，俄白在盟国和欧亚经济联盟框架下深化一体化，将进一步推动两国经济发展，提升两国人民福祉，并将为保障欧亚空间安全与稳定做出重大贡献。\n　　白俄罗斯总统新闻办公室表示，卢卡申科祝愿普京身体健康，生活幸福，常有志同道合者支持，万事顺意。\n　　普京67岁生日怎么过？此前，据克里姆林宫新闻秘书佩斯科夫透露，普京今天将与亲朋好友在大自然中庆生。', '4', '114');
INSERT INTO `paragraph` VALUES ('395', '新华社北京10月2日电（记者张选杰、李兵峰）10月1日上午，在国庆70周年阅兵中，东风-17常规导弹、长剑-100巡航导弹、东风-41核导弹首次揭开神秘面纱，成为万众聚焦的“明星”。新型导弹武器不断入列，也标志着火箭军已经成为维护和平的重要力量。', '1', '117');
INSERT INTO `paragraph` VALUES ('396', '　　受阅方队亮相长安街，象征着国威军威的大国长剑昂首向天、威震寰宇。16枚东风-17常规导弹行进在导弹方阵的最前列，是未来战场决战决胜的先锋利刃。被誉为最新大国重器的东风-41核导弹，作为此次火箭军受阅的压轴巨阵，是中国战略核力量的中流砥柱。随着火箭军武器装备不断更新换代，“东风家族”人丁兴旺、日益壮大，核心战斗力持续攀升，部队整体作战能力实现历史性跨越。\n十里长安街，见证新时代。受邀前来观礼的人群，目送一辆辆导弹战车隆隆驶过。一名观众激动地说：“在新中国成立35周年阅兵式上，我们只有1个导弹方队3种型号导弹受阅，今天一次就展示了火箭军的6种新型导弹武器，折射出这支部队从无到有、从弱到强的发展历程，也象征着军队的不断强大、国力的日益强盛。”', '2', '117');
INSERT INTO `paragraph` VALUES ('397', '我是上世纪80年代初期上的大学，当时身边几乎所有人，也包括我在内，都以为北京邮电学院（现北京邮电大学）大学毕业后是要去送信的。那时候，通信是一个很稀有的服务。打电话要去电话局排队，如果在小地方，要到县城才能打一个长途电话。如果确有什么急事需要和外地联络，通常都是去邮局发电报，打电话是很奢侈的事情。\n　　到80年代末期，中国开始有了程控电话，但装一部固定电话要五六千块钱，这可不是小数。后来有了BP机，到90年代初期，开始有了采用模拟通信技术的第一代移动电话，俗称“大哥大”，要两三万元一部，在那个刚刚有 “万元户”的年代，这可是一种身份的象征。\n　　随着数字移动电话和2G时代来临，“手机”才变小，价格也越来越低。后来，3G和4G时代到来，网速越来越快，手机性能越来越好，现在，智能手机已经成为每个人工作生活必不可少的一部分，甚至一刻都离不开。\n　　从技术角度看，中国的移动通信技术在1G时代（1980年代）是空白，无标准、无技术、无产业。2G时代（1990年代）是跟随，这时标准虽然还是被欧美所掌控，但中国已经有了全球最大的移动网络，也开始培育本土的通信制造商。\n　　3G时代（2000年代）是突破，中国拥有了首个移动通信国际标准，实现了标准的从无到有，与欧洲主导的WCDMA和美国主导的CDMA2000一起形成全球三大3G国际标准。期间，中国移动承担了建设运营TD-SCDMA“中国标准”的使命，虽然面临很多挑战，但通过持续的技术创新和不懈的努力，成功建成了可运营、高质量的TD-SCDMA网络，并实现了国内“三分天下有其一”的发展目标。更为重要的是，3G时代对各种能力的锻造和积累，为4G时代打翻身仗做了充分准备。\n　　4G时代（2010年代）是并跑，中国主导的国际标准首次成为主流，华为、中兴等中国通信设备企业已经迎头赶上，并开始走出去，移动互联网应用蓬勃兴起，中国在移动电商、移动支付、移动出行等很多领域成为全球创新的典范，实现了“4G改变生活”。\n到了5G时代（2020年代）是力争引领，中国在5G技术、标准、产业、应用等方面显现出引领的态势，而且5G时代通信将开始深入产业，目标是实现“5G改变社会”。', '3', '117');
INSERT INTO `paragraph` VALUES ('398', '今天（10月7日）是俄罗斯总统普京的67岁生日。据俄罗斯卫星通讯社报道，白俄罗斯总统新闻办公室7日发布消息称，白俄罗斯总统卢卡申科向普京送上生日祝福，他同时表示，普京在国际舞台上具有极高的威望和巨大的影响力。\n消息还称，卢卡申科相信，俄白在盟国和欧亚经济联盟框架下深化一体化，将进一步推动两国经济发展，提升两国人民福祉，并将为保障欧亚空间安全与稳定做出重大贡献。\n　　白俄罗斯总统新闻办公室表示，卢卡申科祝愿普京身体健康，生活幸福，常有志同道合者支持，万事顺意。\n　　普京67岁生日怎么过？此前，据克里姆林宫新闻秘书佩斯科夫透露，普京今天将与亲朋好友在大自然中庆生。', '4', '117');
INSERT INTO `paragraph` VALUES ('417', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '177');
INSERT INTO `paragraph` VALUES ('418', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '2', '177');
INSERT INTO `paragraph` VALUES ('419', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '3', '177');
INSERT INTO `paragraph` VALUES ('420', '新华社北京10月2日电（记者张选杰、李兵峰）10月1日上午，在国庆70周年阅兵中，东风-17常规导弹、长剑-100巡航导弹、东风-41核导弹首次揭开神秘面纱，成为万众聚焦的“明星”。新型导弹武器不断入列，也标志着火箭军已经成为维护和平的重要力量。', '1', '179');
INSERT INTO `paragraph` VALUES ('421', '　　受阅方队亮相长安街，象征着国威军威的大国长剑昂首向天、威震寰宇。16枚东风-17常规导弹行进在导弹方阵的最前列，是未来战场决战决胜的先锋利刃。被誉为最新大国重器的东风-41核导弹，作为此次火箭军受阅的压轴巨阵，是中国战略核力量的中流砥柱。随着火箭军武器装备不断更新换代，“东风家族”人丁兴旺、日益壮大，核心战斗力持续攀升，部队整体作战能力实现历史性跨越。\n十里长安街，见证新时代。受邀前来观礼的人群，目送一辆辆导弹战车隆隆驶过。一名观众激动地说：“在新中国成立35周年阅兵式上，我们只有1个导弹方队3种型号导弹受阅，今天一次就展示了火箭军的6种新型导弹武器，折射出这支部队从无到有、从弱到强的发展历程，也象征着军队的不断强大、国力的日益强盛。”', '2', '179');
INSERT INTO `paragraph` VALUES ('422', '我是上世纪80年代初期上的大学，当时身边几乎所有人，也包括我在内，都以为北京邮电学院（现北京邮电大学）大学毕业后是要去送信的。那时候，通信是一个很稀有的服务。打电话要去电话局排队，如果在小地方，要到县城才能打一个长途电话。如果确有什么急事需要和外地联络，通常都是去邮局发电报，打电话是很奢侈的事情。\n　　到80年代末期，中国开始有了程控电话，但装一部固定电话要五六千块钱，这可不是小数。后来有了BP机，到90年代初期，开始有了采用模拟通信技术的第一代移动电话，俗称“大哥大”，要两三万元一部，在那个刚刚有 “万元户”的年代，这可是一种身份的象征。\n　　随着数字移动电话和2G时代来临，“手机”才变小，价格也越来越低。后来，3G和4G时代到来，网速越来越快，手机性能越来越好，现在，智能手机已经成为每个人工作生活必不可少的一部分，甚至一刻都离不开。\n　　从技术角度看，中国的移动通信技术在1G时代（1980年代）是空白，无标准、无技术、无产业。2G时代（1990年代）是跟随，这时标准虽然还是被欧美所掌控，但中国已经有了全球最大的移动网络，也开始培育本土的通信制造商。\n　　3G时代（2000年代）是突破，中国拥有了首个移动通信国际标准，实现了标准的从无到有，与欧洲主导的WCDMA和美国主导的CDMA2000一起形成全球三大3G国际标准。期间，中国移动承担了建设运营TD-SCDMA“中国标准”的使命，虽然面临很多挑战，但通过持续的技术创新和不懈的努力，成功建成了可运营、高质量的TD-SCDMA网络，并实现了国内“三分天下有其一”的发展目标。更为重要的是，3G时代对各种能力的锻造和积累，为4G时代打翻身仗做了充分准备。\n　　4G时代（2010年代）是并跑，中国主导的国际标准首次成为主流，华为、中兴等中国通信设备企业已经迎头赶上，并开始走出去，移动互联网应用蓬勃兴起，中国在移动电商、移动支付、移动出行等很多领域成为全球创新的典范，实现了“4G改变生活”。\n到了5G时代（2020年代）是力争引领，中国在5G技术、标准、产业、应用等方面显现出引领的态势，而且5G时代通信将开始深入产业，目标是实现“5G改变社会”。', '3', '179');
INSERT INTO `paragraph` VALUES ('423', '今天（10月7日）是俄罗斯总统普京的67岁生日。据俄罗斯卫星通讯社报道，白俄罗斯总统新闻办公室7日发布消息称，白俄罗斯总统卢卡申科向普京送上生日祝福，他同时表示，普京在国际舞台上具有极高的威望和巨大的影响力。\n消息还称，卢卡申科相信，俄白在盟国和欧亚经济联盟框架下深化一体化，将进一步推动两国经济发展，提升两国人民福祉，并将为保障欧亚空间安全与稳定做出重大贡献。\n　　白俄罗斯总统新闻办公室表示，卢卡申科祝愿普京身体健康，生活幸福，常有志同道合者支持，万事顺意。\n　　普京67岁生日怎么过？此前，据克里姆林宫新闻秘书佩斯科夫透露，普京今天将与亲朋好友在大自然中庆生。', '4', '179');
INSERT INTO `paragraph` VALUES ('424', '新华社北京10月2日电（记者张选杰、李兵峰）10月1日上午，在国庆70周年阅兵中，东风-17常规导弹、长剑-100巡航导弹、东风-41核导弹首次揭开神秘面纱，成为万众聚焦的“明星”。新型导弹武器不断入列，也标志着火箭军已经成为维护和平的重要力量。', '1', '180');
INSERT INTO `paragraph` VALUES ('425', '　　受阅方队亮相长安街，象征着国威军威的大国长剑昂首向天、威震寰宇。16枚东风-17常规导弹行进在导弹方阵的最前列，是未来战场决战决胜的先锋利刃。被誉为最新大国重器的东风-41核导弹，作为此次火箭军受阅的压轴巨阵，是中国战略核力量的中流砥柱。随着火箭军武器装备不断更新换代，“东风家族”人丁兴旺、日益壮大，核心战斗力持续攀升，部队整体作战能力实现历史性跨越。', '2', '180');
INSERT INTO `paragraph` VALUES ('426', '十里长安街，见证新时代。受邀前来观礼的人群，目送一辆辆导弹战车隆隆驶过。一名观众激动地说：“在新中国成立35周年阅兵式上，我们只有1个导弹方队3种型号导弹受阅，今天一次就展示了火箭军的6种新型导弹武器，折射出这支部队从无到有、从弱到强的发展历程，也象征着军队的不断强大、国力的日益强盛。”', '3', '180');
INSERT INTO `paragraph` VALUES ('427', '我是上世纪80年代初期上的大学，当时身边几乎所有人，也包括我在内，都以为北京邮电学院（现北京邮电大学）大学毕业后是要去送信的。那时候，通信是一个很稀有的服务。打电话要去电话局排队，如果在小地方，要到县城才能打一个长途电话。如果确有什么急事需要和外地联络，通常都是去邮局发电报，打电话是很奢侈的事情。', '4', '180');
INSERT INTO `paragraph` VALUES ('428', '　　到80年代末期，中国开始有了程控电话，但装一部固定电话要五六千块钱，这可不是小数。后来有了BP机，到90年代初期，开始有了采用模拟通信技术的第一代移动电话，俗称“大哥大”，要两三万元一部，在那个刚刚有 “万元户”的年代，这可是一种身份的象征。', '5', '180');
INSERT INTO `paragraph` VALUES ('429', '　　随着数字移动电话和2G时代来临，“手机”才变小，价格也越来越低。后来，3G和4G时代到来，网速越来越快，手机性能越来越好，现在，智能手机已经成为每个人工作生活必不可少的一部分，甚至一刻都离不开。', '6', '180');
INSERT INTO `paragraph` VALUES ('430', '　　从技术角度看，中国的移动通信技术在1G时代（1980年代）是空白，无标准、无技术、无产业。2G时代（1990年代）是跟随，这时标准虽然还是被欧美所掌控，但中国已经有了全球最大的移动网络，也开始培育本土的通信制造商。', '7', '180');
INSERT INTO `paragraph` VALUES ('431', '　　3G时代（2000年代）是突破，中国拥有了首个移动通信国际标准，实现了标准的从无到有，与欧洲主导的WCDMA和美国主导的CDMA2000一起形成全球三大3G国际标准。期间，中国移动承担了建设运营TD-SCDMA“中国标准”的使命，虽然面临很多挑战，但通过持续的技术创新和不懈的努力，成功建成了可运营、高质量的TD-SCDMA网络，并实现了国内“三分天下有其一”的发展目标。更为重要的是，3G时代对各种能力的锻造和积累，为4G时代打翻身仗做了充分准备。', '8', '180');
INSERT INTO `paragraph` VALUES ('432', '　　4G时代（2010年代）是并跑，中国主导的国际标准首次成为主流，华为、中兴等中国通信设备企业已经迎头赶上，并开始走出去，移动互联网应用蓬勃兴起，中国在移动电商、移动支付、移动出行等很多领域成为全球创新的典范，实现了“4G改变生活”。', '9', '180');
INSERT INTO `paragraph` VALUES ('433', '到了5G时代（2020年代）是力争引领，中国在5G技术、标准、产业、应用等方面显现出引领的态势，而且5G时代通信将开始深入产业，目标是实现“5G改变社会”。', '10', '180');
INSERT INTO `paragraph` VALUES ('434', '今天（10月7日）是俄罗斯总统普京的67岁生日。据俄罗斯卫星通讯社报道，白俄罗斯总统新闻办公室7日发布消息称，白俄罗斯总统卢卡申科向普京送上生日祝福，他同时表示，普京在国际舞台上具有极高的威望和巨大的影响力。', '11', '180');
INSERT INTO `paragraph` VALUES ('435', '消息还称，卢卡申科相信，俄白在盟国和欧亚经济联盟框架下深化一体化，将进一步推动两国经济发展，提升两国人民福祉，并将为保障欧亚空间安全与稳定做出重大贡献。', '12', '180');
INSERT INTO `paragraph` VALUES ('436', '　　白俄罗斯总统新闻办公室表示，卢卡申科祝愿普京身体健康，生活幸福，常有志同道合者支持，万事顺意。', '13', '180');
INSERT INTO `paragraph` VALUES ('437', '　　普京67岁生日怎么过？此前，据克里姆林宫新闻秘书佩斯科夫透露，普京今天将与亲朋好友在大自然中庆生。', '14', '180');
INSERT INTO `paragraph` VALUES ('438', '新华社北京10月2日电（记者张选杰、李兵峰）10月1日上午，在国庆70周年阅兵中，东风-17常规导弹、长剑-100巡航导弹、东风-41核导弹首次揭开神秘面纱，成为万众聚焦的“明星”。新型导弹武器不断入列，也标志着火箭军已经成为维护和平的重要力量。', '1', '184');
INSERT INTO `paragraph` VALUES ('439', '　　受阅方队亮相长安街，象征着国威军威的大国长剑昂首向天、威震寰宇。16枚东风-17常规导弹行进在导弹方阵的最前列，是未来战场决战决胜的先锋利刃。被誉为最新大国重器的东风-41核导弹，作为此次火箭军受阅的压轴巨阵，是中国战略核力量的中流砥柱。随着火箭军武器装备不断更新换代，“东风家族”人丁兴旺、日益壮大，核心战斗力持续攀升，部队整体作战能力实现历史性跨越。\n十里长安街，见证新时代。受邀前来观礼的人群，目送一辆辆导弹战车隆隆驶过。一名观众激动地说：“在新中国成立35周年阅兵式上，我们只有1个导弹方队3种型号导弹受阅，今天一次就展示了火箭军的6种新型导弹武器，折射出这支部队从无到有、从弱到强的发展历程，也象征着军队的不断强大、国力的日益强盛。”', '2', '184');
INSERT INTO `paragraph` VALUES ('440', '我是上世纪80年代初期上的大学，当时身边几乎所有人，也包括我在内，都以为北京邮电学院（现北京邮电大学）大学毕业后是要去送信的。那时候，通信是一个很稀有的服务。打电话要去电话局排队，如果在小地方，要到县城才能打一个长途电话。如果确有什么急事需要和外地联络，通常都是去邮局发电报，打电话是很奢侈的事情。\n　　到80年代末期，中国开始有了程控电话，但装一部固定电话要五六千块钱，这可不是小数。后来有了BP机，到90年代初期，开始有了采用模拟通信技术的第一代移动电话，俗称“大哥大”，要两三万元一部，在那个刚刚有 “万元户”的年代，这可是一种身份的象征。\n　　随着数字移动电话和2G时代来临，“手机”才变小，价格也越来越低。后来，3G和4G时代到来，网速越来越快，手机性能越来越好，现在，智能手机已经成为每个人工作生活必不可少的一部分，甚至一刻都离不开。\n　　从技术角度看，中国的移动通信技术在1G时代（1980年代）是空白，无标准、无技术、无产业。2G时代（1990年代）是跟随，这时标准虽然还是被欧美所掌控，但中国已经有了全球最大的移动网络，也开始培育本土的通信制造商。\n　　3G时代（2000年代）是突破，中国拥有了首个移动通信国际标准，实现了标准的从无到有，与欧洲主导的WCDMA和美国主导的CDMA2000一起形成全球三大3G国际标准。期间，中国移动承担了建设运营TD-SCDMA“中国标准”的使命，虽然面临很多挑战，但通过持续的技术创新和不懈的努力，成功建成了可运营、高质量的TD-SCDMA网络，并实现了国内“三分天下有其一”的发展目标。更为重要的是，3G时代对各种能力的锻造和积累，为4G时代打翻身仗做了充分准备。\n　　4G时代（2010年代）是并跑，中国主导的国际标准首次成为主流，华为、中兴等中国通信设备企业已经迎头赶上，并开始走出去，移动互联网应用蓬勃兴起，中国在移动电商、移动支付、移动出行等很多领域成为全球创新的典范，实现了“4G改变生活”。\n到了5G时代（2020年代）是力争引领，中国在5G技术、标准、产业、应用等方面显现出引领的态势，而且5G时代通信将开始深入产业，目标是实现“5G改变社会”。', '3', '184');
INSERT INTO `paragraph` VALUES ('441', '今天（10月7日）是俄罗斯总统普京的67岁生日。据俄罗斯卫星通讯社报道，白俄罗斯总统新闻办公室7日发布消息称，白俄罗斯总统卢卡申科向普京送上生日祝福，他同时表示，普京在国际舞台上具有极高的威望和巨大的影响力。\n消息还称，卢卡申科相信，俄白在盟国和欧亚经济联盟框架下深化一体化，将进一步推动两国经济发展，提升两国人民福祉，并将为保障欧亚空间安全与稳定做出重大贡献。\n　　白俄罗斯总统新闻办公室表示，卢卡申科祝愿普京身体健康，生活幸福，常有志同道合者支持，万事顺意。\n　　普京67岁生日怎么过？此前，据克里姆林宫新闻秘书佩斯科夫透露，普京今天将与亲朋好友在大自然中庆生。', '4', '184');
INSERT INTO `paragraph` VALUES ('442', '新华社北京10月2日电（记者张选杰、李兵峰）10月1日上午，在国庆70周年阅兵中，东风-17常规导弹、长剑-100巡航导弹、东风-41核导弹首次揭开神秘面纱，成为万众聚焦的“明星”。新型导弹武器不断入列，也标志着火箭军已经成为维护和平的重要力量。', '1', '187');
INSERT INTO `paragraph` VALUES ('443', '受阅方队亮相长安街，象征着国威军威的大国长剑昂首向天、威震寰宇。16枚东风-17常规导弹行进在导弹方阵的最前列，是未来战场决战决胜的先锋利刃。被誉为最新大国重器的东风-41核导弹，作为此次火箭军受阅的压轴巨阵，是中国战略核力量的中流砥柱。随着火箭军武器装备不断更新换代，“东风家族”人丁兴旺、日益壮大，核心战斗力持续攀升，部队整体作战能力实现历史性跨越。\n十里长安街，见证新时代。受邀前来观礼的人群，目送一辆辆导弹战车隆隆驶过。一名观众激动地说：“在新中国成立35周年阅兵式上，我们只有1个导弹方队3种型号导弹受阅，今天一次就展示了火箭军的6种新型导弹武器，折射出这支部队从无到有、从弱到强的发展历程，也象征着军队的不断强大、国力的日益强盛。”', '2', '187');
INSERT INTO `paragraph` VALUES ('444', '我是上世纪80年代初期上的大学，当时身边几乎所有人，也包括我在内，都以为北京邮电学院（现北京邮电大学）大学毕业后是要去送信的。那时候，通信是一个很稀有的服务。打电话要去电话局排队，如果在小地方，要到县城才能打一个长途电话。如果确有什么急事需要和外地联络，通常都是去邮局发电报，打电话是很奢侈的事情。\n到80年代末期，中国开始有了程控电话，但装一部固定电话要五六千块钱，这可不是小数。后来有了BP机，到90年代初期，开始有了采用模拟通信技术的第一代移动电话，俗称“大哥大”，要两三万元一部，在那个刚刚有 “万元户”的年代，这可是一种身份的象征。\n　　随着数字移动电话和2G时代来临，“手机”才变小，价格也越来越低。后来，3G和4G时代到来，网速越来越快，手机性能越来越好，现在，智能手机已经成为每个人工作生活必不可少的一部分，甚至一刻都离不开。\n　　从技术角度看，中国的移动通信技术在1G时代（1980年代）是空白，无标准、无技术、无产业。2G时代（1990年代）是跟随，这时标准虽然还是被欧美所掌控，但中国已经有了全球最大的移动网络，也开始培育本土的通信制造商。\n　　3G时代（2000年代）是突破，中国拥有了首个移动通信国际标准，实现了标准的从无到有，与欧洲主导的WCDMA和美国主导的CDMA2000一起形成全球三大3G国际标准。期间，中国移动承担了建设运营TD-SCDMA“中国标准”的使命，虽然面临很多挑战，但通过持续的技术创新和不懈的努力，成功建成了可运营、高质量的TD-SCDMA网络，并实现了国内“三分天下有其一”的发展目标。更为重要的是，3G时代对各种能力的锻造和积累，为4G时代打翻身仗做了充分准备。\n　　4G时代（2010年代）是并跑，中国主导的国际标准首次成为主流，华为、中兴等中国通信设备企业已经迎头赶上，并开始走出去，移动互联网应用蓬勃兴起，中国在移动电商、移动支付、移动出行等很多领域成为全球创新的典范，实现了“4G改变生活”。\n到了5G时代（2020年代）是力争引领，中国在5G技术、标准、产业、应用等方面显现出引领的态势，而且5G时代通信将开始深入产业，目标是实现“5G改变社会”。', '3', '187');
INSERT INTO `paragraph` VALUES ('445', '今天（10月7日）是俄罗斯总统普京的67岁生日。据俄罗斯卫星通讯社报道，白俄罗斯总统新闻办公室7日发布消息称，白俄罗斯总统卢卡申科向普京送上生日祝福，他同时表示，普京在国际舞台上具有极高的威望和巨大的影响力。\n消息还称，卢卡申科相信，俄白在盟国和欧亚经济联盟框架下深化一体化，将进一步推动两国经济发展，提升两国人民福祉，并将为保障欧亚空间安全与稳定做出重大贡献。\n　　白俄罗斯总统新闻办公室表示，卢卡申科祝愿普京身体健康，生活幸福，常有志同道合者支持，万事顺意。\n　　普京67岁生日怎么过？此前，据克里姆林宫新闻秘书佩斯科夫透露，普京今天将与亲朋好友在大自然中庆生。', '4', '187');
INSERT INTO `paragraph` VALUES ('446', '新华社北京10月2日电（记者张选杰、李兵峰）10月1日上午，在国庆70周年阅兵中，东风-17常规导弹、长剑-100巡航导弹、东风-41核导弹首次揭开神秘面纱，成为万众聚焦的“明星”。新型导弹武器不断入列，也标志着火箭军已经成为维护和平的重要力量。', '1', '188');
INSERT INTO `paragraph` VALUES ('447', '　　受阅方队亮相长安街，象征着国威军威的大国长剑昂首向天、威震寰宇。16枚东风-17常规导弹行进在导弹方阵的最前列，是未来战场决战决胜的先锋利刃。被誉为最新大国重器的东风-41核导弹，作为此次火箭军受阅的压轴巨阵，是中国战略核力量的中流砥柱。随着火箭军武器装备不断更新换代，“东风家族”人丁兴旺、日益壮大，核心战斗力持续攀升，部队整体作战能力实现历史性跨越。', '2', '188');
INSERT INTO `paragraph` VALUES ('448', '十里长安街，见证新时代。受邀前来观礼的人群，目送一辆辆导弹战车隆隆驶过。一名观众激动地说：“在新中国成立35周年阅兵式上，我们只有1个导弹方队3种型号导弹受阅，今天一次就展示了火箭军的6种新型导弹武器，折射出这支部队从无到有、从弱到强的发展历程，也象征着军队的不断强大、国力的日益强盛。”', '3', '188');
INSERT INTO `paragraph` VALUES ('449', '我是上世纪80年代初期上的大学，当时身边几乎所有人，也包括我在内，都以为北京邮电学院（现北京邮电大学）大学毕业后是要去送信的。那时候，通信是一个很稀有的服务。打电话要去电话局排队，如果在小地方，要到县城才能打一个长途电话。如果确有什么急事需要和外地联络，通常都是去邮局发电报，打电话是很奢侈的事情。', '4', '188');
INSERT INTO `paragraph` VALUES ('450', '　　到80年代末期，中国开始有了程控电话，但装一部固定电话要五六千块钱，这可不是小数。后来有了BP机，到90年代初期，开始有了采用模拟通信技术的第一代移动电话，俗称“大哥大”，要两三万元一部，在那个刚刚有 “万元户”的年代，这可是一种身份的象征。', '5', '188');
INSERT INTO `paragraph` VALUES ('451', '　　随着数字移动电话和2G时代来临，“手机”才变小，价格也越来越低。后来，3G和4G时代到来，网速越来越快，手机性能越来越好，现在，智能手机已经成为每个人工作生活必不可少的一部分，甚至一刻都离不开。', '6', '188');
INSERT INTO `paragraph` VALUES ('452', '　　从技术角度看，中国的移动通信技术在1G时代（1980年代）是空白，无标准、无技术、无产业。2G时代（1990年代）是跟随，这时标准虽然还是被欧美所掌控，但中国已经有了全球最大的移动网络，也开始培育本土的通信制造商。', '7', '188');
INSERT INTO `paragraph` VALUES ('453', '　　3G时代（2000年代）是突破，中国拥有了首个移动通信国际标准，实现了标准的从无到有，与欧洲主导的WCDMA和美国主导的CDMA2000一起形成全球三大3G国际标准。期间，中国移动承担了建设运营TD-SCDMA“中国标准”的使命，虽然面临很多挑战，但通过持续的技术创新和不懈的努力，成功建成了可运营、高质量的TD-SCDMA网络，并实现了国内“三分天下有其一”的发展目标。更为重要的是，3G时代对各种能力的锻造和积累，为4G时代打翻身仗做了充分准备。', '8', '188');
INSERT INTO `paragraph` VALUES ('454', '　　4G时代（2010年代）是并跑，中国主导的国际标准首次成为主流，华为、中兴等中国通信设备企业已经迎头赶上，并开始走出去，移动互联网应用蓬勃兴起，中国在移动电商、移动支付、移动出行等很多领域成为全球创新的典范，实现了“4G改变生活”。', '9', '188');
INSERT INTO `paragraph` VALUES ('455', '到了5G时代（2020年代）是力争引领，中国在5G技术、标准、产业、应用等方面显现出引领的态势，而且5G时代通信将开始深入产业，目标是实现“5G改变社会”。', '10', '188');
INSERT INTO `paragraph` VALUES ('456', '今天（10月7日）是俄罗斯总统普京的67岁生日。据俄罗斯卫星通讯社报道，白俄罗斯总统新闻办公室7日发布消息称，白俄罗斯总统卢卡申科向普京送上生日祝福，他同时表示，普京在国际舞台上具有极高的威望和巨大的影响力。', '11', '188');
INSERT INTO `paragraph` VALUES ('457', '消息还称，卢卡申科相信，俄白在盟国和欧亚经济联盟框架下深化一体化，将进一步推动两国经济发展，提升两国人民福祉，并将为保障欧亚空间安全与稳定做出重大贡献。', '12', '188');
INSERT INTO `paragraph` VALUES ('458', '　　白俄罗斯总统新闻办公室表示，卢卡申科祝愿普京身体健康，生活幸福，常有志同道合者支持，万事顺意。', '13', '188');
INSERT INTO `paragraph` VALUES ('459', '　　普京67岁生日怎么过？此前，据克里姆林宫新闻秘书佩斯科夫透露，普京今天将与亲朋好友在大自然中庆生。', '14', '188');
INSERT INTO `paragraph` VALUES ('460', '新华社北京10月2日电（记者张选杰、李兵峰）10月1日上午，在国庆70周年阅兵中，东风-17常规导弹、长剑-100巡航导弹、东风-41核导弹首次揭开神秘面纱，成为万众聚焦的“明星”。新型导弹武器不断入列，也标志着火箭军已经成为维护和平的重要力量。', '1', '189');
INSERT INTO `paragraph` VALUES ('461', '受阅方队亮相长安街，象征着国威军威的大国长剑昂首向天、威震寰宇。16枚东风-17常规导弹行进在导弹方阵的最前列，是未来战场决战决胜的先锋利刃。被誉为最新大国重器的东风-41核导弹，作为此次火箭军受阅的压轴巨阵，是中国战略核力量的中流砥柱。随着火箭军武器装备不断更新换代，“东风家族”人丁兴旺、日益壮大，核心战斗力持续攀升，部队整体作战能力实现历史性跨越。\n十里长安街，见证新时代。受邀前来观礼的人群，目送一辆辆导弹战车隆隆驶过。一名观众激动地说：“在新中国成立35周年阅兵式上，我们只有1个导弹方队3种型号导弹受阅，今天一次就展示了火箭军的6种新型导弹武器，折射出这支部队从无到有、从弱到强的发展历程，也象征着军队的不断强大、国力的日益强盛。”', '2', '189');
INSERT INTO `paragraph` VALUES ('462', '我是上世纪80年代初期上的大学，当时身边几乎所有人，也包括我在内，都以为北京邮电学院（现北京邮电大学）大学毕业后是要去送信的。那时候，通信是一个很稀有的服务。打电话要去电话局排队，如果在小地方，要到县城才能打一个长途电话。如果确有什么急事需要和外地联络，通常都是去邮局发电报，打电话是很奢侈的事情。\n到80年代末期，中国开始有了程控电话，但装一部固定电话要五六千块钱，这可不是小数。后来有了BP机，到90年代初期，开始有了采用模拟通信技术的第一代移动电话，俗称“大哥大”，要两三万元一部，在那个刚刚有 “万元户”的年代，这可是一种身份的象征。\n　　随着数字移动电话和2G时代来临，“手机”才变小，价格也越来越低。后来，3G和4G时代到来，网速越来越快，手机性能越来越好，现在，智能手机已经成为每个人工作生活必不可少的一部分，甚至一刻都离不开。\n　　从技术角度看，中国的移动通信技术在1G时代（1980年代）是空白，无标准、无技术、无产业。2G时代（1990年代）是跟随，这时标准虽然还是被欧美所掌控，但中国已经有了全球最大的移动网络，也开始培育本土的通信制造商。\n　　3G时代（2000年代）是突破，中国拥有了首个移动通信国际标准，实现了标准的从无到有，与欧洲主导的WCDMA和美国主导的CDMA2000一起形成全球三大3G国际标准。期间，中国移动承担了建设运营TD-SCDMA“中国标准”的使命，虽然面临很多挑战，但通过持续的技术创新和不懈的努力，成功建成了可运营、高质量的TD-SCDMA网络，并实现了国内“三分天下有其一”的发展目标。更为重要的是，3G时代对各种能力的锻造和积累，为4G时代打翻身仗做了充分准备。\n　　4G时代（2010年代）是并跑，中国主导的国际标准首次成为主流，华为、中兴等中国通信设备企业已经迎头赶上，并开始走出去，移动互联网应用蓬勃兴起，中国在移动电商、移动支付、移动出行等很多领域成为全球创新的典范，实现了“4G改变生活”。\n到了5G时代（2020年代）是力争引领，中国在5G技术、标准、产业、应用等方面显现出引领的态势，而且5G时代通信将开始深入产业，目标是实现“5G改变社会”。', '3', '189');
INSERT INTO `paragraph` VALUES ('463', '今天（10月7日）是俄罗斯总统普京的67岁生日。据俄罗斯卫星通讯社报道，白俄罗斯总统新闻办公室7日发布消息称，白俄罗斯总统卢卡申科向普京送上生日祝福，他同时表示，普京在国际舞台上具有极高的威望和巨大的影响力。\n消息还称，卢卡申科相信，俄白在盟国和欧亚经济联盟框架下深化一体化，将进一步推动两国经济发展，提升两国人民福祉，并将为保障欧亚空间安全与稳定做出重大贡献。\n　　白俄罗斯总统新闻办公室表示，卢卡申科祝愿普京身体健康，生活幸福，常有志同道合者支持，万事顺意。\n　　普京67岁生日怎么过？此前，据克里姆林宫新闻秘书佩斯科夫透露，普京今天将与亲朋好友在大自然中庆生。', '4', '189');
INSERT INTO `paragraph` VALUES ('464', '新华社北京10月2日电（记者张选杰、李兵峰）10月1日上午，在国庆70周年阅兵中，东风-17常规导弹、长剑-100巡航导弹、东风-41核导弹首次揭开神秘面纱，成为万众聚焦的“明星”。新型导弹武器不断入列，也标志着火箭军已经成为维护和平的重要力量。', '1', '190');
INSERT INTO `paragraph` VALUES ('465', '　　受阅方队亮相长安街，象征着国威军威的大国长剑昂首向天、威震寰宇。16枚东风-17常规导弹行进在导弹方阵的最前列，是未来战场决战决胜的先锋利刃。被誉为最新大国重器的东风-41核导弹，作为此次火箭军受阅的压轴巨阵，是中国战略核力量的中流砥柱。随着火箭军武器装备不断更新换代，“东风家族”人丁兴旺、日益壮大，核心战斗力持续攀升，部队整体作战能力实现历史性跨越。', '2', '190');
INSERT INTO `paragraph` VALUES ('466', '十里长安街，见证新时代。受邀前来观礼的人群，目送一辆辆导弹战车隆隆驶过。一名观众激动地说：“在新中国成立35周年阅兵式上，我们只有1个导弹方队3种型号导弹受阅，今天一次就展示了火箭军的6种新型导弹武器，折射出这支部队从无到有、从弱到强的发展历程，也象征着军队的不断强大、国力的日益强盛。”', '3', '190');
INSERT INTO `paragraph` VALUES ('467', '我是上世纪80年代初期上的大学，当时身边几乎所有人，也包括我在内，都以为北京邮电学院（现北京邮电大学）大学毕业后是要去送信的。那时候，通信是一个很稀有的服务。打电话要去电话局排队，如果在小地方，要到县城才能打一个长途电话。如果确有什么急事需要和外地联络，通常都是去邮局发电报，打电话是很奢侈的事情。', '4', '190');
INSERT INTO `paragraph` VALUES ('468', '　　到80年代末期，中国开始有了程控电话，但装一部固定电话要五六千块钱，这可不是小数。后来有了BP机，到90年代初期，开始有了采用模拟通信技术的第一代移动电话，俗称“大哥大”，要两三万元一部，在那个刚刚有 “万元户”的年代，这可是一种身份的象征。', '5', '190');
INSERT INTO `paragraph` VALUES ('469', '　　随着数字移动电话和2G时代来临，“手机”才变小，价格也越来越低。后来，3G和4G时代到来，网速越来越快，手机性能越来越好，现在，智能手机已经成为每个人工作生活必不可少的一部分，甚至一刻都离不开。', '6', '190');
INSERT INTO `paragraph` VALUES ('470', '　　从技术角度看，中国的移动通信技术在1G时代（1980年代）是空白，无标准、无技术、无产业。2G时代（1990年代）是跟随，这时标准虽然还是被欧美所掌控，但中国已经有了全球最大的移动网络，也开始培育本土的通信制造商。', '7', '190');
INSERT INTO `paragraph` VALUES ('471', '　　3G时代（2000年代）是突破，中国拥有了首个移动通信国际标准，实现了标准的从无到有，与欧洲主导的WCDMA和美国主导的CDMA2000一起形成全球三大3G国际标准。期间，中国移动承担了建设运营TD-SCDMA“中国标准”的使命，虽然面临很多挑战，但通过持续的技术创新和不懈的努力，成功建成了可运营、高质量的TD-SCDMA网络，并实现了国内“三分天下有其一”的发展目标。更为重要的是，3G时代对各种能力的锻造和积累，为4G时代打翻身仗做了充分准备。', '8', '190');
INSERT INTO `paragraph` VALUES ('472', '　　4G时代（2010年代）是并跑，中国主导的国际标准首次成为主流，华为、中兴等中国通信设备企业已经迎头赶上，并开始走出去，移动互联网应用蓬勃兴起，中国在移动电商、移动支付、移动出行等很多领域成为全球创新的典范，实现了“4G改变生活”。', '9', '190');
INSERT INTO `paragraph` VALUES ('473', '到了5G时代（2020年代）是力争引领，中国在5G技术、标准、产业、应用等方面显现出引领的态势，而且5G时代通信将开始深入产业，目标是实现“5G改变社会”。', '10', '190');
INSERT INTO `paragraph` VALUES ('474', '今天（10月7日）是俄罗斯总统普京的67岁生日。据俄罗斯卫星通讯社报道，白俄罗斯总统新闻办公室7日发布消息称，白俄罗斯总统卢卡申科向普京送上生日祝福，他同时表示，普京在国际舞台上具有极高的威望和巨大的影响力。', '11', '190');
INSERT INTO `paragraph` VALUES ('475', '消息还称，卢卡申科相信，俄白在盟国和欧亚经济联盟框架下深化一体化，将进一步推动两国经济发展，提升两国人民福祉，并将为保障欧亚空间安全与稳定做出重大贡献。', '12', '190');
INSERT INTO `paragraph` VALUES ('476', '　　白俄罗斯总统新闻办公室表示，卢卡申科祝愿普京身体健康，生活幸福，常有志同道合者支持，万事顺意。', '13', '190');
INSERT INTO `paragraph` VALUES ('477', '　　普京67岁生日怎么过？此前，据克里姆林宫新闻秘书佩斯科夫透露，普京今天将与亲朋好友在大自然中庆生。', '14', '190');
INSERT INTO `paragraph` VALUES ('496', '新华社北京10月2日电（记者张选杰、李兵峰）10月1日上午，在国庆70周年阅兵中，东风-17常规导弹、长剑-100巡航导弹、东风-41核导弹首次揭开神秘面纱，成为万众聚焦的“明星”。新型导弹武器不断入列，也标志着火箭军已经成为维护和平的重要力量。', '1', '193');
INSERT INTO `paragraph` VALUES ('497', '受阅方队亮相长安街，象征着国威军威的大国长剑昂首向天、威震寰宇。16枚东风-17常规导弹行进在导弹方阵的最前列，是未来战场决战决胜的先锋利刃。被誉为最新大国重器的东风-41核导弹，作为此次火箭军受阅的压轴巨阵，是中国战略核力量的中流砥柱。随着火箭军武器装备不断更新换代，“东风家族”人丁兴旺、日益壮大，核心战斗力持续攀升，部队整体作战能力实现历史性跨越。\n十里长安街，见证新时代。受邀前来观礼的人群，目送一辆辆导弹战车隆隆驶过。一名观众激动地说：“在新中国成立35周年阅兵式上，我们只有1个导弹方队3种型号导弹受阅，今天一次就展示了火箭军的6种新型导弹武器，折射出这支部队从无到有、从弱到强的发展历程，也象征着军队的不断强大、国力的日益强盛。”', '2', '193');
INSERT INTO `paragraph` VALUES ('498', '我是上世纪80年代初期上的大学，当时身边几乎所有人，也包括我在内，都以为北京邮电学院（现北京邮电大学）大学毕业后是要去送信的。那时候，通信是一个很稀有的服务。打电话要去电话局排队，如果在小地方，要到县城才能打一个长途电话。如果确有什么急事需要和外地联络，通常都是去邮局发电报，打电话是很奢侈的事情。\n到80年代末期，中国开始有了程控电话，但装一部固定电话要五六千块钱，这可不是小数。后来有了BP机，到90年代初期，开始有了采用模拟通信技术的第一代移动电话，俗称“大哥大”，要两三万元一部，在那个刚刚有 “万元户”的年代，这可是一种身份的象征。\n　　随着数字移动电话和2G时代来临，“手机”才变小，价格也越来越低。后来，3G和4G时代到来，网速越来越快，手机性能越来越好，现在，智能手机已经成为每个人工作生活必不可少的一部分，甚至一刻都离不开。\n　　从技术角度看，中国的移动通信技术在1G时代（1980年代）是空白，无标准、无技术、无产业。2G时代（1990年代）是跟随，这时标准虽然还是被欧美所掌控，但中国已经有了全球最大的移动网络，也开始培育本土的通信制造商。\n　　3G时代（2000年代）是突破，中国拥有了首个移动通信国际标准，实现了标准的从无到有，与欧洲主导的WCDMA和美国主导的CDMA2000一起形成全球三大3G国际标准。期间，中国移动承担了建设运营TD-SCDMA“中国标准”的使命，虽然面临很多挑战，但通过持续的技术创新和不懈的努力，成功建成了可运营、高质量的TD-SCDMA网络，并实现了国内“三分天下有其一”的发展目标。更为重要的是，3G时代对各种能力的锻造和积累，为4G时代打翻身仗做了充分准备。\n　　4G时代（2010年代）是并跑，中国主导的国际标准首次成为主流，华为、中兴等中国通信设备企业已经迎头赶上，并开始走出去，移动互联网应用蓬勃兴起，中国在移动电商、移动支付、移动出行等很多领域成为全球创新的典范，实现了“4G改变生活”。\n到了5G时代（2020年代）是力争引领，中国在5G技术、标准、产业、应用等方面显现出引领的态势，而且5G时代通信将开始深入产业，目标是实现“5G改变社会”。', '3', '193');
INSERT INTO `paragraph` VALUES ('499', '今天（10月7日）是俄罗斯总统普京的67岁生日。据俄罗斯卫星通讯社报道，白俄罗斯总统新闻办公室7日发布消息称，白俄罗斯总统卢卡申科向普京送上生日祝福，他同时表示，普京在国际舞台上具有极高的威望和巨大的影响力。\n消息还称，卢卡申科相信，俄白在盟国和欧亚经济联盟框架下深化一体化，将进一步推动两国经济发展，提升两国人民福祉，并将为保障欧亚空间安全与稳定做出重大贡献。\n　　白俄罗斯总统新闻办公室表示，卢卡申科祝愿普京身体健康，生活幸福，常有志同道合者支持，万事顺意。\n　　普京67岁生日怎么过？此前，据克里姆林宫新闻秘书佩斯科夫透露，普京今天将与亲朋好友在大自然中庆生。', '4', '193');
INSERT INTO `paragraph` VALUES ('500', '新华社北京10月2日电（记者张选杰、李兵峰）10月1日上午，在国庆70周年阅兵中，东风-17常规导弹、长剑-100巡航导弹、东风-41核导弹首次揭开神秘面纱，成为万众聚焦的“明星”。新型导弹武器不断入列，也标志着火箭军已经成为维护和平的重要力量。', '1', '194');
INSERT INTO `paragraph` VALUES ('501', '　　受阅方队亮相长安街，象征着国威军威的大国长剑昂首向天、威震寰宇。16枚东风-17常规导弹行进在导弹方阵的最前列，是未来战场决战决胜的先锋利刃。被誉为最新大国重器的东风-41核导弹，作为此次火箭军受阅的压轴巨阵，是中国战略核力量的中流砥柱。随着火箭军武器装备不断更新换代，“东风家族”人丁兴旺、日益壮大，核心战斗力持续攀升，部队整体作战能力实现历史性跨越。', '2', '194');
INSERT INTO `paragraph` VALUES ('502', '十里长安街，见证新时代。受邀前来观礼的人群，目送一辆辆导弹战车隆隆驶过。一名观众激动地说：“在新中国成立35周年阅兵式上，我们只有1个导弹方队3种型号导弹受阅，今天一次就展示了火箭军的6种新型导弹武器，折射出这支部队从无到有、从弱到强的发展历程，也象征着军队的不断强大、国力的日益强盛。”', '3', '194');
INSERT INTO `paragraph` VALUES ('503', '我是上世纪80年代初期上的大学，当时身边几乎所有人，也包括我在内，都以为北京邮电学院（现北京邮电大学）大学毕业后是要去送信的。那时候，通信是一个很稀有的服务。打电话要去电话局排队，如果在小地方，要到县城才能打一个长途电话。如果确有什么急事需要和外地联络，通常都是去邮局发电报，打电话是很奢侈的事情。', '4', '194');
INSERT INTO `paragraph` VALUES ('504', '　　到80年代末期，中国开始有了程控电话，但装一部固定电话要五六千块钱，这可不是小数。后来有了BP机，到90年代初期，开始有了采用模拟通信技术的第一代移动电话，俗称“大哥大”，要两三万元一部，在那个刚刚有 “万元户”的年代，这可是一种身份的象征。', '5', '194');
INSERT INTO `paragraph` VALUES ('505', '　　随着数字移动电话和2G时代来临，“手机”才变小，价格也越来越低。后来，3G和4G时代到来，网速越来越快，手机性能越来越好，现在，智能手机已经成为每个人工作生活必不可少的一部分，甚至一刻都离不开。', '6', '194');
INSERT INTO `paragraph` VALUES ('506', '　　从技术角度看，中国的移动通信技术在1G时代（1980年代）是空白，无标准、无技术、无产业。2G时代（1990年代）是跟随，这时标准虽然还是被欧美所掌控，但中国已经有了全球最大的移动网络，也开始培育本土的通信制造商。', '7', '194');
INSERT INTO `paragraph` VALUES ('507', '　　3G时代（2000年代）是突破，中国拥有了首个移动通信国际标准，实现了标准的从无到有，与欧洲主导的WCDMA和美国主导的CDMA2000一起形成全球三大3G国际标准。期间，中国移动承担了建设运营TD-SCDMA“中国标准”的使命，虽然面临很多挑战，但通过持续的技术创新和不懈的努力，成功建成了可运营、高质量的TD-SCDMA网络，并实现了国内“三分天下有其一”的发展目标。更为重要的是，3G时代对各种能力的锻造和积累，为4G时代打翻身仗做了充分准备。', '8', '194');
INSERT INTO `paragraph` VALUES ('508', '　　4G时代（2010年代）是并跑，中国主导的国际标准首次成为主流，华为、中兴等中国通信设备企业已经迎头赶上，并开始走出去，移动互联网应用蓬勃兴起，中国在移动电商、移动支付、移动出行等很多领域成为全球创新的典范，实现了“4G改变生活”。', '9', '194');
INSERT INTO `paragraph` VALUES ('509', '到了5G时代（2020年代）是力争引领，中国在5G技术、标准、产业、应用等方面显现出引领的态势，而且5G时代通信将开始深入产业，目标是实现“5G改变社会”。', '10', '194');
INSERT INTO `paragraph` VALUES ('510', '今天（10月7日）是俄罗斯总统普京的67岁生日。据俄罗斯卫星通讯社报道，白俄罗斯总统新闻办公室7日发布消息称，白俄罗斯总统卢卡申科向普京送上生日祝福，他同时表示，普京在国际舞台上具有极高的威望和巨大的影响力。', '11', '194');
INSERT INTO `paragraph` VALUES ('511', '消息还称，卢卡申科相信，俄白在盟国和欧亚经济联盟框架下深化一体化，将进一步推动两国经济发展，提升两国人民福祉，并将为保障欧亚空间安全与稳定做出重大贡献。', '12', '194');
INSERT INTO `paragraph` VALUES ('512', '　　白俄罗斯总统新闻办公室表示，卢卡申科祝愿普京身体健康，生活幸福，常有志同道合者支持，万事顺意。', '13', '194');
INSERT INTO `paragraph` VALUES ('513', '　　普京67岁生日怎么过？此前，据克里姆林宫新闻秘书佩斯科夫透露，普京今天将与亲朋好友在大自然中庆生。', '14', '194');
INSERT INTO `paragraph` VALUES ('514', '新华社北京10月2日电（记者张选杰、李兵峰）10月1日上午，在国庆70周年阅兵中，东风-17常规导弹、长剑-100巡航导弹、东风-41核导弹首次揭开神秘面纱，成为万众聚焦的“明星”。新型导弹武器不断入列，也标志着火箭军已经成为维护和平的重要力量。', '1', '195');
INSERT INTO `paragraph` VALUES ('515', '受阅方队亮相长安街，象征着国威军威的大国长剑昂首向天、威震寰宇。16枚东风-17常规导弹行进在导弹方阵的最前列，是未来战场决战决胜的先锋利刃。被誉为最新大国重器的东风-41核导弹，作为此次火箭军受阅的压轴巨阵，是中国战略核力量的中流砥柱。随着火箭军武器装备不断更新换代，“东风家族”人丁兴旺、日益壮大，核心战斗力持续攀升，部队整体作战能力实现历史性跨越。\n十里长安街，见证新时代。受邀前来观礼的人群，目送一辆辆导弹战车隆隆驶过。一名观众激动地说：“在新中国成立35周年阅兵式上，我们只有1个导弹方队3种型号导弹受阅，今天一次就展示了火箭军的6种新型导弹武器，折射出这支部队从无到有、从弱到强的发展历程，也象征着军队的不断强大、国力的日益强盛。”', '2', '195');
INSERT INTO `paragraph` VALUES ('516', '我是上世纪80年代初期上的大学，当时身边几乎所有人，也包括我在内，都以为北京邮电学院（现北京邮电大学）大学毕业后是要去送信的。那时候，通信是一个很稀有的服务。打电话要去电话局排队，如果在小地方，要到县城才能打一个长途电话。如果确有什么急事需要和外地联络，通常都是去邮局发电报，打电话是很奢侈的事情。\n到80年代末期，中国开始有了程控电话，但装一部固定电话要五六千块钱，这可不是小数。后来有了BP机，到90年代初期，开始有了采用模拟通信技术的第一代移动电话，俗称“大哥大”，要两三万元一部，在那个刚刚有 “万元户”的年代，这可是一种身份的象征。\n　　随着数字移动电话和2G时代来临，“手机”才变小，价格也越来越低。后来，3G和4G时代到来，网速越来越快，手机性能越来越好，现在，智能手机已经成为每个人工作生活必不可少的一部分，甚至一刻都离不开。\n　　从技术角度看，中国的移动通信技术在1G时代（1980年代）是空白，无标准、无技术、无产业。2G时代（1990年代）是跟随，这时标准虽然还是被欧美所掌控，但中国已经有了全球最大的移动网络，也开始培育本土的通信制造商。\n　　3G时代（2000年代）是突破，中国拥有了首个移动通信国际标准，实现了标准的从无到有，与欧洲主导的WCDMA和美国主导的CDMA2000一起形成全球三大3G国际标准。期间，中国移动承担了建设运营TD-SCDMA“中国标准”的使命，虽然面临很多挑战，但通过持续的技术创新和不懈的努力，成功建成了可运营、高质量的TD-SCDMA网络，并实现了国内“三分天下有其一”的发展目标。更为重要的是，3G时代对各种能力的锻造和积累，为4G时代打翻身仗做了充分准备。\n　　4G时代（2010年代）是并跑，中国主导的国际标准首次成为主流，华为、中兴等中国通信设备企业已经迎头赶上，并开始走出去，移动互联网应用蓬勃兴起，中国在移动电商、移动支付、移动出行等很多领域成为全球创新的典范，实现了“4G改变生活”。\n到了5G时代（2020年代）是力争引领，中国在5G技术、标准、产业、应用等方面显现出引领的态势，而且5G时代通信将开始深入产业，目标是实现“5G改变社会”。', '3', '195');
INSERT INTO `paragraph` VALUES ('517', '今天（10月7日）是俄罗斯总统普京的67岁生日。据俄罗斯卫星通讯社报道，白俄罗斯总统新闻办公室7日发布消息称，白俄罗斯总统卢卡申科向普京送上生日祝福，他同时表示，普京在国际舞台上具有极高的威望和巨大的影响力。\n消息还称，卢卡申科相信，俄白在盟国和欧亚经济联盟框架下深化一体化，将进一步推动两国经济发展，提升两国人民福祉，并将为保障欧亚空间安全与稳定做出重大贡献。\n　　白俄罗斯总统新闻办公室表示，卢卡申科祝愿普京身体健康，生活幸福，常有志同道合者支持，万事顺意。\n　　普京67岁生日怎么过？此前，据克里姆林宫新闻秘书佩斯科夫透露，普京今天将与亲朋好友在大自然中庆生。', '4', '195');
INSERT INTO `paragraph` VALUES ('518', '新华社北京10月2日电（记者张选杰、李兵峰）10月1日上午，在国庆70周年阅兵中，东风-17常规导弹、长剑-100巡航导弹、东风-41核导弹首次揭开神秘面纱，成为万众聚焦的“明星”。新型导弹武器不断入列，也标志着火箭军已经成为维护和平的重要力量。', '1', '196');
INSERT INTO `paragraph` VALUES ('519', '受阅方队亮相长安街，象征着国威军威的大国长剑昂首向天、威震寰宇。16枚东风-17常规导弹行进在导弹方阵的最前列，是未来战场决战决胜的先锋利刃。被誉为最新大国重器的东风-41核导弹，作为此次火箭军受阅的压轴巨阵，是中国战略核力量的中流砥柱。随着火箭军武器装备不断更新换代，“东风家族”人丁兴旺、日益壮大，核心战斗力持续攀升，部队整体作战能力实现历史性跨越。\n十里长安街，见证新时代。受邀前来观礼的人群，目送一辆辆导弹战车隆隆驶过。一名观众激动地说：“在新中国成立35周年阅兵式上，我们只有1个导弹方队3种型号导弹受阅，今天一次就展示了火箭军的6种新型导弹武器，折射出这支部队从无到有、从弱到强的发展历程，也象征着军队的不断强大、国力的日益强盛。”', '2', '196');
INSERT INTO `paragraph` VALUES ('520', '我是上世纪80年代初期上的大学，当时身边几乎所有人，也包括我在内，都以为北京邮电学院（现北京邮电大学）大学毕业后是要去送信的。那时候，通信是一个很稀有的服务。打电话要去电话局排队，如果在小地方，要到县城才能打一个长途电话。如果确有什么急事需要和外地联络，通常都是去邮局发电报，打电话是很奢侈的事情。\n到80年代末期，中国开始有了程控电话，但装一部固定电话要五六千块钱，这可不是小数。后来有了BP机，到90年代初期，开始有了采用模拟通信技术的第一代移动电话，俗称“大哥大”，要两三万元一部，在那个刚刚有 “万元户”的年代，这可是一种身份的象征。\n　　随着数字移动电话和2G时代来临，“手机”才变小，价格也越来越低。后来，3G和4G时代到来，网速越来越快，手机性能越来越好，现在，智能手机已经成为每个人工作生活必不可少的一部分，甚至一刻都离不开。\n　　从技术角度看，中国的移动通信技术在1G时代（1980年代）是空白，无标准、无技术、无产业。2G时代（1990年代）是跟随，这时标准虽然还是被欧美所掌控，但中国已经有了全球最大的移动网络，也开始培育本土的通信制造商。\n　　3G时代（2000年代）是突破，中国拥有了首个移动通信国际标准，实现了标准的从无到有，与欧洲主导的WCDMA和美国主导的CDMA2000一起形成全球三大3G国际标准。期间，中国移动承担了建设运营TD-SCDMA“中国标准”的使命，虽然面临很多挑战，但通过持续的技术创新和不懈的努力，成功建成了可运营、高质量的TD-SCDMA网络，并实现了国内“三分天下有其一”的发展目标。更为重要的是，3G时代对各种能力的锻造和积累，为4G时代打翻身仗做了充分准备。\n　　4G时代（2010年代）是并跑，中国主导的国际标准首次成为主流，华为、中兴等中国通信设备企业已经迎头赶上，并开始走出去，移动互联网应用蓬勃兴起，中国在移动电商、移动支付、移动出行等很多领域成为全球创新的典范，实现了“4G改变生活”。\n到了5G时代（2020年代）是力争引领，中国在5G技术、标准、产业、应用等方面显现出引领的态势，而且5G时代通信将开始深入产业，目标是实现“5G改变社会”。', '3', '196');
INSERT INTO `paragraph` VALUES ('521', '今天（10月7日）是俄罗斯总统普京的67岁生日。据俄罗斯卫星通讯社报道，白俄罗斯总统新闻办公室7日发布消息称，白俄罗斯总统卢卡申科向普京送上生日祝福，他同时表示，普京在国际舞台上具有极高的威望和巨大的影响力。\n消息还称，卢卡申科相信，俄白在盟国和欧亚经济联盟框架下深化一体化，将进一步推动两国经济发展，提升两国人民福祉，并将为保障欧亚空间安全与稳定做出重大贡献。\n　　白俄罗斯总统新闻办公室表示，卢卡申科祝愿普京身体健康，生活幸福，常有志同道合者支持，万事顺意。\n　　普京67岁生日怎么过？此前，据克里姆林宫新闻秘书佩斯科夫透露，普京今天将与亲朋好友在大自然中庆生。', '4', '196');
INSERT INTO `paragraph` VALUES ('522', '新华社北京10月2日电（记者张选杰、李兵峰）10月1日上午，在国庆70周年阅兵中，东风-17常规导弹、长剑-100巡航导弹、东风-41核导弹首次揭开神秘面纱，成为万众聚焦的“明星”。新型导弹武器不断入列，也标志着火箭军已经成为维护和平的重要力量。', '1', '197');
INSERT INTO `paragraph` VALUES ('523', '　　受阅方队亮相长安街，象征着国威军威的大国长剑昂首向天、威震寰宇。16枚东风-17常规导弹行进在导弹方阵的最前列，是未来战场决战决胜的先锋利刃。被誉为最新大国重器的东风-41核导弹，作为此次火箭军受阅的压轴巨阵，是中国战略核力量的中流砥柱。随着火箭军武器装备不断更新换代，“东风家族”人丁兴旺、日益壮大，核心战斗力持续攀升，部队整体作战能力实现历史性跨越。', '2', '197');
INSERT INTO `paragraph` VALUES ('524', '十里长安街，见证新时代。受邀前来观礼的人群，目送一辆辆导弹战车隆隆驶过。一名观众激动地说：“在新中国成立35周年阅兵式上，我们只有1个导弹方队3种型号导弹受阅，今天一次就展示了火箭军的6种新型导弹武器，折射出这支部队从无到有、从弱到强的发展历程，也象征着军队的不断强大、国力的日益强盛。”', '3', '197');
INSERT INTO `paragraph` VALUES ('525', '我是上世纪80年代初期上的大学，当时身边几乎所有人，也包括我在内，都以为北京邮电学院（现北京邮电大学）大学毕业后是要去送信的。那时候，通信是一个很稀有的服务。打电话要去电话局排队，如果在小地方，要到县城才能打一个长途电话。如果确有什么急事需要和外地联络，通常都是去邮局发电报，打电话是很奢侈的事情。', '4', '197');
INSERT INTO `paragraph` VALUES ('526', '　　到80年代末期，中国开始有了程控电话，但装一部固定电话要五六千块钱，这可不是小数。后来有了BP机，到90年代初期，开始有了采用模拟通信技术的第一代移动电话，俗称“大哥大”，要两三万元一部，在那个刚刚有 “万元户”的年代，这可是一种身份的象征。', '5', '197');
INSERT INTO `paragraph` VALUES ('527', '　　随着数字移动电话和2G时代来临，“手机”才变小，价格也越来越低。后来，3G和4G时代到来，网速越来越快，手机性能越来越好，现在，智能手机已经成为每个人工作生活必不可少的一部分，甚至一刻都离不开。', '6', '197');
INSERT INTO `paragraph` VALUES ('528', '　　从技术角度看，中国的移动通信技术在1G时代（1980年代）是空白，无标准、无技术、无产业。2G时代（1990年代）是跟随，这时标准虽然还是被欧美所掌控，但中国已经有了全球最大的移动网络，也开始培育本土的通信制造商。', '7', '197');
INSERT INTO `paragraph` VALUES ('529', '　　3G时代（2000年代）是突破，中国拥有了首个移动通信国际标准，实现了标准的从无到有，与欧洲主导的WCDMA和美国主导的CDMA2000一起形成全球三大3G国际标准。期间，中国移动承担了建设运营TD-SCDMA“中国标准”的使命，虽然面临很多挑战，但通过持续的技术创新和不懈的努力，成功建成了可运营、高质量的TD-SCDMA网络，并实现了国内“三分天下有其一”的发展目标。更为重要的是，3G时代对各种能力的锻造和积累，为4G时代打翻身仗做了充分准备。', '8', '197');
INSERT INTO `paragraph` VALUES ('530', '　　4G时代（2010年代）是并跑，中国主导的国际标准首次成为主流，华为、中兴等中国通信设备企业已经迎头赶上，并开始走出去，移动互联网应用蓬勃兴起，中国在移动电商、移动支付、移动出行等很多领域成为全球创新的典范，实现了“4G改变生活”。', '9', '197');
INSERT INTO `paragraph` VALUES ('531', '到了5G时代（2020年代）是力争引领，中国在5G技术、标准、产业、应用等方面显现出引领的态势，而且5G时代通信将开始深入产业，目标是实现“5G改变社会”。', '10', '197');
INSERT INTO `paragraph` VALUES ('532', '今天（10月7日）是俄罗斯总统普京的67岁生日。据俄罗斯卫星通讯社报道，白俄罗斯总统新闻办公室7日发布消息称，白俄罗斯总统卢卡申科向普京送上生日祝福，他同时表示，普京在国际舞台上具有极高的威望和巨大的影响力。', '11', '197');
INSERT INTO `paragraph` VALUES ('533', '消息还称，卢卡申科相信，俄白在盟国和欧亚经济联盟框架下深化一体化，将进一步推动两国经济发展，提升两国人民福祉，并将为保障欧亚空间安全与稳定做出重大贡献。', '12', '197');
INSERT INTO `paragraph` VALUES ('534', '　　白俄罗斯总统新闻办公室表示，卢卡申科祝愿普京身体健康，生活幸福，常有志同道合者支持，万事顺意。', '13', '197');
INSERT INTO `paragraph` VALUES ('535', '　　普京67岁生日怎么过？此前，据克里姆林宫新闻秘书佩斯科夫透露，普京今天将与亲朋好友在大自然中庆生。', '14', '197');
INSERT INTO `paragraph` VALUES ('536', '新华社北京10月2日电（记者张选杰、李兵峰）10月1日上午，在国庆70周年阅兵中，东风-17常规导弹、长剑-100巡航导弹、东风-41核导弹首次揭开神秘面纱，成为万众聚焦的“明星”。新型导弹武器不断入列，也标志着火箭军已经成为维护和平的重要力量。', '1', '198');
INSERT INTO `paragraph` VALUES ('537', '　　受阅方队亮相长安街，象征着国威军威的大国长剑昂首向天、威震寰宇。16枚东风-17常规导弹行进在导弹方阵的最前列，是未来战场决战决胜的先锋利刃。被誉为最新大国重器的东风-41核导弹，作为此次火箭军受阅的压轴巨阵，是中国战略核力量的中流砥柱。随着火箭军武器装备不断更新换代，“东风家族”人丁兴旺、日益壮大，核心战斗力持续攀升，部队整体作战能力实现历史性跨越。', '2', '198');
INSERT INTO `paragraph` VALUES ('538', '十里长安街，见证新时代。受邀前来观礼的人群，目送一辆辆导弹战车隆隆驶过。一名观众激动地说：“在新中国成立35周年阅兵式上，我们只有1个导弹方队3种型号导弹受阅，今天一次就展示了火箭军的6种新型导弹武器，折射出这支部队从无到有、从弱到强的发展历程，也象征着军队的不断强大、国力的日益强盛。”', '3', '198');
INSERT INTO `paragraph` VALUES ('539', '我是上世纪80年代初期上的大学，当时身边几乎所有人，也包括我在内，都以为北京邮电学院（现北京邮电大学）大学毕业后是要去送信的。那时候，通信是一个很稀有的服务。打电话要去电话局排队，如果在小地方，要到县城才能打一个长途电话。如果确有什么急事需要和外地联络，通常都是去邮局发电报，打电话是很奢侈的事情。', '4', '198');
INSERT INTO `paragraph` VALUES ('540', '　　到80年代末期，中国开始有了程控电话，但装一部固定电话要五六千块钱，这可不是小数。后来有了BP机，到90年代初期，开始有了采用模拟通信技术的第一代移动电话，俗称“大哥大”，要两三万元一部，在那个刚刚有 “万元户”的年代，这可是一种身份的象征。', '5', '198');
INSERT INTO `paragraph` VALUES ('541', '　　随着数字移动电话和2G时代来临，“手机”才变小，价格也越来越低。后来，3G和4G时代到来，网速越来越快，手机性能越来越好，现在，智能手机已经成为每个人工作生活必不可少的一部分，甚至一刻都离不开。', '6', '198');
INSERT INTO `paragraph` VALUES ('542', '　　从技术角度看，中国的移动通信技术在1G时代（1980年代）是空白，无标准、无技术、无产业。2G时代（1990年代）是跟随，这时标准虽然还是被欧美所掌控，但中国已经有了全球最大的移动网络，也开始培育本土的通信制造商。', '7', '198');
INSERT INTO `paragraph` VALUES ('543', '　　3G时代（2000年代）是突破，中国拥有了首个移动通信国际标准，实现了标准的从无到有，与欧洲主导的WCDMA和美国主导的CDMA2000一起形成全球三大3G国际标准。期间，中国移动承担了建设运营TD-SCDMA“中国标准”的使命，虽然面临很多挑战，但通过持续的技术创新和不懈的努力，成功建成了可运营、高质量的TD-SCDMA网络，并实现了国内“三分天下有其一”的发展目标。更为重要的是，3G时代对各种能力的锻造和积累，为4G时代打翻身仗做了充分准备。', '8', '198');
INSERT INTO `paragraph` VALUES ('544', '　　4G时代（2010年代）是并跑，中国主导的国际标准首次成为主流，华为、中兴等中国通信设备企业已经迎头赶上，并开始走出去，移动互联网应用蓬勃兴起，中国在移动电商、移动支付、移动出行等很多领域成为全球创新的典范，实现了“4G改变生活”。', '9', '198');
INSERT INTO `paragraph` VALUES ('545', '到了5G时代（2020年代）是力争引领，中国在5G技术、标准、产业、应用等方面显现出引领的态势，而且5G时代通信将开始深入产业，目标是实现“5G改变社会”。', '10', '198');
INSERT INTO `paragraph` VALUES ('546', '今天（10月7日）是俄罗斯总统普京的67岁生日。据俄罗斯卫星通讯社报道，白俄罗斯总统新闻办公室7日发布消息称，白俄罗斯总统卢卡申科向普京送上生日祝福，他同时表示，普京在国际舞台上具有极高的威望和巨大的影响力。', '11', '198');
INSERT INTO `paragraph` VALUES ('547', '消息还称，卢卡申科相信，俄白在盟国和欧亚经济联盟框架下深化一体化，将进一步推动两国经济发展，提升两国人民福祉，并将为保障欧亚空间安全与稳定做出重大贡献。', '12', '198');
INSERT INTO `paragraph` VALUES ('548', '　　白俄罗斯总统新闻办公室表示，卢卡申科祝愿普京身体健康，生活幸福，常有志同道合者支持，万事顺意。', '13', '198');
INSERT INTO `paragraph` VALUES ('549', '　　普京67岁生日怎么过？此前，据克里姆林宫新闻秘书佩斯科夫透露，普京今天将与亲朋好友在大自然中庆生。', '14', '198');
INSERT INTO `paragraph` VALUES ('550', '恭喜！您获得一个免单资格！3包家庭装湿巾0元领', '1', '199');
INSERT INTO `paragraph` VALUES ('551', '网易游戏雷火事业群技术宣讲会（南京大学）\n\n宣讲会时间：3月11号18：30\n宣讲会地点：南京大学-仙林校区-计算机科学技术楼111\n宣讲福利：现场拿笔试资格\n招聘职位：\n技术类：游戏研发、游戏AI、游戏测试、前端/平台开发、数据挖掘、游戏运维、技术音频等\n非技术类：虚拟世界架构师（游戏策划）、项目管理、用户体验、交互设计、市场营销、数据分析等\n艺术类：界面动效/美术设计师（GUI）、场景/角色原画、场景/角色制作、游戏特效/动作、官网视觉、动画动效等\n工作地点：杭州\n面向对象：2020届&2019届', '2', '199');
INSERT INTO `paragraph` VALUES ('552', '如果你不想再收到该产品的推荐邮件，请点击 这里退订\n《阴阳师》二周年庆重磅开启！', '3', '199');
INSERT INTO `paragraph` VALUES ('553', '恭喜！您获得一个免单资格！3包家庭装湿巾0元领', '1', '200');
INSERT INTO `paragraph` VALUES ('554', '网易游戏雷火事业群技术宣讲会（南京大学）\n\n宣讲会时间：3月11号18：30\n宣讲会地点：南京大学-仙林校区-计算机科学技术楼111\n宣讲福利：现场拿笔试资格\n招聘职位：\n技术类：游戏研发、游戏AI、游戏测试、前端/平台开发、数据挖掘、游戏运维、技术音频等\n非技术类：虚拟世界架构师（游戏策划）、项目管理、用户体验、交互设计、市场营销、数据分析等\n艺术类：界面动效/美术设计师（GUI）、场景/角色原画、场景/角色制作、游戏特效/动作、官网视觉、动画动效等\n工作地点：杭州\n面向对象：2020届&2019届', '2', '200');
INSERT INTO `paragraph` VALUES ('555', '如果你不想再收到该产品的推荐邮件，请点击 这里退订\n《阴阳师》二周年庆重磅开启！', '3', '200');
INSERT INTO `paragraph` VALUES ('556', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '203');
INSERT INTO `paragraph` VALUES ('557', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '2', '203');
INSERT INTO `paragraph` VALUES ('558', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '3', '203');
INSERT INTO `paragraph` VALUES ('559', '恭喜！您获得一个免单资格！3包家庭装湿巾0元领', '1', '212');
INSERT INTO `paragraph` VALUES ('560', '网易游戏雷火事业群技术宣讲会（南京大学）\n\n宣讲会时间：3月11号18：30\n宣讲会地点：南京大学-仙林校区-计算机科学技术楼111\n宣讲福利：现场拿笔试资格\n招聘职位：\n技术类：游戏研发、游戏AI、游戏测试、前端/平台开发、数据挖掘、游戏运维、技术音频等\n非技术类：虚拟世界架构师（游戏策划）、项目管理、用户体验、交互设计、市场营销、数据分析等\n艺术类：界面动效/美术设计师（GUI）、场景/角色原画、场景/角色制作、游戏特效/动作、官网视觉、动画动效等\n工作地点：杭州\n面向对象：2020届&2019届', '2', '212');
INSERT INTO `paragraph` VALUES ('561', '如果你不想再收到该产品的推荐邮件，请点击 这里退订\n《阴阳师》二周年庆重磅开启！', '3', '212');
INSERT INTO `paragraph` VALUES ('562', '恭喜！您获得一个免单资格！3包家庭装湿巾0元领', '1', '213');
INSERT INTO `paragraph` VALUES ('563', '网易游戏雷火事业群技术宣讲会（南京大学）\n\n宣讲会时间：3月11号18：30\n宣讲会地点：南京大学-仙林校区-计算机科学技术楼111\n宣讲福利：现场拿笔试资格\n招聘职位：\n技术类：游戏研发、游戏AI、游戏测试、前端/平台开发、数据挖掘、游戏运维、技术音频等\n非技术类：虚拟世界架构师（游戏策划）、项目管理、用户体验、交互设计、市场营销、数据分析等\n艺术类：界面动效/美术设计师（GUI）、场景/角色原画、场景/角色制作、游戏特效/动作、官网视觉、动画动效等\n工作地点：杭州\n面向对象：2020届&2019届', '2', '213');
INSERT INTO `paragraph` VALUES ('564', '如果你不想再收到该产品的推荐邮件，请点击 这里退订\n《阴阳师》二周年庆重磅开启！', '3', '213');
INSERT INTO `paragraph` VALUES ('565', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '1', '217');
INSERT INTO `paragraph` VALUES ('566', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '2', '217');
INSERT INTO `paragraph` VALUES ('567', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '3', '217');

-- ----------------------------
-- Table structure for point
-- ----------------------------
DROP TABLE IF EXISTS `point`;
CREATE TABLE `point` (
  `p_id` int(11) DEFAULT NULL,
  `deficitvalue` varchar(255) DEFAULT NULL,
  `obtainvalue` varchar(255) DEFAULT NULL,
  `u_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of point
-- ----------------------------

-- ----------------------------
-- Table structure for pointunit
-- ----------------------------
DROP TABLE IF EXISTS `pointunit`;
CREATE TABLE `pointunit` (
  `pu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分单位ID',
  `pointunit` int(11) NOT NULL COMMENT '积分单位',
  `task_id` int(11) DEFAULT NULL COMMENT '任务ID',
  PRIMARY KEY (`pu_id`),
  KEY `task_id` (`task_id`),
  CONSTRAINT `pointunit_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `task` (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pointunit
-- ----------------------------
INSERT INTO `pointunit` VALUES ('2', '0', '20');
INSERT INTO `pointunit` VALUES ('14', '0', '38');
INSERT INTO `pointunit` VALUES ('15', '0', '39');
INSERT INTO `pointunit` VALUES ('28', '0', '53');
INSERT INTO `pointunit` VALUES ('39', '0', '64');
INSERT INTO `pointunit` VALUES ('41', '0', '67');
INSERT INTO `pointunit` VALUES ('42', '0', '68');
INSERT INTO `pointunit` VALUES ('43', '0', '69');
INSERT INTO `pointunit` VALUES ('44', '0', '70');
INSERT INTO `pointunit` VALUES ('45', '0', '71');
INSERT INTO `pointunit` VALUES ('46', '0', '72');
INSERT INTO `pointunit` VALUES ('47', '0', '73');
INSERT INTO `pointunit` VALUES ('49', '0', '76');
INSERT INTO `pointunit` VALUES ('50', '0', '77');
INSERT INTO `pointunit` VALUES ('52', '0', '82');
INSERT INTO `pointunit` VALUES ('53', '0', '84');
INSERT INTO `pointunit` VALUES ('54', '0', '86');

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `tid` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `title` varchar(255) DEFAULT NULL COMMENT '任务名称',
  `description` varchar(255) DEFAULT NULL COMMENT '任务描述',
  `type_name` varchar(50) DEFAULT NULL COMMENT '任务类型',
  `createtime` varchar(255) DEFAULT NULL COMMENT '创建日期',
  `deadline` datetime DEFAULT NULL COMMENT '截止日期',
  `taskcompstatus` varchar(40) DEFAULT NULL COMMENT '任务进行状态',
  `otherinfo` varchar(255) DEFAULT NULL COMMENT '其他备注',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `viewnum` int(11) DEFAULT NULL COMMENT '浏览次数,初始为0',
  `attendnum` int(11) NOT NULL COMMENT '参与人数',
  `currenttask` int(11) DEFAULT NULL,
  `frequence` int(11) DEFAULT NULL,
  `totaltask` int(11) DEFAULT NULL,
  `startid` int(11) DEFAULT NULL,
  `iftest` varchar(255) DEFAULT NULL,
  `testtask_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`tid`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('1', 'TC-1 文本分类测试用例1', '根据标签对邮件内容进行分类', '文本分类', '2019-03-12 15:29:34', '2019-11-12 00:00:00', '已完成', 'TC-1测试用例', '2', '138', '3', '2', '0', '18', '1', 'no', null);
INSERT INTO `task` VALUES ('3', '文本分类TC-2', 'TC-2', '文本分类', '2019-03-12 15:37:49', '2019-03-28 00:00:00', '已完成', '', '1', '11', '0', null, null, null, null, null, null);
INSERT INTO `task` VALUES ('4', '测试1', '测试2', '文本配对#一对一', '2019-03-12 15:43:2', '2019-03-30 00:00:00', '已完成', '测试3', '3', '21', '1', null, null, null, null, null, null);
INSERT INTO `task` VALUES ('5', 'c', 'c', '文本配对#一对多', '2019-03-12 15:43:23', '2019-03-30 00:00:00', '已完成', '出', '1', '12', '1', null, null, null, null, null, null);
INSERT INTO `task` VALUES ('6', '出的', '从', '文本配对#多对多', '2019-03-12 15:43:43', '2019-03-30 00:00:00', '已完成', '从', '2', '11', '1', null, null, null, null, null, null);
INSERT INTO `task` VALUES ('7', '出的', '导出', '文本排序', '2019-03-12 15:44:2', '2019-03-29 00:00:00', '已完成', '的', '3', '15', '0', null, null, null, null, null, null);
INSERT INTO `task` VALUES ('8', '根据左边的文本对右边的文本进行排序', '按照时间顺序或案件审查顺序', '文本类比排序', '2019-03-12 16:45:15', '2019-03-28 00:00:00', '已完成', '无', '1', '15', '2', null, null, null, null, null, null);
INSERT INTO `task` VALUES ('9', '3', '4', '信息抽取', '2019-03-12 18:40:40', '2019-04-19 00:00:00', '已完成', '5', '3', '55', '2', null, null, null, null, null, null);
INSERT INTO `task` VALUES ('10', '1', '2', '文本关系', '2019-03-13 11:6:42', '2019-03-30 00:00:00', '已完成', '3', '2', '27', '1', null, '0', null, null, null, null);
INSERT INTO `task` VALUES ('11', '法院关键信息抽取', '根据标签提取文本中的关键信息', '信息抽取', '2019-04-06 22:27:31', '2019-04-25 00:00:00', '已完成', '无', '1', '14', '1', null, '0', null, null, null, null);
INSERT INTO `task` VALUES ('12', '判断给定的事实是否相关', '根据文本，判断给定的事实是否相关', '文本关系', '2019-04-06 22:35:33', '2019-04-30 00:00:00', '已完成', '无', '3', '9', '1', null, '0', null, null, null, null);
INSERT INTO `task` VALUES ('13', '对两边的文本内容相关的进行连线', '相关的内容进行连线', '文本配对#一对多', '2019-04-06 22:43:50', '2019-04-26 00:00:00', '已完成', '无', '2', '13', '2', null, '0', null, null, null, null);
INSERT INTO `task` VALUES ('14', '1', '1', '信息抽取', '2019-04-15 16:34:22', '2019-04-18 00:00:00', '已完成', '1', '2', '1', '0', null, '0', null, null, null, null);
INSERT INTO `task` VALUES ('15', '2', '1', '信息抽取', '2019-04-18 19:43:28', '2019-04-26 00:00:00', '已完成', '1', '2', '0', '0', null, '0', null, null, null, null);
INSERT INTO `task` VALUES ('16', '2', '3', '文本排序', '2019-04-18 19:44:56', '2019-04-26 00:00:00', '已完成', '3', '2', '1', '0', null, '0', null, null, null, null);
INSERT INTO `task` VALUES ('17', '4', '4', '文本排序', '2019-04-18 19:45:37', '2019-04-27 00:00:00', '已完成', '5', '2', '0', '0', null, '0', null, null, null, null);
INSERT INTO `task` VALUES ('18', '3', '3', '信息抽取', '2019-04-18 22:16:3', '2019-04-27 00:00:00', '已完成', '3', '2', '2', '0', null, '0', null, null, null, null);
INSERT INTO `task` VALUES ('20', 'test', 'test', '文本分类', '2019-12-02 9:13:2', '2019-12-31 00:00:00', '已完成', '', '3', '1', '0', '1', '0', '14', '125', null, null);
INSERT INTO `task` VALUES ('38', '汽车实体关系抽取', '汽车实体关系抽取', '信息抽取', '2019-12-24 10:6:59', '2019-12-31 00:00:00', '已完成', '汽车实体关系抽取', '4', '121', '0', '0', '0', '4', '391', 'yes', null);
INSERT INTO `task` VALUES ('39', '汽车实体关系抽取', '汽车实体关系抽取', '信息抽取', '2019-12-29 14:10:10', '2019-12-31 00:00:00', '已完成', '汽车实体关系抽取', '4', '26', '0', '1', '0', '4', '395', 'yes', null);
INSERT INTO `task` VALUES ('53', '文本排序', '文本排序', '文本排序', '2020-01-10 16:58:43', '2020-06-10 00:00:00', '进行中', '文本排序', '4', '5', '0', null, null, null, null, 'yes', null);
INSERT INTO `task` VALUES ('64', '文本关系', '文本关系', '文本关系', '2020-02-23 1:23:37', '2020-02-29 00:00:00', '已完成', '文本关系', '4', '1', '0', '0', '0', '3', '127', 'no', null);
INSERT INTO `task` VALUES ('65', '文本配对', '文本配对', '文本配对#一对一', '2020-02-23 2:39:56', '2020-02-29 00:00:00', '已完成', '文本配对', '4', '1', '0', null, null, null, null, 'no', null);
INSERT INTO `task` VALUES ('67', '文本关系', '文本关系', '文本关系', '2020-02-23 12:52:58', '2020-02-29 00:00:00', '已完成', '文本关系', '4', '1', '0', '0', '0', '3', '136', 'no', null);
INSERT INTO `task` VALUES ('68', '文本分类', '文本分类', '文本分类', '2020-02-23 13:2:28', '2020-02-29 00:00:00', '已完成', '文本分类', '4', '1', '0', '1', '0', '3', '417', 'no', null);
INSERT INTO `task` VALUES ('69', '文本关系', '文本关系', '文本关系', '2020-02-23 13:3:59', '2020-02-29 00:00:00', '已完成', '文本关系', '4', '1', '0', '0', '0', '3', '139', 'no', null);
INSERT INTO `task` VALUES ('70', '信息抽取', '信息抽取', '信息抽取', '2020-03-21 16:39:25', '2020-03-23 00:00:00', '已完成', '信息抽取', '4', '3', '0', '18', '0', '18', '420', 'no', null);
INSERT INTO `task` VALUES ('71', '信息抽取', '信息抽取', '信息抽取', '2020-03-21 17:57:28', '2020-03-24 00:00:00', '已完成', '', '4', '1', '0', '0', '0', '4', '438', 'yes', null);
INSERT INTO `task` VALUES ('72', '信息抽取', '信息抽取', '信息抽取', '2020-03-22 21:3:37', '2020-03-25 00:00:00', '已完成', '信息抽取', '4', '0', '0', '0', '0', '18', '442', 'no', null);
INSERT INTO `task` VALUES ('73', '地名抽取', '地名抽取', '信息抽取', '2020-03-24 20:43:34', '2020-03-31 00:00:00', '已完成', '', '4', '17', '0', '4', '0', '4', '514', 'no', '74');
INSERT INTO `task` VALUES ('74', '地名抽取-检测任务', '地名抽取', '信息抽取', '2020-03-24 20:43:34', '2020-03-31 00:00:00', '已完成', '', '4', '11', '0', '4', '0', '4', '518', 'test', '73');
INSERT INTO `task` VALUES ('76', '信息抽取', '信息抽取', '信息抽取', '2020-03-25 3:11:46', '2020-03-28 00:00:00', '已完成', '', '4', '19', '0', '4', '0', '14', '536', 'no', null);
INSERT INTO `task` VALUES ('77', '邮件分类', '邮件分类', '文本分类', '2020-03-30 12:55:9', '2020-06-30 00:00:00', '进行中', '', '4', '11', '0', '2', '0', '3', '559', 'no', '78');
INSERT INTO `task` VALUES ('78', '邮件分类-检测任务', '邮件分类', '文本分类', '2020-03-30 12:55:9', '2020-06-30 00:00:00', '进行中', '', '4', '0', '0', '0', '0', '3', '562', 'test', '77');
INSERT INTO `task` VALUES ('79', '一一配对', '一一配对', '文本配对#一对一', '2020-03-30 12:56:13', '2020-06-30 00:00:00', '进行中', '', '4', '8', '0', '2', '0', '2', '162', 'no', '80');
INSERT INTO `task` VALUES ('80', '一一配对-检测任务', '一一配对', '文本配对#一对一', '2020-03-30 12:56:13', '2020-06-30 00:00:00', '进行中', '', '4', '0', '0', '0', '0', '2', '164', 'test', '79');
INSERT INTO `task` VALUES ('82', '关系配对', '关系配对', '文本关系', '2020-03-30 14:48:24', '2020-06-30 00:00:00', '进行中', '关系配对', '4', '11', '0', '2', '0', '3', '169', 'no', '83');
INSERT INTO `task` VALUES ('83', '关系配对-检测任务', '关系配对', '文本关系', '2020-03-30 14:48:24', '2020-06-30 00:00:00', '进行中', '关系配对', '4', '0', '0', '0', '0', '3', '172', 'test', '82');
INSERT INTO `task` VALUES ('84', '直接排序', '直接排序', '文本排序', '2020-03-30 15:3:54', '2020-06-30 00:00:00', '进行中', '直接排序', '4', '9', '0', '2', '0', '2', '175', 'no', '85');
INSERT INTO `task` VALUES ('85', '直接排序-检测任务', '直接排序', '文本排序', '2020-03-30 15:3:54', '2020-06-30 00:00:00', '进行中', '直接排序', '4', '0', '0', '0', '0', '2', '177', 'test', '84');
INSERT INTO `task` VALUES ('86', '比较排序', '比较排序', '文本类比排序', '2020-03-30 15:5:4', '2020-06-30 00:00:00', '进行中', '比较排序', '4', '3', '0', '1', '0', '2', '179', 'no', '87');
INSERT INTO `task` VALUES ('87', '比较排序-检测任务', '比较排序', '文本类比排序', '2020-03-30 15:5:4', '2020-06-30 00:00:00', '进行中', '比较排序', '4', '0', '0', '0', '0', '2', '181', 'test', '86');
INSERT INTO `task` VALUES ('88', '一一配对', '一一配对', '文本配对#一对一', '2020-03-30 19:15:13', '2020-06-30 00:00:00', '进行中', '一一配对', '4', '4', '0', '2', '0', '2', '183', 'no', '89');
INSERT INTO `task` VALUES ('89', '一一配对-检测任务', '一一配对', '文本配对#一对一', '2020-03-30 19:15:13', '2020-06-30 00:00:00', '进行中', '一一配对', '4', '3', '0', '2', '0', '2', '185', 'test', '88');
INSERT INTO `task` VALUES ('90', '配对', '配对', '文本配对#一对一', '2020-03-30 23:52:51', '2020-06-30 00:00:00', '进行中', '配对', '4', '10', '0', '2', '0', '6', '187', 'no', '91');
INSERT INTO `task` VALUES ('91', '配对-检测任务', '配对', '文本配对#一对一', '2020-03-30 23:52:51', '2020-06-30 00:00:00', '进行中', '配对', '4', '0', '0', '0', '0', '6', '193', 'test', '90');

-- ----------------------------
-- Table structure for tasktype
-- ----------------------------
DROP TABLE IF EXISTS `tasktype`;
CREATE TABLE `tasktype` (
  `typeid` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务类型ID',
  `typename` varchar(50) DEFAULT NULL COMMENT '任务类型名称',
  PRIMARY KEY (`typeid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tasktype
-- ----------------------------
INSERT INTO `tasktype` VALUES ('1', '信息抽取');
INSERT INTO `tasktype` VALUES ('2', '文本分类');
INSERT INTO `tasktype` VALUES ('3', '文本关系');
INSERT INTO `tasktype` VALUES ('4', '文本配对');
INSERT INTO `tasktype` VALUES ('5', '文本排序');
INSERT INTO `tasktype` VALUES ('6', '类比排序');

-- ----------------------------
-- Table structure for task_document
-- ----------------------------
DROP TABLE IF EXISTS `task_document`;
CREATE TABLE `task_document` (
  `task_id` int(11) NOT NULL COMMENT '任务ID',
  `document_id` int(11) NOT NULL COMMENT '文件ID',
  KEY `task_id` (`task_id`),
  KEY `document_id` (`document_id`),
  CONSTRAINT `task_document_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `task` (`tid`),
  CONSTRAINT `task_document_ibfk_2` FOREIGN KEY (`document_id`) REFERENCES `document` (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task_document
-- ----------------------------
INSERT INTO `task_document` VALUES ('1', '1');
INSERT INTO `task_document` VALUES ('1', '2');
INSERT INTO `task_document` VALUES ('3', '4');
INSERT INTO `task_document` VALUES ('4', '5');
INSERT INTO `task_document` VALUES ('4', '6');
INSERT INTO `task_document` VALUES ('5', '7');
INSERT INTO `task_document` VALUES ('5', '8');
INSERT INTO `task_document` VALUES ('6', '9');
INSERT INTO `task_document` VALUES ('6', '10');
INSERT INTO `task_document` VALUES ('7', '11');
INSERT INTO `task_document` VALUES ('7', '12');
INSERT INTO `task_document` VALUES ('8', '13');
INSERT INTO `task_document` VALUES ('8', '14');
INSERT INTO `task_document` VALUES ('9', '15');
INSERT INTO `task_document` VALUES ('10', '18');
INSERT INTO `task_document` VALUES ('10', '19');
INSERT INTO `task_document` VALUES ('11', '20');
INSERT INTO `task_document` VALUES ('11', '21');
INSERT INTO `task_document` VALUES ('12', '22');
INSERT INTO `task_document` VALUES ('12', '23');
INSERT INTO `task_document` VALUES ('13', '24');
INSERT INTO `task_document` VALUES ('13', '25');
INSERT INTO `task_document` VALUES ('14', '26');
INSERT INTO `task_document` VALUES ('15', '27');
INSERT INTO `task_document` VALUES ('16', '28');
INSERT INTO `task_document` VALUES ('17', '29');
INSERT INTO `task_document` VALUES ('18', '30');
INSERT INTO `task_document` VALUES ('18', '31');
INSERT INTO `task_document` VALUES ('20', '38');
INSERT INTO `task_document` VALUES ('38', '114');
INSERT INTO `task_document` VALUES ('39', '117');
INSERT INTO `task_document` VALUES ('53', '149');
INSERT INTO `task_document` VALUES ('64', '170');
INSERT INTO `task_document` VALUES ('65', '174');
INSERT INTO `task_document` VALUES ('67', '176');
INSERT INTO `task_document` VALUES ('68', '177');
INSERT INTO `task_document` VALUES ('69', '178');
INSERT INTO `task_document` VALUES ('70', '179');
INSERT INTO `task_document` VALUES ('70', '180');
INSERT INTO `task_document` VALUES ('71', '184');
INSERT INTO `task_document` VALUES ('72', '187');
INSERT INTO `task_document` VALUES ('72', '188');
INSERT INTO `task_document` VALUES ('73', '195');
INSERT INTO `task_document` VALUES ('74', '196');
INSERT INTO `task_document` VALUES ('76', '198');
INSERT INTO `task_document` VALUES ('77', '212');
INSERT INTO `task_document` VALUES ('78', '213');
INSERT INTO `task_document` VALUES ('79', '214');
INSERT INTO `task_document` VALUES ('80', '215');
INSERT INTO `task_document` VALUES ('82', '218');
INSERT INTO `task_document` VALUES ('83', '219');
INSERT INTO `task_document` VALUES ('84', '220');
INSERT INTO `task_document` VALUES ('85', '221');
INSERT INTO `task_document` VALUES ('86', '222');
INSERT INTO `task_document` VALUES ('87', '223');
INSERT INTO `task_document` VALUES ('88', '224');
INSERT INTO `task_document` VALUES ('89', '225');
INSERT INTO `task_document` VALUES ('90', '226');
INSERT INTO `task_document` VALUES ('91', '227');

-- ----------------------------
-- Table structure for task_label
-- ----------------------------
DROP TABLE IF EXISTS `task_label`;
CREATE TABLE `task_label` (
  `task_id` int(11) NOT NULL COMMENT '文件ID',
  `label_id` int(11) NOT NULL COMMENT '标签ID',
  `color` varchar(40) DEFAULT NULL COMMENT '标签对应的颜色',
  KEY `task_id` (`task_id`),
  KEY `label_id` (`label_id`),
  CONSTRAINT `task_label_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `task` (`tid`),
  CONSTRAINT `task_label_ibfk_2` FOREIGN KEY (`label_id`) REFERENCES `label` (`lid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task_label
-- ----------------------------
INSERT INTO `task_label` VALUES ('1', '1', null);
INSERT INTO `task_label` VALUES ('1', '2', null);
INSERT INTO `task_label` VALUES ('1', '3', null);
INSERT INTO `task_label` VALUES ('1', '4', null);
INSERT INTO `task_label` VALUES ('1', '5', null);
INSERT INTO `task_label` VALUES ('1', '6', null);
INSERT INTO `task_label` VALUES ('1', '7', null);
INSERT INTO `task_label` VALUES ('3', '9', null);
INSERT INTO `task_label` VALUES ('9', '10', '#8000ff');
INSERT INTO `task_label` VALUES ('9', '8', '#ff8040');
INSERT INTO `task_label` VALUES ('9', '11', '#ff0080');
INSERT INTO `task_label` VALUES ('11', '22', '#ff0080');
INSERT INTO `task_label` VALUES ('11', '23', '#ff8040');
INSERT INTO `task_label` VALUES ('11', '24', '#ff80ff');
INSERT INTO `task_label` VALUES ('11', '25', '#ff0000');
INSERT INTO `task_label` VALUES ('11', '26', '#8000ff');
INSERT INTO `task_label` VALUES ('11', '27', '#408080');
INSERT INTO `task_label` VALUES ('14', '32', '#FF0000');
INSERT INTO `task_label` VALUES ('14', '32', '#8000ff');
INSERT INTO `task_label` VALUES ('15', '33', '#ff80ff');
INSERT INTO `task_label` VALUES ('15', '34', '#FF0000');
INSERT INTO `task_label` VALUES ('18', '35', '#FF0000');
INSERT INTO `task_label` VALUES ('18', '36', '#FF0000');
INSERT INTO `task_label` VALUES ('20', '44', null);
INSERT INTO `task_label` VALUES ('20', '45', null);
INSERT INTO `task_label` VALUES ('38', '52', '#ff8080');
INSERT INTO `task_label` VALUES ('38', '53', '#ffff80');
INSERT INTO `task_label` VALUES ('38', '44', '#80ff80');
INSERT INTO `task_label` VALUES ('38', '45', '#00ff80');
INSERT INTO `task_label` VALUES ('38', '54', '#80ffff');
INSERT INTO `task_label` VALUES ('38', '55', '#0080ff');
INSERT INTO `task_label` VALUES ('39', '52', '#ff8080');
INSERT INTO `task_label` VALUES ('39', '56', '#FF0000');
INSERT INTO `task_label` VALUES ('39', '45', '#ffff80');
INSERT INTO `task_label` VALUES ('39', '53', '#80ffff');
INSERT INTO `task_label` VALUES ('39', '54', '#ff80c0');
INSERT INTO `task_label` VALUES ('68', '2', null);
INSERT INTO `task_label` VALUES ('68', '1', null);
INSERT INTO `task_label` VALUES ('70', '44', '#1e775c');
INSERT INTO `task_label` VALUES ('70', '60', '#8c98da');
INSERT INTO `task_label` VALUES ('71', '47', '#fcd17d');
INSERT INTO `task_label` VALUES ('71', '32', '#6743cf');
INSERT INTO `task_label` VALUES ('72', '44', '#9e3a5e');
INSERT INTO `task_label` VALUES ('72', '45', '#e89f34');
INSERT INTO `task_label` VALUES ('72', '61', '#af9c6d');
INSERT INTO `task_label` VALUES ('73', '44', '#e12be9');
INSERT INTO `task_label` VALUES ('73', '45', '#a682fb');
INSERT INTO `task_label` VALUES ('74', '44', '#e12be9');
INSERT INTO `task_label` VALUES ('74', '45', '#a682fb');
INSERT INTO `task_label` VALUES ('76', '44', '#6aad41');
INSERT INTO `task_label` VALUES ('76', '45', '#353b64');
INSERT INTO `task_label` VALUES ('77', '2', null);
INSERT INTO `task_label` VALUES ('77', '1', null);
INSERT INTO `task_label` VALUES ('77', '64', null);
INSERT INTO `task_label` VALUES ('78', '2', null);
INSERT INTO `task_label` VALUES ('78', '1', null);
INSERT INTO `task_label` VALUES ('78', '64', null);

-- ----------------------------
-- Table structure for test_classify
-- ----------------------------
DROP TABLE IF EXISTS `test_classify`;
CREATE TABLE `test_classify` (
  `dataid` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `subtask_id` int(11) DEFAULT NULL,
  `content` varchar(20000) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`dataid`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_classify
-- ----------------------------
INSERT INTO `test_classify` VALUES ('43', '55', '1', '恭喜！您获得一个免单资格！3包家庭装湿巾0元领', '广告邮件', '156');
INSERT INTO `test_classify` VALUES ('44', '55', '2', '网易游戏雷火事业群技术宣讲会（南京大学）\n\n宣讲会时间：3月11号18：30\n宣讲会地点：南京大学-仙林校区-计算机科学技术楼111\n宣讲福利：现场拿笔试资格\n招聘职位：\n技术类：游戏研发、游戏AI、游戏测试、前端/平台开发、数据挖掘、游戏运维、技术音频等\n非技术类：虚拟世界架构师（游戏策划）、项目管理、用户体验、交互设计、市场营销、数据分析等\n艺术类：界面动效/美术设计师（GUI）、场景/角色原画、场景/角色制作、游戏特效/动作、官网视觉、动画动效等\n工作地点：杭州\n面向对象：2020届&2019届', '招聘信息', '156');
INSERT INTO `test_classify` VALUES ('45', '55', '3', '如果你不想再收到该产品的推荐邮件，请点击 这里退订\n《阴阳师》二周年庆重磅开启！', '广告邮件', '156');
INSERT INTO `test_classify` VALUES ('46', '56', '1', '恭喜！您获得一个免单资格！3包家庭装湿巾0元领', '广告邮件', '158');
INSERT INTO `test_classify` VALUES ('47', '56', '2', '网易游戏雷火事业群技术宣讲会（南京大学）\n\n宣讲会时间：3月11号18：30\n宣讲会地点：南京大学-仙林校区-计算机科学技术楼111\n宣讲福利：现场拿笔试资格\n招聘职位：\n技术类：游戏研发、游戏AI、游戏测试、前端/平台开发、数据挖掘、游戏运维、技术音频等\n非技术类：虚拟世界架构师（游戏策划）、项目管理、用户体验、交互设计、市场营销、数据分析等\n艺术类：界面动效/美术设计师（GUI）、场景/角色原画、场景/角色制作、游戏特效/动作、官网视觉、动画动效等\n工作地点：杭州\n面向对象：2020届&2019届', '招聘信息', '158');
INSERT INTO `test_classify` VALUES ('48', '56', '3', '如果你不想再收到该产品的推荐邮件，请点击 这里退订\n《阴阳师》二周年庆重磅开启！', '广告邮件', '158');

-- ----------------------------
-- Table structure for test_document
-- ----------------------------
DROP TABLE IF EXISTS `test_document`;
CREATE TABLE `test_document` (
  `test_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`test_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_document
-- ----------------------------
INSERT INTO `test_document` VALUES ('1', '38', '115');
INSERT INTO `test_document` VALUES ('2', '38', '116');
INSERT INTO `test_document` VALUES ('3', '39', '118');
INSERT INTO `test_document` VALUES ('4', '39', '119');
INSERT INTO `test_document` VALUES ('5', '41', '123');
INSERT INTO `test_document` VALUES ('6', '47', '135');
INSERT INTO `test_document` VALUES ('7', '48', '138');
INSERT INTO `test_document` VALUES ('8', '49', '141');
INSERT INTO `test_document` VALUES ('9', '49', '142');
INSERT INTO `test_document` VALUES ('10', '50', '144');
INSERT INTO `test_document` VALUES ('11', '53', '150');
INSERT INTO `test_document` VALUES ('12', '54', '152');
INSERT INTO `test_document` VALUES ('13', '55', '154');
INSERT INTO `test_document` VALUES ('14', '55', '156');
INSERT INTO `test_document` VALUES ('15', '56', '158');
INSERT INTO `test_document` VALUES ('16', '71', '182');
INSERT INTO `test_document` VALUES ('17', '71', '183');
INSERT INTO `test_document` VALUES ('18', '71', '185');
INSERT INTO `test_document` VALUES ('19', '71', '186');

-- ----------------------------
-- Table structure for test_extractiondata
-- ----------------------------
DROP TABLE IF EXISTS `test_extractiondata`;
CREATE TABLE `test_extractiondata` (
  `dataid` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `subtask_id` int(11) DEFAULT NULL,
  `content` varchar(20000) DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`dataid`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_extractiondata
-- ----------------------------
INSERT INTO `test_extractiondata` VALUES ('31', '38', '1', '标题：现代汽车拟与Aptiv组建自动驾驶合资公司总计投资40亿美元\n内容：据国外媒体报道，现代汽车集团（HyundaiMotor）与自动驾驶技术供应商Aptiv（安波福）\n日前签署合作协议，双方将投资40亿美元，成立自动驾驶合资公司。【TechWeb】9月24日消息，据国\n外媒体报道，现代汽车集团（HyundaiMotor）与自动驾驶技术供应商Aptiv（安波福）日前签署\n合作协议，双方将投资40亿美元，成立自动驾驶合资公司。现代汽车集团旗下现代汽车、起亚汽车、现代摩比斯\n（Mobis）将向合资公司投资16亿美元，以及规模达4亿美元的汽车工程服务、研发力量、知识产权共享，\n总计投资20亿美元。Aptiv将提供自动驾驶技术和知识产权，并投入约700人研发自动驾驶解决方案等。\n双方将各拥有合资公司50%的股份。合资公司总部将设在波斯顿，由Aptiv自动驾驶移动出行业务（Apt\nivAutonomousMobility）总裁KarlIagnemma领导。根据计划，该合资公司将针\n对L4和L5级自动驾驶技术进行开发，并计划于2020年开始全自动驾驶系统的测试，在2022年为自动驾\n驶出租车供应商、车队运营商和汽车制造商提供可量产的自动驾驶系统。', '115');
INSERT INTO `test_extractiondata` VALUES ('32', '38', '2', '标题：马斯克：特斯拉正研发寿命160万公里电池组\n内容：马斯克：特斯拉正研发寿命160万公里电池组2019年04月25日10:50来源：腾讯汽车据国外媒\n体报道，特斯拉首席执行官埃隆·马斯克透露，特斯拉正在研发一款全新电池组，该电池组寿命可支撑车辆行驶里\n程达到100万英里(约合161万公里)，其将在明年面世。在周一（当地时间4月22日）举行的特斯拉自动\n化大会上，在谈及未来特斯拉机器人出租车车队的经济性问题时，埃隆·马斯克称车辆需要加强耐用性以体现运营\n经济性。他说到：“目前生产的汽车在设计阶段都是以行驶百万英里为目标的。车辆的传动装置按照运营100万\n英里的标准来设计、测试以及验证的。”不过埃隆·马斯克也承认目前的电池组寿命还无法支撑车辆行驶里程达到\n100万英里。就在一周之前，埃隆·马斯克表示特斯拉打造了行驶里程媲美商用卡车的Model3，这意味着\n后者能够行驶100万英里。埃隆·马斯克还指出相应的电池模块寿命应该能使车辆行驶30万到50万英里之间\n。眼下埃隆·马斯克又透露特斯拉计划为上述电池模块提供替代品。他表示，特斯拉将会推出一款全新电池组，其\n寿命长短将同车辆保持一致。他说到：“新电池组可能将在明年投产，其设计初衷即为使得车辆的运营里程可以达\n到100万英里。”埃隆·马斯克表示，特斯拉的研究人员正在致力于优化车辆的每一个环节，其中甚至包括车辆\n的轮胎，此举意在把车辆的维护成本降到最低水平以打造一款“极度高效”电动机器人出租车。鉴于特斯拉作为汽\n车制造企业的资历并不算老，因此有关特斯拉汽车耐跑里程的数据比较有限。特斯拉电池退化的早期数据显示，在\n车辆行驶16万英里之后，电池容量的缩减幅度不超过10%。单看上述指标，特斯拉电池的表现算得上很好，但\n要让电池能够支撑车辆跑上100万英里，这显然是一个全新的水平。有消息现实，特斯拉聚焦于可支撑较长耐跑\n里程电池的研发工作已经有一段时间。今年早些时候，有媒体报道称由杰夫·达恩领衔的特斯拉研究团队申请了一\n项专利权。该专利权描述了一种新的电池单元化学物质组成，其将使得电池的充电和放电速度更快、电池寿命更长\n、成本则更低。值得一提的是，特斯拉通过收购Maxwell而获得的电池技术或能够潜在帮助其改善电池寿命\n。\n', '115');
INSERT INTO `test_extractiondata` VALUES ('33', '38', '3', '标题：货物承载空间3000L雷诺EZ-FLEX亮相\n内容：[汽车之家新车首发]近日，雷诺EZ-FLEX电动车正式亮相，新车属轻型商用车范畴，其刚推出的目的\n就是让城市运输更便捷。据悉新车续航里程为100km，尽管只有3860mm的车长，但其货物装载空间高达\n3立方米（约等于3000L）。雷诺官方称，到2050年，全球运输货物的数量将翻两番，EZ-FLEX正\n是雷诺凭借电动和互联探索出的新交付方法。由于该车将用于城市运输，所以紧凑的车身必不可少，其长宽高分别\n为3860/1650/1880mm，但得益于紧凑的驾驶室，新车货物装载空间高达3立方米（约等于300\n0L）。官方称EZ-FLEX可提供100km的续航里程以应对城市通行，由于新车还处试验阶段，所以投入\n使用的车辆将配备传感器以采集地理位置、里程、范围、速度、停靠等数据，以便官方了解在真实使用情况。', '115');
INSERT INTO `test_extractiondata` VALUES ('34', '39', '1', '标题：现代汽车拟与Aptiv组建自动驾驶合资公司总计投资40亿美元\n内容：据国外媒体报道，现代汽车集团（HyundaiMotor）与自动驾驶技术供应商Aptiv（安波福）\n日前签署合作协议，双方将投资40亿美元，成立自动驾驶合资公司。【TechWeb】9月24日消息，据国\n外媒体报道，现代汽车集团（HyundaiMotor）与自动驾驶技术供应商Aptiv（安波福）日前签署\n合作协议，双方将投资40亿美元，成立自动驾驶合资公司。现代汽车集团旗下现代汽车、起亚汽车、现代摩比斯\n（Mobis）将向合资公司投资16亿美元，以及规模达4亿美元的汽车工程服务、研发力量、知识产权共享，\n总计投资20亿美元。Aptiv将提供自动驾驶技术和知识产权，并投入约700人研发自动驾驶解决方案等。\n双方将各拥有合资公司50%的股份。合资公司总部将设在波斯顿，由Aptiv自动驾驶移动出行业务（Apt\nivAutonomousMobility）总裁KarlIagnemma领导。根据计划，该合资公司将针\n对L4和L5级自动驾驶技术进行开发，并计划于2020年开始全自动驾驶系统的测试，在2022年为自动驾\n驶出租车供应商、车队运营商和汽车制造商提供可量产的自动驾驶系统。', '118');
INSERT INTO `test_extractiondata` VALUES ('35', '39', '2', '标题：马斯克：特斯拉正研发寿命160万公里电池组\n内容：马斯克：特斯拉正研发寿命160万公里电池组2019年04月25日10:50来源：腾讯汽车据国外媒\n体报道，特斯拉首席执行官埃隆·马斯克透露，特斯拉正在研发一款全新电池组，该电池组寿命可支撑车辆行驶里\n程达到100万英里(约合161万公里)，其将在明年面世。在周一（当地时间4月22日）举行的特斯拉自动\n化大会上，在谈及未来特斯拉机器人出租车车队的经济性问题时，埃隆·马斯克称车辆需要加强耐用性以体现运营\n经济性。他说到：“目前生产的汽车在设计阶段都是以行驶百万英里为目标的。车辆的传动装置按照运营100万\n英里的标准来设计、测试以及验证的。”不过埃隆·马斯克也承认目前的电池组寿命还无法支撑车辆行驶里程达到\n100万英里。就在一周之前，埃隆·马斯克表示特斯拉打造了行驶里程媲美商用卡车的Model3，这意味着\n后者能够行驶100万英里。埃隆·马斯克还指出相应的电池模块寿命应该能使车辆行驶30万到50万英里之间\n。眼下埃隆·马斯克又透露特斯拉计划为上述电池模块提供替代品。他表示，特斯拉将会推出一款全新电池组，其\n寿命长短将同车辆保持一致。他说到：“新电池组可能将在明年投产，其设计初衷即为使得车辆的运营里程可以达\n到100万英里。”埃隆·马斯克表示，特斯拉的研究人员正在致力于优化车辆的每一个环节，其中甚至包括车辆\n的轮胎，此举意在把车辆的维护成本降到最低水平以打造一款“极度高效”电动机器人出租车。鉴于特斯拉作为汽\n车制造企业的资历并不算老，因此有关特斯拉汽车耐跑里程的数据比较有限。特斯拉电池退化的早期数据显示，在\n车辆行驶16万英里之后，电池容量的缩减幅度不超过10%。单看上述指标，特斯拉电池的表现算得上很好，但\n要让电池能够支撑车辆跑上100万英里，这显然是一个全新的水平。有消息现实，特斯拉聚焦于可支撑较长耐跑\n里程电池的研发工作已经有一段时间。今年早些时候，有媒体报道称由杰夫·达恩领衔的特斯拉研究团队申请了一\n项专利权。该专利权描述了一种新的电池单元化学物质组成，其将使得电池的充电和放电速度更快、电池寿命更长\n、成本则更低。值得一提的是，特斯拉通过收购Maxwell而获得的电池技术或能够潜在帮助其改善电池寿命\n。\n', '118');
INSERT INTO `test_extractiondata` VALUES ('36', '39', '3', '标题：货物承载空间3000L雷诺EZ-FLEX亮相\n内容：[汽车之家新车首发]近日，雷诺EZ-FLEX电动车正式亮相，新车属轻型商用车范畴，其刚推出的目的\n就是让城市运输更便捷。据悉新车续航里程为100km，尽管只有3860mm的车长，但其货物装载空间高达\n3立方米（约等于3000L）。雷诺官方称，到2050年，全球运输货物的数量将翻两番，EZ-FLEX正\n是雷诺凭借电动和互联探索出的新交付方法。由于该车将用于城市运输，所以紧凑的车身必不可少，其长宽高分别\n为3860/1650/1880mm，但得益于紧凑的驾驶室，新车货物装载空间高达3立方米（约等于300\n0L）。官方称EZ-FLEX可提供100km的续航里程以应对城市通行，由于新车还处试验阶段，所以投入\n使用的车辆将配备传感器以采集地理位置、里程、范围、速度、停靠等数据，以便官方了解在真实使用情况。', '118');
INSERT INTO `test_extractiondata` VALUES ('37', '71', '1', '标题：现代汽车拟与Aptiv组建自动驾驶合资公司总计投资40亿美元\n内容：据国外媒体报道，现代汽车集团（HyundaiMotor）与自动驾驶技术供应商Aptiv（安波福）\n日前签署合作协议，双方将投资40亿美元，成立自动驾驶合资公司。【TechWeb】9月24日消息，据国\n外媒体报道，现代汽车集团（HyundaiMotor）与自动驾驶技术供应商Aptiv（安波福）日前签署\n合作协议，双方将投资40亿美元，成立自动驾驶合资公司。现代汽车集团旗下现代汽车、起亚汽车、现代摩比斯\n（Mobis）将向合资公司投资16亿美元，以及规模达4亿美元的汽车工程服务、研发力量、知识产权共享，\n总计投资20亿美元。Aptiv将提供自动驾驶技术和知识产权，并投入约700人研发自动驾驶解决方案等。\n双方将各拥有合资公司50%的股份。合资公司总部将设在波斯顿，由Aptiv自动驾驶移动出行业务（Apt\nivAutonomousMobility）总裁KarlIagnemma领导。根据计划，该合资公司将针\n对L4和L5级自动驾驶技术进行开发，并计划于2020年开始全自动驾驶系统的测试，在2022年为自动驾\n驶出租车供应商、车队运营商和汽车制造商提供可量产的自动驾驶系统。', '182');
INSERT INTO `test_extractiondata` VALUES ('38', '71', '2', '标题：马斯克：特斯拉正研发寿命160万公里电池组\n内容：马斯克：特斯拉正研发寿命160万公里电池组2019年04月25日10:50来源：腾讯汽车据国外媒\n体报道，特斯拉首席执行官埃隆·马斯克透露，特斯拉正在研发一款全新电池组，该电池组寿命可支撑车辆行驶里\n程达到100万英里(约合161万公里)，其将在明年面世。在周一（当地时间4月22日）举行的特斯拉自动\n化大会上，在谈及未来特斯拉机器人出租车车队的经济性问题时，埃隆·马斯克称车辆需要加强耐用性以体现运营\n经济性。他说到：“目前生产的汽车在设计阶段都是以行驶百万英里为目标的。车辆的传动装置按照运营100万\n英里的标准来设计、测试以及验证的。”不过埃隆·马斯克也承认目前的电池组寿命还无法支撑车辆行驶里程达到\n100万英里。就在一周之前，埃隆·马斯克表示特斯拉打造了行驶里程媲美商用卡车的Model3，这意味着\n后者能够行驶100万英里。埃隆·马斯克还指出相应的电池模块寿命应该能使车辆行驶30万到50万英里之间\n。眼下埃隆·马斯克又透露特斯拉计划为上述电池模块提供替代品。他表示，特斯拉将会推出一款全新电池组，其\n寿命长短将同车辆保持一致。他说到：“新电池组可能将在明年投产，其设计初衷即为使得车辆的运营里程可以达\n到100万英里。”埃隆·马斯克表示，特斯拉的研究人员正在致力于优化车辆的每一个环节，其中甚至包括车辆\n的轮胎，此举意在把车辆的维护成本降到最低水平以打造一款“极度高效”电动机器人出租车。鉴于特斯拉作为汽\n车制造企业的资历并不算老，因此有关特斯拉汽车耐跑里程的数据比较有限。特斯拉电池退化的早期数据显示，在\n车辆行驶16万英里之后，电池容量的缩减幅度不超过10%。单看上述指标，特斯拉电池的表现算得上很好，但\n要让电池能够支撑车辆跑上100万英里，这显然是一个全新的水平。有消息现实，特斯拉聚焦于可支撑较长耐跑\n里程电池的研发工作已经有一段时间。今年早些时候，有媒体报道称由杰夫·达恩领衔的特斯拉研究团队申请了一\n项专利权。该专利权描述了一种新的电池单元化学物质组成，其将使得电池的充电和放电速度更快、电池寿命更长\n、成本则更低。值得一提的是，特斯拉通过收购Maxwell而获得的电池技术或能够潜在帮助其改善电池寿命\n。\n', '182');
INSERT INTO `test_extractiondata` VALUES ('39', '71', '3', '标题：货物承载空间3000L雷诺EZ-FLEX亮相\n内容：[汽车之家新车首发]近日，雷诺EZ-FLEX电动车正式亮相，新车属轻型商用车范畴，其刚推出的目的\n就是让城市运输更便捷。据悉新车续航里程为100km，尽管只有3860mm的车长，但其货物装载空间高达\n3立方米（约等于3000L）。雷诺官方称，到2050年，全球运输货物的数量将翻两番，EZ-FLEX正\n是雷诺凭借电动和互联探索出的新交付方法。由于该车将用于城市运输，所以紧凑的车身必不可少，其长宽高分别\n为3860/1650/1880mm，但得益于紧凑的驾驶室，新车货物装载空间高达3立方米（约等于300\n0L）。官方称EZ-FLEX可提供100km的续航里程以应对城市通行，由于新车还处试验阶段，所以投入\n使用的车辆将配备传感器以采集地理位置、里程、范围、速度、停靠等数据，以便官方了解在真实使用情况。', '182');
INSERT INTO `test_extractiondata` VALUES ('40', '71', '1', '标题：现代汽车拟与Aptiv组建自动驾驶合资公司总计投资40亿美元\n内容：据国外媒体报道，现代汽车集团（HyundaiMotor）与自动驾驶技术供应商Aptiv（安波福）\n日前签署合作协议，双方将投资40亿美元，成立自动驾驶合资公司。【TechWeb】9月24日消息，据国\n外媒体报道，现代汽车集团（HyundaiMotor）与自动驾驶技术供应商Aptiv（安波福）日前签署\n合作协议，双方将投资40亿美元，成立自动驾驶合资公司。现代汽车集团旗下现代汽车、起亚汽车、现代摩比斯\n（Mobis）将向合资公司投资16亿美元，以及规模达4亿美元的汽车工程服务、研发力量、知识产权共享，\n总计投资20亿美元。Aptiv将提供自动驾驶技术和知识产权，并投入约700人研发自动驾驶解决方案等。\n双方将各拥有合资公司50%的股份。合资公司总部将设在波斯顿，由Aptiv自动驾驶移动出行业务（Apt\nivAutonomousMobility）总裁KarlIagnemma领导。根据计划，该合资公司将针\n对L4和L5级自动驾驶技术进行开发，并计划于2020年开始全自动驾驶系统的测试，在2022年为自动驾\n驶出租车供应商、车队运营商和汽车制造商提供可量产的自动驾驶系统。', '185');
INSERT INTO `test_extractiondata` VALUES ('41', '71', '2', '标题：马斯克：特斯拉正研发寿命160万公里电池组\n内容：马斯克：特斯拉正研发寿命160万公里电池组2019年04月25日10:50来源：腾讯汽车据国外媒\n体报道，特斯拉首席执行官埃隆·马斯克透露，特斯拉正在研发一款全新电池组，该电池组寿命可支撑车辆行驶里\n程达到100万英里(约合161万公里)，其将在明年面世。在周一（当地时间4月22日）举行的特斯拉自动\n化大会上，在谈及未来特斯拉机器人出租车车队的经济性问题时，埃隆·马斯克称车辆需要加强耐用性以体现运营\n经济性。他说到：“目前生产的汽车在设计阶段都是以行驶百万英里为目标的。车辆的传动装置按照运营100万\n英里的标准来设计、测试以及验证的。”不过埃隆·马斯克也承认目前的电池组寿命还无法支撑车辆行驶里程达到\n100万英里。就在一周之前，埃隆·马斯克表示特斯拉打造了行驶里程媲美商用卡车的Model3，这意味着\n后者能够行驶100万英里。埃隆·马斯克还指出相应的电池模块寿命应该能使车辆行驶30万到50万英里之间\n。眼下埃隆·马斯克又透露特斯拉计划为上述电池模块提供替代品。他表示，特斯拉将会推出一款全新电池组，其\n寿命长短将同车辆保持一致。他说到：“新电池组可能将在明年投产，其设计初衷即为使得车辆的运营里程可以达\n到100万英里。”埃隆·马斯克表示，特斯拉的研究人员正在致力于优化车辆的每一个环节，其中甚至包括车辆\n的轮胎，此举意在把车辆的维护成本降到最低水平以打造一款“极度高效”电动机器人出租车。鉴于特斯拉作为汽\n车制造企业的资历并不算老，因此有关特斯拉汽车耐跑里程的数据比较有限。特斯拉电池退化的早期数据显示，在\n车辆行驶16万英里之后，电池容量的缩减幅度不超过10%。单看上述指标，特斯拉电池的表现算得上很好，但\n要让电池能够支撑车辆跑上100万英里，这显然是一个全新的水平。有消息现实，特斯拉聚焦于可支撑较长耐跑\n里程电池的研发工作已经有一段时间。今年早些时候，有媒体报道称由杰夫·达恩领衔的特斯拉研究团队申请了一\n项专利权。该专利权描述了一种新的电池单元化学物质组成，其将使得电池的充电和放电速度更快、电池寿命更长\n、成本则更低。值得一提的是，特斯拉通过收购Maxwell而获得的电池技术或能够潜在帮助其改善电池寿命\n。\n', '185');
INSERT INTO `test_extractiondata` VALUES ('42', '71', '3', '标题：货物承载空间3000L雷诺EZ-FLEX亮相\n内容：[汽车之家新车首发]近日，雷诺EZ-FLEX电动车正式亮相，新车属轻型商用车范畴，其刚推出的目的\n就是让城市运输更便捷。据悉新车续航里程为100km，尽管只有3860mm的车长，但其货物装载空间高达\n3立方米（约等于3000L）。雷诺官方称，到2050年，全球运输货物的数量将翻两番，EZ-FLEX正\n是雷诺凭借电动和互联探索出的新交付方法。由于该车将用于城市运输，所以紧凑的车身必不可少，其长宽高分别\n为3860/1650/1880mm，但得益于紧凑的驾驶室，新车货物装载空间高达3立方米（约等于300\n0L）。官方称EZ-FLEX可提供100km的续航里程以应对城市通行，由于新车还处试验阶段，所以投入\n使用的车辆将配备传感器以采集地理位置、里程、范围、速度、停靠等数据，以便官方了解在真实使用情况。', '185');

-- ----------------------------
-- Table structure for test_extractionentity
-- ----------------------------
DROP TABLE IF EXISTS `test_extractionentity`;
CREATE TABLE `test_extractionentity` (
  `task_id` int(11) DEFAULT NULL,
  `subtask_id` int(11) DEFAULT NULL,
  `entity_id` varchar(255) DEFAULT NULL,
  `entity_name` varchar(255) DEFAULT NULL,
  `startindex` int(11) DEFAULT NULL,
  `endindex` int(11) DEFAULT NULL,
  `entity` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_extractionentity
-- ----------------------------
INSERT INTO `test_extractionentity` VALUES ('38', '1', 'T1', '公司', '46', '52', '现代汽车集团');
INSERT INTO `test_extractionentity` VALUES ('38', '1', 'T2', '公司', '76', '81', 'Aptiv');
INSERT INTO `test_extractionentity` VALUES ('38', '1', 'T3', '公司', '110', '118', '自动驾驶合资公司');
INSERT INTO `test_extractionentity` VALUES ('38', '1', 'T4', '时间', '128', '133', '43732');
INSERT INTO `test_extractionentity` VALUES ('38', '1', 'T5', '地点', '374', '377', '波斯顿');
INSERT INTO `test_extractionentity` VALUES ('38', '1', 'T6', '人名', '423', '435', 'KarlIagnemma');
INSERT INTO `test_extractionentity` VALUES ('38', '1', 'T7', '公司', '379', '384', 'Aptiv');
INSERT INTO `test_extractionentity` VALUES ('38', '2', 'T1', '时间', '50', '61', '43580');
INSERT INTO `test_extractionentity` VALUES ('38', '2', 'T2', '公司', '83', '86', '特斯拉');
INSERT INTO `test_extractionentity` VALUES ('38', '2', 'T3', '人名', '91', '97', '埃隆·马斯克');
INSERT INTO `test_extractionentity` VALUES ('38', '2', 'T4', '技术', '486', '491', '全新电池组');
INSERT INTO `test_extractionentity` VALUES ('38', '2', 'T5', '公司', '477', '480', '特斯拉');
INSERT INTO `test_extractionentity` VALUES ('38', '3', 'T1', '技术', '3', '14', '货物承载空间3000L');
INSERT INTO `test_extractionentity` VALUES ('38', '3', 'T2', '公司', '14', '16', '雷诺');
INSERT INTO `test_extractionentity` VALUES ('38', '3', 'T3', '产品', '44', '55', 'EZ-FLEX电动车');
INSERT INTO `test_extractionentity` VALUES ('38', '3', 'T4', '公司', '43', '45', '雷诺');
INSERT INTO `test_extractionentity` VALUES ('39', '1', 'T1', '公司', '46', '52', '现代汽车集团');
INSERT INTO `test_extractionentity` VALUES ('39', '1', 'T2', '公司', '76', '81', 'Aptiv');
INSERT INTO `test_extractionentity` VALUES ('39', '1', 'T3', '公司', '110', '118', '自动驾驶合资公司');
INSERT INTO `test_extractionentity` VALUES ('39', '1', 'T4', '时间', '128', '133', '43732');
INSERT INTO `test_extractionentity` VALUES ('39', '1', 'T5', '地点', '374', '377', '波斯顿');
INSERT INTO `test_extractionentity` VALUES ('39', '1', 'T6', '人名', '423', '435', 'KarlIagnemma');
INSERT INTO `test_extractionentity` VALUES ('39', '1', 'T7', '公司', '379', '384', 'Aptiv');
INSERT INTO `test_extractionentity` VALUES ('39', '2', 'T1', '时间', '50', '61', '43580');
INSERT INTO `test_extractionentity` VALUES ('39', '2', 'T2', '公司', '83', '86', '特斯拉');
INSERT INTO `test_extractionentity` VALUES ('39', '2', 'T3', '人名', '91', '97', '埃隆·马斯克');
INSERT INTO `test_extractionentity` VALUES ('39', '2', 'T4', '技术', '486', '491', '全新电池组');
INSERT INTO `test_extractionentity` VALUES ('39', '2', 'T5', '公司', '477', '480', '特斯拉');
INSERT INTO `test_extractionentity` VALUES ('39', '3', 'T1', '技术', '3', '14', '货物承载空间3000L');
INSERT INTO `test_extractionentity` VALUES ('39', '3', 'T2', '公司', '14', '16', '雷诺');
INSERT INTO `test_extractionentity` VALUES ('39', '3', 'T3', '产品', '44', '55', 'EZ-FLEX电动车');
INSERT INTO `test_extractionentity` VALUES ('39', '3', 'T4', '公司', '43', '45', '雷诺');
INSERT INTO `test_extractionentity` VALUES ('1', '71', 'T1', '公司', '46', '52', '现代汽车集团');
INSERT INTO `test_extractionentity` VALUES ('1', '71', 'T2', '公司', '76', '81', 'Aptiv');
INSERT INTO `test_extractionentity` VALUES ('1', '71', 'T3', '公司', '110', '118', '自动驾驶合资公司');
INSERT INTO `test_extractionentity` VALUES ('1', '71', 'T4', '时间', '128', '133', '43732');
INSERT INTO `test_extractionentity` VALUES ('1', '71', 'T5', '地点', '374', '377', '波斯顿');
INSERT INTO `test_extractionentity` VALUES ('1', '71', 'T6', '人名', '423', '435', 'KarlIagnemma');
INSERT INTO `test_extractionentity` VALUES ('1', '71', 'T7', '公司', '379', '384', 'Aptiv');
INSERT INTO `test_extractionentity` VALUES ('2', '71', 'T1', '时间', '50', '61', '43580');
INSERT INTO `test_extractionentity` VALUES ('2', '71', 'T2', '公司', '83', '86', '特斯拉');
INSERT INTO `test_extractionentity` VALUES ('2', '71', 'T3', '人名', '91', '97', '埃隆·马斯克');
INSERT INTO `test_extractionentity` VALUES ('2', '71', 'T4', '技术', '486', '491', '全新电池组');
INSERT INTO `test_extractionentity` VALUES ('2', '71', 'T5', '公司', '477', '480', '特斯拉');
INSERT INTO `test_extractionentity` VALUES ('3', '71', 'T1', '技术', '3', '14', '货物承载空间3000L');
INSERT INTO `test_extractionentity` VALUES ('3', '71', 'T2', '公司', '14', '16', '雷诺');
INSERT INTO `test_extractionentity` VALUES ('3', '71', 'T3', '产品', '44', '55', 'EZ-FLEX电动车');
INSERT INTO `test_extractionentity` VALUES ('3', '71', 'T4', '公司', '43', '45', '雷诺');
INSERT INTO `test_extractionentity` VALUES ('1', '71', 'T1', '公司', '46', '52', '现代汽车集团');
INSERT INTO `test_extractionentity` VALUES ('1', '71', 'T2', '公司', '76', '81', 'Aptiv');
INSERT INTO `test_extractionentity` VALUES ('1', '71', 'T3', '公司', '110', '118', '自动驾驶合资公司');
INSERT INTO `test_extractionentity` VALUES ('1', '71', 'T4', '时间', '128', '133', '43732');
INSERT INTO `test_extractionentity` VALUES ('1', '71', 'T5', '地点', '374', '377', '波斯顿');
INSERT INTO `test_extractionentity` VALUES ('1', '71', 'T6', '人名', '423', '435', 'KarlIagnemma');
INSERT INTO `test_extractionentity` VALUES ('1', '71', 'T7', '公司', '379', '384', 'Aptiv');
INSERT INTO `test_extractionentity` VALUES ('2', '71', 'T1', '时间', '50', '61', '43580');
INSERT INTO `test_extractionentity` VALUES ('2', '71', 'T2', '公司', '83', '86', '特斯拉');
INSERT INTO `test_extractionentity` VALUES ('2', '71', 'T3', '人名', '91', '97', '埃隆·马斯克');
INSERT INTO `test_extractionentity` VALUES ('2', '71', 'T4', '技术', '486', '491', '全新电池组');
INSERT INTO `test_extractionentity` VALUES ('2', '71', 'T5', '公司', '477', '480', '特斯拉');
INSERT INTO `test_extractionentity` VALUES ('3', '71', 'T1', '技术', '3', '14', '货物承载空间3000L');
INSERT INTO `test_extractionentity` VALUES ('3', '71', 'T2', '公司', '14', '16', '雷诺');
INSERT INTO `test_extractionentity` VALUES ('3', '71', 'T3', '产品', '44', '55', 'EZ-FLEX电动车');
INSERT INTO `test_extractionentity` VALUES ('3', '71', 'T4', '公司', '43', '45', '雷诺');

-- ----------------------------
-- Table structure for test_extractionrel
-- ----------------------------
DROP TABLE IF EXISTS `test_extractionrel`;
CREATE TABLE `test_extractionrel` (
  `task_id` int(11) DEFAULT NULL,
  `subtask_id` int(11) DEFAULT NULL,
  `relation_id` varchar(255) DEFAULT NULL,
  `relation` varchar(255) DEFAULT NULL,
  `headentity` varchar(255) DEFAULT NULL,
  `tailentity` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_extractionrel
-- ----------------------------
INSERT INTO `test_extractionrel` VALUES ('38', '1', 'R1', '投资', 'T1', 'T3');
INSERT INTO `test_extractionrel` VALUES ('38', '1', 'R2', '投资', 'T2', 'T3');
INSERT INTO `test_extractionrel` VALUES ('38', '1', 'R3', '任职', 'T6', 'T7');
INSERT INTO `test_extractionrel` VALUES ('38', '2', 'R1', '任职', 'T3', 'T2');
INSERT INTO `test_extractionrel` VALUES ('38', '2', 'R2', '技术关系', 'T5', 'T4');
INSERT INTO `test_extractionrel` VALUES ('38', '3', 'R1', '技术关系', 'T2', 'T1');
INSERT INTO `test_extractionrel` VALUES ('38', '3', 'R2', '产品关系', 'T4', 'T3');
INSERT INTO `test_extractionrel` VALUES ('39', '1', 'R1', '投资', 'T1', 'T3');
INSERT INTO `test_extractionrel` VALUES ('39', '1', 'R2', '投资', 'T2', 'T3');
INSERT INTO `test_extractionrel` VALUES ('39', '1', 'R3', '任职', 'T6', 'T7');
INSERT INTO `test_extractionrel` VALUES ('39', '2', 'R1', '任职', 'T3', 'T2');
INSERT INTO `test_extractionrel` VALUES ('39', '2', 'R2', '技术关系', 'T5', 'T4');
INSERT INTO `test_extractionrel` VALUES ('39', '3', 'R1', '技术关系', 'T2', 'T1');
INSERT INTO `test_extractionrel` VALUES ('39', '3', 'R2', '产品关系', 'T4', 'T3');
INSERT INTO `test_extractionrel` VALUES ('71', '1', 'R1', '投资', 'T1', 'T3');
INSERT INTO `test_extractionrel` VALUES ('71', '1', 'R2', '投资', 'T2', 'T3');
INSERT INTO `test_extractionrel` VALUES ('71', '1', 'R3', '任职', 'T6', 'T7');
INSERT INTO `test_extractionrel` VALUES ('71', '2', 'R1', '任职', 'T3', 'T2');
INSERT INTO `test_extractionrel` VALUES ('71', '2', 'R2', '技术关系', 'T5', 'T4');
INSERT INTO `test_extractionrel` VALUES ('71', '3', 'R1', '技术关系', 'T2', 'T1');
INSERT INTO `test_extractionrel` VALUES ('71', '3', 'R2', '产品关系', 'T4', 'T3');
INSERT INTO `test_extractionrel` VALUES ('71', '1', 'R1', '投资', 'T1', 'T3');
INSERT INTO `test_extractionrel` VALUES ('71', '1', 'R2', '投资', 'T2', 'T3');
INSERT INTO `test_extractionrel` VALUES ('71', '1', 'R3', '任职', 'T6', 'T7');
INSERT INTO `test_extractionrel` VALUES ('71', '2', 'R1', '任职', 'T3', 'T2');
INSERT INTO `test_extractionrel` VALUES ('71', '2', 'R2', '技术关系', 'T5', 'T4');
INSERT INTO `test_extractionrel` VALUES ('71', '3', 'R1', '技术关系', 'T2', 'T1');
INSERT INTO `test_extractionrel` VALUES ('71', '3', 'R2', '产品关系', 'T4', 'T3');

-- ----------------------------
-- Table structure for test_pairing
-- ----------------------------
DROP TABLE IF EXISTS `test_pairing`;
CREATE TABLE `test_pairing` (
  `dataid` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `subtask_id` int(11) DEFAULT NULL,
  `itemid` int(11) DEFAULT NULL,
  `itemtype` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `itemcontent` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `coritemid` int(11) DEFAULT NULL,
  PRIMARY KEY (`dataid`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_pairing
-- ----------------------------
INSERT INTO `test_pairing` VALUES ('49', '50', '1', '1', 'item1', '公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、', '3');
INSERT INTO `test_pairing` VALUES ('50', '50', '1', '2', 'item1', '二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；', '4');
INSERT INTO `test_pairing` VALUES ('51', '50', '1', '3', 'item2', '鉴定意见：辽阳市公安局刑事技术鉴定书、车辆检验报告及照片、辽阳襄平法医司法鉴定所检验报告；被告人宋X的供述与辩解等证据证明。', '2');
INSERT INTO `test_pairing` VALUES ('52', '50', '1', '4', 'item2', '据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。', '1');

-- ----------------------------
-- Table structure for test_relationanswer
-- ----------------------------
DROP TABLE IF EXISTS `test_relationanswer`;
CREATE TABLE `test_relationanswer` (
  `task_id` int(11) DEFAULT NULL,
  `subtask_id` int(11) DEFAULT NULL,
  `labeltype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_relationanswer
-- ----------------------------
INSERT INTO `test_relationanswer` VALUES ('49', '1', 'item1', '原因');
INSERT INTO `test_relationanswer` VALUES ('49', '1', 'item2', '结果');
INSERT INTO `test_relationanswer` VALUES ('49', '1', 'instance', '因果关系');
INSERT INTO `test_relationanswer` VALUES ('49', '2', 'item1', '结果');
INSERT INTO `test_relationanswer` VALUES ('49', '2', 'item2', '原因');
INSERT INTO `test_relationanswer` VALUES ('49', '2', 'instance', '因果关系');
INSERT INTO `test_relationanswer` VALUES ('49', '3', 'item1', '结果');
INSERT INTO `test_relationanswer` VALUES ('49', '3', 'item1', '事故责任判定');
INSERT INTO `test_relationanswer` VALUES ('49', '3', 'item2', '原因');
INSERT INTO `test_relationanswer` VALUES ('49', '3', 'instance', '因果关系');

-- ----------------------------
-- Table structure for test_relationdata
-- ----------------------------
DROP TABLE IF EXISTS `test_relationdata`;
CREATE TABLE `test_relationdata` (
  `dataid` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `subtask_id` int(11) DEFAULT NULL,
  `item1` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `item2` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `document_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`dataid`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_relationdata
-- ----------------------------
INSERT INTO `test_relationdata` VALUES ('40', '47', '1', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '135');
INSERT INTO `test_relationdata` VALUES ('41', '47', '2', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '135');
INSERT INTO `test_relationdata` VALUES ('42', '47', '3', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '135');
INSERT INTO `test_relationdata` VALUES ('43', '48', '1', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '138');
INSERT INTO `test_relationdata` VALUES ('44', '48', '2', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '138');
INSERT INTO `test_relationdata` VALUES ('45', '48', '3', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '138');
INSERT INTO `test_relationdata` VALUES ('46', '49', '1', '经审理查明： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。', '被告人宋X案后到公安机关投案。 上述事实，有如下经庭审举证、质证的证据证明，本院予以确认： 公诉机关向法庭提供的证据： 1、接受刑事案件登记表、受理交通事故案件登记表、案件来源证明，本案系宋X电话报案，辽阳市公安交通警察支队弓长岭大队接到报警电话后出警，对现场进行勘查等工作。 2、被告人宋X到案情况说明证明，本案系案发后被告人宋X于2015年7月8日22时报警，于次日到辽阳市公安交警支队事故大队的讯问室做讯问笔录，如实供述自己的犯罪事实。 3、身份证复印件、户籍证明，能证明被告人宋X的出生日期为19XX年XX月XX日；被害人王XX的出生日期为19XX年XX月XX日，系城镇居民。', '141');
INSERT INTO `test_relationdata` VALUES ('47', '49', '2', '机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件证明，被告人宋X拥有驾驶C1车型的资格，其所驾驶牌照为辽K392XX小轿车为宋X个人所有。 被害人王XX拥有驾驶E车型的资格，有效期为2004年7月2日至2006年7月2日，经交警在2015年7月10日查询被害人驾驶E车型资格有效期期满之后未办理机动车驾驶证，其所驾驶牌照为辽K105XX摩托车为王XX所有。 5、机动车交通事故责任强制保险单副本复印件证明，牌照为辽K392XX的小型轿车在华泰财产保险公司辽阳中心支公司投保交通强制保险。', '死亡证明，能证明被害人王XX因交通肇事而死亡。 7、被告人宋X的供述与辩解证明，2015年7月8日22时30分左右，其驾驶个人所有的辽K392XX号夏利轿车，由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞。此外，当日其没有喝酒。', '141');
INSERT INTO `test_relationdata` VALUES ('48', '49', '3', '鉴定意见证明，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。 9、车辆痕迹检验鉴定报告及照片6张证明，辽K392XX号轿车和辽K105XX发生碰撞可以形成上述痕迹。 10、辽襄鉴（检验）字（2015）1088号检验报告证明，宋X的血液中未检出乙醇成分；', '王XX的血液中检测出乙醇成分，含量为17．1mg／100ml。 11、道路交通事故认定书证明，被告人宋X负此事故的全部责任，被害人王XX无责任。 12、道路交通事故现场勘查笔录、道路交通事故现场图及现场照片证明，肇事现场和肇事车辆的具体情况。', '141');

-- ----------------------------
-- Table structure for test_sort
-- ----------------------------
DROP TABLE IF EXISTS `test_sort`;
CREATE TABLE `test_sort` (
  `dataid` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `subtask_id` int(11) DEFAULT NULL,
  `contrastcontent` text,
  `itemid` int(11) DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `sortid` int(11) DEFAULT NULL,
  PRIMARY KEY (`dataid`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_sort
-- ----------------------------
INSERT INTO `test_sort` VALUES ('40', '53', '1', null, '1', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '3');
INSERT INTO `test_sort` VALUES ('41', '53', '1', null, '2', '该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。', '2');
INSERT INTO `test_sort` VALUES ('42', '53', '1', null, '3', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '1');
INSERT INTO `test_sort` VALUES ('43', '53', '1', null, '4', '公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；', '4');
INSERT INTO `test_sort` VALUES ('44', '54', '1', '据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。\n各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；\n交通费2000元；衣物及摩托车损失费2000元。共计赔偿人民币616131元。\n附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。\n关于刑事部分，被告人宋X对公诉机关指控的犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。\n附带民事诉讼被告保险公司的委托代理人同意在交强险保额内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。', '1', '经鉴定，被害人王XX系因机动车肇事致肠系膜多处破裂出血、肝脏右叶外侧缘多处破裂出血、引起急性失血休克而死亡。', '3');
INSERT INTO `test_sort` VALUES ('45', '54', '1', '据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。\n各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；\n交通费2000元；衣物及摩托车损失费2000元。共计赔偿人民币616132元。\n附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。\n关于刑事部分，被告人宋X对公诉机关指控的犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。\n附带民事诉讼被告保险公司的委托代理人同意在交强险保额内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。', '2', '该事故由辽阳市交通警察支队弓长岭交警大队认定，被告人宋X应负此事故全部责任，王XX无责任。 案后，被告人宋X到公安机关投案。', '2');
INSERT INTO `test_sort` VALUES ('46', '54', '1', '据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。\n各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；\n交通费2000元；衣物及摩托车损失费2000元。共计赔偿人民币616133元。\n附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。\n关于刑事部分，被告人宋X对公诉机关指控的犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。\n附带民事诉讼被告保险公司的委托代理人同意在交强险保额内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。', '3', '辽阳市弓长岭区人民检察院指控： 2015年7月8日22时35分，被告人宋X驾驶辽K392XX号夏利轿车由汤河水库向辽阳市弓长岭区滑雪场方向行驶，当行驶至辽阳市弓长岭区滨河路庞家崴子路段时，因忽视安全，逆向行驶至左侧，与对面由被害人王XX驾驶的辽K105XX号二轮摩托车相撞，造成王XX当场死亡。', '1');
INSERT INTO `test_sort` VALUES ('47', '54', '1', '据此，公诉机关认为：被告人宋X的行为已触犯《中华人民共和国刑法》第一百三十三条之规定，应以交通肇事罪追究其刑事责任。\n各附带民事诉讼原告人要求被告人宋X赔偿误工费2390．1元；死亡赔偿金407148元；丧葬费24555元；精神损失抚慰金174492元；被抚养人生活费3545．9元；\n交通费2000元；衣物及摩托车损失费2000元。共计赔偿人民币616134元。\n附带民事原告人没有向法庭提供证据。 保险公司向法庭提供的证据有交强险保险单。\n关于刑事部分，被告人宋X对公诉机关指控的犯罪事实及罪名没有异议，但对道路交通事故认定书有异议，认为宋X与被害人应付同等责任；关于民事部分，被告人宋X无异议。\n附带民事诉讼被告保险公司的委托代理人同意在交强险保额内赔偿，但对精神损害抚慰金的赔偿要求有异议，认为其是附带民事案件没有此赔偿；要求赔偿的被抚养人不是附带民事原告人，不予赔偿。', '4', '公诉机关为上述指控向本院提供了书证：机动车驾驶证、机动车行驶证、驾驶人信息查询结果单、机动车信息查询结果、二轮摩托车行驶证复印件、二轮摩托车驾驶证复印件、机动车强制保险单副本、死亡证明、证明、机动车扣押行政强制手续、道路交通事故责任认定书、道路交通事故现场勘查笔录及照片；', '4');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(80) NOT NULL COMMENT '用户昵称',
  `email` varchar(100) NOT NULL COMMENT '用户邮箱',
  `password` varchar(80) NOT NULL COMMENT '用户密码',
  `sex` varchar(20) DEFAULT NULL COMMENT '男#女',
  `birthday` varchar(50) DEFAULT NULL COMMENT '出生日期',
  `regTime` varchar(50) DEFAULT NULL COMMENT '注册时间',
  `lastLogInTime` varchar(50) DEFAULT NULL COMMENT '上次登陆时间',
  `job` varchar(50) DEFAULT NULL COMMENT '用户职业',
  `taskid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '巴卫君', 'wqueenangle@163.com', '123456', '2017-03-28 09:40:31', '女', '1995-03-28', '2017-03-28 09:40:31', 'student', null, null);
INSERT INTO `user` VALUES ('2', '小埋酱', '479681178@qq.com', '123456', null, null, '2019-02-06 22:38:44', null, null, null, null);
INSERT INTO `user` VALUES ('3', 'test', 'wqueenangl@163.com', '123456', null, null, '2019-02-08 13:46:21', null, null, null, null);
INSERT INTO `user` VALUES ('4', 'mp1832034', '865833921', 'xu123dong', null, null, '2019-06-04 14:53:07', null, null, null, null);
INSERT INTO `user` VALUES ('5', 'root', '', '123456', null, null, '2020-03-20 16:15:09', null, null, null, null);

-- ----------------------------
-- Table structure for user_subtask
-- ----------------------------
DROP TABLE IF EXISTS `user_subtask`;
CREATE TABLE `user_subtask` (
  `uts_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL,
  `subtask_id` int(11) DEFAULT NULL,
  `done` varchar(255) DEFAULT NULL,
  `dotime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uts_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_subtask
-- ----------------------------
INSERT INTO `user_subtask` VALUES ('53', '4', '73', '515', 'yes', null);
INSERT INTO `user_subtask` VALUES ('54', '4', '73', '516', 'yes', null);
INSERT INTO `user_subtask` VALUES ('55', '4', '73', '517', 'yes', '20-3-24 下午11:49');
INSERT INTO `user_subtask` VALUES ('60', '4', '73', '518', 'yes', '20-3-25 上午12:11');
INSERT INTO `user_subtask` VALUES ('61', '4', '74', '519', 'yes', '20-3-26 下午8:52');
INSERT INTO `user_subtask` VALUES ('62', '4', '74', '520', 'no', null);
INSERT INTO `user_subtask` VALUES ('63', '4', '75', '523', 'yes', '20-3-25 上午3:03');
INSERT INTO `user_subtask` VALUES ('64', '4', '75', '524', 'no', null);
INSERT INTO `user_subtask` VALUES ('65', '4', '76', '536', 'yes', '20-3-25 上午3:20');
INSERT INTO `user_subtask` VALUES ('66', '4', '76', '537', 'yes', '20-3-25 上午3:20');
INSERT INTO `user_subtask` VALUES ('67', '4', '76', '538', 'yes', '20-3-25 上午3:21');
INSERT INTO `user_subtask` VALUES ('68', '4', '76', '539', 'no', null);
INSERT INTO `user_subtask` VALUES ('70', '4', '74', '521', 'no', null);
INSERT INTO `user_subtask` VALUES ('71', '4', '77', '550', 'no', null);
INSERT INTO `user_subtask` VALUES ('72', '4', '79', '162', 'yes', '20-3-30 下午7:28');
INSERT INTO `user_subtask` VALUES ('73', '4', '82', '169', 'yes', '20-3-30 下午9:04');
INSERT INTO `user_subtask` VALUES ('74', '4', '84', '175', 'yes', '20-3-30 下午9:47');
INSERT INTO `user_subtask` VALUES ('75', '4', '86', '179', 'yes', '20-3-30 下午9:48');
INSERT INTO `user_subtask` VALUES ('76', '4', '77', '559', 'yes', '20-3-30 下午5:00');
INSERT INTO `user_subtask` VALUES ('77', '4', '79', '163', 'yes', '20-3-30 下午7:35');
INSERT INTO `user_subtask` VALUES ('78', '4', '88', '183', 'yes', '20-3-30 下午7:39');
INSERT INTO `user_subtask` VALUES ('79', '4', '88', '184', 'yes', '20-3-30 下午7:40');
INSERT INTO `user_subtask` VALUES ('80', '4', '77', '560', 'no', null);
INSERT INTO `user_subtask` VALUES ('81', '4', '82', '170', 'no', null);
INSERT INTO `user_subtask` VALUES ('82', '4', '89', '185', 'yes', '20-3-30 下午11:33');
INSERT INTO `user_subtask` VALUES ('83', '4', '89', '186', 'yes', '20-3-30 下午11:47');
INSERT INTO `user_subtask` VALUES ('84', '4', '90', '187', 'yes', '20-3-30 下午11:53');
INSERT INTO `user_subtask` VALUES ('85', '4', '90', '188', 'no', null);
INSERT INTO `user_subtask` VALUES ('86', '4', '84', '176', 'no', null);
