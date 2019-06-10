use textannotation;
DROP TABLE IF EXISTS `dtu_comment`;
CREATE TABLE `dtu_comment` (
  `dtu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '做任务详细描述ID',
  `dtd_id` int(11) NOT NULL COMMENT '做任务ID',
  `u_id` int(11) DEFAULT NULL COMMENT '做任务详细描述标签ID',
  `cnum` int(11) DEFAULT NULL COMMENT 'label对应的content开始位置',
  PRIMARY KEY (`dtu_id`),
  FOREIGN KEY (`dtd_id`) REFERENCES `dt_classify` (`dtd_id`),
  FOREIGN KEY (`u_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

use textannotation;
DROP TABLE IF EXISTS `dtasktype`;
CREATE TABLE `dtasktype` (
  `dty_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '该类型是否可以做任务的ID',
  `tasktype` int(11) NOT NULL COMMENT '任务类别',
  `typevalue` int(11) NOT NULL COMMENT '该类型是否可以做任务的值',
  `u_id` int(11) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`dty_id`),
  FOREIGN KEY (`u_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `dtasktype` VALUES ('1', '1','1','1');
INSERT INTO `dtasktype` VALUES ('2', '2','1','1');
INSERT INTO `dtasktype` VALUES ('3', '3','1','1');
INSERT INTO `dtasktype` VALUES ('4', '4','1','1');
INSERT INTO `dtasktype` VALUES ('5', '5','1','1');
INSERT INTO `dtasktype` VALUES ('6', '6','1','1');

use textannotation;
DROP TABLE IF EXISTS `point`;
CREATE TABLE `point` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分ID',
  `deficitvalue` int(11) NOT NULL COMMENT '下载文件亏欠的积分值',
  `obtainvalue` int(11) NOT NULL COMMENT '做任务获取的积分值',
  `u_id` int(11) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`p_id`),
  FOREIGN KEY (`u_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `point` VALUES ('1', '100','100','1');

use textannotation;
DROP TABLE IF EXISTS `pointunit`;
CREATE TABLE `pointunit` (
  `pu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分单位ID',
  `pointunit` int(11) NOT NULL COMMENT '积分单位',
  `task_id` int(11) DEFAULT NULL COMMENT '任务ID',
  PRIMARY KEY (`pu_id`),
  FOREIGN KEY (`task_id`) REFERENCES `task` (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `pointunit` VALUES ('1', '10','1');

