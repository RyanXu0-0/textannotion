
-- ----------------------------
-- 任务类型表
-- ----------------------------
use textannotation;
DROP TABLE IF EXISTS `tasktype`;
CREATE TABLE `tasktype` (
  `typeid` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务类型ID',
  `typename` varchar(50) DEFAULT NULL COMMENT '任务类型名称',
  PRIMARY KEY (`typeid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
INSERT INTO `tasktype` VALUES ('1', '信息抽取');
INSERT INTO `tasktype` VALUES ('2', '文本分类');
INSERT INTO `tasktype` VALUES ('3', '文本关系');
INSERT INTO `tasktype` VALUES ('4', '文本配对');
INSERT INTO `tasktype` VALUES ('5', '文本排序');
INSERT INTO `tasktype` VALUES ('6', '类比排序');

-- ----------------------------
-- 任务表
-- ----------------------------
use textannotation;
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `tid` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `title` varchar(255) DEFAULT NULL COMMENT '任务名称',
  `description` varchar(255) DEFAULT NULL COMMENT '任务描述',
  `type_name`  varchar(50) DEFAULT NULL COMMENT '任务类型',
  `createtime` varchar(255) DEFAULT NULL COMMENT '创建日期',
  `deadline` varchar(255) DEFAULT NULL COMMENT '截止日期',
  `taskcompstatus` varchar(40) DEFAULT NULL COMMENT '任务进行状态',
  `otherinfo` varchar(255) DEFAULT NULL COMMENT '其他备注',
  `user_id` INT(11) NOT NULL COMMENT '用户ID',
  `viewnum` INT(11) DEFAULT NULL COMMENT '浏览次数,初始为0',
  `attendnum` INT(11) DEFAULT NULL COMMENT '参与人数',
  PRIMARY KEY (`tid`),
  FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
INSERT INTO `task` VALUES ('1', '测试', '任务描述','1', '2017-03-28 09:40:31', '2017-03-28 09:40:31', '进行中','备注','1','0','0');

-- ----------------------------
-- 任务-文件 关系表
-- ----------------------------
use textannotation;
DROP TABLE IF EXISTS `task_document`;
CREATE TABLE `task_document` (
  `task_id` int(11) NOT NULL COMMENT '任务ID',
  `document_id` INT(11) NOT NULL COMMENT '文件ID',
  FOREIGN KEY (`task_id`) REFERENCES `task` (`tid`),
  FOREIGN KEY (`document_id`) REFERENCES `document` (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `task_document` VALUES ('1', '1');

-- ----------------------------
-- 标签表
-- ----------------------------
use textannotation;
DROP TABLE IF EXISTS `label`;
CREATE TABLE `label` (
  `lid` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签ID',
  `labelname` varchar(255) DEFAULT NULL COMMENT '标签名称',
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
INSERT INTO `label` VALUES ('1', '测试label');

-- ----------------------------
-- 任务-标签 关系表
-- color可为空
-- ----------------------------
use textannotation;
DROP TABLE IF EXISTS `task_label`;
CREATE TABLE `task_label` (
  `task_id` int(11) NOT NULL COMMENT '文件ID',
  `label_id` INT(11) NOT NULL COMMENT '标签ID',
  `color` VARCHAR(40) DEFAULT NULL COMMENT '标签对应的颜色',
  FOREIGN KEY (`task_id`) REFERENCES `task` (`tid`),
  FOREIGN KEY (`label_id`) REFERENCES `label` (`lid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `task_label` VALUES ('1', '1','#ff0000');

-- ----------------------------
-- instance-标签 关系表
-- ----------------------------
use textannotation;
DROP TABLE IF EXISTS `instance_label`;
CREATE TABLE `instance_label` (
  `task_id` int(11) NOT NULL COMMENT '任务ID',
  `labeltype` VARCHAR(11) NOT NULL COMMENT '标签类别：item1#item2#instance',
  `label_id` INT(11) NOT NULL COMMENT '标签id',
  FOREIGN KEY (`label_id`) REFERENCES `label` (`lid`),
  FOREIGN KEY (`task_id`) REFERENCES `task` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `instance_label` VALUES ('1','item1','1');
INSERT INTO `instance_label` VALUES ('2','item2','1');

