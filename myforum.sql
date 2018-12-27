-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: pkuforum
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Forum`
--

DROP TABLE IF EXISTS `Forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Forum` (
  `id` bigint(20) NOT NULL,
  `banzhuId` bigint(20) DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Forum`
--

LOCK TABLES `Forum` WRITE;
/*!40000 ALTER TABLE `Forum` DISABLE KEYS */;
INSERT INTO `Forum` VALUES (3,31,_binary '\0','同学们好！','娱乐'),(4,53,_binary '\0','兼容并蓄','非主流文化'),(5,47,_binary '\0','计算中心','北京大学');
/*!40000 ALTER TABLE `Forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Log`
--

DROP TABLE IF EXISTS `Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Log` (
  `log_created_time` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Log`
--

LOCK TABLES `Log` WRITE;
/*!40000 ALTER TABLE `Log` DISABLE KEYS */;
INSERT INTO `Log` VALUES ('2018-12-27 14:54:38',24,0);
/*!40000 ALTER TABLE `Log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Post`
--

DROP TABLE IF EXISTS `Post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Post` (
  `id` bigint(20) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `likes` bigint(20) NOT NULL,
  `postedAt` datetime DEFAULT NULL,
  `postedBy_id` bigint(20) DEFAULT NULL,
  `topic_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6hdc1ipo6l77i5856kpa5dqf9` (`postedBy_id`),
  KEY `FKk0ab8mjj94yfpyebhmy5kydc9` (`topic_id`),
  CONSTRAINT `FK6hdc1ipo6l77i5856kpa5dqf9` FOREIGN KEY (`postedBy_id`) REFERENCES `User` (`id`),
  CONSTRAINT `FKk0ab8mjj94yfpyebhmy5kydc9` FOREIGN KEY (`topic_id`) REFERENCES `Topic` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Post`
--

LOCK TABLES `Post` WRITE;
/*!40000 ALTER TABLE `Post` DISABLE KEYS */;
INSERT INTO `Post` VALUES (7,'求教',_binary '\0',1,'2018-12-27 12:12:43',2,6),(23,'不会',_binary '\0',2,'2018-12-27 13:03:41',21,6),(70,'我很喜欢哟',_binary '\0',1,'2018-12-27 14:34:42',2,69),(71,'学校无线网就是垃圾……',_binary '\0',0,'2018-12-27 14:40:17',19,6),(73,'今天晚上在燕南食堂打好饭找座位的时候，被一个急转急停的女生撞到，她的饭菜剐蹭在了我的衣服上。而我，不巧穿着白色的羽绒服，手臂处一大片橙黄色的油渍格外显眼。心中无比郁闷的我放下餐盘，脱下羽绒服去燕南一楼的洗手池擦拭油渍。洗手池旁边就是残食台，工作人员正在认真地收拾同学们放下的餐盘。突然，一道水流飞来，溅到了我的身上。确切地说，不是水，是汤。原来是工作人员收拾汤碗时没有将汤倒干净就直接扔向了身后的箩筐，汤从碗里飞溅了出来。',_binary '\0',7,'2018-12-27 14:41:01',19,72),(74,'从小看火影长大',_binary '\0',7,'2018-12-27 14:41:19',19,69),(76,'很多人认为聪明的人才会成功，其实不是。很多聪明人做事情不能成功，原因有二：一是不能下笨功夫；二是他们没有找到他们价值体系中最重要的事情去做，却去做一些在他的价值观体系中不怎么重要的事情。所以他们内心缺乏全力以赴的动力。\r\n——钱钟书',_binary '\0',3,'2018-12-27 14:42:02',19,75),(77,'鸣人结婚泪目',_binary '\0',4,'2018-12-27 14:42:59',20,69),(78,'pat pat',_binary '\0',0,'2018-12-27 14:43:28',20,72),(79,'三 不想成功',_binary '\0',4,'2018-12-27 14:43:56',20,75),(89,'金庸先生离开我们已近三周了，各方各界都以自己的方式表达了自己的哀思，苍蝇与蚊子也不同程度地消费了一波情怀，如今看来尘埃落定，新的热点已经一波一波地刷了过去。如此，金庸走了，下一个金庸在哪儿，我们是否还需要一个金庸？',_binary '\0',6,'2018-12-27 14:45:51',20,88),(91,'有沒有學大氣之類的現在氣溫-9度上下為甚麼體感卻只有-18度然而我還沒有穿秋褲嗚嗚嗚',_binary '\0',7,'2018-12-27 14:47:01',20,90),(92,'自来也的死真难受',_binary '\0',2,'2018-12-27 14:47:58',22,69),(93,'温度降低了',_binary '\0',0,'2018-12-27 14:48:18',22,90),(94,'四 这个社会的成功和我定义的不一样',_binary '\0',2,'2018-12-27 14:48:42',22,75),(95,'接网线吧',_binary '\0',3,'2018-12-27 14:48:56',22,6),(96,'品质',_binary '\0',2,'2018-12-27 14:49:24',22,72),(98,'好看',_binary '\0',1,'2018-12-27 14:49:42',22,97),(100,'从正版软件共享平台下载了office2019 的.iso文件，按照要求卸载了之前的版本并且重启后进行安装，可为什么装上的是2016专业增强版？？我确定下载了2019的64位版呀……',_binary '\0',2,'2018-12-27 14:50:15',22,99),(101,'没有火影的童年是不完整的',_binary '\0',2,'2018-12-27 14:51:15',24,69),(102,'侠之大者，为国为民',_binary '\0',2,'2018-12-27 14:51:33',24,88),(103,'成功定义不同',_binary '\0',0,'2018-12-27 14:51:57',24,75),(104,'站卷福华生',_binary '\0',4,'2018-12-27 14:52:22',24,97),(105,'悲哀',_binary '\0',0,'2018-12-27 14:52:39',24,90),(106,'同接网线',_binary '\0',0,'2018-12-27 14:52:58',24,6),(107,'垃圾食堂',_binary '\0',0,'2018-12-27 14:53:19',24,72),(108,'你没看说明',_binary '\0',4,'2018-12-27 14:53:29',24,99),(110,'真的受不了了。每天晚上大概十一点左右开始就连不上校园网，十二点左右才能恢复...学校这是不想让我们学习了吗？？？',_binary '\0',7,'2018-12-27 14:54:10',24,109),(112,'如题',_binary '\0',1,'2018-12-27 14:54:39',24,111),(113,'真爱',_binary '\0',1,'2018-12-27 14:56:08',25,69),(114,'当然需要。',_binary '\0',0,'2018-12-27 14:56:26',25,88),(115,'激情四射',_binary '\0',0,'2018-12-27 14:56:40',25,97),(116,'不是一天两天了',_binary '\0',0,'2018-12-27 14:57:05',25,109),(117,'看官网说明',_binary '\0',0,'2018-12-27 14:57:20',25,99),(118,'当然柯哀啦',_binary '\0',5,'2018-12-27 14:57:43',25,111),(119,'没有金庸就没有现代武侠文学',_binary '\0',1,'2018-12-27 14:58:25',26,88),(120,'卷福超帅',_binary '\0',1,'2018-12-27 14:58:45',26,97),(121,'兰新吧，官配',_binary '\0',1,'2018-12-27 14:58:59',26,111),(122,'还不穿秋裤',_binary '\0',0,'2018-12-27 14:59:16',26,90),(123,'接有线',_binary '\0',3,'2018-12-27 14:59:33',26,109),(124,'software.pku.edu.cn',_binary '\0',1,'2018-12-27 14:59:50',26,99),(125,'莫里亚蒂好骚',_binary '\0',0,'2018-12-27 15:02:10',27,97),(126,'金庸与我们同在',_binary '\0',0,'2018-12-27 15:02:35',27,88),(127,'我是柯基党',_binary '\0',2,'2018-12-27 15:02:58',27,111),(128,'冷风刮得疼',_binary '\0',0,'2018-12-27 15:03:18',27,90),(129,'一句话就是甘坐冷板凳',_binary '\0',0,'2018-12-27 15:03:39',27,75),(130,'一直都是如此',_binary '\0',0,'2018-12-27 15:04:06',27,109),(131,'柯基那个别跑',_binary '\0',0,'2018-12-27 15:05:08',28,111),(132,'看视频也到处卡',_binary '\0',0,'2018-12-27 15:05:42',28,109),(133,'去学五啊',_binary '\0',0,'2018-12-27 15:06:06',28,72),(134,'还是用旧版吧',_binary '\0',0,'2018-12-27 15:06:53',29,99),(135,'雏田酱太美了',_binary '\0',0,'2018-12-27 15:07:42',29,69),(137,'抱走侑酱',_binary '\0',5,'2018-12-27 15:08:01',29,136),(138,'敲好看！佐佑大法好',_binary '\0',1,'2018-12-27 15:08:54',30,136),(139,'讲真农园比燕南还要烦人',_binary '\0',1,'2018-12-27 15:09:27',30,72),(140,'七海灯子出来挨打！',_binary '\0',1,'2018-12-27 15:10:22',31,136),(141,'你是不是接错了',_binary '\0',0,'2018-12-27 15:11:21',31,109),(142,'沙弥香太好看了',_binary '\0',0,'2018-12-27 15:12:17',32,136),(143,'耳朵无知觉了',_binary '\0',0,'2018-12-27 15:12:38',32,90),(144,'大灯蹄子',_binary '\0',0,'2018-12-27 15:21:08',33,136),(145,'哀多可爱',_binary '\0',0,'2018-12-27 15:21:34',33,111),(146,'笑傲江湖，都是回忆',_binary '\0',0,'2018-12-27 15:22:30',34,88),(147,'带个耳罩吧',_binary '\0',0,'2018-12-27 15:22:44',34,90),(148,'怎么这么早就更新了',_binary '\0',0,'2018-12-27 15:23:30',35,99),(149,'我吃喝拉撒也觉得很成功',_binary '\0',0,'2018-12-27 15:23:48',35,75),(150,'我觉得幸福就是成功',_binary '\0',1,'2018-12-27 15:24:17',36,75),(151,'求助信科同学吧',_binary '\0',0,'2018-12-27 15:24:37',36,6),(152,'年轻人就是naive',_binary '\0',0,'2018-12-27 15:26:01',37,90),(153,'兰酱更可爱！',_binary '\0',0,'2018-12-27 15:26:21',37,111),(154,'不怕远去勺园吧',_binary '\0',1,'2018-12-27 15:26:43',37,72),(155,'最喜欢的英剧',_binary '\0',0,'2018-12-27 15:28:12',38,97),(157,'爱不释手',_binary '\0',4,'2018-12-27 15:28:49',38,156),(158,'手不释卷',_binary '\0',1,'2018-12-27 15:29:22',39,156),(159,'我都是用mac的',_binary '\0',0,'2018-12-27 15:29:45',39,99),(160,'卷土重来',_binary '\0',1,'2018-12-27 15:30:18',40,156),(161,'“木叶燃烧的地方”',_binary '\0',0,'2018-12-27 15:30:42',40,69),(162,'来之不易',_binary '\0',0,'2018-12-27 15:32:35',41,156),(163,'计算中心不行',_binary '\0',0,'2018-12-27 15:33:00',41,109),(164,'易如反掌',_binary '\0',1,'2018-12-27 15:34:04',42,156),(165,'请拨打12344444',_binary '\0',1,'2018-12-27 15:34:27',42,6),(166,'掌上明珠',_binary '\0',0,'2018-12-27 15:38:39',43,156),(167,'勺园的鸡腿贼好吃',_binary '\0',0,'2018-12-27 15:38:59',43,72),(168,'珠联璧合',_binary '\0',0,'2018-12-27 15:39:39',44,156),(169,'侑太可爱了',_binary '\0',0,'2018-12-27 15:39:57',44,136),(170,'合而为一',_binary '\0',1,'2018-12-27 15:40:52',45,156),(171,'旗木五五开最帅-.-',_binary '\0',1,'2018-12-27 15:41:25',45,69),(172,'一心一意',_binary '\0',0,'2018-12-27 15:43:07',45,156),(173,'自己搭个路由器吧',_binary '\0',0,'2018-12-27 15:43:31',45,109),(174,'意在笔先',_binary '\0',0,'2018-12-27 15:44:38',46,156),(175,'我爱玛丽',_binary '\0',0,'2018-12-27 15:44:51',46,97),(176,'欢迎联系计算中心，这是官方账号',_binary '\0',0,'2018-12-27 15:45:35',47,6),(177,'成功不就是小确幸吗',_binary '\0',0,'2018-12-27 15:46:06',47,75),(178,'先发制人',_binary '\0',0,'2018-12-27 15:46:48',48,156),(179,'燕南太好吃了',_binary '\0',0,'2018-12-27 15:47:07',48,72),(180,'先发制人',_binary '\0',0,'2018-12-27 15:47:35',49,156),(181,'小孩子才做选择',_binary '\0',0,'2018-12-27 15:48:00',49,97),(182,'人山人海',_binary '\0',0,'2018-12-27 15:49:05',50,156),(183,'举手！',_binary '\0',0,'2018-12-27 15:49:21',50,136),(184,'海市蜃楼',_binary '\0',0,'2018-12-27 15:49:51',51,156),(185,'燕南也好冷',_binary '\0',0,'2018-12-27 15:50:13',51,72),(186,'艾琳艾德勒那集真惊艳',_binary '\0',0,'2018-12-27 15:50:59',52,97),(187,'楼阁亭台',_binary '\0',0,'2018-12-27 15:51:34',52,156),(188,'看看我昵称',_binary '\0',0,'2018-12-27 15:52:02',53,69),(189,'北京伤心大学',_binary '\0',0,'2018-12-27 15:52:21',53,72),(190,'Naruto!\r\nSasuke!',_binary '\0',0,'2018-12-27 15:52:58',54,69),(191,'接不下去了……',_binary '\0',0,'2018-12-27 15:53:34',54,156),(192,'我还是更喜欢小樱',_binary '\0',0,'2018-12-27 15:54:11',55,69),(193,'没意义，看作者',_binary '\0',0,'2018-12-27 15:54:34',55,111),(194,'上纲上线',_binary '\0',0,'2018-12-27 15:55:09',56,75),(195,'建议重启',_binary '\0',0,'2018-12-27 15:55:22',56,6),(196,'学校的怎么可能是假的',_binary '\0',0,'2018-12-27 15:55:53',57,99),(197,'越女剑最好',_binary '\0',0,'2018-12-27 15:56:07',57,88),(198,'你是南方人吗',_binary '\0',0,'2018-12-27 15:56:53',58,90),(199,'燕南石锅！',_binary '\0',0,'2018-12-27 15:57:19',58,72),(200,'大家都好有文化',_binary '\0',0,'2018-12-27 15:58:14',59,156),(201,'竹内顺子太可爱了',_binary '\0',0,'2018-12-27 15:58:59',59,69),(202,'燃烧自己照亮别人就是成功',_binary '\0',0,'2018-12-27 15:59:34',61,75),(203,'佐灯赛高！',_binary '\0',0,'2018-12-27 15:59:51',61,136),(204,'博人传也不错',_binary '\0',0,'2018-12-27 16:00:23',62,69),(205,'都实现就好了',_binary '\0',0,'2018-12-27 16:00:39',62,111),(206,'博人传哪里好看了！',_binary '\0',0,'2018-12-27 16:01:23',63,69),(207,'同九年汝何秀',_binary '\0',0,'2018-12-27 16:01:38',63,156),(209,'平安',_binary '\0',2,'2018-12-27 16:02:30',64,208),(210,'嘤嘤嘤',_binary '\0',0,'2018-12-27 16:02:45',64,90),(211,'同乐同乐',_binary '\0',0,'2018-12-27 16:03:10',65,208),(212,'兰新才现实',_binary '\0',0,'2018-12-27 16:03:35',65,111),(213,'merry Christmas！',_binary '\0',0,'2018-12-27 16:04:21',66,208),(214,'贵校药丸',_binary '\0',0,'2018-12-27 16:04:44',66,75),(215,'谢谢dz！',_binary '\0',0,'2018-12-27 16:05:46',67,208),(216,'理科生默默观望',_binary '\0',0,'2018-12-27 16:06:09',67,156),(217,'别忘了和男女朋友出去玩！',_binary '\0',0,'2018-12-27 16:09:13',19,208),(219,'哈哈哈哈',_binary '',0,'2018-12-27 16:09:35',19,218),(221,'单身狗只能复习',_binary '\0',0,'2018-12-27 16:11:53',220,208),(222,'路由器很不错',_binary '\0',0,'2018-12-27 16:12:07',220,109),(223,'什么，2019好快',_binary '\0',0,'2018-12-27 16:12:24',220,99),(224,'一拳一个嘤嘤怪',_binary '\0',0,'2018-12-27 16:12:43',220,90),(225,'笑书神侠倚碧鸳',_binary '\0',0,'2018-12-27 16:12:56',220,88),(226,'博人传剧情太烂',_binary '\0',0,'2018-12-27 16:13:57',220,69),(227,'不敢说自己是北大的了',_binary '\0',0,'2018-12-27 16:14:21',220,156),(229,'火影真的是情怀',_binary '\0',0,'2018-12-27 16:15:55',228,69),(230,'金庸只是在另一个世界续大侠梦',_binary '\0',0,'2018-12-27 16:16:21',228,88),(231,'最喜欢巴斯克那集',_binary '\0',0,'2018-12-27 16:16:40',228,97),(232,'明年萌王！！！',_binary '\0',0,'2018-12-27 16:17:02',228,136),(233,'太聪明是不能成功的',_binary '\0',0,'2018-12-27 16:17:22',228,75),(234,'穿3条裤子了。。。',_binary '\0',0,'2018-12-27 16:17:43',228,90),(235,'不是不给接路由器吗',_binary '\0',0,'2018-12-27 16:18:24',228,109),(236,'其实我也没穿秋裤',_binary '\0',0,'2018-12-27 16:19:19',34,90),(237,'鸣人嘴遁无敌',_binary '\0',0,'2018-12-27 16:20:03',34,69),(238,'6个撒切尔2333',_binary '\0',0,'2018-12-27 16:20:27',34,97),(239,'抱走雏田小天使',_binary '\0',0,'2018-12-27 16:21:40',37,69),(240,'侑真温柔',_binary '\0',0,'2018-12-27 16:22:37',36,136),(242,'哈哈哈哈或',_binary '',0,'2018-12-27 16:30:45',19,241);
/*!40000 ALTER TABLE `Post` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`pkuforumadmin`@`localhost`*/ /*!50003 TRIGGER posttrigger AFTER INSERT ON Post 
	FOR EACH ROW
		BEGIN
			SET @recenttenmin := (SELECT COUNT(*) FROM Post as p
									WHERE p.postedAt >= (NOW() - INTERVAL 10 MINUTE)
									AND p.postedBy_id=NEW.postedBy_id);
			IF (@recenttenmin >= 10) THEN
				INSERT INTO Log VALUES(NOW(), NEW.postedBy_id, 0);
			END IF;				
		END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Post_User`
--

DROP TABLE IF EXISTS `Post_User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Post_User` (
  `Post_id` bigint(20) NOT NULL,
  `whoLiked_id` bigint(20) NOT NULL,
  KEY `FKbt83rhhc97w4dijqd84bndu4o` (`whoLiked_id`),
  KEY `FKs0rihpt3jjxljdhtpq32p3j7x` (`Post_id`),
  CONSTRAINT `FKbt83rhhc97w4dijqd84bndu4o` FOREIGN KEY (`whoLiked_id`) REFERENCES `User` (`id`),
  CONSTRAINT `FKs0rihpt3jjxljdhtpq32p3j7x` FOREIGN KEY (`Post_id`) REFERENCES `Post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Post_User`
--

LOCK TABLES `Post_User` WRITE;
/*!40000 ALTER TABLE `Post_User` DISABLE KEYS */;
INSERT INTO `Post_User` VALUES (7,21),(70,24),(98,24),(100,22),(100,24),(77,20),(77,22),(77,24),(77,25),(92,22),(92,25),(102,24),(102,26),(121,26),(124,26),(104,24),(104,25),(104,26),(104,27),(119,27),(79,20),(79,22),(79,24),(79,27),(94,22),(94,27),(127,27),(127,28),(123,26),(123,27),(123,28),(95,22),(95,24),(95,29),(138,30),(139,30),(140,31),(137,29),(137,30),(137,31),(137,32),(137,33),(89,20),(89,24),(89,25),(89,26),(89,27),(89,34),(108,24),(108,26),(108,29),(108,35),(150,36),(91,20),(91,22),(91,24),(91,26),(91,27),(91,32),(91,37),(112,37),(118,25),(118,26),(118,27),(118,28),(118,37),(73,19),(73,20),(73,22),(73,24),(73,28),(73,30),(73,37),(96,22),(96,37),(120,38),(158,40),(101,25),(101,40),(113,40),(160,41),(110,24),(110,25),(110,26),(110,27),(110,28),(110,31),(110,41),(164,42),(165,42),(23,19),(23,42),(157,38),(157,40),(157,41),(157,43),(154,43),(170,45),(171,45),(74,19),(74,20),(74,22),(74,24),(74,25),(74,40),(74,45),(76,19),(76,24),(76,47),(209,65),(209,67);
/*!40000 ALTER TABLE `Post_User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Topic`
--

DROP TABLE IF EXISTS `Topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Topic` (
  `id` bigint(20) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `postedAt` datetime DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `forum_id` bigint(20) DEFAULT NULL,
  `postedBy_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKs7ni6yttp4udld1kl3w30bcr4` (`forum_id`),
  KEY `FKry14dyc3ig0bi30i74lu3j4i9` (`postedBy_id`),
  CONSTRAINT `FKry14dyc3ig0bi30i74lu3j4i9` FOREIGN KEY (`postedBy_id`) REFERENCES `User` (`id`),
  CONSTRAINT `FKs7ni6yttp4udld1kl3w30bcr4` FOREIGN KEY (`forum_id`) REFERENCES `Forum` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Topic`
--

LOCK TABLES `Topic` WRITE;
/*!40000 ALTER TABLE `Topic` DISABLE KEYS */;
INSERT INTO `Topic` VALUES (6,_binary '\0','2018-12-27 12:12:43','无线网怎么用？',33,5,2),(69,_binary '\0','2018-12-27 14:34:42','大家喜欢火影忍者吗？',66,3,2),(72,_binary '\0','2018-12-27 14:41:01','燕南食堂从此成为了我的伤心地',34,5,19),(75,_binary '\0','2018-12-27 14:42:02','为什么那么多贵校人不成功？',35,4,19),(88,_binary '\0','2018-12-27 14:45:51','我们是否还需要一个金庸？',31,3,20),(90,_binary '\0','2018-12-27 14:47:01','今天也太冷了吧',35,4,20),(97,_binary '\0','2018-12-27 14:49:42','神探夏洛克',28,3,22),(99,_binary '\0','2018-12-27 14:50:15','假Office2019？',25,5,22),(109,_binary '\0','2018-12-27 14:54:10','天天晚上都连不上校园网？？',31,5,24),(111,_binary '\0','2018-12-27 14:54:39','你们是柯哀党还是兰新党？',31,4,24),(136,_binary '\0','2018-12-27 15:08:01','有人看终将成为你吗？',29,3,29),(156,_binary '\0','2018-12-27 15:28:49','来玩词语接龙吧',59,4,38),(208,_binary '\0','2018-12-27 16:02:30','祝大家圣诞快乐！',14,5,64),(218,_binary '','2018-12-27 16:09:35','我爱北大',2,5,19),(241,_binary '','2018-12-27 16:30:45','哈哈哈哈哈哈哈',2,3,19);
/*!40000 ALTER TABLE `Topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `id` bigint(20) NOT NULL,
  `age` bigint(20) DEFAULT NULL,
  `dateOfBirth` datetime DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `isBanzhu` bit(1) NOT NULL,
  `isBanzhuOf` bigint(20) DEFAULT NULL,
  `level` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `needConfirmation` varchar(255) DEFAULT NULL,
  `passwordHash` varchar(255) DEFAULT NULL,
  `registrationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,NULL,'2000-01-01 00:00:00',_binary '','klsl1307@pku.edu.cn','male',_binary '\0',-1,NULL,'吴飞','5c6d79db-4535-4477-abbb-8ffcc125e036','e10adc3949ba59abbe56e057f20f883e','2018-12-26 23:51:14'),(2,NULL,'1999-07-22 00:00:00',_binary '\0','admin@pku.edu.cn','male',_binary '\0',-1,NULL,'管理员',NULL,'21232f297a57a5a743894a0e4a801fc3','2018-12-26 23:53:05'),(8,NULL,'1994-09-05 00:00:00',_binary '','deleted@pku.edu.cn','female',_binary '\0',-1,NULL,'被删掉',NULL,'594f803b380a41396ed63dca39503542','2018-12-27 12:18:45'),(9,NULL,'2000-01-01 00:00:00',_binary '','aaaa@pku.edu.cn','male',_binary '\0',-1,NULL,'aaaa','4a00c36a-bdd0-4819-9d9b-31bf32a35bff','827ccb0eea8a706c4c34a16891f84e7b','2018-12-27 12:45:00'),(10,NULL,'1999-01-01 00:00:00',_binary '','aaab@pku.edu.cn','male',_binary '\0',-1,NULL,'aaab','99876405-7156-4929-a0ab-7cfc7608deb0','827ccb0eea8a706c4c34a16891f84e7b','2018-12-27 12:47:00'),(11,NULL,'1998-03-01 00:00:00',_binary '','aaac@pku.edu.cn','male',_binary '\0',-1,NULL,'aaac','00159d57-7395-41c1-aa15-2ac5eae56fbc','1c395a8dce135849bd73c6dba3b54809','2018-12-27 12:47:29'),(12,NULL,'1997-03-29 00:00:00',_binary '','aaad@pku.edu.cn','female',_binary '\0',-1,NULL,'aaad','b6b3d576-71f6-4766-8d2e-e10871d53888','1c395a8dce135849bd73c6dba3b54809','2018-12-27 12:48:06'),(13,NULL,'1996-05-01 00:00:00',_binary '','aaae@pku.edu.cn','female',_binary '\0',-1,NULL,'aaae','7398669c-7e94-4eef-bf0a-5f878931f104','1c395a8dce135849bd73c6dba3b54809','2018-12-27 12:50:35'),(14,NULL,'1997-01-04 00:00:00',_binary '','aaaf@pku.edu.cn','female',_binary '\0',-1,NULL,'aaaf','faa05042-6146-4f12-b5d7-0620fd290586','1c395a8dce135849bd73c6dba3b54809','2018-12-27 12:52:21'),(15,NULL,'1995-09-29 00:00:00',_binary '','aaag@pku.edu.cn','male',_binary '\0',-1,NULL,'aaag','bc061436-2a74-47c5-99a0-20cd6bbb2fb7','1c395a8dce135849bd73c6dba3b54809','2018-12-27 12:54:32'),(16,NULL,'1996-09-08 00:00:00',_binary '','aaah@pku.edu.cn','female',_binary '\0',-1,NULL,'aaah','1e4c2229-8cd3-4273-87d9-d9f9bbe0275a','1c395a8dce135849bd73c6dba3b54809','2018-12-27 12:56:11'),(17,NULL,'1997-08-22 00:00:00',_binary '','aaai@pku.edu.cn','female',_binary '\0',-1,NULL,'aaai','82993976-b3f3-4743-b652-347810f60805','1c395a8dce135849bd73c6dba3b54809','2018-12-27 12:56:53'),(18,NULL,'1995-06-28 00:00:00',_binary '','aaaj@pku.edu.cn','male',_binary '\0',-1,NULL,'aaaj','f3735f6a-4f94-48bd-a682-c8c26ea6db8e','1c395a8dce135849bd73c6dba3b54809','2018-12-27 12:57:32'),(19,NULL,'1996-04-27 00:00:00',_binary '\0','klsl@pku.edu.cn','male',_binary '\0',-1,NULL,'klsl',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:01:28'),(20,NULL,'1995-04-30 00:00:00',_binary '\0','lovecatcat@pku.edu.cn','female',_binary '\0',-1,NULL,'lovecatcat',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:03:01'),(21,NULL,'1977-01-14 00:00:00',_binary '\0','Arnome@pku.edu.cn','female',_binary '\0',-1,NULL,'Arnome',NULL,'594f803b380a41396ed63dca39503542','2018-12-27 13:03:11'),(22,NULL,'1997-04-24 00:00:00',_binary '\0','CNNman@pku.edu.cn','female',_binary '\0',-1,NULL,'CNNman',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:03:41'),(24,NULL,'1995-09-03 00:00:00',_binary '\0','Griffiths@pku.edu.cn','female',_binary '\0',-1,NULL,'Griffiths',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:04:23'),(25,NULL,'1994-11-04 00:00:00',_binary '\0','LBLLBL@pku.edu.cn','female',_binary '\0',-1,NULL,'LBLLBL',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:05:09'),(26,NULL,'2000-11-03 00:00:00',_binary '\0','RedB@pku.edu.cn','male',_binary '\0',-1,NULL,'RedB',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:05:52'),(27,NULL,'1997-05-29 00:00:00',_binary '\0','Nginx@pku.edu.cn','female',_binary '\0',-1,NULL,'Nginx',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:08:33'),(28,NULL,'1996-10-01 00:00:00',_binary '\0','googol@pku.edu.cn','male',_binary '\0',-1,NULL,'googol',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:10:03'),(29,NULL,'1996-07-29 00:00:00',_binary '\0','Carboner@pku.edu.cn','male',_binary '\0',-1,NULL,'Carboner',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:11:27'),(30,NULL,'1995-03-01 00:00:00',_binary '\0','aileen@pku.edu.cn','female',_binary '\0',-1,NULL,'aileen',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:12:32'),(31,NULL,'2000-05-07 00:00:00',_binary '\0','yuu@pku.edu.cn','female',_binary '',3,NULL,'yuu',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:13:39'),(32,NULL,'1999-05-29 00:00:00',_binary '\0','koito@pku.edu.cn','female',_binary '\0',-1,NULL,'koito',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:14:16'),(33,NULL,'1998-10-07 00:00:00',_binary '\0','tougo@pku.edu.cn','female',_binary '\0',-1,NULL,'tougo',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:14:59'),(34,NULL,'1997-07-28 00:00:00',_binary '\0','yuki@pku.edu.cn','female',_binary '\0',-1,NULL,'yuki',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:15:48'),(35,NULL,'1997-05-25 00:00:00',_binary '\0','ray@pku.edu.cn','male',_binary '\0',-1,NULL,'ray',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:16:26'),(36,NULL,'1994-06-26 00:00:00',_binary '\0','vermouth@pku.edu.cn','female',_binary '\0',-1,NULL,'vermouth',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:17:06'),(37,NULL,'1992-08-26 00:00:00',_binary '\0','sherlock@pku.edu.cn','male',_binary '\0',-1,NULL,'sherlock',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:17:35'),(38,NULL,'1992-08-28 00:00:00',_binary '\0','naiiive@pku.edu.cn','male',_binary '\0',-1,NULL,'naiiive',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:18:31'),(39,NULL,'1994-08-25 00:00:00',_binary '\0','lost@pku.edu.cn','male',_binary '\0',-1,NULL,'lost',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:21:48'),(40,NULL,'1996-09-28 00:00:00',_binary '\0','lucius@pku.edu.cn','male',_binary '\0',-1,NULL,'lucius',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:22:42'),(41,NULL,'1993-08-26 00:00:00',_binary '\0','BBQsu@pku.edu.cn','female',_binary '\0',-1,NULL,'BBQsu',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:23:25'),(42,NULL,'1994-10-08 00:00:00',_binary '\0','davy@pku.edu.cn','male',_binary '\0',-1,NULL,'davy',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:26:36'),(43,NULL,'1996-07-08 00:00:00',_binary '\0','leefee@pku.edu.cn','male',_binary '\0',-1,NULL,'leefee',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:27:33'),(44,NULL,'1995-09-15 00:00:00',_binary '\0','rucpku@pku.edu.cn','male',_binary '\0',-1,NULL,'rucpku',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:28:23'),(45,NULL,'1994-02-23 00:00:00',_binary '\0','Aias@pku.edu.cn','female',_binary '\0',-1,NULL,'Aias',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:29:38'),(46,NULL,'1995-07-11 00:00:00',_binary '\0','ljh@pku.edu.cn','male',_binary '\0',-1,NULL,'ljh',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:30:42'),(47,NULL,'1995-10-25 00:00:00',_binary '\0','pkucc@pku.edu.cn','female',_binary '',5,NULL,'pkucc',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:32:10'),(48,NULL,'1996-08-09 00:00:00',_binary '\0','ryn@pku.edu.cn','female',_binary '\0',-1,NULL,'ryn',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:33:41'),(49,NULL,'1998-10-23 00:00:00',_binary '\0','kaka@pku.edu.cn','male',_binary '\0',-1,NULL,'kaka',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:34:11'),(50,NULL,'1998-07-26 00:00:00',_binary '\0','Eating@pku.edu.cn','female',_binary '\0',-1,NULL,'Eating',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:35:04'),(51,NULL,'1996-07-26 00:00:00',_binary '\0','thinky@pku.edu.cn','female',_binary '\0',-1,NULL,'thinky',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:36:15'),(52,NULL,'2000-10-27 00:00:00',_binary '\0','soda@pku.edu.cn','male',_binary '\0',-1,NULL,'soda',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:36:57'),(53,NULL,'1994-07-09 00:00:00',_binary '\0','naruto@pku.edu.cn','male',_binary '',4,NULL,'naruto',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:37:30'),(54,NULL,'1998-06-26 00:00:00',_binary '\0','sasuke@pku.edu.cn','male',_binary '\0',-1,NULL,'sasuke',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:38:00'),(55,NULL,'1998-06-30 00:00:00',_binary '\0','sakura@pku.edu.cn','female',_binary '\0',-1,NULL,'sakura',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:38:34'),(56,NULL,'1996-11-04 00:00:00',_binary '\0','japan@pku.edu.cn','male',_binary '\0',-1,NULL,'japan',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:39:10'),(57,NULL,'1997-07-17 00:00:00',_binary '\0','boson@pku.edu.cn','female',_binary '\0',-1,NULL,'boson',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:39:52'),(58,NULL,'1997-08-27 00:00:00',_binary '\0','matto@pku.edu.cn','female',_binary '\0',-1,NULL,'matto',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:41:09'),(59,NULL,'1995-07-10 00:00:00',_binary '\0','anta@pku.edu.cn','male',_binary '\0',-1,NULL,'anta',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:42:31'),(60,NULL,'1995-07-24 00:00:00',_binary '\0','crazy@pku.edu.cn','female',_binary '\0',-1,NULL,'crazy','a900eddf-b72e-403a-a362-1e862d7b7d6c','1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:42:57'),(61,NULL,'1995-04-28 00:00:00',_binary '\0','firefly@pku.edu.cn','male',_binary '\0',-1,NULL,'firefly',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:44:43'),(62,NULL,'1997-05-04 00:00:00',_binary '\0','boruto@pku.edu.cn','male',_binary '\0',-1,NULL,'boruto',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:45:07'),(63,NULL,'2000-04-25 00:00:00',_binary '\0','jojo@pku.edu.cn','female',_binary '\0',-1,NULL,'jojo',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:45:58'),(64,NULL,'1995-07-27 00:00:00',_binary '\0','santa@pku.edu.cn','male',_binary '\0',-1,NULL,'santa',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:46:53'),(65,NULL,'1999-03-22 00:00:00',_binary '\0','cos@pku.edu.cn','male',_binary '\0',-1,NULL,'cos',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:53:14'),(66,NULL,'1995-06-27 00:00:00',_binary '\0','tison@pku.edu.cn','female',_binary '\0',-1,NULL,'tison',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:53:43'),(67,NULL,'1995-12-28 00:00:00',_binary '\0','avada@pku.edu.cn','male',_binary '\0',-1,NULL,'avada',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 13:54:10'),(68,NULL,'2000-01-01 00:00:00',_binary '','lyutyuh@gmail.com','male',_binary '\0',-1,NULL,'newone',NULL,'594f803b380a41396ed63dca39503542','2018-12-27 14:16:14'),(220,NULL,'1997-06-24 00:00:00',_binary '\0','bilibili@pku.edu.cn','female',_binary '\0',-1,NULL,'bilibili',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 16:10:58'),(228,NULL,'1996-09-07 00:00:00',_binary '\0','lovedog@pku.edu.cn','female',_binary '\0',-1,NULL,'lovedog',NULL,'1c395a8dce135849bd73c6dba3b54809','2018-12-27 16:15:18');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (243),(243),(243),(243),(243);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-27 23:51:13
