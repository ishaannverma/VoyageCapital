CREATE DATABASE IF NOT EXISTS `projectlogin` DEFAULT CHARACTER SET utf8MB4 COLLATE utf8mb4_general_ci;
USE `projectlogin`;
DROP TABLE userdetails;

CREATE TABLE IF NOT EXISTS `userdetails`(
	 `id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	 `email` varchar(50) NOT NULL,
     `username` varchar(30) UNIQUE NOT NULL,
     `firstname` varchar(50) NOT NULL,
     `lastname` varchar(50) NOT NULL,
     `mobile` bigint NOT NULL,
     `address` varchar(200) NOT NULL
);
DROP TABLE userstock;
CREATE TABLE IF NOT EXISTS `userstock`(
     `id` int(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
     `stock1` char(10) NOT NULL,
     `stock2` char(10) NOT NULL,
     `stock3` char(10) NOT NULL,
     foreign key (id) references userdetails(id)
);

DROP TABLE messages;
CREATE TABLE IF NOT EXISTS `messages`(
	`messageid` int(9) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	 `id` int(9),
     `fname` varchar(50) NOT NULL,
     `email` varchar(100) NOT NULL,
     `message` mediumtext NOT NULL,
     foreign key (id) references userdetails(id)
);
'INSERT INTO userdetails VALUES ( NULL , (SELECT id FROM userdetails WHERE email= %s LIMIT 1) , %s , %s , % s)', (email,fullname,email,message,)
DROP TABLE cache_pred;
CREATE TABLE IF NOT EXISTS `cache_pred`(
      `quote` varchar(10),
	  `arima_pred` float(50),
      `lstm_pred` float(50),
      `lr_pred` float(50),
      `error_lr` float(30), 
      `error_lstm` float(30),
      `error_arima` float(30),
      `forecast1` float(30),
      `forecast2` float(30),
      `forecast3` float(30),
      `forecast4` float(30),
      `forecast5` float(30),
      `forecast6` float(30),
      `forecast7` float(30),
      `date` date
);

DROP TABLE cache_twitter;
CREATE TABLE IF NOT EXISTS `cache_twitter`(
      `quote` varchar(10),
	  `tw_pol` varchar(50),
      `tweet1` mediumtext,
      `tweet2` mediumtext,
      `tweet3` mediumtext,
      `tweet4` mediumtext,
      `tweet5` mediumtext,
      `tweet6` mediumtext,
      `tweet7` mediumtext,
      `tweet8` mediumtext,
      `tweet9` mediumtext,
      `tweet10` mediumtext,
      `tweet11` mediumtext,
      `tweet12` mediumtext,
      `tweet13` mediumtext,
      `tweet14` mediumtext,
      `tweet15` mediumtext,
      `tweet16` mediumtext,
      `tweet17` mediumtext,
      `tweet18` mediumtext,
      `tweet19` mediumtext,
      `tweet20` mediumtext,
      `idea` varchar(50),
      `decision` varchar(50),
      `date` date
);

DROP TABLE history;
CREATE TABLE IF NOT EXISTS `history`(
     `id` int(9) NOT NULL,
     `symbol` varchar(50) NOT NULL,
     PRIMARY KEY (id,symbol)
);

DROP TABLE images_pred;
CREATE TABLE IF NOT EXISTS `images_pred`(
     `quote` MEDIUMBLOB,
     `arima` MEDIUMBLOB ,
	 `lstm` MEDIUMBLOB,
	 `lr` MEDIUMBLOB,
	 `trends` MEDIUMBLOB,
     `tweet` MEDIUMBLOB,
     `date` date
);



select * from userdetails;
select * from userstock;
select * from messages;
select * from cache_pred;
select * from cache_twitter;
select * from history;
select * from images_pred;

select symbol,count(symbol) from history
group by symbol
order by count(symbol) desc
LIMIT 3;