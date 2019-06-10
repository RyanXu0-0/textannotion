-- ----------------------------
-- 做任务表
-- task
-- ----------------------------
use textannotation;
DROP TABLE IF EXISTS `d_task`;
CREATE TABLE `d_task` (
  `tkid` int(11) NOT NULL AUTO_INCREMENT COMMENT '做任务唯一标识ID',
  `user_id` int(11) DEFAULT NULL COMMENT '做任务的用户ID',
  `task_id` int(11) DEFAULT NULL COMMENT '任务ID',
  `dotime` varchar(40) DEFAULT NULL COMMENT '开始做日期',
  `dcomptime` varchar(40) DEFAULT NULL COMMENT '完成日期',
  `dstatus` varchar(40) DEFAULT NULL COMMENT '任务进行状态',
  `dpercent` VARCHAR(40) DEFAULT NULL COMMENT '任务完成百分比',
  `alreadypart` int(11) DEFAULT NULL COMMENT '已经做了的部分个数',
  `totalpart` int(11) DEFAULT NULL COMMENT '总的部分，可以是para总数，也可以是instance总数',
  PRIMARY KEY (`tkid`),
  FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  FOREIGN KEY (`task_id`) REFERENCES `task` (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `d_task` VALUES ('1', '1','1','2017-03-28 09:40:31','2017-03-28 09:40:31','进行中','0%');
INSERT INTO `d_task` VALUES ('2', '1','1','2017-03-28 09:40:31','2017-03-28 09:40:31','进行中','10%');
INSERT INTO `d_task` VALUES ('3', '1','1','2017-03-28 09:40:31','2017-03-28 09:40:31','进行中','20%');


-- ----------------------------
-- 做任务表
-- paragraph
-- ----------------------------
use textannotation;
DROP TABLE IF EXISTS `d_paragraph`;
CREATE TABLE `d_paragraph` (
  `dtid` int(11) NOT NULL AUTO_INCREMENT COMMENT '做任务唯一标识ID',
  `document_id` INT(11) NOT NULL COMMENT '文件ID',
  `paragraph_id` int(11) NOT NULL COMMENT '做任务段落ID',
  `dotime` varchar(40) DEFAULT NULL COMMENT '开始做日期',
  `comptime` varchar(40) DEFAULT NULL COMMENT '完成日期',
  `dtstatus` varchar(40) DEFAULT NULL COMMENT '任务进行状态',
  `dtask_id` INT(11) NOT NULL COMMENT '做任务taskid',
  PRIMARY KEY (`dtid`),
  FOREIGN KEY (`paragraph_id`) REFERENCES `paragraph` (`pid`),
  FOREIGN KEY (`document_id`) REFERENCES `document` (`did`),
  FOREIGN KEY (`dtask_id`) REFERENCES `d_task` (`tkid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `d_paragraph` VALUES ('1', '1','1','2017-03-28 09:40:31','2017-03-28 09:40:31','进行中','1');
INSERT INTO `d_paragraph` VALUES ('2', '1','1','2017-03-28 09:40:31','2017-03-28 09:40:31','进行中','1');
INSERT INTO `d_paragraph` VALUES ('3', '1','1','2017-03-28 09:40:31','2017-03-28 09:40:31','进行中','1');


-- ----------------------------
-- 做任务表
-- instance
-- ----------------------------
use textannotation;
DROP TABLE IF EXISTS `d_instance`;
CREATE TABLE `d_instance` (
  `dtid` int(11) NOT NULL AUTO_INCREMENT COMMENT '做任务唯一标识ID',
  `document_id` INT(11) NOT NULL COMMENT '文件ID',
  `instance_id` int(11) NOT NULL COMMENT '做任务段落ID',
  `dotime` varchar(40) DEFAULT NULL COMMENT '开始做日期',
  `comptime` varchar(40) DEFAULT NULL COMMENT '完成日期',
  `dtstatus` varchar(40) DEFAULT NULL COMMENT '任务进行状态',
  `dtask_id` INT(11) NOT NULL COMMENT '做任务taskid',
  PRIMARY KEY (`dtid`),
  FOREIGN KEY (`instance_id`) REFERENCES `instance` (`instid`),
  FOREIGN KEY (`document_id`) REFERENCES `document` (`did`),
  FOREIGN KEY (`dtask_id`) REFERENCES `d_task` (`tkid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `d_instance` VALUES ('1', '1','1','2017-03-28 09:40:31','2017-03-28 09:40:31','进行中','1');
INSERT INTO `d_instance` VALUES ('2', '1','1','2017-03-28 09:40:31','2017-03-28 09:40:31','进行中','1');
INSERT INTO `d_instance` VALUES ('3', '1','1','2017-03-28 09:40:31','2017-03-28 09:40:31','进行中','1');


-- ----------------------------
-- 做任务内容表
-- type1->信息抽取
-- ----------------------------
use textannotation;
DROP TABLE IF EXISTS `dt_extraction`;
CREATE TABLE `dt_extraction` (
  `dtd_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '做任务详细描述ID',
  `dt_id` int(11) NOT NULL COMMENT '做任务ID',
  `label_id` int(11) DEFAULT NULL COMMENT '做任务详细描述标签ID',
  `index_begin` int(11) DEFAULT NULL COMMENT 'label对应的content开始位置',
  `index_end` int(11) DEFAULT NULL COMMENT 'label对应的content结束位置',
  PRIMARY KEY (`dtd_id`),
  FOREIGN KEY (`dt_id`) REFERENCES `d_paragraph` (`dtid`),
  FOREIGN KEY (`label_id`) REFERENCES `label` (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `dt_extraction` VALUES ('1', '1','1','1','2');
INSERT INTO `dt_extraction` VALUES ('2', '1','1','2','3');
INSERT INTO `dt_extraction` VALUES ('3', '1','1','3','4');

-- ----------------------------
-- 做任务内容表
-- type2->文本分类
-- ----------------------------
use textannotation;
DROP TABLE IF EXISTS `dt_classify`;
CREATE TABLE `dt_classify` (
  `dtd_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '做任务详细描述ID',
  `dt_id` int(11) NOT NULL COMMENT '做任务ID',
  `label_id` int(11) DEFAULT NULL COMMENT '做任务详细描述标签ID',
  `goodlabel` int(11) DEFAULT NULL COMMENT '点赞数',
  `badlabel` int(11) DEFAULT NULL COMMENT '踩数量',
  PRIMARY KEY (`dtd_id`),
  FOREIGN KEY (`dt_id`) REFERENCES `d_paragraph` (`dtid`),
  FOREIGN KEY (`label_id`) REFERENCES `label` (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `dt_classify` VALUES ('1', '1','1','1','2');
INSERT INTO `dt_classify` VALUES ('2', '1','1','1','2');
INSERT INTO `dt_classify` VALUES ('3', '1','1','1','2');

-- ----------------------------
-- 做任务内容表
-- type3->文本关系
-- ----------------------------
use textannotation;
DROP TABLE IF EXISTS `dt_relation`;
CREATE TABLE `dt_relation` (
  `dtd_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '做任务详细描述ID',
  `dt_id` int(11) NOT NULL COMMENT '做任务ID',
  `labeltype` VARCHAR(80) DEFAULT NULL COMMENT '仅可取值instance#item1#item2',
  `label_id` int(11) DEFAULT NULL COMMENT '标签ID',
  PRIMARY KEY (`dtd_id`),
  FOREIGN KEY (`dt_id`) REFERENCES `d_instance` (`dtid`),
  FOREIGN KEY (`label_id`) REFERENCES `label` (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
INSERT INTO `dt_relation` VALUES ('1','1', '1','instance','1');

-- ----------------------------
-- 做任务内容表
-- type4->文本配对
-- ----------------------------
use textannotation;
DROP TABLE IF EXISTS `dt_pairing`;
CREATE TABLE `dt_pairing` (
  `dtd_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '做任务详细描述ID',
  `dt_id` int(11) NOT NULL COMMENT '做任务ID',
  `a_litemid` int(11) DEFAULT NULL COMMENT 'listitemID',
  `b_litemid` int(11) DEFAULT NULL COMMENT 'listitemID',
  PRIMARY KEY (`dtd_id`),
  FOREIGN KEY (`dt_id`) REFERENCES `d_instance` (`dtid`),
  FOREIGN KEY (`a_litemid`) REFERENCES `listitem` (`ltid`),
  FOREIGN KEY (`b_litemid`) REFERENCES `listitem` (`ltid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
INSERT INTO `dt_pairing` VALUES ('1', '1','1','2');

-- ----------------------------
-- 做任务内容表
-- type5&6->文本排序
-- ----------------------------
use textannotation;
DROP TABLE IF EXISTS `dt_sorting`;
CREATE TABLE `dt_sorting` (
  `dtd_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '做任务详细描述ID',
  `dt_id` int(11) NOT NULL COMMENT '做任务ID',
  `item_id` int(11) NOT NULL COMMENT 'itemID',
  `newindex` int(11) NOT NULL COMMENT 'newindex',
  PRIMARY KEY (`dtd_id`),
  FOREIGN KEY (`dt_id`) REFERENCES `d_instance` (`dtid`),
  FOREIGN KEY (`item_id`) REFERENCES `item` (`itid`),
  UNIQUE KEY `dt_id` (`dt_id`,`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
INSERT INTO `dt_sorting` VALUES ('1','1','1','2');


-- ----------------------------
-- classify类型点赞
--
-- ----------------------------
use textannotation;
DROP TABLE IF EXISTS `dtu_comment`;
CREATE TABLE `dtu_comment` (
  `dtu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '做任务详细描述ID',
  `dtd_id` int(11) NOT NULL COMMENT '做任务ID',
  `u_id` int(11) DEFAULT NULL COMMENT '做任务详细描述标签ID',
  `cnum` int(11) DEFAULT NULL COMMENT 'label对应的content开始位置',
  PRIMARY KEY (`dtu_id`),
  FOREIGN KEY (`dtd_id`) REFERENCES `dt_classify` (`dtdid`),
  FOREIGN KEY (`u_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;