-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.20


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema police
--

CREATE DATABASE IF NOT EXISTS police;
USE police;

--
-- Definition of table `criminals`
--

DROP TABLE IF EXISTS `criminals`;
CREATE TABLE `criminals` (
  `id` char(18) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `bodytype` varchar(400) DEFAULT NULL,
  `phonenumber` varchar(15) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `criminals`
--
/*!40000 ALTER TABLE `criminals` DISABLE KEYS */;
INSERT INTO `criminals` (`id`,`name`,`sex`,`height`,`weight`,`bodytype`,`phonenumber`,`image`) VALUES 
('432831196804300410', '龙仁福', '男', 170, 69, '户籍地为：湖南省郴州市安仁县城关镇城西居委会七一西路。
身高1.70米左右，体态中等。湖南口音', '16433251002', '龙仁福.PNG'
),
('350127197208041619', '林希孝', '男', 170, 60, '户籍地址：福建省福清市海口镇牛宅村山下52号
身高1.70米左右，体态中等，福建口音。', '0755-110', '林希孝.PNG'),
('442522196510244336', '王明辉', '男', 173, 72, '户籍地址：广东省深圳市龙华新区民治大道潜龙花园13-304.
身高1.70米左右，体态中等，长脸，福建口音。', '0755-84468777', '王明辉.PNG'),
('452724197910122530', '覃志钢', '男', 168, 60, '户籍地：广西河池市环江县明伦镇干城村曲洞屯8号。
身高1.68米左右，体态中等，广西口音。', '110', '覃志钢.png'),
('410922195908130611', '李现府', '男', 170, 60, '户籍地址：南省清丰县马村乡段庄村人。
身高170cm,中等体型,左手食指和中指残缺', '18860320086', '李现府.png'),
('512223197407280331', '田先成', '男', 160, 50, '户籍地：重庆市合川区钱塘镇石墩村8组72号。
身高160cm左右，短发，体态偏瘦，重庆口音。', '110', '田先成.png'),
('33032919740910353X', '王细灵', '男', 170, 70, '户籍地址：浙江省泰顺县泗溪镇筠竹坑村。
浙江口音。', '110', '王细灵.png'),
('350128195007171924', '陈莲香', '女', 160, 65, '户籍地址：福建省平潭县 平原镇榕山村镇间154号。
身高1.60米左右，福建口音。', '110', '陈莲香.png'),
('533525198001251248', '陈小东', '女', 165, 50, '户籍地址：云南省镇康县南伞镇哈里村委会林格寨组。
云南镇康口音。', '110', '陈小东.png'),
('522425196708018119', '安金良', '男', 170, 60, '户籍地址：贵州省织金县阿弓镇狗场村尖山组。
身高1.70米左右，长脸，宽额，贵州口音。', '110', '安金良.png'),
('61052619880827791x', '赵超超', '男', 175, 50, '户籍地址：陕西省蒲城县椿林乡兴林村5组。
身高1.75米左右，体瘦，行走时显驼背，陕西口音。', '110', '赵超超.PNG'),
('350425195009231422', '刘秀清', '女', 155, 53, '户籍地址： 福建省大田县均溪镇凤山西路44号B幢202室。
身高1.55米左右，福建口音。', '110', '刘秀清.PNG'),
('342225198508012411', '娄亚刚', '男', 168, 70, '户籍地为安徽泗县黑塔镇朱山村娄庄155号
身高1.68米左右，体态中等，皮肤白，五官端正，短平头，眉毛较浓。
会说比较标准的武汉话，会驾驶，爱上网', '13377872933', '娄亚刚.png');
/*!40000 ALTER TABLE `criminals` ENABLE KEYS */;


--
-- Definition of table `inform`
--

DROP TABLE IF EXISTS `inform`;
CREATE TABLE `inform` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `criminal` char(18) NOT NULL,
  `title` varchar(20) NOT NULL,
  `content` mediumtext NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inform`
--

/*!40000 ALTER TABLE `inform` DISABLE KEYS */;
INSERT INTO `inform` (`num`,`criminal`,`title`,`content`,`phone`,`name`) VALUES 
 (15, '350127197208041619', '目击该人出现', '地点位于天津大学卫津路校区', '02226554315', 'D'),
 (16, '432831196804300410', '确定就是此人！！', '于2016年1月15日下午四点左右，在南开区五马路出现', '', ''),
 (17, '350127197208041619', '目击与此人相似', '目击到的人与此人十分相似。
地点是津南区海河教育园内，天津大学北洋园校区内。', '13351206648', ''),
 (18, '33032919740910353X', '发现此人踪迹', '于2015年12月20日在天津市南开区卫津路周围发现此人', '', ''),
 (19, '33032919740910353X', '发现此人踪迹', '于2015年12月20日在天津市南开区卫津路周围发现此人', '', '');
/*!40000 ALTER TABLE `inform` ENABLE KEYS */;


--
-- Definition of table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`,`name`,`password`,`type`) VALUES 
 (1,'王善宇','d135dd433dccd2c3b6ca027691f61a5d','user'),
 (7,'管理员','665b2fed1599f29554a9bd6a19c9947f','organizer'),
 (8,'陶泽远','5d387d156f9595d2268882c7d9abdb3a','user'),
 (10,'米涛','328213cd6b167a027f5dddf54afdc4e2','user'),
 (11,'刘畅','0bf5bcd8f555fa2dd35c5f7dd64b9337','user'),
 (12,'王儒','47cd2687faea0e7b3ba596cbc556804b','user'),
 (13,'赵永全','3fc2f7565612285f15c6733be69b6209','user'),
 (14,'佟海宁','5d867b94c7d133d187add7de0f0ea0c1','user');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
