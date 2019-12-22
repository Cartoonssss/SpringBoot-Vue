/*
Navicat MySQL Data Transfer

Source Server         : 47.94.224.43
Source Server Version : 50614
Source Host           : 47.94.224.43:3306
Source Database       : exam

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2019-06-20 19:15:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminId` int(9) NOT NULL AUTO_INCREMENT COMMENT 'ID号',
  `adminName` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `sex` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `tel` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '电话号码',
  `email` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '电子邮箱',
  `pwd` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `cardId` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '身份证号',
  `role` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '角色(0管理员，1教师，2学生)',
  PRIMARY KEY (`adminId`) USING BTREE,
  KEY `sex` (`sex`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9528 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='管理员信息表';

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('123456', '超级管理员', '男', '13658377857', '1253838283@qq.com', 'E10ADC3949BA59ABBE56E057F20F883E', '3132', '0');

-- ----------------------------
-- Table structure for exammanage
-- ----------------------------
DROP TABLE IF EXISTS `exammanage`;
CREATE TABLE `exammanage` (
  `examCode` int(9) NOT NULL AUTO_INCREMENT COMMENT '考试编号',
  `description` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '该次考试介绍',
  `source` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '课程名称',
  `paperId` int(10) DEFAULT NULL COMMENT '试卷编号',
  `examDate` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '考试日期',
  `totalTime` int(3) DEFAULT NULL COMMENT '持续时长',
  `grade` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '年级',
  `term` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '学期',
  `major` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '专业',
  `institute` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '学院',
  `totalScore` int(4) DEFAULT NULL COMMENT '总分',
  `type` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '考试类型',
  `tips` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '考生须知',
  PRIMARY KEY (`examCode`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20190018 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='考试管理表';

-- ----------------------------
-- Records of exammanage
-- ----------------------------
INSERT INTO `exammanage` VALUES ('20190001', '2019年上期期末考试', '计算机网络', '1001', '2019-06-10', '100', '2016', '1', '计算机科学与技术', '软件工程学院', '100', '期末考试', '诚信考试，禁止舞弊！！');
INSERT INTO `exammanage` VALUES ('20190002', '2019年上期期末考试', '数据库理论', '1002', '2019-06-12', '1', '2016', '2', '网络工程', '软件工程学院', '100', '期末考试', '诚信考试，禁止舞弊！！');
INSERT INTO `exammanage` VALUES ('20190003', '2018年下期期末考试', '数据结构', '1003', '2019-06-13', '90', '2016', '1', '软件工程', '软件工程学院', '100', '期末考试', '诚信考试，禁止舞弊！！');
INSERT INTO `exammanage` VALUES ('20190005', '2018年上期期末考试', '计算机导论', '1004', '2019-06-14', '90', '2016', '1', '计算机科学与技术', '软件工程学院', '100', '期末考试', '诚信考试，禁止舞弊！！');
INSERT INTO `exammanage` VALUES ('20190006', '2017年上期期末考试', '软件工程', '1005', '2019-06-15', '120', '2016', '1', '计算机科学与技术', '软件工程学院', '100', '期末考试', '诚信考试，禁止舞弊！！。');
INSERT INTO `exammanage` VALUES ('20190007', '2018年上期期末考试', '操作系统', '1006', '2019-06-13', '120', '2016', '2', '计算机科学与技术', '软件工程学院', '100', '期末考试', '诚信考试，禁止舞弊！！');
INSERT INTO `exammanage` VALUES ('20190009', '2018年上期期末考试', '高等数学', '1008', '2019-06-07', '90', '2016', '1', '信息工程', '软件工程学院', '100', '期末考试', '诚信考试，禁止舞弊！！');
INSERT INTO `exammanage` VALUES ('20190017', 'c', 'C语言', '1009', '2019-07-02', '4', 'c', null, 'c', 'c', '4', '4', '4');

-- ----------------------------
-- Table structure for fillquestion
-- ----------------------------
DROP TABLE IF EXISTS `fillquestion`;
CREATE TABLE `fillquestion` (
  `questionId` int(9) NOT NULL AUTO_INCREMENT COMMENT '试题编号',
  `subject` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '考试科目',
  `question` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '试题内容',
  `answer` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '正确答案',
  `analysis` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '题目解析',
  `score` int(2) DEFAULT '2' COMMENT '分数',
  `level` varchar(5) COLLATE utf8_bin DEFAULT NULL COMMENT '难度等级',
  `section` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '所属章节',
  PRIMARY KEY (`questionId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10043 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='填空题题库';

-- ----------------------------
-- Records of fillquestion
-- ----------------------------
INSERT INTO `fillquestion` VALUES ('10000', '计算机网络', '从计算机网络系统组成的角度看，计算机网络可以分为()和()', '通信子网资源子网', null, '2', '1', null);
INSERT INTO `fillquestion` VALUES ('10001', '计算机网络', '收发电子邮件，属于ISO/OSI RM中 ()层的功能。', '应用', null, '2', '1', null);
INSERT INTO `fillquestion` VALUES ('10002', '计算机网络', '在TCP/IP层次模型中与OSI参考模型第四层相对应的主要协议有()和(),其中后者提供无连接的不可靠传输服', 'TCP（传输控制协议） UDP（用户数据报协议） ', null, '2', '1', null);
INSERT INTO `fillquestion` VALUES ('10003', '计算机网络', '计算机网络中常用的三种有线媒体是 (),()和 ()', '同轴电缆.双绞线 光纤', null, '2', '1', null);
INSERT INTO `fillquestion` VALUES ('10004', '计算机网络', '国内最早的四大网络包括原邮电部的ChinaNet. 原电子部的ChinaGBN. 教育部的()和中科院的CSTnet', 'CERnet (或中国教育科研网)', null, '2', '1', null);
INSERT INTO `fillquestion` VALUES ('10005', '计算机网络', '复盖一个国家，地区或几个洲的计算机网络称为()，在同一建筑或复盖几公里内范围的网络称为()，而介于两者之间的是()', ' 广域网       局域网     城域网', null, '2', '1', null);
INSERT INTO `fillquestion` VALUES ('10006', '计算机网络', 'Outlook等常用电子邮件软件接收邮件使用的协议是(),发送邮件时使用的协议是()', 'POP3    SMTP    ', null, '2', '1', null);
INSERT INTO `fillquestion` VALUES ('10007', '计算机网络', '通信系统中，称调制前的电信号为()信号，调制后的信号为调制信号', '基带', null, '2', '1', null);
INSERT INTO `fillquestion` VALUES ('10008', '计算机网络', '按照IPV4标准,IP地址205.3.127.13属于()类地址', 'C', null, '2', '1', null);
INSERT INTO `fillquestion` VALUES ('10009', '计算机网络', '计算机网络采用()技术，而传统电话网络则采用()技术', '分组交换电路交换', null, '2', '1', null);
INSERT INTO `fillquestion` VALUES ('10010', '计算机网络', '计算机内传输的信号是()，而公用电话系统的传输系统只能传输()', '数字信号模拟信号', null, '2', '1', null);
INSERT INTO `fillquestion` VALUES ('10011', '计算机网络', '通信系统中，称调制前的电信号为()，调制后的信号叫()。', '基带信号调制信号', null, '2', '1', null);
INSERT INTO `fillquestion` VALUES ('10012', '计算机网络', 'IP地址分()和()两个部分', '网络号主机号', null, '2', '1', null);
INSERT INTO `fillquestion` VALUES ('10013', '计算机网络', ' IP地址协议作网间网中()层协议，提供无连接的数据报传输机制，IP数据报也分为()和()两个部分', '网络报头数据区', null, '2', '1', null);
INSERT INTO `fillquestion` VALUES ('10014', '计算机网络', '()是一个简单的远程终端协议。', 'TELNET', null, '2', '1', null);
INSERT INTO `fillquestion` VALUES ('10015', '计算机网络', '在同一个系统内，相邻层之间交换信息的连接点称之为()，而低层模块向高层提供功能性的支持称之为()。', '接口服务', null, '2', '1', null);
INSERT INTO `fillquestion` VALUES ('10016', '计算机网络', 'Internet广泛使用的电子邮件传送协议是()', 'SMTP', null, '2', '1', null);
INSERT INTO `fillquestion` VALUES ('10017', '计算机网络', '按交换方式来分类，计算机网络可以分为电路交换网，  报文交换网  和()三种', '分组交换网', null, '2', '1', null);
INSERT INTO `fillquestion` VALUES ('10018', '计算机网络', 'Intranet分层结构包括网络、(),应用三个层次。', '服务', null, '2', '1', null);
INSERT INTO `fillquestion` VALUES ('10019', '计算机网络', 'WWW上的每一个网页都有一个独立的地址，这些地址称为  ()', '统一资源定位器/URL ', null, '2', '1', null);
INSERT INTO `fillquestion` VALUES ('10020', '计算机网络', '分组交换网中，附加信息用来在网络中进行路由选择、() 和流量控制', '差错纠正  ', null, '2', '1', null);
INSERT INTO `fillquestion` VALUES ('10021', '计算机网络', '根据IEEE802模型的标准将数据链路层划分为LLC子层和 ()子层。', ' MAC ', null, '2', '1', null);
INSERT INTO `fillquestion` VALUES ('10022', '计算机网络', '据交换的路由信息的不同，路由算法可以分为两大类：  ()  和链路状态算法', '距离向量算法', null, '2', '1', null);
INSERT INTO `fillquestion` VALUES ('10023', '计算机网络', '假定某信道受奈氏准则限制的最高码元速率为2000码元/秒。如果采用振幅调制，把码元的振幅划分为16个不同等级来传送，那么可以获得的数据率为 () b/s。', '80000 ', null, '2', '1', null);
INSERT INTO `fillquestion` VALUES ('10024', '计算机网络', '交换型以太网系统中的 ()  ，以其为核心联接站点或者网段，端口之间帧的输入和输出已不再受到CSMA/CD媒体访问控制协议的约束。', '以太网交换器 ', null, '2', '1', null);
INSERT INTO `fillquestion` VALUES ('10025', '计算机网络', '局域网络参考模型是以 ()标准为基础的', 'IEEE802', null, '2', '1', null);
INSERT INTO `fillquestion` VALUES ('10026', '计算机网络', '路由器的核心是 () 。', ' 路由表', null, '2', '1', null);
INSERT INTO `fillquestion` VALUES ('10027', '计算机网络', '若 HDLC 帧数据段中出现比特串“ 01011111110 ”，则比特填充后的输出为()', '10111110110', null, '2', '1', null);
INSERT INTO `fillquestion` VALUES ('10028', '计算机网络', '数字调制的三种基本形式：移幅键控法ASK、 ()、移相键控法PSK', '移频键控法FSK', null, '2', '1', null);
INSERT INTO `fillquestion` VALUES ('10029', '数据库理论', '数据模型通常由______________, _____________, ______________三部分组成', '数据结构 关系操作 完整性约束', '暂无解析', '2', '1', '理论基础');
INSERT INTO `fillquestion` VALUES ('10030', '数据库理论', 'SQL的授权语句中的关键字PUBLIC表示_________________', '全体用户', '暂无解析', '2', '1', '理论基础');
INSERT INTO `fillquestion` VALUES ('10031', '数据库理论', '数据独立性又可为_______________和_______________两方面', '逻辑独立性 物理独立性', '暂无解析', '2', '1', '理论基础');
INSERT INTO `fillquestion` VALUES ('10032', '数据结构', '程序段“ i=1;while(i<=n) i=i*2; ”的时间复杂度为()', 'log2n', '暂无解析', '2', '1', '概论');
INSERT INTO `fillquestion` VALUES ('10033', '数据结构', '数据结构的四种基本类型中， ()的元素是一对多关系', '树形结构', '暂无解析', '2', '1', '概论');
INSERT INTO `fillquestion` VALUES ('10034', '数据结构', '数据结构被形式地定义为（ D, R ），其中D 是()的有限集合， R 是D 上的()\n有限集合', '数据元素 关系', '暂无解析', '2', '1', '概论');
INSERT INTO `fillquestion` VALUES ('10035', '数据结构', '在图形结构中，每个结点的前驱结点数和后续结点数可以()', '任意多个', '暂无解析', '2', '1', '概论');
INSERT INTO `fillquestion` VALUES ('10036', '数据结构', '任何一个C 程序都由()和若干个被调用的其它函数组成', '一个主函数', '暂无解析', '2', '1', '概论');
INSERT INTO `fillquestion` VALUES ('10037', '数据结构', '具有n 个结点的完全二叉树的深度是()', 'log 2n +1', '暂无解析', '2', '1', '树');
INSERT INTO `fillquestion` VALUES ('10038', '数据结构', '哈夫曼树是其树的带权路径长度()', '最小的二叉树', '暂无解析', '2', '1', '树');
INSERT INTO `fillquestion` VALUES ('10039', '数据结构', '在一棵二叉树中，度为0的结点的个数是n0 ，度为2 的结点的个数为n2 ，则有n0=()', 'N2+1', '暂无解析', '2', '1', '树');
INSERT INTO `fillquestion` VALUES ('10040', '数据结构', '树内各结点度的最大值称为树的()', '度', '暂无解析', '2', '1', '树');
INSERT INTO `fillquestion` VALUES ('10041', '数据结构', '空格串的长度为空格数空串的长度为() ', '0', '', '2', '1', '栈和队列');
INSERT INTO `fillquestion` VALUES ('10042', '数据结构', '设串S=’How are you’，则串的长度为()', '11', null, '2', '1', '栈和队列');

-- ----------------------------
-- Table structure for judgequestion
-- ----------------------------
DROP TABLE IF EXISTS `judgequestion`;
CREATE TABLE `judgequestion` (
  `questionId` int(9) NOT NULL AUTO_INCREMENT COMMENT '试题编号',
  `subject` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '考试科目',
  `question` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '试题内容',
  `answer` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '正确答案',
  `analysis` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '题目解析',
  `score` int(2) DEFAULT '2' COMMENT '分数',
  `level` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '难度等级',
  `section` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '所属章节',
  PRIMARY KEY (`questionId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10031 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='判断题题库表';

-- ----------------------------
-- Records of judgequestion
-- ----------------------------
INSERT INTO `judgequestion` VALUES ('10001', '计算机网络', '与有线网相比,无线网的数据传输率一般相对较慢', 'T', null, '2', '1', '');
INSERT INTO `judgequestion` VALUES ('10002', '计算机网络', 'OSI参考模型中,不同节点的同等层具有不同的功能', 'F', null, '2', '1', null);
INSERT INTO `judgequestion` VALUES ('10003', '计算机网络', '普通电脑不能作为服务器', 'F', null, '2', '1', null);
INSERT INTO `judgequestion` VALUES ('10004', '计算机网络', '没有网线的电脑不能连入互联网', 'F', null, '2', '1', null);
INSERT INTO `judgequestion` VALUES ('10005', '计算机网络', '网卡必须安装驱动程序', 'T', null, '2', '1', null);
INSERT INTO `judgequestion` VALUES ('10006', '计算机网络', 'UTP为屏蔽双绞线', 'F', null, '2', '1', null);
INSERT INTO `judgequestion` VALUES ('10007', '计算机网络', '网络接口卡又称为网卡,它是构成网络的基本部件', 'T', null, '2', '1', null);
INSERT INTO `judgequestion` VALUES ('10008', '计算机网络', '无线AP可以成倍地扩展网络覆盖范围', 'T', null, '2', '1', null);
INSERT INTO `judgequestion` VALUES ('10009', '计算机网络', 'SMTP是一组用于由源地址到目的地址传送邮件的协议', 'T', null, '2', '1', null);
INSERT INTO `judgequestion` VALUES ('10010', '计算机网络', '任务管理器可以关闭所有的进程', 'F', null, '2', '1', null);
INSERT INTO `judgequestion` VALUES ('10011', '计算机网络', '利用BT下载时,用户越多,下载速度越快', 'T', null, '2', '1', null);
INSERT INTO `judgequestion` VALUES ('10012', '计算机网络', 'INTERNET上向朋友发送电子邮件,必须知道对方的真实姓名和家庭住址', 'F', null, '2', '1', null);
INSERT INTO `judgequestion` VALUES ('10013', '数据结构', '单链表不是一种随机存储结构。', 'T', '', '2', '1', '线性表');
INSERT INTO `judgequestion` VALUES ('10014', '数据结构', '在具有头结点的单链表中，头指针指向链表的第一个数据结点（的存储位置）', 'F', null, '2', '1', '线性表');
INSERT INTO `judgequestion` VALUES ('10015', '数据结构', '用循环单链表表示的链队列中，可以不设队头指针，仅在队尾设置队尾指针。', 'F', '暂无解析', '2', '1', '线性表');
INSERT INTO `judgequestion` VALUES ('10016', '数据结构', '顺序存储方式只能用于存储线性结构。', 'T', '暂无解析', '2', '1', '线性表');
INSERT INTO `judgequestion` VALUES ('10017', '数据结构', '在线性表的顺序存储结构中， 逻辑上相邻的两个元素但是在物理位置上不一定是相邻的。', 'T', '暂无解析', '2', '1', null);
INSERT INTO `judgequestion` VALUES ('10018', '数据结构', '链式存储的线性表可以随机存取。', 'F', '暂无解析', '2', '1', '线性表');
INSERT INTO `judgequestion` VALUES ('10019', '数据结构', '由二叉树的前序和后序遍历序列能惟一确定这棵二叉树。', 'F', '暂无解析', '2', '1', '树');
INSERT INTO `judgequestion` VALUES ('10020', '数据结构', '一个含有n个结点的完全二叉树，它的高度是log 2n ＋1', 'T', '暂无解析', '2', '1', '树');
INSERT INTO `judgequestion` VALUES ('10021', '数据结构', '完全二叉树的某结点若无左孩子，则它必是叶结', 'T', '暂无解析', '2', '1', '树');
INSERT INTO `judgequestion` VALUES ('10022', '数据结构', '线性表的逻辑顺序总是与其物理顺序一致', 'F', '', '2', '1', '');
INSERT INTO `judgequestion` VALUES ('10023', '数据结构', '线性表的顺序存储优于链式存储', 'F', null, '2', '1', '线性表');
INSERT INTO `judgequestion` VALUES ('10024', '数据结构', '在长度为n的顺序表中， 求第i个元素的直接前驱算\n法的时间复杂度为0（1）', 'T', null, '2', '1', null);
INSERT INTO `judgequestion` VALUES ('10025', '数据结构', '若一棵二叉树中的结点均无右孩子，则该二叉树\n的中根遍历和后根遍历序列正好相反', 'F', null, '2', '1', '树');
INSERT INTO `judgequestion` VALUES ('10026', '数据结构', '顺序表和一维数组一样， 都可以按下标随机\n（或直接）访问', 'T', null, '2', '1', '表');
INSERT INTO `judgequestion` VALUES ('10027', '数据结构', '内部排序是指排序过程在内存中进行的排序。', 'T', null, '2', '1', '排序');
INSERT INTO `judgequestion` VALUES ('10028', '数据结构', '当待排序序列初始有序时，简单选择排序的时间\n复杂性为O(n)', 'F', null, '2', '1', '排序');
INSERT INTO `judgequestion` VALUES ('10029', '数据结构', '用邻接矩阵存储一个图时，在不考虑压缩存储的情\n况下，所占用的存储空间大小只与图中的顶点个数有关，\n而与图的边数无关。', 'T', null, '2', '1', '图');
INSERT INTO `judgequestion` VALUES ('10030', '数据结构', '任何一棵二叉树的叶结点在三种遍历中的相对次\n序是不变的', 'T', null, '2', '1', '树');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(9) NOT NULL AUTO_INCREMENT COMMENT '留言编号',
  `title` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '标题',
  `content` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '留言内容',
  `time` date DEFAULT NULL COMMENT '留言时间',
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='留言表';

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('35', '林林林', '你好', '2019-05-30', null);
INSERT INTO `message` VALUES ('36', 'ff', 'ff', '2019-06-05', null);
INSERT INTO `message` VALUES ('37', '123456', '123456', '2019-06-17', null);
INSERT INTO `message` VALUES ('38', '周', '你干嘛', '2019-06-19', null);
INSERT INTO `message` VALUES ('39', '林林林', '大家好', '2019-06-20', '黄先龙');

-- ----------------------------
-- Table structure for multiquestion
-- ----------------------------
DROP TABLE IF EXISTS `multiquestion`;
CREATE TABLE `multiquestion` (
  `questionId` int(9) NOT NULL AUTO_INCREMENT COMMENT '试题编号',
  `subject` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '考试科目',
  `question` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '问题题目',
  `answerA` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '选项A',
  `answerB` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '选项B',
  `answerC` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '选项C',
  `answerD` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '选项D',
  `rightAnswer` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '正确答案',
  `analysis` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '题目解析',
  `score` int(2) DEFAULT '2' COMMENT '分数',
  `section` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '所属章节',
  `level` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '难度等级',
  PRIMARY KEY (`questionId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10107 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='选择题题库表';

-- ----------------------------
-- Records of multiquestion
-- ----------------------------
INSERT INTO `multiquestion` VALUES ('10000', '计算机网络', 'DNS 服务器和DHCP服务器的作用是（）', '将IP地址翻译为计算机名，为客户机分配IP地址', '将IP地址翻译为计算机名、解析计算机的MAC地址', '将计算机名翻译为IP地址、为客户机分配IP地址', '将计算机名翻译为IP地址、解析计算机的MAC地址', 'C', null, '2', '应用层', '1');
INSERT INTO `multiquestion` VALUES ('10001', '计算机网络', 'HTTP协议通常使用什么协议进行传输（）', 'ARP', 'DHCP', 'UDP', 'TCP', 'D', null, '2', '应用层', '1');
INSERT INTO `multiquestion` VALUES ('10003', '计算机网络', '查看DNS缓存记录的命令（）', 'ipconfig/displaydns', 'nslookup', 'ipconfig/release', 'ipconfig/flushdns', 'A', null, '2', '应用层', '1');
INSERT INTO `multiquestion` VALUES ('10004', '计算机网络', 'DHCP(        )报文的目的IP地址为255.255.255.255', 'DhcpDisover', 'DhcpOffer', 'DhcpAck', 'DhcpNack', 'A', null, '2', '应用层', '1');
INSERT INTO `multiquestion` VALUES ('10005', '计算机网络', '下列地址中，（  ）不是DHCP服务器分配的IP地址', '196.254.109.100', '169.254.12.42', '69.254.48.45', '96.254.54.15', 'B', null, '2', '应用层', '1');
INSERT INTO `multiquestion` VALUES ('10006', '计算机网络', 'DHCP通常可以为客户端自动配置哪些网络参数（）', 'IP，掩码，网关，DNS', 'IP，掩码，域名，SMTP', '网关，掩码，浏览器，FTP', 'IP，网关，DNS，服务器', 'A', null, '2', '应用层', '1');
INSERT INTO `multiquestion` VALUES ('10007', '计算机网络', 'DNS服务器在名称解析过程中正确的查询顺序为（）', '本地缓存记录→区域记录→转发域名服务器→根域名服务器', '区域记录→本地缓存记录→转发域名服务器→根域名服务器', '本地缓存记录→区域记录→根域名服务器→转发域名服务器', '区域记录→本地缓存记录→根域名服务器→转发域名服务器', 'A', null, '2', '应用层', '1');
INSERT INTO `multiquestion` VALUES ('10008', '计算机网络', '在TCP/IP协议中，序号小于（  ）的端口称为熟知端口(well-known port)。', '1024', '64', '256', '128', 'A', null, '2', '传输层', '1');
INSERT INTO `multiquestion` VALUES ('10009', '计算机网络', '在Internet上用TCP/IP播放视频，想用传输层的最快协议，以减少时延，要使用（ ）', 'UDP协议的低开销特性', 'UDP协议的高开销特性', 'TCP协议的低开销特性', 'TCP协议的高开销特性', 'A', null, '2', '传输层', '1');
INSERT INTO `multiquestion` VALUES ('10010', '计算机网络', '在TCP协议中采用（ ）来区分不同的应用进程', '端口号', 'IP地址', '协议类型', 'MAC地址', 'A', null, '2', '传输层', '1');
INSERT INTO `multiquestion` VALUES ('10011', '计算机网络', '可靠的传输协议中的“可靠”指的是（ ）', '使用面向连接的会话', '使用“尽力而为”的传输', '使用滑动窗口来维持可靠性', '使用确认重传机制来确保传输的数据不丢失', 'D', null, '2', '传输层', '1');
INSERT INTO `multiquestion` VALUES ('10012', '计算机网络', '假设拥塞窗口为50KB，接收窗口为80KB，TCP能够发送的最大字节数为（ ）', '50KB', '80KB', '130KB', '30KB', 'A', null, '2', '传输层', '1');
INSERT INTO `multiquestion` VALUES ('10013', '计算机网络', '主机A向主机B发送一个（SYN=1，seq=2000）的TCP报文，期望与主机B建立连接，若主机B接受连接请求，则主机B发送的正确有TCP报文可能是（ ）', '（SYN=0,ACK=0,seq=2001,ack=2001）', '（SYN=1,ACK=1,seq=2000,ack=2000）', '•	C.（SYN=1,ACK=1,seq=2001,ack=2001）', '（SYN=0,ACK=1,seq=2000,ack=2000）', 'C', null, '2', '传输层', '1');
INSERT INTO `multiquestion` VALUES ('10014', '计算机网络', '主机A向主机B连续发送了两个TCP报文段，其序号分别为70和100。试问： （1）第一个报文段携带了（）个字节的数据？', ' 70', '30', '100', '170', 'B', null, '2', '传输层', '1');
INSERT INTO `multiquestion` VALUES ('10015', '计算机网络', 'PCM脉码调制的过程（ ）', '采样、量化、编码', '量化、编码、采样', '编码、量化、采样', '采样、编码、量化', 'A', null, '2', '物理层', '1');
INSERT INTO `multiquestion` VALUES ('10016', '计算机网络', '若某采用4相位调制的通信链路的数据传输速率为2400bps，则该链路的波特率为（）', '600Baud', '1200Baud', '4800Baud', '9600Baud', 'B', null, '2', '物理层', '1');
INSERT INTO `multiquestion` VALUES ('10017', '计算机网络', '以下关于数据传输速率的描述中，错误的是( )', '数据传输速率表示每秒钟传输构成数据代码的二进制比特数', '对于二进制数据，数据传输速率为S=1/T (bps)', '常用的数据传输速率单位有: 1Mbps=1.024×106bps', '数据传输速率是描述数据传输系统性能的重要技术指标之一', 'C', null, '2', '物理层', '1');
INSERT INTO `multiquestion` VALUES ('10018', '计算机网络', '以下关于时分多路复用概念的描述中，错误的是.(  ).', '时分多路复用将线路使用的时间分成多个时间片', '时分多路复用分为同步时分多路复用与统计时分多路复用', '时分多路复用使用“帧”与数据链路层“帧”的概念、作用是不同的', '统计时分多路复用将时间片预先分配给各个信道', 'D', null, '2', '物理层', '1');
INSERT INTO `multiquestion` VALUES ('10019', '计算机网络', '1000BASE-T标准支持的传输介质是（）', '双绞线', '同轴电缆', '光纤', '无线电', 'A', null, '2', '物理层', '1');
INSERT INTO `multiquestion` VALUES ('10020', '计算机网络', '一个以太网交换机，读取整个数据帧，对数据帧进行差错校验后再转发出去，这种交换方式称为 （）', '直通交换', '无碎片交换', '无差错交换', '存储转发交换', 'D', null, '2', '数据链路层', '1');
INSERT INTO `multiquestion` VALUES ('10021', '计算机网络', '关于VLAN，下面的描述中正确的是（）', '一个新的交换机没有配置VLAN', '通过配置VLAN减少了冲突域的数量', '一个VLAN不能跨越多个交换机', '各个VLAN属于不同的广播域', 'D', null, '2', '数据链路层', '1');
INSERT INTO `multiquestion` VALUES ('10022', '计算机网络', '以太网协议中使用物理地址作用是什么？', '.用于不同子网中的主机进行通信', '作为第二层设备的唯一标识', '用于区别第二层第三层的协议数据单元', '保存主机可检测未知的远程设备', 'B', null, '2', '数据链路层', '1');
INSERT INTO `multiquestion` VALUES ('10023', '计算机网络', '以太网采用的CSMA/CD协议，当冲突发生时要通过二进制指数后退算法计算后退延时， 关于这个算法，以下论述中错误的是 （）', '冲突次数越多，后退的时间越短', '平均后退次数的多少与负载大小有关', '后退时延的平均值与负载大小有关', '重发次数达到一定极限后放弃发送', 'A', null, '2', '数据链路层', '1');
INSERT INTO `multiquestion` VALUES ('10024', '计算机网络', '以下关于交换机获取与其端口连接设备的MAC地址的叙述中，正确的是（）', '交换机从路由表中提取设备的MAC地址', '交换机检查端口流入分组的源地址', '交换机之间互相交换地址表', '网络管理员手工输入设备的MAC地址', 'B', null, '2', '数据链路层', '1');
INSERT INTO `multiquestion` VALUES ('10025', '计算机网络', '如果G (x）为11010010，以下4个CRC校验比特序列中只有哪个可能是正确的 ？', '1101011001', '101011011', '11011011', '1011001', 'B', null, '2', '数据链路层', '1');
INSERT INTO `multiquestion` VALUES ('10026', '计算机网络', '以下关于Ethernet物理地址的描述中，错误的是', 'Ethernet物理地址又叫做MAC地址', '48位的Ethernet物理地址允许分配的地址数达到247个', '网卡的物理地址写入主机的EPROM中', '每一块网卡的物理地址在全世界是唯一的', 'C', null, '2', '数据链路层', '1');
INSERT INTO `multiquestion` VALUES ('10027', '计算机网络', '下列帧类型中，不属于HDLC帧类型的是（）', '信息帧', '确认帧', '监控帧', '无编号帧', 'B', null, '2', '数据链路层', '1');
INSERT INTO `multiquestion` VALUES ('10028', '计算机网络', '通过交换机连接的一组站点，关于它们的广播域和冲突域说法正确的是（）', '组成一个冲突域，但不是一个广播域', '组成一个广播域，但不是一个冲突域', '组成一个冲突域，也是一个广播域', '既不一个冲突域，也不是一个广播域', 'B', null, '2', '数据链路层', '1');
INSERT INTO `multiquestion` VALUES ('10029', '计算机网络', '数据链路层的数据单位是（）', '帧', '字节', '比特', '分组', 'A', null, '2', '数据链路层', '1');
INSERT INTO `multiquestion` VALUES ('10030', '计算机网络', 'LAN参考模型可分为物理层、（ ）', 'MAC，LLC等三层', 'LLC，MHS等三层', 'MAC，FTAM等三层', 'LLC，VT等三层', 'A', null, '2', '数据链路层', '1');
INSERT INTO `multiquestion` VALUES ('10031', '测试', '测试', 'A', 'B', 'C', 'D', 'B', '解析', '2', '测试', '1');
INSERT INTO `multiquestion` VALUES ('10032', '计算机网络', 'DNS 服务器和DHCP服务器的作用是（）', 'A', 'B', 'C', 'D', 'B', '哦解析', '2', '网络层', '1');
INSERT INTO `multiquestion` VALUES ('10033', '软件测试', '一', 'a', 'aa', 'aaa', 'aaaa', 'A', 'aaaaaa', '2', '', '1');
INSERT INTO `multiquestion` VALUES ('10034', '软件测试', 'b', 'bb', 'bb', 'bbb', 'bbbb', null, 'bbbbb', '2', null, '1');
INSERT INTO `multiquestion` VALUES ('10035', '计算机导论', '', '', '', '', '', '', '', '2', '', '1');
INSERT INTO `multiquestion` VALUES ('10036', '数据库理论', '在数据库的三级模式结构中，描述数据库中数据的全局逻辑结构和特征的是', '外模式', '内模式', '存储模式', '模式', 'D', '暂无解析', '2', '理论基础题', '1');
INSERT INTO `multiquestion` VALUES ('10037', '数据库理论', '公司中有多个部门和多名职员，每个职员只能属于一个部门，一个部门可以有多名职员，从职员到部门的联系类型是', '多对多', '一对一', '多对一', '一对多', 'C', '暂无解析', '2', '表的关系', '1');
INSERT INTO `multiquestion` VALUES ('10038', '数据库理论', 'DB、DBMS和DBS三者之间的关系是', 'DB包括DBMS和DBS', 'DBS包括DB和DBMS', 'DBMS包括DB和DBS', '不能相互包括', 'B', '暂无解析', '2', '理论基础', '1');
INSERT INTO `multiquestion` VALUES ('10039', '数据库理论', '关系数据库中的码是指', '能唯一决定关系的字段', '不可改动的专用保留字', '关键的很重要的字段 ', '能唯一标识元组的属性或属性集合', 'D', '暂无解析', '2', '理论基础', '1');
INSERT INTO `multiquestion` VALUES ('10040', '计算机网络', '在下面的输入框中输入题目,形如--DNS 服务器和DHCP服务器的作用是（） ', '', '', '', '', 'A', '', '2', '4', '1');
INSERT INTO `multiquestion` VALUES ('10042', '数据结构', '研究数据结构就是研究', '数据的逻辑结构', '数据的存储结构', '数据的逻辑结构和存储结构', '数据的逻辑结构、存储结构及其基本操作（研究非 数值计算的程序设计问题中，计算机操作对象以及他们之间的关系和操作）', 'D', '暂无解析', '2', '概论', '1');
INSERT INTO `multiquestion` VALUES ('10043', '数据结构', '算法分析的两个主要方面是（）', '空间复杂度和时间复杂度', '正确性和简单性', '可读性和文档性', '数据复杂性和程序复杂性', 'A', '暂无解析', '2', '概论', '1');
INSERT INTO `multiquestion` VALUES ('10044', '数据结构', '具有线性结构的数据结构是', '图', '树', '广义表', '栈', 'D', '（ 线性结构就是：在非空有限集合中，存在为一个被称为第一个的数据元素和最后一个元素， 有除了第一个元素， 集合中每一个元素均只有一个前驱，除了最后一个元素有唯一后继）（链表、栈、队列、数组、串）', '2', '概论', '1');
INSERT INTO `multiquestion` VALUES ('10045', '数据结构', '计算机中的算法指的是解决某一个问题的有限运算序列，它必须具备输入、输出、（）等5 个特性。', '可执行性、可移植性和可扩充性', '可执行性、有穷性和确定性', '确定性、有穷性和稳定性', '易读性、稳定性和确定性', 'B', '暂无解析', '2', '概论', '1');
INSERT INTO `multiquestion` VALUES ('10046', '数据结构', '下面程序段的时间复杂度是（  ）。\nfor(i=0;i<m;i++)\nfor(j=0;j<n;j++)\na[i][j]=i*j;', 'O(m 2)', 'O(n 2)', 'O(m*n)', 'O(m+n)', 'C', '暂无解析', '2', '概论', '1');
INSERT INTO `multiquestion` VALUES ('10047', '数据结构', '算法是（）。', '计算机程序', '解决问题的计算方法', '排序算法', '解决 问题的有限运算序列', 'D', '为了解决某一问题而规定的一个有限长的操作序列', '2', '概论', '1');
INSERT INTO `multiquestion` VALUES ('10048', '数据结构', '某算法的语句执行频度为（ 3n+nlog 2n+n 2+8 ） , 其时间复杂度表示（  ）。', 'O(n)', 'O(nlog 2n）', 'O(n 2 )', 'O(log 2n）', 'C', '暂无解析', '2', '概论', '1');
INSERT INTO `multiquestion` VALUES ('10049', '数据结构', '下面程序段的时间复杂度为（ ）。\ni=1;\nwhile(i<=n)\ni=i*3;', 'O(n)', 'O(3n)', 'O(log 3n）', 'O(n 3)', 'C', '暂无解析', '2', '概论', '1');
INSERT INTO `multiquestion` VALUES ('10050', '数据结构', '数据结构是一门研究非数值计算的程序设计问题中计算机的数据元素以及它们之间的（）和运算等的学科。（关系和操作）', '结构', '关系', '运算', '算法', 'B', '暂无解析', '2', '概论', '1');
INSERT INTO `multiquestion` VALUES ('10051', '数据结构', '下面程序段的时间复杂度是（）。\ni=s=0;\nwhile(s<n){\ni++;s+=i;\n}', 'O(n)', 'O(n 2)', 'O(log 2n)', 'O(n 3)', 'A', '暂无解析', '2', '概论', '1');
INSERT INTO `multiquestion` VALUES ('10052', '数据结构', '抽象数据类型的三个组成部分分别为（）。', '数据对象、数据关系和基本操作', '数据元素、逻辑结构和存储结构', '数据项、数据元素和数据类型', '数据元素、数据结构和数据类型', 'A', '暂无解析', '2', '概论', '1');
INSERT INTO `multiquestion` VALUES ('10053', '数据结构', '通常从正确性、易读性、健壮性、高效性等4 个方面评价算法的质量，以下解释错误的\n是（ ）。', '正确性算法应能正确地实现预定的功能', '易读性算法应易于阅读和理解，以便调试、修改和扩充', '健壮性当环境发生变化时， 算法能适当地做出反应或进行处理， 不会产生不需要的运 行结果', '高效性即达到所需要的时间性能空间', 'D', '暂无解析', '2', '概论', '1');
INSERT INTO `multiquestion` VALUES ('10054', '数据结构', '下列程序段的时间复杂度为（）。\nx=n;y=0;\nwhile(x>=(y+1)*(y+1))\ny=y+1;', 'O(n)', 'O( n)', 'O(1)', 'O(n 2)', 'B', '暂无解析', '2', '概论', '1');
INSERT INTO `multiquestion` VALUES ('10055', '数据结构', '非线性结构是数据元素之间存在一种()', '一对多关系', '多对多关系', '多对一关系', '一对 一关系', 'B', '暂无解析', '2', '概论', '1');
INSERT INTO `multiquestion` VALUES ('10056', '数据结构', '数据结构中，与所使用的计算机无关的是数据的（）结构；', '存储', '物理', '逻辑', '物理和存储', 'C', '暂无解析', '2', '概论', '1');
INSERT INTO `multiquestion` VALUES ('10057', '数据结构', '算法分析的目的是（）', '找出数据结构的合理性', '研究算法中的输入和输出的关系', '分析算法的效率以求改进', '分析算法的易懂性和文档性', 'C', '暂无解析', '2', '概论', '1');
INSERT INTO `multiquestion` VALUES ('10058', '数据结构', '算法分析的两个主要方面5 是（）', '空间复杂性和时间复杂性', '正确性和简明性', '可读性和文档性', '数据复杂性和程序复杂性', 'A', '暂无解析', '2', '概论', '1');
INSERT INTO `multiquestion` VALUES ('10059', '数据结构', '计算机算法指的是（）', '计算方法', '排序方法', '解决问题的有限运算序列', '调度 方法', 'C', '暂无解析', '2', '理论', '1');
INSERT INTO `multiquestion` VALUES ('10060', '数据结构', '计算机算法必须具备输入、输出和（）等5 个特性', '可行性、可移植性和可扩充性', '可行性、确定性和有穷性', '确定性、有穷性和稳定性', '易读性、稳定性和安全性', 'B', '暂无解析', '2', '理论', '1');
INSERT INTO `multiquestion` VALUES ('10061', '数据结构', '若长度为n 的线性表采用顺序存储结构， 在其第i 个位置插入一个新元素算法的时间复\n杂度（）。', 'O(log 2n)', 'O(1)', 'O(n)', 'O(n 2)', 'B', '暂无解析', '2', '线性表', '1');
INSERT INTO `multiquestion` VALUES ('10062', '数据结构', '二叉树的深度为k ，则二叉树最多有（）个结点。\nA.  B. 2  C. 2 D. ', '2k', 'k-1', 'k-1', '2k-1', 'C', '暂无解析', '2', '树', '1');
INSERT INTO `multiquestion` VALUES ('10063', '数据结构', '用顺序存储的方法，将完全二叉树中所有结点按层逐个从左到右的顺序存放在一维数组\nR[1..N] 中，若结点R[i] 有右孩子，则其右孩子是（）。\n', 'R[2i-1]', 'R[2i+1]', ' R[2i]', 'R[2/i]', 'B', '暂无解析', '2', '树', '1');
INSERT INTO `multiquestion` VALUES ('10064', '数据结构', '设a,b 为一棵二叉树上的两个结点，在中序遍历时， a 在b 前面的条件是（）。\n', 'a 在b的右方', 'a 在b的左方', 'a 是b 的祖先', 'a是b的子孙', 'B', '暂无解析', '2', '树', '1');
INSERT INTO `multiquestion` VALUES ('10065', '数据结构', '设一棵二叉树的中序遍历序列： badce ，后序遍历序列： bdeca ，则二叉树先序遍历序\n列为（）。', 'adbce', 'decab', 'debac', 'abcde', 'B', '暂无解析', '2', '树', '1');
INSERT INTO `multiquestion` VALUES ('10066', '数据结构', '在一棵具有5 层的满二叉树中结点总数为（）。', '31', '32', '33', '16', 'A', '暂无解析', '2', '树', '1');
INSERT INTO `multiquestion` VALUES ('10067', '数据结构', '某二叉树的中序序列为ABCDEFG，后序序列为BDCAFGE，则其左子树中结点数目为\n（）。', '3', '2', '4', '5', 'C', '暂无解析', '2', '树', '1');
INSERT INTO `multiquestion` VALUES ('10068', '数据结构', '若以{4,5,6,7,8} 作为权值构造哈夫曼树，则该树的带权路径长度为（）。', '67', '68', '69', '70', 'C', '暂无解析', '2', '树', '1');
INSERT INTO `multiquestion` VALUES ('10069', '数据结构', '将一棵有100 个结点的完全二叉树从根这一层开始，每一层上从左到右依次对结点进行\n编号，根结点的编号为1，则编号为49 的结点的左孩子编号为（）。', '98', '99', '50', '48', 'A', '暂无解析', '2', '树', '1');
INSERT INTO `multiquestion` VALUES ('10070', '数据结构', '表达式a*(b+c)-d 的后缀表达式是（）。', 'abcd+-', 'abc+*d-', 'abc*+d-', '-+*abcd', 'B', '暂无解析', '2', '树', '1');
INSERT INTO `multiquestion` VALUES ('10071', '数据结构', '对某二叉树进行先序遍历的结果为ABDEFC，中序遍历的结果为DBFEAC，则后序遍历\n的结果是（）。', 'DBFEAC', 'DFEBCA', 'BDFECA', 'BDEFAC', 'B', '暂无解析', '2', '树', '1');
INSERT INTO `multiquestion` VALUES ('10072', '数据结构', '树最适合用来表示（）。', '有序数据元素', '无序数据元素', '元素之间具有分支层次关系的数 据', '元素之间无联系的数据', 'C', '暂无解析', '2', '树', '1');
INSERT INTO `multiquestion` VALUES ('10073', '数据结构', '表达式A*(B+C)/(D-E+F) 的后缀表达式是（）。\n', 'A*B+C/D-E+F', 'AB*C+D/E-F+', 'ABC+*DE-F+/', 'ABCDED*+/-+', 'C', '暂无解析', '2', '树', '1');
INSERT INTO `multiquestion` VALUES ('10074', '数据结构', '在线索二叉树中， t 所指结点没有左子树的充要条件是（） 。', 't->left==NULL', 't->ltag==1', 't->ltag==1&&t->left==NULL', '以上都不对', 'C', '暂无解析', '2', '树', '1');
INSERT INTO `multiquestion` VALUES ('10075', '数据结构', '在下列情况中，可称为二叉树的是（）。', '每个结点至多有两棵子树的树', '哈夫曼树', ' 每个结点至多有两棵子树的有序树', '每个结点只有一棵子树', 'B', '暂无解析', '2', '树', '1');
INSERT INTO `multiquestion` VALUES ('10076', '数据结构', '按照二叉树的定义，具有3个结点的二叉树有（ C）种。\nA. 3 B. 4 C. 5 D. 6', '3', '4', '5', '6', 'C', '暂无解析', '2', '树', '1');
INSERT INTO `multiquestion` VALUES ('10077', '数据结构', '在计算机存储器内表示时，物理地址和逻辑地址相同并且是连续的，称之为()', '逻辑结构', '顺序存储结构', '链表存储结构 ', '以上都不对', 'B', '', '2', '', '1');
INSERT INTO `multiquestion` VALUES ('10078', '数据结构', '数据结构中，在逻辑上可以把数据结构分成：（）。', '动态结构和静态结构', '紧凑结构和非紧凑结构', '线性结构和非线性结构', '内部结构和外部结构', 'C', null, '2', null, '1');
INSERT INTO `multiquestion` VALUES ('10079', '数据结构', '以下属于顺序存储结构优点的是（）。', '存储密度大', '插入运算方便', '删除运算方便', '可方便地用于各种逻辑结构的存储表示', 'A', null, '2', null, '1');
INSERT INTO `multiquestion` VALUES ('10080', '数据结构', '数据结构研究的内容是（）。', '数据的逻辑结构', '数据的存储结构', '建立在相应逻辑结构和存储结构上的算法', '包括以上三个方面', 'D', null, '2', null, '1');
INSERT INTO `multiquestion` VALUES ('10081', '数据结构', '链式存储的存储结构所占存储空间（）。', '分两部分，一部分存放结点值，另一部分存放表示结点间关系的指针', '只有一部分，存放结点值', '只有一部分，存储表示结点间关系的指针', '分两部分，一部分存放结点值，另一部分存放结点所占单元数', 'A', null, '2', null, '1');
INSERT INTO `multiquestion` VALUES ('10082', '数据结构', '一个正确的算法应该具有 5 个特性，除输入、输出特性外，另外 3 个特性是（）。', '确定性、可行性、有穷性', '易读性、确定性、有效性', '有穷性、稳定性、确定性 ', '可行性、易读性、有穷性', 'A', null, '2', null, '1');
INSERT INTO `multiquestion` VALUES ('10083', '数据结构', '以下关于数据的逻辑结构的叙述中正确的是（）。', '数据的逻辑结构是数据间关系的描述', '数据的逻辑结构反映了数据在计算机中的存储方式', '数据的逻辑结构分为顺序结构和链式结构', '数据的逻辑结构分为静态结构和动态结构', 'A', null, '2', null, '1');
INSERT INTO `multiquestion` VALUES ('10084', '数据结构', '算法分析的主要任务是（）。', '探讨算法的正确性和可读性', '探讨数据组织方式的合理性', '为给定问题寻找一种性能良好的解决方案 ', '研究数据之间的逻辑关系', 'C', null, '2', null, '1');
INSERT INTO `multiquestion` VALUES ('10085', '数据结构', '下述哪一条是顺序存储结构的优点？（）', '存储密度大', '插入运算方便', '删除运算方便', '可方便地用于各种逻辑结构的存储表示', 'A', null, '2', null, '1');
INSERT INTO `multiquestion` VALUES ('10086', '数据结构', '下面关于线性表的叙述中，错误的是哪一个？（）', '线性表采用顺序存储，必须占用一片连续的存储单元。', '线性表采用顺序存储，便于进行插入和删除操作。', '线性表采用链接存储，不必占用一片连续的存储单元', '线性表采用链接存储，便于插入和删除操作', 'B', null, '2', '线性表', '1');
INSERT INTO `multiquestion` VALUES ('10087', '数据结构', '若某线性表最常用的操作是存取任一指定序号的元素和在最后进行插入和删除运算，则利用（）存储方式最节省时间。', '顺序表', '双链表', '带头结点的双循环链表', '单循环链表', 'A', null, '2', '线性表', '1');
INSERT INTO `multiquestion` VALUES ('10088', '数据结构', '某线性表中最常用的操作是在最后一个元素之后插入一个元素和删除第一个元素，则采用（）存储方式最节省运算时间。', '单链表', '仅有头指针的单循环链表', '双链表', '仅有尾指针的单循环链表', 'D', null, '2', null, '1');
INSERT INTO `multiquestion` VALUES ('10089', '数据结构', '在一个长度为n的顺序表中删除第i个元素(0<=i<=n)时，需向前移动（）个元素', 'n-i', 'n-i+l', 'n-i-1', 'i', 'A', null, '2', '线性表', '1');
INSERT INTO `multiquestion` VALUES ('10090', '数据结构', '从一个具有n个结点的单链表中查找其值等于x的结点时，在查找成功的情况下，需平均比较（）个元素结点', 'n/2', 'n', '（n+1）/2 ', '（n-1）/2', 'C', null, '2', '线性表', '1');
INSERT INTO `multiquestion` VALUES ('10091', '数据结构', '设单链表中指针p指向结点m，若要删除m之后的结点（若存在），则需修改指针的操作为（）', 'p->next=p->next->next', 'p=p->next', 'p=p->next->next', 'p->next=p', 'A', null, '2', '线性表', '1');
INSERT INTO `multiquestion` VALUES ('10092', '数据结构', '在一个单链表中，已知q结点是p结点的前趋结点，若在q和p之间插入s结点，则须执行（）', 's->next=p->next;  p->next=s', 'q->next=s;  s->next=p', 'p->next=s->next;  s->next=p', 'p->next=s;  s->next=q', 'B', null, '2', '线性表', '1');
INSERT INTO `multiquestion` VALUES ('10093', '数据结构', '线性表的顺序存储结构是一种（）的存储结构。', '随机存取', '顺序存取 ', '索引存取', '散列存取', 'A', null, '2', '线性表', '1');
INSERT INTO `multiquestion` VALUES ('10094', '数据结构', '设有一个栈，元素的进栈次序为A, B, C, D, E,下列是不可能的出栈序列（）', 'A, B, C, D, E', 'B, C, D, E, A', 'E, A, B, C, D', 'E, D, C, B, A', 'C', null, '2', '栈和队列', '1');
INSERT INTO `multiquestion` VALUES ('10095', '数据结构', '在一个具有n个单元的顺序栈中，假定以地址低端（即0单元）作为栈底，以top作为栈顶指针，当做出栈处理时，top变化为（）', 'top不变', 'top=0', 'top--', 'top++', 'C', null, '2', '线性表', '1');
INSERT INTO `multiquestion` VALUES ('10096', '数据结构', '在具有n个单元的顺序存储的循环队列中，假定front和rear分别为队头指针和队尾指针，则判断队满的条件为（）', 'rear％n= = front', '（front+l）％n= = rear', 'rear％n -1= = front', '(rear+l)％n= = front', 'D', null, '2', '栈和队列', '1');
INSERT INTO `multiquestion` VALUES ('10097', 'C语言', 'dd', 'd', 'd', 'd', 'd', '', '', '2', '', '');
INSERT INTO `multiquestion` VALUES ('10098', 'C语言', 'dr', 'rr', 'rr', 'rr', 'r', 'A', null, '2', null, null);
INSERT INTO `multiquestion` VALUES ('10099', 'C语言', 'h', 'h', 'h', 'h', 'h', 'A', '', '2', '1', '1');
INSERT INTO `multiquestion` VALUES ('10100', '数据库理论', '()是存储在计算机内有结构的数据的结合', '数据库系统', '数据库', '数据库管理系统', '数据结构', 'B', '', '2', '', '2');
INSERT INTO `multiquestion` VALUES ('10101', '数据库理论', '下列（）不是DBM必须提供的数据控制功能', '安全性保护', '完整性检查', '可移植性', '并发控制', 'C', null, '2', null, '2');
INSERT INTO `multiquestion` VALUES ('10102', '计算机网络', '计算机网络是计算机技术与（）结合的产物', '通信', '电话', 'windows', '软件', 'A', '', '2', '', '2');
INSERT INTO `multiquestion` VALUES ('10103', '计算机网络', '下列（）数据通讯线路形式具备最佳数据保密及最高传输效率', '电话线路', '光纤', '同轴电缆', '双绞线', 'B', null, '2', null, '2');
INSERT INTO `multiquestion` VALUES ('10104', '计算机网络', '下列（）不是数据通讯的传输媒体', '同轴电缆', '微波', '光纤', '调制解调器', 'D', null, '2', null, '2');
INSERT INTO `multiquestion` VALUES ('10105', '计算机网络', '通信系统必须具备的三个基本要素是( C )', '终端、电缆、计算机 ', '信号发生器、通信线路、信号接收设备', '信源、通信媒体、信宿   ', '终端、通信设施、接收设备', 'C', '', '2', '', '2');
INSERT INTO `multiquestion` VALUES ('10106', '计算机网络', '计算机网络通信系统是(  )', '电信号传输系统 ', '文字通信系统', '信号通信系统 ', '数据通信系统', 'D', null, '2', null, '2');

-- ----------------------------
-- Table structure for papermanage
-- ----------------------------
DROP TABLE IF EXISTS `papermanage`;
CREATE TABLE `papermanage` (
  `paperId` int(9) DEFAULT NULL COMMENT '试卷编号',
  `questionType` int(1) DEFAULT NULL COMMENT '题目类型',
  `questionId` int(9) DEFAULT NULL COMMENT '题目编号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='试卷管理表';

-- ----------------------------
-- Records of papermanage
-- ----------------------------
INSERT INTO `papermanage` VALUES ('1002', '1', '10039');
INSERT INTO `papermanage` VALUES ('1003', '1', '10053');
INSERT INTO `papermanage` VALUES ('1003', '1', '10075');
INSERT INTO `papermanage` VALUES ('1003', '2', '10032');
INSERT INTO `papermanage` VALUES ('1003', '2', '10033');
INSERT INTO `papermanage` VALUES ('1003', '2', '10041');
INSERT INTO `papermanage` VALUES ('1003', '3', '10018');
INSERT INTO `papermanage` VALUES ('1003', '3', '10026');
INSERT INTO `papermanage` VALUES ('1003', '3', '10015');
INSERT INTO `papermanage` VALUES ('1003', '3', '10027');
INSERT INTO `papermanage` VALUES ('1007', '1', '10099');
INSERT INTO `papermanage` VALUES ('1002', '1', '10100');
INSERT INTO `papermanage` VALUES ('1002', '1', '10101');
INSERT INTO `papermanage` VALUES ('1001', '1', '10024');
INSERT INTO `papermanage` VALUES ('1001', '1', '10021');
INSERT INTO `papermanage` VALUES ('1001', '2', '10003');
INSERT INTO `papermanage` VALUES ('1001', '2', '10023');
INSERT INTO `papermanage` VALUES ('1001', '2', '10008');
INSERT INTO `papermanage` VALUES ('1001', '3', '10002');
INSERT INTO `papermanage` VALUES ('1001', '3', '10001');
INSERT INTO `papermanage` VALUES ('1001', '3', '10003');
INSERT INTO `papermanage` VALUES ('1001', '3', '10010');
INSERT INTO `papermanage` VALUES ('1001', '1', '10105');
INSERT INTO `papermanage` VALUES ('1001', '1', '10106');

-- ----------------------------
-- Table structure for replay
-- ----------------------------
DROP TABLE IF EXISTS `replay`;
CREATE TABLE `replay` (
  `messageId` int(255) DEFAULT NULL COMMENT '留言编号',
  `replayId` int(9) NOT NULL AUTO_INCREMENT COMMENT '回复编号',
  `replay` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '内容',
  `replayTime` date DEFAULT NULL COMMENT '回复时间',
  PRIMARY KEY (`replayId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='回复表';

-- ----------------------------
-- Records of replay
-- ----------------------------
INSERT INTO `replay` VALUES ('35', '21', '哈哈哈', '2019-05-31');
INSERT INTO `replay` VALUES ('27', '22', 'dfdf ', '2019-06-05');
INSERT INTO `replay` VALUES ('27', '23', '111', '2019-06-17');
INSERT INTO `replay` VALUES ('38', '24', 'sdaf', '2019-06-19');

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score` (
  `scoreId` int(9) NOT NULL AUTO_INCREMENT COMMENT '分数编号',
  `examCode` int(9) DEFAULT NULL COMMENT '考试编号',
  `studentId` int(9) DEFAULT NULL COMMENT '学号',
  `subject` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '课程名称',
  `ptScore` int(5) DEFAULT NULL COMMENT '平时成绩',
  `etScore` int(5) DEFAULT NULL COMMENT '期末成绩',
  `score` int(5) DEFAULT NULL COMMENT '总成绩',
  `answerDate` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '答题日期',
  PRIMARY KEY (`scoreId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='成绩管理表';

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES ('4', '20190001', '20154084', '计算机网络', null, '70', null, '2019-06-03');
INSERT INTO `score` VALUES ('14', '20190002', '20154084', '数据库理论', null, '78', null, '2019-06-10');
INSERT INTO `score` VALUES ('15', '20190002', '20154084', '数据库理论', null, '80', null, '2019-06-11');
INSERT INTO `score` VALUES ('16', '20190002', '20154084', '数据库理论', null, '83', null, '2019-06-14');
INSERT INTO `score` VALUES ('17', '20190001', '20154001', '计算机网络', null, '74', null, '2019-06-13');
INSERT INTO `score` VALUES ('18', '20190001', '20154001', '计算机网络', null, '70', null, '2019-06-10');
INSERT INTO `score` VALUES ('19', '20190001', '20155003', '计算机网络', null, '86', null, '2019-06-14');
INSERT INTO `score` VALUES ('20', '20190001', '20155007', '计算机网络', null, '90', null, '2019-06-11');
INSERT INTO `score` VALUES ('21', '20190001', '20155007', '计算机网络', null, '92', null, '2019-06-12');
INSERT INTO `score` VALUES ('22', '20190001', '20155008', '计算机网络', null, '80', null, '2019-06-12');
INSERT INTO `score` VALUES ('23', '20190001', '20155003', '计算机网络', null, '90', null, '2019-06-13');
INSERT INTO `score` VALUES ('24', '20190001', '20155008', '计算机网络', null, '88', null, '2019-06-14');
INSERT INTO `score` VALUES ('27', '20190001', '20154084', '计算机网络', null, '80', null, '2019-06-25');
INSERT INTO `score` VALUES ('30', '20190001', '20154084', '计算机网络', null, '0', null, '2019-06-29');
INSERT INTO `score` VALUES ('31', '20190001', '20154084', '计算机网络', null, '2', null, '2019-05-31');
INSERT INTO `score` VALUES ('32', '20190001', '16478079', '计算机网络', null, '0', null, '2019-06-03');
INSERT INTO `score` VALUES ('33', '20190014', '16478079', '软件测试', null, '0', null, '2019-06-03');
INSERT INTO `score` VALUES ('34', '20190014', '16478079', '软件测试', null, '2', null, '2019-06-03');
INSERT INTO `score` VALUES ('37', '20190001', '16478079', '计算机网络', null, '0', null, '2019-06-11');
INSERT INTO `score` VALUES ('76', '20190001', '16478095', '计算机网络', null, '0', null, '2019-06-18');
INSERT INTO `score` VALUES ('79', '20190003', '16478068', '数据结构', null, '4', null, '2019-06-18');
INSERT INTO `score` VALUES ('80', '20190001', '16478095', '计算机网络', null, '4', null, '2019-06-18');
INSERT INTO `score` VALUES ('95', '20190001', '16478095', '计算机网络', null, '0', null, '2019-06-18');
INSERT INTO `score` VALUES ('108', '20190001', '16478095', '计算机网络', null, '0', null, '2019-06-18');
INSERT INTO `score` VALUES ('109', '20190001', '16478095', '计算机网络', null, '0', null, '2019-06-18');
INSERT INTO `score` VALUES ('110', '20190001', '16478095', '计算机网络', null, '0', null, '2019-06-18');
INSERT INTO `score` VALUES ('111', '20190001', '16478079', '计算机网络', null, '0', null, '2019-06-18');
INSERT INTO `score` VALUES ('112', '20190001', '16478079', '计算机网络', null, '0', null, '2019-06-18');
INSERT INTO `score` VALUES ('113', '20190001', '16478075', '计算机网络', null, '6', null, '2019-06-18');
INSERT INTO `score` VALUES ('114', '20190001', '16478079', '计算机网络', null, '0', null, '2019-06-18');
INSERT INTO `score` VALUES ('115', '20190001', '16478075', '计算机网络', null, '0', null, '2019-06-18');
INSERT INTO `score` VALUES ('116', '20190001', '16478079', '计算机网络', null, '2', null, '2019-06-18');
INSERT INTO `score` VALUES ('117', '20190001', '16478079', '计算机网络', null, '0', null, '2019-06-18');
INSERT INTO `score` VALUES ('119', '20190001', '16478068', '计算机网络', null, '0', null, '2019-06-18');
INSERT INTO `score` VALUES ('120', '20190001', '16478079', '计算机网络', null, '0', null, '2019-06-18');
INSERT INTO `score` VALUES ('121', '20190001', '16478079', '计算机网络', null, '0', null, '2019-06-18');
INSERT INTO `score` VALUES ('122', '20190001', '16478079', '计算机网络', null, '0', null, '2019-06-18');
INSERT INTO `score` VALUES ('123', '20190001', '16478079', '计算机网络', null, '0', null, '2019-06-18');
INSERT INTO `score` VALUES ('124', '20190001', '16478079', '计算机网络', null, '0', null, '2019-06-18');
INSERT INTO `score` VALUES ('125', '20190001', '16478079', '计算机网络', null, '0', null, '2019-06-18');
INSERT INTO `score` VALUES ('126', '20190001', '16478079', '计算机网络', null, '0', null, '2019-06-18');
INSERT INTO `score` VALUES ('127', '20190001', '16478075', '计算机网络', null, '0', null, '2019-06-18');
INSERT INTO `score` VALUES ('128', '20190001', '16478075', '计算机网络', null, '0', null, '2019-06-18');
INSERT INTO `score` VALUES ('129', '20190001', '16478075', '计算机网络', null, '0', null, '2019-06-18');
INSERT INTO `score` VALUES ('130', '20190001', '16478075', '计算机网络', null, '0', null, '2019-06-18');
INSERT INTO `score` VALUES ('131', '20190001', '16478075', '计算机网络', null, '0', null, '2019-06-18');
INSERT INTO `score` VALUES ('132', '20190001', '16478075', '计算机网络', null, '0', null, '2019-06-18');
INSERT INTO `score` VALUES ('133', '20190001', '16478075', '计算机网络', null, '0', null, '2019-06-18');
INSERT INTO `score` VALUES ('134', '20190001', '16478095', '计算机网络', null, '0', null, '2019-06-18');
INSERT INTO `score` VALUES ('170', '20190001', '16478095', '计算机网络', null, '0', null, '2019-06-19');
INSERT INTO `score` VALUES ('171', '20190002', '16478095', '数据库理论', null, '0', null, '2019-06-19');
INSERT INTO `score` VALUES ('172', '20190003', '16478095', '数据结构', null, '0', null, '2019-06-19');
INSERT INTO `score` VALUES ('173', '20190003', '16478095', '数据结构', null, '0', null, '2019-06-19');
INSERT INTO `score` VALUES ('174', '20190001', '16478095', '计算机网络', null, '10', null, '2019-06-19');
INSERT INTO `score` VALUES ('175', '20190001', '16478099', '计算机网络', null, '0', null, '2019-06-19');
INSERT INTO `score` VALUES ('176', '20190001', '16478099', '计算机网络', null, '0', null, '2019-06-19');
INSERT INTO `score` VALUES ('177', '20190001', '16478099', '计算机网络', null, '0', null, '2019-06-19');
INSERT INTO `score` VALUES ('178', '20190001', '16478099', '计算机网络', null, '0', null, '2019-06-19');
INSERT INTO `score` VALUES ('201', '20190001', '16478095', '计算机网络', null, '0', null, '2019-06-19');
INSERT INTO `score` VALUES ('202', '20190002', '16478054', '数据库理论', null, '0', null, '2019-06-20');
INSERT INTO `score` VALUES ('203', '20190001', '16478056', '计算机网络', null, '18', null, '2019-06-20');
INSERT INTO `score` VALUES ('204', '20190002', '16478079', '数据库理论', null, '0', null, '2019-06-20');
INSERT INTO `score` VALUES ('205', '20190002', '16478079', '数据库理论', null, '0', null, '2019-06-20');
INSERT INTO `score` VALUES ('206', '20190002', '16478068', '数据库理论', null, '0', null, '2019-06-20');
INSERT INTO `score` VALUES ('207', '20190002', '16478075', '数据库理论', null, '0', null, '2019-06-20');
INSERT INTO `score` VALUES ('208', '20190003', '16478075', '数据结构', null, '0', null, '2019-06-20');
INSERT INTO `score` VALUES ('209', '20190008', '16478079', 'C语言', null, '2', null, '2019-06-20');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `studentId` int(9) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `studentName` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `grade` varchar(4) COLLATE utf8_bin DEFAULT NULL COMMENT '年级',
  `major` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '专业',
  `clazz` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '班级',
  `institute` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '学院',
  `tel` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '电话号码',
  `email` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '电子邮件',
  `pwd` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `cardId` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '身份证号',
  `sex` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `role` varchar(1) COLLATE utf8_bin DEFAULT '2' COMMENT '角色(0管理员，1教师，2学生)',
  PRIMARY KEY (`studentId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16478100 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='学生信息表';

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('16478054', '蔡勇祥', '2016', '软件工程', '2', '信息与计算机工程', '1487946523', '53156415', 'E10ADC3949BA59ABBE56E057F20F883E', '1145641+65', '男', '2');
INSERT INTO `student` VALUES ('16478056', '张艳平', '2016', '软件工程', '2', '信息与计算机', '14895256646', '4654654', 'E10ADC3949BA59ABBE56E057F20F883E', '64654687684546465', '男', '2');
INSERT INTO `student` VALUES ('16478068', '宋忆雄', '2016', '软件工程', '2', '信息与计算机工程学院', '18214789652', '1033658746@qq.com', 'E10ADC3949BA59ABBE56E057F20F883E', '145698745978964562', '男', '2');
INSERT INTO `student` VALUES ('16478075', '易文勤', '2016', '软件工程', '2', '信息与计算机工程学院', '18214789652', '1033658746@qq.com', 'C4CA4238A0B923820DCC509A6F75849B', '145698745978964562', '男', '2');
INSERT INTO `student` VALUES ('16478079', '黄先龙', '2016', '软件工程', '2', '信计学院', '123456789', '123456@qq.com', 'E10ADC3949BA59ABBE56E057F20F883E', '3412312', '男', '2');
INSERT INTO `student` VALUES ('16478095', '周秀兰', '2015', '软件工程', '2', '信息与计算机工程学院', '13658377857', '13658377857@sina.cn', 'E10ADC3949BA59ABBE56E057F20F883E', '124123124535', '女', '2');

-- ----------------------------
-- Table structure for subjectinfo
-- ----------------------------
DROP TABLE IF EXISTS `subjectinfo`;
CREATE TABLE `subjectinfo` (
  `subjectId` int(9) NOT NULL AUTO_INCREMENT COMMENT '课程编号',
  `subjectName` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '课程名称',
  `institute` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '学院',
  `instituteId` int(9) DEFAULT NULL COMMENT '学院编号',
  `teacherId` int(9) DEFAULT NULL COMMENT '教师编号',
  PRIMARY KEY (`subjectId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='课程管理表';

-- ----------------------------
-- Records of subjectinfo
-- ----------------------------
INSERT INTO `subjectinfo` VALUES ('1', '计算机网络', null, null, '20081001');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `teacherId` int(9) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `teacherName` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `institute` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '学院',
  `sex` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `tel` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '电话号码',
  `email` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `pwd` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `cardId` varchar(18) COLLATE utf8_bin DEFAULT NULL COMMENT '身份证号',
  `type` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '职称',
  `role` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '角色（0管理员，1教师，2学生）',
  PRIMARY KEY (`teacherId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20081008 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='教师信息表';

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('20161001', '张华', '软件工程学院', '男', '13598458442', '13598458442@163.com', 'E10ADC3949BA59ABBE56E057F20F883E', '423423283498', '讲师', '1');
INSERT INTO `teacher` VALUES ('20161002', '王大志', '软件工程学院', '男', '1231221312', '1231221312@163.com', 'E10ADC3949BA59ABBE56E057F20F883E', '24241234', '讲师', '1');
