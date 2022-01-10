CREATE TABLE `booking` (
  `num` int(11) NOT NULL AUTO_INCREMENT COMMENT '번호',
  `event` varchar(15) NOT NULL COMMENT '참여형태',
  `name` varchar(20) DEFAULT NULL COMMENT '신청인',
  `tel` varchar(13) DEFAULT NULL COMMENT '연락처',
  `member` int(3) DEFAULT NULL COMMENT '참여인원',
  `vDate` date DEFAULT NULL COMMENT 'v참여일',
  `state` varchar(20) DEFAULT '처리대기중' COMMENT '진행상태',
  `pass` varchar(8) NOT NULL COMMENT '비밀번호',
  `ref` smallint(7) DEFAULT NULL COMMENT '원글번호',
  `pos` smallint(7) unsigned DEFAULT NULL COMMENT '답글순서',
  `depth` smallint(7) unsigned DEFAULT NULL COMMENT '들여쓰기값',
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=4014 DEFAULT CHARSET=utf8;