/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb3 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `t017`;
CREATE DATABASE IF NOT EXISTS `t017` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `t017`;

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='配置文件';

DELETE FROM `config`;
INSERT INTO `config` (`id`, `name`, `value`) VALUES
	(1, 'picture1', 'http://localhost:8080/springbootvtgh9/upload/picture1.jpg'),
	(2, 'picture2', 'http://localhost:8080/springbootvtgh9/upload/picture2.jpg'),
	(3, 'picture3', 'http://localhost:8080/springbootvtgh9/upload/picture3.jpg'),
	(6, 'homepage', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png');

DROP TABLE IF EXISTS `exampaper`;
CREATE TABLE IF NOT EXISTS `exampaper` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(200) NOT NULL COMMENT '试卷名称',
  `time` int NOT NULL COMMENT '考试时长(分钟)',
  `status` int NOT NULL DEFAULT '0' COMMENT '试卷状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1703070663547 DEFAULT CHARSET=utf8mb3 COMMENT='试卷表';

DELETE FROM `exampaper`;
INSERT INTO `exampaper` (`id`, `addtime`, `name`, `time`, `status`) VALUES
	(1703070663540, '2023-12-20 11:11:02', '测试试卷1', 60, 1),
	(1703070663541, '2023-12-20 11:11:02', '测试试卷2', 60, 1),
	(1703070663542, '2023-12-20 11:11:02', '测试试卷3', 60, 1),
	(1703070663543, '2023-12-20 11:11:02', '测试试卷4', 60, 1),
	(1703070663544, '2023-12-20 11:11:02', '测试试卷5', 60, 1),
	(1703070663545, '2023-12-20 11:11:02', '测试试卷6', 60, 1),
	(1703070663546, '2023-12-20 11:11:02', '测试试卷7', 60, 1);

DROP TABLE IF EXISTS `examquestion`;
CREATE TABLE IF NOT EXISTS `examquestion` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `paperid` bigint NOT NULL COMMENT '所属试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `type` bigint DEFAULT '0' COMMENT '试题类型，0：单选题 1：多选题 2：判断题 3：填空题（暂不考虑多项填空）',
  `sequence` bigint DEFAULT '100' COMMENT '试题排序，值越大排越前面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1703070748820 DEFAULT CHARSET=utf8mb3 COMMENT='试题表';

DELETE FROM `examquestion`;
INSERT INTO `examquestion` (`id`, `addtime`, `paperid`, `papername`, `questionname`, `options`, `score`, `answer`, `analysis`, `type`, `sequence`) VALUES
	(1703070748810, '2023-12-20 11:12:28', 1703070663540, '测试试卷1', '1+1=？', '[{"text":"A.1","code":"A"},{"text":"B.2","code":"B"},{"text":"C.3","code":"C"},{"text":"D.4","code":"D"}]', 5, 'B', '测试', 0, 1),
	(1703070748811, '2023-12-20 11:12:28', 1703070663540, '测试试卷1', '1+1=？', '[{"text":"A.1","code":"A"},{"text":"B.2","code":"B"},{"text":"C.3","code":"C"},{"text":"D.4","code":"D"}]', 5, 'B', '测试', 0, 1),
	(1703070748812, '2023-12-20 11:12:28', 1703070663540, '测试试卷1', '1+1=？', '[{"text":"A.1","code":"A"},{"text":"B.2","code":"B"},{"text":"C.3","code":"C"},{"text":"D.4","code":"D"}]', 5, 'B', '测试', 0, 1),
	(1703070748813, '2023-12-20 11:12:28', 1703070663540, '测试试卷1', '1+1=？', '[{"text":"A.1","code":"A"},{"text":"B.2","code":"B"},{"text":"C.3","code":"C"},{"text":"D.4","code":"D"}]', 5, 'B', '测试', 0, 1),
	(1703070748814, '2023-12-20 11:12:28', 1703070663540, '测试试卷1', '1+1=？', '[{"text":"A.1","code":"A"},{"text":"B.2","code":"B"},{"text":"C.3","code":"C"},{"text":"D.4","code":"D"}]', 5, 'B', '测试', 0, 1);

DROP TABLE IF EXISTS `examrecord`;
CREATE TABLE IF NOT EXISTS `examrecord` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `paperid` bigint NOT NULL COMMENT '试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionid` bigint NOT NULL COMMENT '试题id（外键）',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `myscore` bigint NOT NULL DEFAULT '0' COMMENT '试题得分',
  `myanswer` varchar(200) DEFAULT NULL COMMENT '考生答案',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1703071099910 DEFAULT CHARSET=utf8mb3 COMMENT='考试记录表';

DELETE FROM `examrecord`;
INSERT INTO `examrecord` (`id`, `addtime`, `userid`, `username`, `paperid`, `papername`, `questionid`, `questionname`, `options`, `score`, `answer`, `analysis`, `myscore`, `myanswer`) VALUES
	(1703071095960, '2023-12-20 11:18:15', 11, NULL, 1703070663540, '测试试卷1', 1703070748810, '1+1=？', '[{"text":"A.1","code":"A"},{"text":"B.2","code":"B"},{"text":"C.3","code":"C"},{"text":"D.4","code":"D"}]', 5, 'B', '测试', 5, 'B'),
	(1703071098001, '2023-12-20 11:18:17', 11, NULL, 1703070663540, '测试试卷1', 1703070748811, '1+1=？', '[{"text":"A.1","code":"A"},{"text":"B.2","code":"B"},{"text":"C.3","code":"C"},{"text":"D.4","code":"D"}]', 5, 'B', '测试', 5, 'B'),
	(1703071098180, '2023-12-20 11:18:18', 11, NULL, 1703070663540, '测试试卷1', 1703070748812, '1+1=？', '[{"text":"A.1","code":"A"},{"text":"B.2","code":"B"},{"text":"C.3","code":"C"},{"text":"D.4","code":"D"}]', 5, 'B', '测试', 5, 'B'),
	(1703071099185, '2023-12-20 11:18:18', 11, NULL, 1703070663540, '测试试卷1', 1703070748813, '1+1=？', '[{"text":"A.1","code":"A"},{"text":"B.2","code":"B"},{"text":"C.3","code":"C"},{"text":"D.4","code":"D"}]', 5, 'B', '测试', 5, 'B'),
	(1703071099909, '2023-12-20 11:18:19', 11, NULL, 1703070663540, '测试试卷1', 1703070748814, '1+1=？', '[{"text":"A.1","code":"A"},{"text":"B.2","code":"B"},{"text":"C.3","code":"C"},{"text":"D.4","code":"D"}]', 5, 'B', '测试', 5, 'B');

DROP TABLE IF EXISTS `token`;
CREATE TABLE IF NOT EXISTS `token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='token表';

DELETE FROM `token`;
INSERT INTO `token` (`id`, `userid`, `username`, `tablename`, `role`, `token`, `addtime`, `expiratedtime`) VALUES
	(1, 1, 'admin', 'users', '管理员', '0qvhg3w029cd6x2zgp4vgk7l6dbp9u61', '2023-12-20 11:07:09', '2023-12-20 12:17:22'),
	(2, 11, '用户1', 'yonghu', '用户', 'vx7att9oakasv9df9ia7a47yapw8260z', '2023-12-20 11:14:23', '2023-12-20 12:18:06');

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='用户表';

DELETE FROM `users`;
INSERT INTO `users` (`id`, `username`, `password`, `role`, `addtime`) VALUES
	(1, 'admin', '123456', '管理员', '2021-05-04 09:24:46');

DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE IF NOT EXISTS `yonghu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zhanghao` varchar(200) NOT NULL COMMENT '账号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `youxiang` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `zhaopian` varchar(200) DEFAULT NULL COMMENT '照片',
  `beizhu` longtext COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `zhanghao` (`zhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COMMENT='用户';

DELETE FROM `yonghu`;
INSERT INTO `yonghu` (`id`, `addtime`, `zhanghao`, `mima`, `xingming`, `xingbie`, `shouji`, `youxiang`, `zhaopian`, `beizhu`) VALUES
	(11, '2021-05-04 09:24:46', '用户1', '123456', '姓名1', '男', '13823888881', '773890001@qq.com', 'http://localhost:8080/springbootvtgh9/upload/yonghu_zhaopian1.jpg', '备注1'),
	(12, '2021-05-04 09:24:46', '用户2', '123456', '姓名2', '男', '13823888882', '773890002@qq.com', 'http://localhost:8080/springbootvtgh9/upload/yonghu_zhaopian2.jpg', '备注2'),
	(13, '2021-05-04 09:24:46', '用户3', '123456', '姓名3', '男', '13823888883', '773890003@qq.com', 'http://localhost:8080/springbootvtgh9/upload/yonghu_zhaopian3.jpg', '备注3'),
	(14, '2021-05-04 09:24:46', '用户4', '123456', '姓名4', '男', '13823888884', '773890004@qq.com', 'http://localhost:8080/springbootvtgh9/upload/yonghu_zhaopian4.jpg', '备注4'),
	(15, '2021-05-04 09:24:46', '用户5', '123456', '姓名5', '男', '13823888885', '773890005@qq.com', 'http://localhost:8080/springbootvtgh9/upload/yonghu_zhaopian5.jpg', '备注5'),
	(16, '2021-05-04 09:24:46', '用户6', '123456', '姓名6', '男', '13823888886', '773890006@qq.com', 'http://localhost:8080/springbootvtgh9/upload/yonghu_zhaopian6.jpg', '备注6');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
