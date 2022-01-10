CREATE TABLE `tblMember` (
  `id` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `e-mail` varchar(30) NOT NULL,
  `tel` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO tblMember VALUES('admin','qwerty','admin','admin@naver.com','010-1234-5678');