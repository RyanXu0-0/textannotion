
-- ----------------------------
-- 用户表
-- ----------------------------
use textannotation;
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(80) NOT NULL COMMENT '用户昵称',
  `email` varchar(100) NOT NULL COMMENT '用户邮箱',
  `password` varchar(80) NOT NULL COMMENT '用户密码',
  `sex` varchar(20) DEFAULT NULL COMMENT '男#女',
  `birthday` varchar(50) DEFAULT NULL COMMENT '出生日期',
  `regTime` VARCHAR(50) DEFAULT NULL COMMENT '注册时间',
  `lastLogInTime` VARCHAR(50) DEFAULT NULL COMMENT '上次登陆时间',
  `job` VARCHAR (50) DEFAULT NULL COMMENT '用户职业',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email`(`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `user` VALUES ('1','test', 'xxx@qq.com', '123456', '2017-03-28 09:40:31','女','1995-03-28', '2017-03-28 09:40:31','student');
