
-- ----------------------------
-- 文件基础信息表
-- ----------------------------
use textannotation;
DROP TABLE IF EXISTS `document`;
CREATE TABLE `document` (
  `did` INT(11) NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `filename` varchar(100) DEFAULT NULL COMMENT '文件名',
  `filetype` varchar(30) DEFAULT NULL COMMENT '文件类型',
  `filesize` INT(11) DEFAULT NULL COMMENT '文件大小',
  `relativepath` varchar(255) DEFAULT NULL COMMENT '相对路径',
  `absolutepath` varchar(255) DEFAULT NULL COMMENT '绝对路径',
  `docuploadtime` varchar(50) DEFAULT NULL COMMENT '上传时间',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`did`),
  FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
INSERT INTO `document` VALUES ('1', 'test', '.doc', '20', 'path', 'path', '2017-12-07 11:17:19', '1');

-- ----------------------------
-- 文件内容表1
-- doc->paragraph形式
-- ----------------------------
use textannotation;
DROP TABLE IF EXISTS `paragraph`;
CREATE TABLE `paragraph` (
  `pid` int(11) NOT NULL AUTO_INCREMENT COMMENT '段落内容ID',
  `paracontent` varchar(20000) DEFAULT NULL COMMENT '段落内容',
  `paraindex` INT(11) DEFAULT NULL COMMENT '段落索引',
  `document_id` INT(11) NOT NULL COMMENT '文件ID',
  PRIMARY KEY (`pid`),
  FOREIGN KEY (`document_id`) REFERENCES `document` (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
INSERT INTO `paragraph` VALUES ('1', '第一段的内容','1','1');
INSERT INTO `paragraph` VALUES ('2', '第二段的内容','2','1');
INSERT INTO `paragraph` VALUES ('3', '第三段的内容','3', '1');

-- ----------------------------
-- 文件内容表2
-- doc->instance形式
-- ----------------------------
use textannotation;
DROP TABLE IF EXISTS `instance`;
CREATE TABLE `instance` (
  `instid` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'instanceID',
  `instindex` INT(11) DEFAULT NULL COMMENT 'doc里的第几段，1、2、3等等',
  `document_id` INT(11) NOT NULL COMMENT '文件ID',
  `labelnum` INT(11) DEFAULT NULL COMMENT '发布者选择做任务贴几个标签',
  PRIMARY KEY (`instid`),
  FOREIGN KEY (`document_id`) REFERENCES `document` (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `instance` VALUES ('1', '1','1','1');
INSERT INTO `instance` VALUES ('2', '1','1','1');

-- ----------------------------
-- instance内容表1
-- instance->item
-- ----------------------------
use textannotation;
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `itid` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'itemID',
  `itemcontent` varchar(20000) DEFAULT NULL COMMENT 'item内容',
  `itemindex` INT(11) NOT NULL COMMENT '取值1或2',
  `instance_id` INT(11) NOT NULL NULL COMMENT '对应instanceID',
  `labelnum` INT(11) DEFAULT NULL COMMENT '发布者选择做任务贴几个标签',
  PRIMARY KEY (`itid`),
  FOREIGN KEY (`instance_id`) REFERENCES `instance` (`instid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
INSERT INTO `item` VALUES ('1', 'item测试内容','1','1','2');
INSERT INTO `item` VALUES ('2', 'item测试内容','2','1','3');

-- ----------------------------
-- instance内容表2
-- instance->listitem
-- ----------------------------
use textannotation;
DROP TABLE IF EXISTS `listitem`;
CREATE TABLE `listitem` (
  `ltid` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'listitemID',
  `litemcontent` varchar(20000) DEFAULT NULL COMMENT 'listitem内容',
  `list_index` INT(11) NOT NULL COMMENT '取值1或2,属于第一个list还是第二个list',
  `litemindex` INT(11) DEFAULT NULL COMMENT '取值1、2、3等,属于第几个listitem',
  `instance_id` INT(11) DEFAULT NULL COMMENT '对应instanceID',
  PRIMARY KEY (`ltid`),
  FOREIGN KEY (`instance_id`) REFERENCES `instance` (`instid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
INSERT INTO `listitem` VALUES ('1', 'listitem测试内容','1','1','1');
INSERT INTO `listitem` VALUES ('2', 'listitem测试内容','2','1','1');




