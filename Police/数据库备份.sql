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
('432831196804300410', '���ʸ�', '��', 170, 69, '������Ϊ������ʡ�����а����سǹ��������ί����һ��·��
���1.70�����ң���̬�еȡ����Ͽ���', '16433251002', '���ʸ�.PNG'
),
('350127197208041619', '��ϣТ', '��', 170, 60, '������ַ������ʡ�����к�����ţլ��ɽ��52��
���1.70�����ң���̬�еȣ�����������', '0755-110', '��ϣТ.PNG'),
('442522196510244336', '������', '��', 173, 72, '������ַ���㶫ʡ�����������������δ��Ǳ����԰13-304.
���1.70�����ң���̬�еȣ�����������������', '0755-84468777', '������.PNG'),
('452724197910122530', '��־��', '��', 168, 60, '�����أ������ӳ��л�����������ɳǴ�������8�š�
���1.68�����ң���̬�еȣ�����������', '110', '��־��.png'),
('410922195908130611', '���ָ�', '��', 170, 60, '������ַ����ʡ�����������ׯ���ˡ�
���170cm,�е�����,����ʳָ����ָ��ȱ', '18860320086', '���ָ�.png'),
('512223197407280331', '���ȳ�', '��', 160, 50, '�����أ������кϴ���Ǯ����ʯ�մ�8��72�š�
���160cm���ң��̷�����̬ƫ�ݣ����������', '110', '���ȳ�.png'),
('33032919740910353X', '��ϸ��', '��', 170, 70, '������ַ���㽭ʡ̩˳����Ϫ������Ӵ塣
�㽭������', '110', '��ϸ��.png'),
('350128195007171924', '������', 'Ů', 160, 65, '������ַ������ʡƽ̶�� ƽԭ����ɽ�����154�š�
���1.60�����ң�����������', '110', '������.png'),
('533525198001251248', '��С��', 'Ů', 165, 50, '������ַ������ʡ������ɡ������ί���ָ�կ�顣
�����򿵿�����', '110', '��С��.png'),
('522425196708018119', '������', '��', 170, 60, '������ַ������ʡ֯���ذ����򹷳����ɽ�顣
���1.70�����ң������������ݿ�����', '110', '������.png'),
('61052619880827791x', '�Գ���', '��', 175, 50, '������ַ������ʡ�ѳ��ش��������ִ�5�顣
���1.75�����ң����ݣ�����ʱ���ձ�������������', '110', '�Գ���.PNG'),
('350425195009231422', '������', 'Ů', 155, 53, '������ַ�� ����ʡ�����ؾ�Ϫ���ɽ��·44��B��202�ҡ�
���1.55�����ң�����������', '110', '������.PNG'),
('342225198508012411', '¦�Ǹ�', '��', 168, 70, '������Ϊ�������غ�������ɽ��¦ׯ155��
���1.68�����ң���̬�еȣ�Ƥ���ף���ٶ�������ƽͷ��üë��Ũ��
��˵�Ƚϱ�׼���人�������ʻ��������', '13377872933', '¦�Ǹ�.png');
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
 (15, '350127197208041619', 'Ŀ�����˳���', '�ص�λ������ѧ����·У��', '02226554315', 'D'),
 (16, '432831196804300410', 'ȷ�����Ǵ��ˣ���', '��2016��1��15�������ĵ����ң����Ͽ�������·����', '', ''),
 (17, '350127197208041619', 'Ŀ�����������', 'Ŀ�������������ʮ�����ơ�
�ص��ǽ��������ӽ���԰�ڣ�����ѧ����԰У���ڡ�', '13351206648', ''),
 (18, '33032919740910353X', '���ִ����ټ�', '��2015��12��20����������Ͽ�������·��Χ���ִ���', '', ''),
 (19, '33032919740910353X', '���ִ����ټ�', '��2015��12��20����������Ͽ�������·��Χ���ִ���', '', '');
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
 (1,'������','d135dd433dccd2c3b6ca027691f61a5d','user'),
 (7,'����Ա','665b2fed1599f29554a9bd6a19c9947f','organizer'),
 (8,'����Զ','5d387d156f9595d2268882c7d9abdb3a','user'),
 (10,'����','328213cd6b167a027f5dddf54afdc4e2','user'),
 (11,'����','0bf5bcd8f555fa2dd35c5f7dd64b9337','user'),
 (12,'����','47cd2687faea0e7b3ba596cbc556804b','user'),
 (13,'����ȫ','3fc2f7565612285f15c6733be69b6209','user'),
 (14,'١����','5d867b94c7d133d187add7de0f0ea0c1','user');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
