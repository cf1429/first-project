/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.1.125
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : 192.168.1.125:3306
 Source Schema         : zhizhong-cms

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 08/12/2020 10:44:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类别编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别名称',
  `type` int(11) NULL DEFAULT NULL COMMENT '类别类型 1：活动类别 2：新闻类别 3：招聘类别 4：banner类别',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '类别管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (6, '头部', 4, '2020-09-15 16:57:28');
INSERT INTO `category` VALUES (23, '国内新闻', 2, '2020-10-10 11:26:43');
INSERT INTO `category` VALUES (24, '国际新闻', 2, '2020-10-10 11:26:58');
INSERT INTO `category` VALUES (25, '实时更新', 2, '2020-10-10 11:27:57');
INSERT INTO `category` VALUES (26, '仲裁要谈', 2, '2020-10-10 11:28:14');
INSERT INTO `category` VALUES (27, 'GR部', 3, '2020-10-10 16:47:56');
INSERT INTO `category` VALUES (28, '技术部', 3, '2020-10-10 16:48:12');
INSERT INTO `category` VALUES (29, '人事行政部', 3, '2020-10-10 16:48:20');
INSERT INTO `category` VALUES (30, '市场部', 3, '2020-10-10 16:48:26');
INSERT INTO `category` VALUES (31, '商务部', 3, '2020-10-10 16:48:33');
INSERT INTO `category` VALUES (32, '产品部', 3, '2020-10-10 16:48:44');
INSERT INTO `category` VALUES (38, '中部', 4, '2020-10-19 14:10:22');
INSERT INTO `category` VALUES (39, '尾部', 4, '2020-10-19 14:10:33');
INSERT INTO `category` VALUES (40, '活动预告', 1, '2020-10-19 17:29:37');
INSERT INTO `category` VALUES (41, '活动详情', 1, '2020-10-19 17:30:12');
INSERT INTO `category` VALUES (42, '运营部', 3, '2020-10-20 10:36:01');
INSERT INTO `category` VALUES (43, '财务部', 3, '2020-10-21 14:33:41');
INSERT INTO `category` VALUES (44, '总经办', 3, '2020-10-21 14:34:04');
INSERT INTO `category` VALUES (45, '活动分享', 1, '2020-10-23 14:01:14');
INSERT INTO `category` VALUES (46, '往期回顾', 1, '2020-10-23 14:26:37');
INSERT INTO `category` VALUES (47, '行业新闻', 2, '2020-10-23 14:32:11');

-- ----------------------------
-- Table structure for content_info
-- ----------------------------
DROP TABLE IF EXISTS `content_info`;
CREATE TABLE `content_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内容编号',
  `category_id` int(11) NULL DEFAULT NULL COMMENT '所属类别',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `cover_file_id` int(11) NULL DEFAULT NULL COMMENT '封面图片编号',
  `editor_charge` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '责任编辑',
  `browse_number` int(11) NULL DEFAULT NULL COMMENT '浏览次数',
  `sort` int(11) NULL DEFAULT NULL COMMENT '顺序值',
  `sum_info` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '摘要信息',
  `data_source` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资料来源',
  `content_source` tinyint(4) NULL DEFAULT NULL COMMENT '内容来源 1：本地上传 2：在线编辑',
  `state` tinyint(4) NULL DEFAULT 1 COMMENT '状态 1：未发布 2：已发布',
  `type` tinyint(4) NULL DEFAULT NULL COMMENT '类型 1：活动 2：新闻 3：招聘 4：banner',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `file_id` int(11) NULL DEFAULT NULL COMMENT '本地上传  文件编号',
  `banner_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'banner链接',
  `release_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `top_time` datetime(0) NULL DEFAULT NULL COMMENT '置顶时间',
  `top_flag` int(11) NULL DEFAULT 0 COMMENT '置顶标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 128 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of content_info
-- ----------------------------
INSERT INTO `content_info` VALUES (48, 28, '高级运维开发工程师', NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 3, '<p>职位描述<br>1、负责集团海外化系统的全球网络优化、系统网络监控、日常运维工作；<br>2、推动及开发高效的自动化运维、管理工具，提升运维工作效率；<br>3、制定和优化运维解决方案，包括但不限于柔性容灾、智能调度、弹性扩容与防攻击；<br>4、探索、研究新的运维技术方向。<br>任职要求<br>1、本科及以上学历，2年以上Linux工作经验；<br>2、熟悉RedHat/CentOS/Fedora操作系统原理，TCP/IP以及常用的网络协议；<br>3、熟悉shell、python、Puppet至少一种开发语言，有相关开发经验；<br>4、熟悉常见应用服务的配置和优化，例如Nginx/LVS；<br>5、熟悉PostgreSQL，MySQL,Redis,mongoDB，Hbase等数据库的操作和维护；<br>6、熟练zabbix,Nagios,Ganglia等常用的监控软件。&nbsp;&nbsp;<br></p>', NULL, NULL, '2020-10-10 16:54:48', '2020-10-10 16:54:47', '2020-10-21 15:04:26', NULL, 0);
INSERT INTO `content_info` VALUES (72, 40, '精准对接新旧动能转换 济南仲裁委驻先行区办事处揭牌成立', 213, '归档', 121245, 5, '为精准对接我省新旧动能转换先行区工作，提升仲裁服务国家战略能力和法律服务水平，10月12日下午，济南仲裁委员会驻新旧动能转换先行区管委会办事处正式揭牌成立，第八期在线公益讲座同期开讲，为先行区企业送去免费“法律云服务”。', '济南仲裁', 2, 2, 1, '<p>为精准对接我省新旧动能转换先行区工作，提升仲裁服务国家战略能力和法律服务水平，10月12日下午，济南仲裁委员会驻新旧动能转换先行区管委会办事处正式揭牌成立，第八期在线公益讲座同期开讲，为先行区企业送去免费“法律云服务”。</p><p><img src=\"http://www.legaldaily.com.cn/Arbitration/images/2020-10/20/093bd3f5-1e04-41c0-8bb4-31188dfdad17.jpg\">济南新旧动能转换先行区党工委委员、管委会副主任张勇和济南仲裁委员会办公室党组成员、副主任刘昌国为办事处揭牌</p><p><br></p><p>济南新旧动能转换先行区党工委委员、管委会副主任张勇，济南仲裁委员会办公室党组成员、副主任刘昌国出席仪式并为办事处揭牌。济南仲裁委员会委员、山东建筑大学法学院院长王淑华，以及先行区相关机构及企业代表出席活动。</p><p>济南仲裁委员会驻新旧动能转换先行区管委会办事处是由济南仲裁委员会、济南新旧动能转换先行区管委会共同发起设立，作为济南仲裁委员会下设办事机构，日常办公地点设在济南新旧动能转换先行区管委会。先行区办事处单独设立办公区域，并设有咨询区、调解区以及会议办公区等多个场所。将重点对接先行区区域经济发展，宣传区域仲裁工作的新经验、新做法，协助企业规范仲裁协议，为企业提供便捷的仲裁服务。</p><p><img src=\"http://www.legaldaily.com.cn/Arbitration/images/2020-10/20/f2af1296-59cf-46a1-aafe-ae13e2726ac2.jpg\"></p><p>济南仲裁委员会办公室党组成员、副主任刘昌国致辞</p><p><br></p><p>“入驻新旧动能转换先行区，除继续发挥仲裁服务优势外，还将精准对接我省新旧动能转换经济发展需求，助力区域经济发展”，济南仲裁委员会副主任刘昌国在揭牌仪式中表示，作为维护市场经济秩序的重要组成部分，济南仲裁委员会致力于优化济南市营商环境，未来借助办事处，将进一步培育和开拓仲裁服务领域，组织域内企业开展经常性的仲裁法律培训，指导和规范商事合同，防范化解企业经营风险。</p><p><img src=\"http://www.legaldaily.com.cn/Arbitration/images/2020-10/20/39ea3de7-95e1-4b12-b3c4-7a67ee8ff4bf.jpg\"></p><p>济南新旧动能转换先行区党工委委员、管委会副主任张勇致辞</p><p><br></p><p>济南新旧动能转换先行区党工委委员、管委会副主任张勇表示，设立驻先行区办事处，是济南仲裁委立足服务国家战略、瞄准先行区需求，提升仲裁工作能力和法律服务水平的重大举措，能有效缓解先行区当前司法资源不足的问题，为区域内居民和企业提供更高效、经济、灵活的仲裁服务，对推进先行区优化营商环境发挥关键作用。</p><p><img src=\"http://www.legaldaily.com.cn/Arbitration/images/2020-10/20/791f6480-0374-49d2-8dd2-b9972db0ec22.jpg\"></p><p>公益讲座现场</p><p><br></p><p>揭牌仪式后，第八期济南仲裁在线公益讲座同期开讲。本次活动邀请了济南仲裁委员会委员、山东建筑大学法学院院长王淑华以“民法典视域下新旧动能转换工程法治保障”为主题，详细阐述并举例分析了民法典视角下仲裁服务在新旧动能转换过程中应用的场景和可能存在的难点等问题。</p><p><img src=\"http://www.legaldaily.com.cn/Arbitration/images/2020-10/20/35e9befe-fe8b-44e7-a020-62fd2775a58e.jpg\"></p><p>济南仲裁委员会仲裁员、山东建筑大学法学院院长王淑华讲解相关问题</p><p><br></p><p>“民法典是新旧动能转换重大工程实施的法律依据”，王淑华指出，民法典对推进国家治理体系和治理能力现代化，具有重大意义，不仅完善了合同制度，为产业发展营造良好环境；而且在保障金融健康发展、工程项目顺利推进、保护知识产权与生态环境方面都有了详尽的规定。　</p><p><img src=\"http://www.legaldaily.com.cn/Arbitration/images/2020-10/20/c88480f7-f047-47a7-8136-c812cf6068b7.jpg\"></p><p>关于合同制度解读以及产业发展应用，王淑华进行了重点介绍。她表示，合同的管理要遵循四个流程，即缔约审查——预防项目风险、慎签合同——预防合同纠纷、严格履约——防范违约风险、依法追责，这样才能从根本上保障自己的合法利益。</p><p>在合同条文应用方面，王淑华通过案例分析的方式，进行了解读。</p><p><img src=\"http://www.legaldaily.com.cn/Arbitration/images/2020-10/20/5d42b419-6e0e-4622-9df9-0ff8df190ed2.jpg\"></p><p>现场嘉宾就企业关注的仲裁法律问题进行了互动交流，讲座还通过海报新闻的“众播”和齐鲁智慧媒体云的“云播”两大直播平台，为网友免费送去“法律云服务”，线上共有28万网友参与观看本次直播。</p>', NULL, NULL, '2020-10-20 15:44:54', '2020-10-20 11:40:04', '2020-11-10 15:55:30', NULL, 0);
INSERT INTO `content_info` VALUES (87, 23, '山东成立涉外仲裁服务百人团', 227, '武卓立', 445452, 2, '记者从山东省司法厅获悉，为适应市场主体解决国际贸易争端的需求，进一步发挥山东涉外仲裁的专家智库优势，山东省司法厅近日成立山东省涉外仲裁服务百人团，为该省提供更加优质的涉外仲裁和国际仲裁服务。', '新华网	', 2, 2, 2, '<p>记者从山东省司法厅获悉，为适应市场主体解决国际贸易争端的需求，进一步发挥山东涉外仲裁的专家智库优势，山东省司法厅近日成立山东省涉外仲裁服务百人团，为该省提供更加优质的涉外仲裁和国际仲裁服务。</p><p>　　据山东省司法厅相关负责人介绍，山东省司法厅按照个人报名、单位推荐、组织筛选、集体研究、社会公示等程序，最终从国内国际仲裁机构的涉外仲裁员中遴选确定101名优秀仲裁员组成山东省涉外仲裁服务百人团。其中，执业律师56人，科研院所专家学者35人，企事业单位的法务工作者10人。</p><p>　　按照山东省涉外仲裁服务百人团工作规则，山东省司法厅指导协调服务团规范运行。服务团成员将根据规定的职责权限开展服务工作，包括参与涉外和国际仲裁案件办理，提供涉外商事咨询和化解涉外商事纠纷的建议或方案，参与复杂疑难仲裁案件的研究论证、山东省涉外仲裁规则的研究制订、涉外和国际仲裁理论研究，以及参加相关学术会议、国际论坛、宣传或座谈等活动，并承担司法行政机关、仲裁委员会委托的其他工作。</p>', NULL, NULL, '2020-10-20 15:38:00', '2020-10-20 15:37:57', '2020-11-09 17:34:43', '2020-11-09 17:34:43', 0);
INSERT INTO `content_info` VALUES (88, 23, '又一融媒创新！济南仲裁率先通过“卫视”推广仲裁制度', 228, '武卓立', 15623, 3, '为认真落实习近平总书记提出的“坚持把非诉讼纠纷解决机制挺在前面”的要求，充分发挥仲裁在解决民商事争议中的独特作用，济南仲裁委员会立足省会经济圈、国家中心城市的发展定位，立足全市中心工作，立足自身职能和特点，着眼“打造一流仲裁机构、建设区域仲裁中心”目标，助力建设“大强美富通”现代化国际大都市，勇于担当作为、大步走在前列。2019年，荣获“仲裁公信力全国十佳机构”称号。', '济南仲裁	', 2, 2, 2, '<p>线上仲裁事务，持续杨帆起航。</p>', 240, NULL, '2020-10-20 15:40:58', '2020-10-20 15:40:56', '2020-11-09 17:39:15', '2020-11-09 17:34:51', 0);
INSERT INTO `content_info` VALUES (89, 40, '习近平会见全国双拥模范城(县)命名暨双拥模范单', 232, '新华网', 123, 3, '习近平会见全国双拥模范城（县）命名暨双拥模范单位和个人表彰大会代表 李克强参加会见并在表彰大会上讲话 王沪宁参加会见', '新浪新闻', 2, 2, 1, '<p>原标题：习近平会见全国双拥模范城（县）命名暨双拥模范单位和个人表彰大会代表 李克强参加会见并在表彰大会上讲话 王沪宁参加会见</p><p>　　新华社北京10月20日电 全国双拥模范城（县）命名暨双拥模范单位和个人表彰大会20日上午在京举行。中共中央总书记、国家主席、中央军委主席习近平亲切会见与会代表，向他们表示诚挚问候，向受到命名表彰的全国双拥模范城（县）、双拥模范单位和个人表示热烈祝贺。</p><p>　　中共中央政治局常委、国务院总理李克强参加会见并在表彰大会上讲话，中共中央政治局常委、中央书记处书记王沪宁参加会见。</p><p>　　上午10时，习近平等来到京西宾馆会议楼前厅，全场响起热烈掌声。习近平等走到代表们中间，同大家亲切交流并合影留念。</p><p>　　李克强在讲话中首先代表党中央、国务院，向受命名的地方和受表彰的单位与个人表示热烈祝贺，向人民解放军指战员、武警官兵、民兵预备役人员、部队职工，向烈军属、伤残军人、转业复员退伍军人和军队离退休干部，向双拥工作战线的同志们致以诚挚问候，向所有关心支持国防和军队建设的社会各界人士表示衷心感谢。</p><p>　　李克强说，党的十八大以来，在以习近平同志为核心的党中央坚强领导下，各地区各有关部门积极支持和服务保障军队建设改革，进一步加大优抚安置保障，军队支援经济社会发展积极有为，在参与重大自然灾害抢险救援和应对突发事件中当先锋，今年面对疫情，人民子弟兵闻令而动、敢打硬仗，广大军民携手同心、共克时艰，取得了抗击疫情斗争重大战略成果，彰显了军政军民团结的强大力量。</p><p>　　李克强指出，各地区各部门要全力支持国防和军队建设，做好交通运输、后勤供给等保障工作，帮助改善边疆海岛驻军官兵执勤和工作生活条件。一如既往为军人和家属排忧解难，使广大官兵不为后路担心、不为后院分心、不为后代忧心。今年稳就业难度更加凸显，要为退役军人提供更加精准及时的就业创业服务和职业技能培训，确保他们就业有去处、创业有扶持、失业有帮扶。拓宽渠道，确保符合条件的随军家属都得到合适安置。落实军人子女就近入学、调动转学、参加中高考优待等政策，让军人及其家属放心安心。同时支持军队发挥优势，积极参与经济社会建设。保障优抚安置等财政支出，继续抓好双拥模范创建活动，健全基层双拥服务体系，努力开创双拥工作新局面。</p><p>　　大会宣读了关于命名411个全国双拥模范城（县），关于表彰全国爱国拥军模范单位和拥政爱民模范单位，关于表彰全国爱国拥军模范和拥政爱民模范的决定。大会向受到命名表彰的全国双拥模范城（县）、双拥模范单位和个人代表颁奖。有关军地代表发言。</p><p>　　丁薛祥参加会见，孙春兰参加会见并主持大会，张又侠、陈希、黄坤明、沈跃跃、肖捷、马飚参加会见并出席大会，中央军委委员苗华参加会见并在会上宣读表彰决定。</p><p>　　大会以电视电话会议形式召开，在北京设主会场，在各省、自治区、直辖市和新疆生产建设兵团设分会场。全国双拥模范城（县）、双拥模范单位和个人代表，全国双拥工作领导小组成员，军地有关部门负责同志，各省、自治区、直辖市和新疆生产建设兵团双拥工作领导小组及双拥办主要负责同志等在主会场参加了会议。</p>', NULL, NULL, '2020-10-20 17:17:59', '2020-10-20 17:17:40', '2020-11-10 15:55:11', NULL, 0);
INSERT INTO `content_info` VALUES (106, 28, '前端工程师', NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 3, '<p>任职资格：<br>1.计算机相关专业统招本科及以上学历，2年以上Web前端开发经验;<br>2.熟练使用HTML/CSS/JS等Web前端技术，基本功扎实；<br>3.能够熟练使用 JavaScript 框架(Vue/React）进行开发，有大型工程经验优先；<br>4.具备扎实的数据结构、计算机网络协议等相关基础；<br>5.了解至少一种后端开发语言（NodeJS/Java/PHP/Python）；<br>6.具有良好的沟通能力和责任心，有一定自我学习能力；&nbsp;&nbsp;<br></p><p>任职要求<br>1、本科及以上学历，2年以上Linux工作经验；<br>2、熟悉RedHat/CentOS/Fedora操作系统原理，TCP/IP以及常用的网络协议；<br>3、熟悉shell、python、Puppet至少一种开发语言，有相关开发经验；<br>4、熟悉常见应用服务的配置和优化，例如Nginx/LVS；<br></p>', NULL, NULL, '2020-10-21 15:03:58', '2020-10-21 15:03:47', '2020-10-21 15:11:06', NULL, 0);
INSERT INTO `content_info` VALUES (108, 29, '人力资源管理师', NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 3, '<h3>职位描述</h3><div>1、 负责公司人力资源工作的规划，建立、执行招聘、培训、考勤、劳动纪律等人事程序或规章制度;<br>　　2、 负责制定和完善公司岗位编制，协调公司各部门有效的开发和利用人力，满足公司的经营管理需要;<br>　　3、 根据现有的编织及业务发展需求，协调、统计各部门的招聘需求，编制年度/月度人员招聘计划，经批准后实施;<br>　　4、 做好各岗位的职位说明书，并根据公司职位调整组要进行相应的变更，保证职位说明书与实际相符;<br>　　5、 负责办理入职手续，负责人事档案的管理、保管、用工合同的签订;<br>　　6、 建立并及时更新员工档案，做好年度/月度人员异动统计(包括离职、入职、晋升、调动、降职等);<br>　　7、 制定公司及各个部门的培训计划和培训大纲，经批准后实施;<br>　　8、 对试用期员工进行培训及考核，并根据培训考核结果建议部门录用;<br>9.定期主持召开本部门工作例会，布置、检查、总结工作，并组织本部门员工的业务学习，提高管理水平和业务技能，保证各项工作任务能及时完成;</div>', NULL, NULL, '2020-10-21 15:25:28', '2020-10-21 15:25:27', NULL, NULL, 0);
INSERT INTO `content_info` VALUES (109, 29, '人力资源管理师', NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 3, '<h3>职位描述</h3><div>1、 负责公司人力资源工作的规划，建立、执行招聘、培训、考勤、劳动纪律等人事程序或规章制度;<br>　　2、 负责制定和完善公司岗位编制，协调公司各部门有效的开发和利用人力，满足公司的经营管理需要;<br>　　3、 根据现有的编织及业务发展需求，协调、统计各部门的招聘需求，编制年度/月度人员招聘计划，经批准后实施;<br>　　4、 做好各岗位的职位说明书，并根据公司职位调整组要进行相应的变更，保证职位说明书与实际相符;<br>　　5、 负责办理入职手续，负责人事档案的管理、保管、用工合同的签订;<br>　　6、 建立并及时更新员工档案，做好年度/月度人员异动统计(包括离职、入职、晋升、调动、降职等);<br>　　7、 制定公司及各个部门的培训计划和培训大纲，经批准后实施;<br>　　8、 对试用期员工进行培训及考核，并根据培训考核结果建议部门录用;<br>9.定期主持召开本部门工作例会，布置、检查、总结工作，并组织本部门员工的业务学习，提高管理水平和业务技能，保证各项工作任务能及时完成;</div>', NULL, NULL, '2020-10-21 15:26:09', '2020-10-21 15:25:54', NULL, NULL, 0);
INSERT INTO `content_info` VALUES (111, 45, '签署协议', 272, '王伟', 4555, 1, '这是一条摘要信息', '人民网', 2, 2, 1, '<style>p{margin-top:0pt;margin-bottom:1pt;}p.a{text-align:justified;}span.a{font-family:FangSong_GB2312;font-size:10.0pt;}p.X2{text-align:left;}span.X2{font-family:FangSong_GB2312;font-size:18.0pt;font-weight:bold;}p.a5{text-align:left;}span.a5{font-size:12.0pt;}span.a6{font-weight:bold;}span.a7{color:#0000ff;text-decoration:underline;}p.ProfileBody{margin-bottom:6.0pt;}p.Header2{text-align:right;}p.HeaderFooterText{text-align:left;text-indent:42.0pt;}span.HeaderFooterText{font-size:1.0pt;}p.a8{text-indent:21.0pt;}</style><div style=\"width:595.0pt;margin-bottom:72.0pt;margin-top:72.0pt;margin-left:90.0pt;margin-right:90.0pt;\"><p class=\"a X2\" style=\"text-align:center;margin-bottom:8.0pt;background-color:#ffffff;\"><span class=\"a X2\" style=\"font-family:FangSong_GB2312;font-size:13.0pt;color:#333333;background-color:#ffffff;\">预告：“ 尤科斯案 ”公益座谈研讨会第</span><span class=\"a X2\" style=\"font-family:FangSong_GB2312;font-size:13.0pt;color:#333333;background-color:#ffffff;\">三</span><span class=\"a X2\" style=\"font-family:FangSong_GB2312;font-size:13.0pt;color:#333333;background-color:#ffffff;\">期【仲裁大家谈】</span></p><p class=\"a a5\"><br></p><p class=\"a a5\" style=\"text-align: center;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img src=\"http://192.168.1.191:8082/tempFanyu/word/media/image1.png\" width=\"425.87253pt\" height=\"181.24968pt\"></p><p class=\"a a5\"><br></p><p class=\"a a5\"><span class=\"a a5\" style=\"font-family:FangSong_GB2312;\">主    题</span><span class=\"a a5\" style=\"font-family:FangSong_GB2312;\">：</span><span class=\"a a5\" style=\"font-family:FangSong_GB2312;\">“</span><span class=\"a a5\" style=\"font-family:FangSong_GB2312;\">尤科斯案</span><span class=\"a a5\" style=\"font-family:FangSong_GB2312;\">给中国企业和仲裁界的启示</span><span class=\"a a5\" style=\"font-family:FangSong_GB2312;\">”</span></p><p class=\"a a5\"><span class=\"a a5\" style=\"font-family:FangSong_GB2312;\">座谈时间：</span><span class=\"a a5\" style=\"font-family:FangSong_GB2312;\">2020 年 4 月</span><span class=\"a a5\" style=\"font-family:FangSong_GB2312;\"> 12</span><span class=\"a a5\" style=\"font-family:FangSong_GB2312;\"> 日（周日）14:30 开始</span></p><p style=\"text-align:left;\"><span style=\"font-family:FangSong_GB2312;font-size:12.0pt;\">主办单位：</span><span style=\"font-family:FangSong_GB2312;font-size:12.0pt;\">中国仲裁法学研究会</span><br><span style=\"font-family:FangSong_GB2312;font-size:12.0pt;\">协办单位：</span><span style=\"font-family:FangSong_GB2312;font-size:12.0pt;\">北京知仲科技有限公司</span></p><p style=\"text-align:left;\"><span style=\"font-family:FangSong_GB2312;font-size:12.0pt;font-weight:bold;\">支持单位：</span><span style=\"font-family:FangSong_GB2312;font-size:12.0pt;\">（ 按回复时间先后排列 ）</span></p><p style=\"text-align:left;\"><span style=\"font-family:FangSong_GB2312;font-size:12.0pt;\">广州仲裁委员会、中国国际经济贸易仲裁委员会、南京仲裁委员会、武汉仲裁委员会、上海国际仲裁中心、青岛仲裁委员会、石家庄仲裁委员会、成都仲裁委员会、北京仲裁委员会、重庆仲裁委员会、宁波仲裁委员会、庆阳仲裁委员会、赤峰仲裁委员会、安阳仲裁委员会、三门峡仲裁委员会、聊城仲裁委员会、镇江仲裁委员会、哈尔滨仲裁委员会、唐山仲裁委员会、上海海事大学法学院、廊坊仲裁委员会、厦门仲裁委员会、沈阳仲裁委员会、海南国际仲裁院、沧州仲裁委员会、温州仲裁委员会</span><span style=\"font-family:FangSong_GB2312;font-size:12.0pt;\">、钦州仲裁委员会</span><span style=\"font-family:FangSong_GB2312;font-size:12.0pt;\">、邢台</span><span style=\"font-family:FangSong_GB2312;font-size:12.0pt;\">仲裁委员会、南通仲裁委员会、驻马店仲裁委员会、荆门仲裁委员会、榆林仲裁委员会、洛阳仲裁委员会、承德仲裁委员会、中国海事仲裁委员会</span><span style=\"font-family:FangSong_GB2312;font-size:12.0pt;\">等。</span><span style=\"font-family:FangSong_GB2312;font-size:12.0pt;\">  </span></p><p class=\"a a5\" style=\"text-align:justified;background-color:#ffffff;\"><br></p><p class=\"a a5\" style=\"text-align:center;\"><span class=\"a a5\" style=\"font-size:14.0pt;\">学术</span><span class=\"a a5\" style=\"font-size:14.0pt;\">&nbsp; &nbsp; &nbsp;</span><span class=\"a a5\" style=\"font-size:14.0pt;\">专业</span><span class=\"a a5\" style=\"font-size:14.0pt;\">&nbsp; &nbsp;&nbsp; </span><span class=\"a a5\" style=\"font-size:14.0pt;\">客观</span><span class=\"a a5\" style=\"font-size:14.0pt;\">&nbsp; &nbsp; &nbsp;</span><span class=\"a a5\" style=\"font-size:14.0pt;\">全面</span></p><p style=\"text-align:left;\"><br></p><p class=\"a a5\" style=\"margin-top:10.0pt;margin-bottom:10.0pt;background-color:#ffffff;\"><span class=\"a a5\" style=\"font-family:FangSong_GB2312;\">一直以来，“ 尤科斯案 ”因索赔偿数额巨大和在全球世界范围内的广泛影响而令人瞩目，特别是在能源界和法律界关注度极高。</span></p><p class=\"a a5\" style=\"margin-top:10.0pt;margin-bottom:10.0pt;background-color:#ffffff;\"><span class=\"a a5\" style=\"font-family:FangSong_GB2312;\">近期，海牙上诉法院撤销了海牙地方法院的判决，裁定维持三份仲裁裁决，由俄罗斯联邦赔偿尤科斯石油公司三家股东共计500亿美元。对国际仲裁事业处于爬坡期的中国业界，此案可以作为国际仲裁的鲜活教科书，值得认真学习、分析、研究。</span></p><p class=\"a a5\" style=\"margin-top:10.0pt;margin-bottom:10.0pt;background-color:#ffffff;\"><span class=\"a a5\" style=\"font-family:FangSong_GB2312;\">3 月 21 日、3 月 28 日</span><span class=\"a a5\" style=\"font-family:FangSong_GB2312;\">、</span><span class=\"a a5\" style=\"font-family:FangSong_GB2312;\">4月</span><span class=\"a a5\" style=\"font-family:FangSong_GB2312;\">5日</span><span class=\"a a5\" style=\"font-family:FangSong_GB2312;\">我们分别以“500 亿美元赔偿金投资案的管辖权与适用法律”</span><span class=\"a a5\" style=\"font-family:FangSong_GB2312;\">、</span><span class=\"a a5\" style=\"font-family:FangSong_GB2312;\"> “尤科斯案国际仲裁程序步步回放与研究”</span><span class=\"a a5\" style=\"font-family:FangSong_GB2312;\">和</span><span class=\"a a5\" style=\"font-family:FangSong_GB2312;\">“</span><span class=\"a a5\" style=\"font-family:FangSong_GB2312;\">跨境仲裁</span><span class=\"a a5\" style=\"font-family:FangSong_GB2312;\">的语言和翻译问题”</span><span class=\"a a5\" style=\"font-family:FangSong_GB2312;\">为主题进行研讨。4月</span><span class=\"a a5\" style=\"font-family:FangSong_GB2312;\">12</span><span class=\"a a5\" style=\"font-family:FangSong_GB2312;\">日，将以“</span><span class=\"a a5\" style=\"font-family:FangSong_GB2312;\">尤科斯案</span><span class=\"a a5\" style=\"font-family:FangSong_GB2312;\">给中国企业和仲裁界的启示</span><span class=\"a a5\" style=\"font-family:FangSong_GB2312;\">”为主题，特邀国际仲裁领域专家，</span><span class=\"a a5\" style=\"font-family:FangSong_GB2312;\">以尤科斯案为背景，讨论我国企业出海，尤其是国际投资业务交易等之中，会面临哪些商务和法律问题，应当如何防范和应对</span><span class=\"a a5\" style=\"font-family:FangSong_GB2312;\">。敬请期待</span><span class=\"a a5\" style=\"font-family:FangSong_GB2312;color:#ff0000;\">（研讨会的报名方式见下文）</span><span class=\"a a5\" style=\"font-family:FangSong_GB2312;\">。</span></p><p class=\"a a5\" style=\"margin-top:10.0pt;margin-bottom:10.0pt;background-color:#ffffff;\"><br></p><p class=\"a a5\" style=\"text-align:center;margin-top:10.0pt;margin-bottom:10.0pt;background-color:#ffffff;\"><span class=\"a a5\" style=\"font-family:FangSong_GB2312;font-size:14.0pt;font-weight:bold;background-color:#ffffff;\">本期发言嘉宾</span></p><p style=\"text-indent:21.0pt;\"><br></p><p class=\"a a5\" style=\"text-align:center;margin-top:10.0pt;margin-bottom:10.0pt;background-color:#ffffff;\"><img src=\"http://192.168.1.191:8082/tempFanyu/word/media/image2.png\" width=\"120.0pt\" height=\"120.0pt\"><span class=\"a a5\" style=\"font-family:FangSong_GB2312;background-color:#ffffff;\"> </span></p><p class=\"a a5\" style=\"text-align:center;margin-top:10.0pt;margin-bottom:10.0pt;background-color:#ffffff;\"><span class=\"a a5\" style=\"font-family:FangSong_GB2312;font-weight:bold;background-color:#ffffff;\">李虎</span><span class=\"a a5\" style=\"font-family:FangSong_GB2312;font-weight:bold;background-color:#ffffff;\"> </span><span class=\"a a5\" style=\"font-family:FangSong_GB2312;font-weight:bold;background-color:#ffffff;\">博士</span></p><p><span style=\"font-size:11.0pt;\">中国国</span><span id=\"_GoBack\"><span style=\"font-size:11.0pt;\">际经济贸易仲裁委员会</span><span style=\"font-size:11.0pt;\">党委书记、</span><span style=\"font-size:11.0pt;\">副秘书长</span><span style=\"font-size:11.0pt;\">，</span><span style=\"font-size:11.0pt;\">中国海事仲裁委员会</span><span style=\"font-size:11.0pt;\">副主任。</span><span style=\"font-size:11.0pt;\">瑞典斯德哥尔摩商会仲裁院（</span><span style=\"font-size:11.0pt;\">SCC</span><span style=\"font-size:11.0pt;\">）理事会理事，</span><span style=\"font-size:11.0pt;\">亚洲多元争议解决院（</span><span style=\"font-size:11.0pt;\">A</span><span style=\"font-size:11.0pt;\">IADR</span><span style=\"font-size:11.0pt;\">）理事会理事，</span><span style=\"font-size:11.0pt;\">ICC</span><span style=\"font-size:11.0pt;\">仲裁与</span><span style=\"font-size:11.0pt;\">ADR</span><span style=\"font-size:11.0pt;\">专业</span><span style=\"font-size:11.0pt;\">委员会委员</span><span style=\"font-size:11.0pt;\">，</span><span style=\"font-size:11.0pt;\">ICC China </span><span style=\"font-size:11.0pt;\">仲裁与</span><span style=\"font-size:11.0pt;\">ADR</span><span style=\"font-size:11.0pt;\">专业</span><span style=\"font-size:11.0pt;\">委员会副主席</span><span style=\"font-size:11.0pt;\">，</span><span style=\"font-size:11.0pt;\">国际商事仲裁理事会</span><span style=\"font-size:11.0pt;\">（</span><span style=\"font-size:11.0pt;\">ICCA</span><span style=\"font-size:11.0pt;\">）</span><span style=\"font-size:11.0pt;\">会员</span><span style=\"font-size:11.0pt;\">。</span><span style=\"font-size:11.0pt;\">最高人民法院知识产权司法保护</span><span style=\"font-size:11.0pt;\">研究中心</span><span style=\"font-size:11.0pt;\">特邀</span><span style=\"font-size:11.0pt;\">研究</span><span style=\"font-size:11.0pt;\">员</span><span style=\"font-size:11.0pt;\">，</span><span style=\"font-size:11.0pt;\">中国政法大学国际法学院和中央财经大学法学院</span><span style=\"font-size:11.0pt;\">客座</span><span style=\"font-size:11.0pt;\">教授</span><span style=\"font-size:11.0pt;\">。</span><span style=\"font-size:11.0pt;\">担任</span><span style=\"font-size:11.0pt;\">国内外多所</span><span style=\"font-size:11.0pt;\">仲裁</span><span style=\"font-size:11.0pt;\">机构的仲裁员</span><span style=\"font-size:11.0pt;\">，</span><span style=\"font-size:11.0pt;\">作为</span><span style=\"font-size:11.0pt;\">首席、独任以及合作</span><span style=\"font-size:11.0pt;\">仲裁员曾裁决国际</span><span style=\"font-size:11.0pt;\">和涉外仲裁案件</span><span style=\"font-size:11.0pt;\">120</span><span style=\"font-size:11.0pt;\">多件</span><span style=\"font-size:11.0pt;\">。</span><span style=\"font-size:11.0pt;\">在多场</span><span style=\"font-size:11.0pt;\">国际、国内仲裁会议中发表演讲。</span></span></p><p style=\"text-align:center;\"><img src=\"http://192.168.1.191:8082/tempFanyu/word/media/image3.png\" width=\"120.0pt\" height=\"120.0pt\"><span style=\"font-family:FangSong_GB2312;font-size:11.0pt;color:#111f2c;background-color:#ffffff;\"> </span></p><p style=\"text-align:center;\"><span style=\"font-family:FangSong_GB2312;font-size:12.0pt;font-weight:bold;\">赵俊</span><span style=\"font-family:FangSong_GB2312;font-size:12.0pt;font-weight:bold;background-color:#ffffff;\"> </span><span style=\"font-family:FangSong_GB2312;font-size:12.0pt;font-weight:bold;background-color:#ffffff;\">教授</span></p><p style=\"text-align:center;\"><br></p><p><span style=\"font-size:11.0pt;\">浙江大学光华法学院副院长、</span><span style=\"font-size:11.0pt;\">教授</span><span style=\"font-size:11.0pt;\">、</span><span style=\"font-size:11.0pt;\">博士生导师。</span><span style=\"font-size:11.0pt;\">外交部国际法咨询委员会委员，中国国际法学会常务理事，中国国际经济法学会理事，中国国际私法学会常务理事，中国仲裁法学研究会理事、中国国际经济贸易仲裁委员会仲裁员。具有</span><span style=\"font-size:11.0pt;\">丰富</span><span style=\"font-size:11.0pt;\">的</span><span style=\"font-size:11.0pt;\">国际经济法业务</span><span style=\"font-size:11.0pt;\">和</span><span style=\"font-size:11.0pt;\">大规模国际项目</span><span style=\"font-size:11.0pt;\">经验</span><span style=\"font-size:11.0pt;\">。</span><span style=\"font-size:11.0pt;\">专门从事国际经济法、国际商法、比较法的研究与教学。</span></p><p class=\"a a5\" style=\"text-align:center;margin-top:10.0pt;margin-bottom:10.0pt;background-color:#ffffff;\"><img src=\"http://192.168.1.191:8082/tempFanyu/word/media/image4.png\" width=\"122.4pt\" height=\"122.4pt\"><span class=\"a a5\" style=\"font-family:FangSong_GB2312;font-size:14.0pt;font-weight:bold;background-color:#ffffff;\"> </span></p><p class=\"a a5\" style=\"text-align:center;margin-top:10.0pt;margin-bottom:10.0pt;background-color:#ffffff;\"><span class=\"a a5\" style=\"font-family:FangSong_GB2312;font-weight:bold;background-color:#ffffff;\">王雪华</span><span class=\"a a5\" style=\"font-family:FangSong_GB2312;font-weight:bold;background-color:#ffffff;\"> </span><span class=\"a a5\" style=\"font-family:FangSong_GB2312;font-weight:bold;background-color:#ffffff;\">主任</span></p><p><span style=\"font-size:11.0pt;\">北京市环中律师事务所创始合伙人，法学博士。现任国际投资争端解决中心（</span><span style=\"font-size:11.0pt;\">ICSID</span><span style=\"font-size:11.0pt;\">）仲裁员、中国国际经济贸易仲裁委员会仲裁员、北京国际仲裁中心、上海国际仲裁中心仲裁员、深圳</span><span style=\"font-size:11.0pt;\"> </span><span style=\"font-size:11.0pt;\">国际仲裁院仲裁员、海南仲裁委员会仲裁员、重庆仲裁委员会仲裁员，对外经济贸易大学法学院兼职教授、中国法学会</span><span style=\"font-size:11.0pt;\"> WTO </span><span style=\"font-size:11.0pt;\">法学会常务理事、中国国际法学会理事。主要从事仲裁和诉讼、国际贸易和投资、贸易救济、国际商</span><span style=\"font-size:11.0pt;\">事交易</span><span style=\"font-size:11.0pt;\">等</span><span style=\"font-size:11.0pt;\">。</span></p><p class=\"a ProfileBody\" style=\"text-align:center;\"><br></p><p class=\"a ProfileBody\" style=\"text-align:center;\"><br></p><p class=\"a ProfileBody\" style=\"text-align:center;\"><img src=\"http://192.168.1.191:8082/tempFanyu/word/media/image5.png\" width=\"120.0pt\" height=\"120.0pt\"></p><p style=\"text-align:center;\"><span style=\"font-family:FangSong_GB2312;font-size:12.0pt;font-weight:bold;background-color:#ffffff;\">主持人：陈建</span><span style=\"font-family:FangSong_GB2312;font-size:12.0pt;font-weight:bold;background-color:#ffffff;\"> </span><span style=\"font-family:FangSong_GB2312;font-size:12.0pt;font-weight:bold;background-color:#ffffff;\">博士</span></p><p style=\"text-align:center;\"><br></p><p style=\"text-align:left;\"><span style=\"font-size:11.0pt;\">中国仲裁法学研究会专职常务副秘书长。兼任中国人民大学律师学院客座教授、法学院</span><span style=\"font-size:11.0pt;\"> “ </span><span style=\"font-size:11.0pt;\">一带一路</span><span style=\"font-size:11.0pt;\"> ” </span><span style=\"font-size:11.0pt;\">法律研究中心研究员，对外经贸大学硕士生导师；国际商事仲裁理事会（</span><span style=\"font-size:11.0pt;\">ICCA</span><span style=\"font-size:11.0pt;\">）正式会员、中国法学会理事、英国皇家仲裁员学会正式会员；中国国际经济贸易仲裁委员会、科隆坡区域仲裁中心、吉尔吉斯斯坦国际仲裁院、柬埔寨国家商业仲裁中心，上海、重庆、深圳等大中城市的仲裁委员会仲裁员；中国国际经济贸易仲裁委员会域名争议解决中心专家组成员。</span></p><p class=\"a ProfileBody\"><br></p><p style=\"text-align:left;\"><span style=\"font-family:FangSong_GB2312;font-size:12.0pt;color:#ffffff;background-color:#78acfe;\">为保证讲座交流效果，敬请各位同仁尽早报名并留下联系方式。一旦接到报名，我们将尽快发送本案件相关材料。</span><br></p><p style=\"text-align:center;\"><span style=\"font-family:FangSong_GB2312;font-size:12.0pt;\">报名方式</span></p><p class=\"a a5\" style=\"text-align:center;\"><br></p><p class=\"a a5\" style=\"text-align:center;\"><span class=\"a a5\" style=\"font-size:11.0pt;font-weight:bold;color:#5b9bd5;\">为了让大家有一个舒适的听讲座体验，</span></p><p class=\"a a5\" style=\"text-align:center;\"><span class=\"a a5\" style=\"font-size:11.0pt;font-weight:bold;color:#5b9bd5;\">我们报名安排如下：</span></p><p class=\"a a5\" style=\"text-align:center;\"><br></p><p style=\"text-align:center;\"><span style=\"font-family:FangSong_GB2312;font-size:10.0pt;font-weight:bold;color:#5b9bd5;\">报名方式 </span><span style=\"font-family:FangSong_GB2312;font-size:10.0pt;font-weight:bold;color:#5b9bd5;\">&nbsp;长按下方</span><span style=\"font-family:FangSong_GB2312;font-size:10.0pt;font-weight:bold;color:#5b9bd5;\">二维码：</span></p><p style=\"text-align:center;\"><br><img src=\"http://192.168.1.191:8082/tempFanyu/word/media/image6.png\" width=\"104.7pt\" height=\"104.7pt\"><br></p><p class=\"a a5\" style=\"text-align:center;\"></p><p class=\"a a5\" style=\"text-align:center;\"><br></p><p class=\"a a5\"><span class=\"a a5\" style=\"font-size:11.0pt;color:#d92142;\">声明：本文仅为分享交流目的，不代表</span><span class=\"a a5\" style=\"font-size:11.0pt;color:#d92142;\">知仲科技</span><span class=\"a a5\" style=\"font-size:11.0pt;color:#d92142;\">有限公司和中国仲裁法学研究会的法律意见等相关的解读。</span></p><p class=\"a a5\"><br></p><p style=\"text-align:center;\"><span style=\"font-family:FangSong_GB2312;font-size:12.0pt;font-weight:bold;color:#78acfe;\">▼</span><span style=\"font-family:FangSong_GB2312;font-size:12.0pt;font-weight:bold;color:#78acfe;\">往期资讯</span><span style=\"font-family:FangSong_GB2312;font-size:12.0pt;font-weight:bold;color:#78acfe;\">回顾▼</span></p><p class=\"a X2\" style=\"text-align:justified;margin-bottom:8.0pt;background-color:#ffffff;\"><br></p><p style=\"text-align:left;\"><span style=\"text-align:left;\">1. </span>【座谈综述】仲裁大家谈——尤科斯案国际仲裁程序步步回放与研究</p><p style=\"text-align:left;\"><br></p><p style=\"text-align:left;\"><span style=\"text-align:left;\">2. </span>建设工程法律专题在线讲座成功举办｜活动概要</p><p style=\"text-align:left;\"><br></p><p style=\"text-align:left;\"><span style=\"text-align:left;\">3. </span>预告：“尤科斯案”公益座谈研讨会第三期【仲裁大家谈】</p><p style=\"text-align:left;\"><br></p><p style=\"text-align:left;\"><span style=\"text-align:left;\">4. </span>预告 | 建设工程法律专题讲座</p><p style=\"text-align:left;\"></p></div>', 274, NULL, '2020-10-23 14:11:22', '2020-10-23 14:11:20', '2020-11-10 14:03:46', NULL, 0);
INSERT INTO `content_info` VALUES (112, 45, '第二条新闻', 275, '张一龙', 11111, 2, '无论多少的摘要', '知仲科技', 2, 2, 1, '<p><span style=\"font-size: xx-large;\">这是第二条新闻</span></p><p><br></p><p><span style=\"font-size: xx-large;\"><br></span></p><p><span style=\"font-size: xx-large;\"><br></span></p><p><span style=\"font-size: xx-large;\">在线编辑时，无法上传本地图片？</span></p><p><br></p><p><br></p><p><br></p><p><br></p>', NULL, NULL, '2020-10-23 14:18:40', '2020-10-23 14:18:35', '2020-11-10 10:58:11', '2020-11-10 10:34:14', 0);
INSERT INTO `content_info` VALUES (113, 45, '第三条新闻', 276, '王伟', 22, 3, '第三条摘要', '凡预科技', 1, 2, 1, '<head><style>p{margin-top:0pt;margin-bottom:1pt;}p.a{text-align:justified;}span.a{font-size:10.0pt;}p.a3{text-align:center;}span.a3{font-size:9.0pt;}span.Char{font-size:9.0pt;}p.a4{text-align:left;}span.a4{font-size:9.0pt;}span.Char0{font-size:9.0pt;}</style></head><div style=\"width:595.0pt;margin-bottom:72.0pt;margin-top:72.0pt;margin-left:90.0pt;margin-right:90.0pt;\"><p style=\"text-align:center;\"><span style=\"font-family:FangSong_GB2312;font-size:22.0pt;\">撤回</span><span style=\"font-family:FangSong_GB2312;font-size:22.0pt;\">仲裁</span><span style=\"font-family:FangSong_GB2312;font-size:22.0pt;\">申请书</span></p><p><br/></p><p><span style=\"font-family:FangSong_GB2312;font-size:16.0pt;\">青岛</span><span style=\"font-family:FangSong_GB2312;font-size:16.0pt;\">仲裁委员会：</span></p><p style=\"text-indent:32.0pt;\"><span style=\"font-family:FangSong_GB2312;font-size:16.0pt;\">贵委</span><span style=\"font-family:FangSong_GB2312;font-size:16.0pt;\">受理的</span><span style=\"font-family:FangSong_GB2312;font-size:16.0pt;\">申请人</span><span style=\"font-family:FangSong_GB2312;font-size:16.0pt;\">北京松拓科技</span><span style=\"font-family:FangSong_GB2312;font-size:16.0pt;\">与</span><span style=\"font-family:FangSong_GB2312;font-size:16.0pt;\">被申请人</span><span style=\"font-family:FangSong_GB2312;font-size:16.0pt;\">王昭</span><span style=\"font-family:FangSong_GB2312;font-size:16.0pt;\">关于</span><span style=\"font-family:FangSong_GB2312;font-size:16.0pt;\">借款纠纷一案，现</span><span style=\"font-family:FangSong_GB2312;font-size:16.0pt;\">申请人</span><span style=\"font-family:FangSong_GB2312;font-size:16.0pt;\">请求</span><span style=\"font-family:FangSong_GB2312;font-size:16.0pt;\">撤回</span><span style=\"font-family:FangSong_GB2312;font-size:16.0pt;\">仲裁</span><span style=\"font-family:FangSong_GB2312;font-size:16.0pt;\">申请。</span></p><p style=\"text-indent:32.0pt;\"><br/></p><p style=\"text-indent:32.0pt;\"><br/></p><p style=\"text-indent:32.0pt;\"><br/></p><p style=\"text-indent:32.0pt;\"><span style=\"font-family:FangSong_GB2312;font-size:16.0pt;\">                   </span><span id=\"_GoBack\"/><span style=\"font-family:FangSong_GB2312;font-size:16.0pt;\"> </span><span style=\"font-family:FangSong_GB2312;font-size:16.0pt;\">申请人</span><span style=\"font-family:FangSong_GB2312;font-size:16.0pt;\">：</span><span style=\"font-family:FangSong_GB2312;font-size:16.0pt;\">北京松拓科技有限公司</span></p><p style=\"text-indent:32.0pt;\"><span style=\"font-family:FangSong_GB2312;font-size:16.0pt;\">                            </span><span style=\"font-family:FangSong_GB2312;font-size:16.0pt;\">2020</span><span style=\"font-family:FangSong_GB2312;font-size:16.0pt;\"> 年 </span><span style=\"font-family:FangSong_GB2312;font-size:16.0pt;\">1</span><span style=\"font-family:FangSong_GB2312;font-size:16.0pt;\">  月  </span><span style=\"font-family:FangSong_GB2312;font-size:16.0pt;\">2</span><span style=\"font-family:FangSong_GB2312;font-size:16.0pt;\"> 日</span></p></div>', 279, NULL, '2020-10-23 14:23:26', '2020-10-23 14:23:25', '2020-11-10 10:59:11', '2020-11-10 10:59:01', 0);
INSERT INTO `content_info` VALUES (114, 46, '回顾的第一条新闻', 281, '阿道夫', 234, 1, '阿道夫', '说杜峰', 2, 2, 1, '<p style=\"text-align: center;\"><span style=\"font-size: xx-large;\">往期回顾的第一条数据</span></p>', NULL, NULL, '2020-10-23 14:29:35', '2020-10-23 14:29:29', '2020-11-10 10:33:36', '2020-11-10 10:33:36', 0);
INSERT INTO `content_info` VALUES (116, 32, '产品经理', NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 3, '<p>XXXXXXXXXXXXXXXXXXXX</p><p>XXXXXXXXXXXXXXXXXXX</p><p>XXXXXXXXXXXXXXXXXXXXX</p>', NULL, NULL, '2020-10-23 15:22:58', '2020-10-23 15:22:57', NULL, NULL, 0);
INSERT INTO `content_info` VALUES (117, 40, '尤科斯石油公司', 309, '1', 1, 1, '摘要信息:尤科斯石油公司（以下称“尤科斯公司”）是俄罗斯最大的石油和天然气公司之一，主要是从事石油、天然气和石化产品的勘探、生产、提炼和销售业务。自2003年起，尤科斯公司被俄罗斯政府部门认定存在逃税、欺诈等行为，需缴纳总额超过100亿美元的罚款。尤科斯公司在俄罗斯国内寻求了多种救济，但诉求都被驳回。由于未能如期履行法院判决，尤科斯公司的部分子公司被查封或强制拍卖，但仍有大量债务无法偿还，尤科斯公司最终于2007年11月被注销……', '1', 2, 2, 1, '<p><br>摘要信息:尤科斯石油公司（以下称“尤科斯公司”）是俄罗斯最大的石油和天然气公司之一，主要是从事石油、天然气和石化产品的勘探、生产、提炼和销售业务。自2003年起，尤科斯公司被俄罗斯政府部门认定存在逃税、欺诈等行为，需缴纳总额超过100亿美元的罚款。尤科斯公司在俄罗斯国内寻求了多种救济，但诉求都被驳回。由于未能如期履行法院判决，尤科斯公司的部分子公司被查封或强制拍卖，但仍有大量债务无法偿还，尤科斯公司最终于2007年11月被注销……</p>', NULL, NULL, '2020-10-26 18:40:44', '2020-10-26 18:40:42', '2020-11-10 12:04:42', '2020-11-10 12:02:38', 0);
INSERT INTO `content_info` VALUES (121, 6, NULL, 313, NULL, NULL, 1, NULL, NULL, 0, 2, 4, NULL, NULL, 'www.baidu.com', '2020-10-28 10:28:06', '2020-10-28 10:28:04', NULL, NULL, 0);
INSERT INTO `content_info` VALUES (122, 6, NULL, 314, NULL, NULL, 2, NULL, NULL, 0, 2, 4, NULL, NULL, 'www.baidu.com', '2020-10-28 10:28:31', '2020-10-28 10:28:18', NULL, NULL, 0);
INSERT INTO `content_info` VALUES (123, 6, NULL, 315, NULL, NULL, 3, NULL, NULL, 0, 2, 4, NULL, NULL, 'www.baidu.com', '2020-10-28 10:28:30', '2020-10-28 10:28:29', NULL, NULL, 0);
INSERT INTO `content_info` VALUES (127, 41, '测试数据', 326, '王力', 1, 0, '测试数据', '网络', 2, 2, 1, '<p>测试数据测试</p>', NULL, NULL, '2020-11-06 15:09:51', '2020-11-06 15:09:39', '2020-11-09 17:38:11', '2020-11-09 17:38:11', 0);

-- ----------------------------
-- Table structure for file_upload
-- ----------------------------
DROP TABLE IF EXISTS `file_upload`;
CREATE TABLE `file_upload`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文件编号',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `file_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 327 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file_upload
-- ----------------------------
INSERT INTO `file_upload` VALUES (1, '被申请人身份证正面.jpg', '/zhizhong-system-cms/20200908/a808d27b4d32451da7c18bbf23445dc2.jpg', '2020-09-08 18:48:28');
INSERT INTO `file_upload` VALUES (2, '仲裁申请书模板.pdf', 'http://127.0.0.1:8080/zhizhong-system-cms/20200914/337096f656c246a682373bc873f258a4.pdf', '2020-09-14 17:07:45');
INSERT INTO `file_upload` VALUES (3, 'u8364.png', 'http://127.0.0.1:8080/zhizhong-system-cms/20200921/44afdae4bc7b43cdae48a50a57ca0c6e.png', '2020-09-21 19:49:03');
INSERT INTO `file_upload` VALUES (4, 'u8364.png', 'http://127.0.0.1:8080/zhizhong-system-cms/20200921/59bdea6e45614af3815644698686d2b7.png', '2020-09-21 19:52:00');
INSERT INTO `file_upload` VALUES (5, 'u8091.png', 'http://127.0.0.1:8080/zhizhong-system-cms/20200921/dd0841803f4344d3805ffd98a0b1882d.png', '2020-09-21 19:52:11');
INSERT INTO `file_upload` VALUES (6, 'u8236.png', 'http://127.0.0.1:8080/zhizhong-system-cms/20200921/3b5e5a8f8ed5408a86718e72d90f72bb.png', '2020-09-21 19:53:02');
INSERT INTO `file_upload` VALUES (7, 'u8234.png', 'http://127.0.0.1:8080/zhizhong-system-cms/20200921/d17b304ac6c1417dabd791f10f7ec622.png', '2020-09-21 19:53:06');
INSERT INTO `file_upload` VALUES (8, 'u8234.png', 'http://127.0.0.1:8080/zhizhong-system-cms/20200921/2517cdd94fcb4bc6b4e6a539cda4c3cd.png', '2020-09-21 19:54:27');
INSERT INTO `file_upload` VALUES (9, 'u8230.png', 'http://127.0.0.1:8080/zhizhong-system-cms/20200921/cce41350618f47268e234e71b9f9b577.png', '2020-09-21 19:54:41');
INSERT INTO `file_upload` VALUES (10, 'u8234.png', 'http://127.0.0.1:8080/zhizhong-system-cms/20200921/a51feb3c01664bfd8a81259049b54d2c.png', '2020-09-21 19:56:36');
INSERT INTO `file_upload` VALUES (11, 'u8212.png', 'http://127.0.0.1:8080/zhizhong-system-cms/20200921/a0b72ced6b4b4088bcfcbfa07c36ad17.png', '2020-09-21 19:58:17');
INSERT INTO `file_upload` VALUES (12, 'u8364.png', 'http://127.0.0.1:8080/zhizhong-system-cms/20200921/60b283ef352843bba735dccf6fc91ff0.png', '2020-09-21 19:59:09');
INSERT INTO `file_upload` VALUES (13, 'u8230.png', 'http://127.0.0.1:8080/zhizhong-system-cms/20200921/b30079f6a80740c384db58c953ef5769.png', '2020-09-21 20:00:55');
INSERT INTO `file_upload` VALUES (14, 'u8236.png', 'http://127.0.0.1:8080/zhizhong-system-cms/20200921/0039331d65a1496f873d9a4cd043ff49.png', '2020-09-21 20:01:03');
INSERT INTO `file_upload` VALUES (15, 'u8210.png', 'http://127.0.0.1:8080/zhizhong-system-cms/20200921/c7ae995aa8ef4ac9915518b8cedfb1dd.png', '2020-09-21 20:02:43');
INSERT INTO `file_upload` VALUES (16, 'u8364.png', 'http://127.0.0.1:8080/zhizhong-system-cms/20200921/5b6ae74890014c9187a6c68d83475087.png', '2020-09-21 20:03:54');
INSERT INTO `file_upload` VALUES (17, 'u8234.png', 'http://127.0.0.1:8080/zhizhong-system-cms/20200921/961e909a3bc04b0ca630ae2ed3444ce7.png', '2020-09-21 20:04:35');
INSERT INTO `file_upload` VALUES (18, 'u8101.png', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/bfdd1d34c8f349c2bcb791ff6cee4fbf.png', '2020-09-22 09:56:44');
INSERT INTO `file_upload` VALUES (19, 'u8210.png', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/9e3203680baa4fa6863df51abdbc5a77.png', '2020-09-22 10:16:06');
INSERT INTO `file_upload` VALUES (20, 'u8210.png', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/f20a4e70ab334fb084c317cbc834ba09.png', '2020-09-22 10:22:56');
INSERT INTO `file_upload` VALUES (21, 'u8089.png', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/43ab1784a4f14d96806d2452791c6369.png', '2020-09-22 10:23:59');
INSERT INTO `file_upload` VALUES (22, 'u8212.png', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/01e0054f255545f98996e73d4aae497e.png', '2020-09-22 10:24:22');
INSERT INTO `file_upload` VALUES (23, 'u8234.png', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/1bad8231ad824eb0bc05e804f56dbeda.png', '2020-09-22 10:26:05');
INSERT INTO `file_upload` VALUES (24, 'u8362.png', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/1b9a32bde61141348d4ee775d40b0aba.png', '2020-09-22 10:31:51');
INSERT INTO `file_upload` VALUES (25, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/5b8fda51a822430cbc1fe34d8debe595.jpg', '2020-09-22 10:34:04');
INSERT INTO `file_upload` VALUES (26, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/0340bacb8bbd42c088c457c232b8ebbf.jpg', '2020-09-22 10:35:04');
INSERT INTO `file_upload` VALUES (27, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/b409fbddb477470584aaf0aba5d81e98.jpg', '2020-09-22 10:40:04');
INSERT INTO `file_upload` VALUES (28, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/3a86e092344f4a78a45280149d972e0d.jpg', '2020-09-22 10:41:09');
INSERT INTO `file_upload` VALUES (29, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/0deb10b26561401daa87cd55035c5eb0.jpg', '2020-09-22 10:42:12');
INSERT INTO `file_upload` VALUES (30, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/13358b466abc474abebec97f78b96f30.jpg', '2020-09-22 10:43:06');
INSERT INTO `file_upload` VALUES (31, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/61a85be979214984bb57ca0fbe5fdcc1.jpg', '2020-09-22 10:44:17');
INSERT INTO `file_upload` VALUES (32, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/4a12debd59724774bf01210bfc389237.jpg', '2020-09-22 10:53:15');
INSERT INTO `file_upload` VALUES (33, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/5ac6b9e1521c4e57b48112e73d906c53.jpg', '2020-09-22 10:57:50');
INSERT INTO `file_upload` VALUES (34, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/a85a01b8390043fa912e39bd7ce4e91b.jpg', '2020-09-22 10:58:15');
INSERT INTO `file_upload` VALUES (35, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/5d4c6a3429d34dbeb09c2a4cfab45c13.jpg', '2020-09-22 10:59:14');
INSERT INTO `file_upload` VALUES (36, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/da0eb2073195486b9344d8980cd2f25d.jpg', '2020-09-22 11:00:18');
INSERT INTO `file_upload` VALUES (37, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/23e067f3f4fa4770896b73993494637e.jpg', '2020-09-22 11:05:48');
INSERT INTO `file_upload` VALUES (38, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/54e54a88e79a43f4b9934a027b5dd4b1.jpg', '2020-09-22 11:06:45');
INSERT INTO `file_upload` VALUES (39, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/fec8197b2f4648128c68045aa982fe54.jpg', '2020-09-22 11:07:45');
INSERT INTO `file_upload` VALUES (40, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/81538c96b97b4eada2624674be7772c9.jpg', '2020-09-22 11:09:02');
INSERT INTO `file_upload` VALUES (41, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/bfc1649b7fe54c5cb3681eeb7c3c4ffe.jpg', '2020-09-22 11:10:25');
INSERT INTO `file_upload` VALUES (42, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/6be6fc6e87c446b6849e23cb279ee9d9.jpg', '2020-09-22 11:11:56');
INSERT INTO `file_upload` VALUES (43, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/7394a41c0f2e4d22b773a0095435f542.jpg', '2020-09-22 11:12:49');
INSERT INTO `file_upload` VALUES (44, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/730801f97c7a4cad90a47b1f46b95ecb.jpg', '2020-09-22 11:14:03');
INSERT INTO `file_upload` VALUES (45, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/0a235cb438344e34aff7bf2211f171a0.jpg', '2020-09-22 11:14:55');
INSERT INTO `file_upload` VALUES (46, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/7c696ffadd254120bd61cac736aacf98.jpg', '2020-09-22 11:15:39');
INSERT INTO `file_upload` VALUES (47, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/75f347b5ff7c443286fc617fe188a4a1.jpg', '2020-09-22 11:18:28');
INSERT INTO `file_upload` VALUES (48, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/318f29880f0c4734952cb8047befdc84.jpg', '2020-09-22 11:21:43');
INSERT INTO `file_upload` VALUES (49, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/9686d0218ef3489f872b0b0fd0bef15d.jpg', '2020-09-22 11:28:49');
INSERT INTO `file_upload` VALUES (50, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/a00d5de97b7b4568afe4ac77564a7765.jpg', '2020-09-22 11:31:13');
INSERT INTO `file_upload` VALUES (51, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/b2c811d75a1041b8a8f0aacff612f12c.jpg', '2020-09-22 11:32:00');
INSERT INTO `file_upload` VALUES (52, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/8700fef72b2c4ea6ac4afda7f98a76d7.jpg', '2020-09-22 11:32:36');
INSERT INTO `file_upload` VALUES (53, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/f97bb7d70d904029a24f5a3119ab2e19.jpg', '2020-09-22 11:32:51');
INSERT INTO `file_upload` VALUES (54, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/cc27295e520043a791e730246edb0ddc.jpg', '2020-09-22 11:38:55');
INSERT INTO `file_upload` VALUES (55, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/4a6f524f33e74c29aa41c66a65f7850c.jpg', '2020-09-22 11:39:40');
INSERT INTO `file_upload` VALUES (56, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/39a65836c1e9460682552c5d2d549354.jpg', '2020-09-22 11:43:57');
INSERT INTO `file_upload` VALUES (57, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/00c3c28201994108b16cddd18083547f.jpg', '2020-09-22 11:44:31');
INSERT INTO `file_upload` VALUES (58, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/c03ff94d77dc4021879f8e16ec934de5.jpg', '2020-09-22 11:44:43');
INSERT INTO `file_upload` VALUES (59, '消费信贷合同.pdf', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/c37f57339aea4a2e97669676e75d232c.pdf', '2020-09-22 12:39:17');
INSERT INTO `file_upload` VALUES (60, '服务器和数据库查询权限.docx', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/865290d00b014f3c9d2b0aa2f3fe51cd.docx', '2020-09-22 12:41:05');
INSERT INTO `file_upload` VALUES (61, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/441f12314e3748d1a0e593a998a0179b.jpg', '2020-09-22 13:33:30');
INSERT INTO `file_upload` VALUES (62, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/2f026243b8014930a17c5925fbaf21f0.jpg', '2020-09-22 13:38:32');
INSERT INTO `file_upload` VALUES (63, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/8875c9e76a6c46bd81c7c6f6345e7ce2.jpg', '2020-09-22 14:09:52');
INSERT INTO `file_upload` VALUES (64, '立案端.docx', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/9c97cf99553d4148b988ad0cae1b95a8.docx', '2020-09-22 14:10:01');
INSERT INTO `file_upload` VALUES (65, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/446cfe2962e4429e9e42366a67891dc3.jpg', '2020-09-22 15:11:09');
INSERT INTO `file_upload` VALUES (66, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/9125cae4518c493690ca059272f1f7ae.jpg', '2020-09-22 15:41:23');
INSERT INTO `file_upload` VALUES (67, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/58339693f97e424b8873a8e1ec9c37e9.jpg', '2020-09-22 17:38:55');
INSERT INTO `file_upload` VALUES (68, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200922/b5e349e9db574c3ab54d30d6a3b748aa.jpg', '2020-09-22 18:20:55');
INSERT INTO `file_upload` VALUES (69, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200923/46d2c34fc1c44f3b97ffbf2f1057ef23.jpg', '2020-09-23 10:32:13');
INSERT INTO `file_upload` VALUES (70, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200923/da746c72c5004ed0a4cfcc3474fe1b0c.jpg', '2020-09-23 10:33:44');
INSERT INTO `file_upload` VALUES (71, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200923/76d6c9267cfa4b42b26c6c38ada51420.jpg', '2020-09-23 10:34:36');
INSERT INTO `file_upload` VALUES (72, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200923/4229f1cc587f408f97327f5c05d1b898.jpg', '2020-09-23 10:36:42');
INSERT INTO `file_upload` VALUES (73, '问题.docx', 'http://127.0.0.1:8080/zhizhong-system-cms/20200923/dded66d9dcfb476c8d8d12c267e960d3.docx', '2020-09-23 10:36:51');
INSERT INTO `file_upload` VALUES (74, 'u8364.png', 'http://127.0.0.1:8080/zhizhong-system-cms/20200923/e633698b5f84424f9ce2239e95b795d7.png', '2020-09-23 10:52:10');
INSERT INTO `file_upload` VALUES (75, 'u8348.png', 'http://127.0.0.1:8080/zhizhong-system-cms/20200923/d26b4c977c37491486eeed50ae7e3d19.png', '2020-09-23 10:52:46');
INSERT INTO `file_upload` VALUES (76, '立案端.docx', 'http://127.0.0.1:8080/zhizhong-system-cms/20200923/7808a35e08b14203b4b1eabebb88111f.docx', '2020-09-23 10:53:00');
INSERT INTO `file_upload` VALUES (77, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200923/5eb858070fd74f8bacafdba94d741db5.jpg', '2020-09-23 13:16:47');
INSERT INTO `file_upload` VALUES (78, '立案端.docx', 'http://127.0.0.1:8080/zhizhong-system-cms/20200923/5a5ba76e83b84366921e3134059e00fb.docx', '2020-09-23 13:16:48');
INSERT INTO `file_upload` VALUES (79, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200923/32815547ec3849c19885621a4f0d0549.jpg', '2020-09-23 14:24:42');
INSERT INTO `file_upload` VALUES (80, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200923/b80492588fb149fab3963d4ee88ed72a.jpg', '2020-09-23 14:25:13');
INSERT INTO `file_upload` VALUES (81, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200923/3c6d454ff57b4e96bda4a15c73aff1c9.jpg', '2020-09-23 14:28:38');
INSERT INTO `file_upload` VALUES (82, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200923/64c2217b2283472f97b55ca48d875d76.jpg', '2020-09-23 14:36:07');
INSERT INTO `file_upload` VALUES (83, '问题.docx', 'http://127.0.0.1:8080/zhizhong-system-cms/20200923/4abd0967577144228aa9e922c423e410.docx', '2020-09-23 14:37:14');
INSERT INTO `file_upload` VALUES (84, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200923/874e569801b24991991090d19adc6032.jpg', '2020-09-23 14:37:26');
INSERT INTO `file_upload` VALUES (85, '问题.docx', 'http://127.0.0.1:8080/zhizhong-system-cms/20200923/c89ad44c55044339a0acd25de9b4a699.docx', '2020-09-23 14:37:34');
INSERT INTO `file_upload` VALUES (86, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200923/b37039134f7d4791b463747fea1a3465.jpg', '2020-09-23 14:38:01');
INSERT INTO `file_upload` VALUES (87, '问题.docx', 'http://127.0.0.1:8080/zhizhong-system-cms/20200923/3d0e5356963942ff924c131b51795f36.docx', '2020-09-23 14:38:09');
INSERT INTO `file_upload` VALUES (88, '1.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200923/39dcacdecca24338931054224b246b9e.jpg', '2020-09-23 16:26:28');
INSERT INTO `file_upload` VALUES (89, '1600921184(1).png', 'http://127.0.0.1:8080/zhizhong-system-cms/20200924/04cc9be01c9d46f489b6d352161ba8c7.png', '2020-09-24 12:19:56');
INSERT INTO `file_upload` VALUES (90, '1600921184(1).png', 'http://127.0.0.1:8080/zhizhong-system-cms/20200924/a6ad2af301994fad937d75db4a3ed7f0.png', '2020-09-24 12:46:19');
INSERT INTO `file_upload` VALUES (91, '1600921184(1).png', 'http://127.0.0.1:8080/zhizhong-system-cms/20200924/532b385f03bf4dbb806316e4bddea753.png', '2020-09-24 12:46:44');
INSERT INTO `file_upload` VALUES (92, '1600921184(1).png', 'http://127.0.0.1:8080/zhizhong-system-cms/20200924/593738ace1204e8aac7d6c7c410877e1.png', '2020-09-24 12:47:22');
INSERT INTO `file_upload` VALUES (93, '39d3df514fb34080a17vv31871203d8560555586665522145522255323322255533225 - 副本.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200925/041ec8be978b43109b9d5ac4909e2189.jpg', '2020-09-25 15:12:49');
INSERT INTO `file_upload` VALUES (94, 'gratisacks.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200927/ef7aafb094a8462ba7ed5c7825b22051.jpg', '2020-09-27 11:20:01');
INSERT INTO `file_upload` VALUES (95, '39d3df514fb34080a17vv31871203d8560555586665522145522255323322255533225 - 副本.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200927/d2f0b27e28654e27baaa791729548648.jpg', '2020-09-27 11:57:02');
INSERT INTO `file_upload` VALUES (96, '39d3df514fb34080a17vv31871203d8560555586665522145522255323322255533225 - 副本.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20200929/961648fce3984751ad214883b6acfe34.jpg', '2020-09-29 11:56:39');
INSERT INTO `file_upload` VALUES (97, '200861194246845_2.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20201009/6f18074956824c09aca3a58cadfc03d4.jpg', '2020-10-09 14:05:35');
INSERT INTO `file_upload` VALUES (98, 'c2340a09.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20201009/65230bdab2364df5874a8236757e9d36.jpg', '2020-10-09 14:05:41');
INSERT INTO `file_upload` VALUES (99, 'c2340a09.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20201009/54c826bf51ad4bb7adb5b92e4fe7e005.jpg', '2020-10-09 17:10:05');
INSERT INTO `file_upload` VALUES (100, 'u=575446659,1937410930&fm=27&gp=0.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20201010/2499ee517c9044d29156035c5f27e808.jpg', '2020-10-10 10:00:25');
INSERT INTO `file_upload` VALUES (101, '200861194246845_2.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20201010/743ead8d67474daa80389951e4ebaa47.jpg', '2020-10-10 10:30:46');
INSERT INTO `file_upload` VALUES (102, '18d8bc3eb13533fa08818dfc3ade951840345bc5.jpeg', 'http://127.0.0.1:8080/zhizhong-system-cms/20201010/12fe8ac9d1b2406faf5de09185522979.jpeg', '2020-10-10 10:49:18');
INSERT INTO `file_upload` VALUES (103, '官网上传资料.docx', 'http://127.0.0.1:8080/zhizhong-system-cms/20201010/b5dbfdba0e2146f6ae1feed3d358d98f.docx', '2020-10-10 10:51:45');
INSERT INTO `file_upload` VALUES (104, '官网上传资料.docx', 'http://127.0.0.1:8080/zhizhong-system-cms/20201010/76e5beff1aa741f5b94f0b42f65ee103.docx', '2020-10-10 10:51:50');
INSERT INTO `file_upload` VALUES (105, '官网上传资料.docx', 'http://127.0.0.1:8080/zhizhong-system-cms/20201010/6bce29b0809d415b9e71a06425a8c782.docx', '2020-10-10 10:51:52');
INSERT INTO `file_upload` VALUES (106, '18d8bc3eb13533fa08818dfc3ade951840345bc5.jpeg', 'http://127.0.0.1:8080/zhizhong-system-cms/20201010/8ea376e6f0964cacae4397aec69285b3.jpeg', '2020-10-10 11:02:04');
INSERT INTO `file_upload` VALUES (107, '官网上传资料.docx', 'http://127.0.0.1:8080/zhizhong-system-cms/20201010/280bf8a0c9484271bfc67f798fe884ad.docx', '2020-10-10 11:02:47');
INSERT INTO `file_upload` VALUES (108, '官网上传资料.docx', 'http://127.0.0.1:8080/zhizhong-system-cms/20201010/2350b536efdb4bfc9ef09196bd6436f6.docx', '2020-10-10 11:02:48');
INSERT INTO `file_upload` VALUES (109, '官网上传资料.docx', 'http://127.0.0.1:8080/zhizhong-system-cms/20201010/e22029e4149f47fa814c49ed3b613143.docx', '2020-10-10 11:02:48');
INSERT INTO `file_upload` VALUES (110, '官网上传资料.docx', 'http://127.0.0.1:8080/zhizhong-system-cms/20201010/34e6609f57b84f20978e844871d4a2e9.docx', '2020-10-10 11:02:48');
INSERT INTO `file_upload` VALUES (111, '官网上传资料.docx', 'http://127.0.0.1:8080/zhizhong-system-cms/20201010/5fee3b2e324e43138367cf5e321c8730.docx', '2020-10-10 11:02:48');
INSERT INTO `file_upload` VALUES (112, '官网上传资料.docx', 'http://127.0.0.1:8080/zhizhong-system-cms/20201010/0eb54e546cc74e0a92d814c455acf720.docx', '2020-10-10 11:02:48');
INSERT INTO `file_upload` VALUES (113, '官网上传资料.docx', 'http://127.0.0.1:8080/zhizhong-system-cms/20201010/2f17d065b49d43a8a2d7a8cf8b4c09d0.docx', '2020-10-10 11:02:49');
INSERT INTO `file_upload` VALUES (114, '官网上传资料.docx', 'http://127.0.0.1:8080/zhizhong-system-cms/20201010/082b993cd6ec4152945809248770ff5f.docx', '2020-10-10 11:02:49');
INSERT INTO `file_upload` VALUES (115, '官网上传资料.docx', 'http://127.0.0.1:8080/zhizhong-system-cms/20201010/1d6127be2414408d87b549fe88d3295c.docx', '2020-10-10 11:02:49');
INSERT INTO `file_upload` VALUES (116, '官网上传资料.docx', 'http://127.0.0.1:8080/zhizhong-system-cms/20201010/fc9568eb23fb4e7593ce7c9472ffd009.docx', '2020-10-10 11:03:24');
INSERT INTO `file_upload` VALUES (117, '官网上传资料.docx', 'http://127.0.0.1:8080/zhizhong-system-cms/20201010/d5ede16709d14c4d85cfbd61a26e7d0b.docx', '2020-10-10 11:03:24');
INSERT INTO `file_upload` VALUES (118, 'a2cc7cd98d1001e9a711b2275ca51deb54e79718.jpeg', 'http://127.0.0.1:8080/zhizhong-system-cms/20201010/afb421fcfa604c1dbb0ce1389d511054.jpeg', '2020-10-10 11:49:39');
INSERT INTO `file_upload` VALUES (119, 'c2340a09.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20201010/6c503f4eeaaa43eea1133064f09bcda2.jpg', '2020-10-10 17:02:29');
INSERT INTO `file_upload` VALUES (120, 'c2340a09.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20201010/c43abad48ca041fabdde273840d0f897.jpg', '2020-10-10 17:04:14');
INSERT INTO `file_upload` VALUES (121, '200861194246845_2.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20201010/d8517b1f0e734c79bde057921271ce72.jpg', '2020-10-10 17:09:38');
INSERT INTO `file_upload` VALUES (122, 'ting.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20201014/618cdfc2343449b7885f6ca06de12feb.jpg', '2020-10-14 16:57:56');
INSERT INTO `file_upload` VALUES (123, 'ting.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20201014/7b83cd64b6c641ddbb0347040e8dc92d.jpg', '2020-10-14 17:00:02');
INSERT INTO `file_upload` VALUES (124, 'ting.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20201014/a2159498c5104046bc85f086b5230169.jpg', '2020-10-14 17:07:01');
INSERT INTO `file_upload` VALUES (125, 'ting.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20201014/c1b8a956048a4b53ab8959409e3944eb.jpg', '2020-10-14 17:18:35');
INSERT INTO `file_upload` VALUES (126, '知仲官网bug.docx', 'http://127.0.0.1:8080/zhizhong-system-cms/20201014/c0b8493e80474f58bc29b73fb123351f.docx', '2020-10-14 17:18:58');
INSERT INTO `file_upload` VALUES (127, 'ting.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20201014/ef67aa0ffdea4bdbae6a4447162b33bb.jpg', '2020-10-14 17:20:12');
INSERT INTO `file_upload` VALUES (128, '知仲官网bug.docx', 'http://127.0.0.1:8080/zhizhong-system-cms/20201014/168c87249f0d4bf7ad675858eaa63cfe.docx', '2020-10-14 17:21:14');
INSERT INTO `file_upload` VALUES (129, 'ting.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20201014/874d8d2375fc4c21bffdbe5efb4910a0.jpg', '2020-10-14 19:19:11');
INSERT INTO `file_upload` VALUES (130, 'ting.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20201015/7672887a7982478a8a5ae14c1a372a58.jpg', '2020-10-15 10:21:46');
INSERT INTO `file_upload` VALUES (131, 'ting.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20201015/0b260f06980a47d089e88ff0a13f5931.jpg', '2020-10-15 10:22:00');
INSERT INTO `file_upload` VALUES (132, 'ting.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20201015/3f15180eb6e3436bac42a2e53f5fe671.jpg', '2020-10-15 10:22:23');
INSERT INTO `file_upload` VALUES (133, 'ting.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20201015/1e4bea3645eb43eb8503bedd23f800ec.jpg', '2020-10-15 13:49:50');
INSERT INTO `file_upload` VALUES (134, 'ting.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20201015/3827ffe9b517455fa38800ea5a3edd4a.jpg', '2020-10-15 14:11:05');
INSERT INTO `file_upload` VALUES (135, 'ting.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20201015/c91bb69f5f1e4316b337de84bfb03c36.jpg', '2020-10-15 14:11:49');
INSERT INTO `file_upload` VALUES (136, 'ting.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20201015/c7c5a028e58f4d9385c65c5f61f6e350.jpg', '2020-10-15 14:18:23');
INSERT INTO `file_upload` VALUES (137, 'ting.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20201015/52cf1a1f617b4cbb96469dcabb5aca3e.jpg', '2020-10-15 14:21:24');
INSERT INTO `file_upload` VALUES (138, 'ting.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20201015/9270c32f3f8d4940809dd9fb707f6aa4.jpg', '2020-10-15 14:39:49');
INSERT INTO `file_upload` VALUES (139, 'ting.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20201015/310b730b373248b190d6437d3c9ea17b.jpg', '2020-10-15 14:46:48');
INSERT INTO `file_upload` VALUES (140, 'ting.jpg', 'http://127.0.0.1:8080/zhizhong-system-cms/20201016/c6f692adc3214b3793c68555a0bdf48f.jpg', '2020-10-16 14:22:28');
INSERT INTO `file_upload` VALUES (141, '7152E918-38B8-4f42-974B-1C148FD8935A.png', 'http://127.0.0.1:8080/zhizhong-system-cms/20201016/3051f41531954589836a68106a963ed8.png', '2020-10-16 16:23:41');
INSERT INTO `file_upload` VALUES (142, '7152E918-38B8-4f42-974B-1C148FD8935A.png', 'http://127.0.0.1:8080/zhizhong-system-cms/20201016/1a9f18bc196e4a1b8b300e2eaa0af735.png', '2020-10-16 16:23:56');
INSERT INTO `file_upload` VALUES (143, '7152E918-38B8-4f42-974B-1C148FD8935A.png', 'http://127.0.0.1:8080/zhizhong-system-cms/20201016/2034a046bd5d49fda7c630827c9ad36c.png', '2020-10-16 16:38:47');
INSERT INTO `file_upload` VALUES (144, '7152E918-38B8-4f42-974B-1C148FD8935A.png', 'http://127.0.0.1:8082/zhizhong-system-cms/20201016/e30e13401ea3402996c523e51c95348f.png', '2020-10-16 16:46:30');
INSERT INTO `file_upload` VALUES (145, '7152E918-38B8-4f42-974B-1C148FD8935A.png', 'http://127.0.0.1:8082/zhizhong-system-cms/20201016/382eaeb0c96c4176bccd73e116b59a1c.png', '2020-10-16 16:55:21');
INSERT INTO `file_upload` VALUES (146, '7152E918-38B8-4f42-974B-1C148FD8935A.png', 'http://127.0.0.1:8082/zhizhong-system-cms/20201016/1b82a0c359be4b07b88a8f844e230e0f.png', '2020-10-16 16:56:03');
INSERT INTO `file_upload` VALUES (147, '7152E918-38B8-4f42-974B-1C148FD8935A.png', 'http://192.168.1.191:8082/zhizhong-system-cms/20201016/e64e4f760a29426db5a053ea00a0e58b.png', '2020-10-16 16:57:52');
INSERT INTO `file_upload` VALUES (148, '7152E918-38B8-4f42-974B-1C148FD8935A.png', 'http://192.168.1.191:8082/zhizhong-system-cms/20201016/db2abe2096f943d8b55b6bda51150561.png', '2020-10-16 17:04:16');
INSERT INTO `file_upload` VALUES (149, '7152E918-38B8-4f42-974B-1C148FD8935A.png', 'http://192.168.1.191:8082/zhizhong-system-cms/20201016/d477d7ca4dc34489b96b150f75f8eaf6.png', '2020-10-16 17:37:47');
INSERT INTO `file_upload` VALUES (150, '7152E918-38B8-4f42-974B-1C148FD8935A.png', 'http://192.168.1.191:8082/zhizhong-system-cms/20201016/3aecb2c6de9e40b29faf19ed51fbfd92.png', '2020-10-16 17:37:57');
INSERT INTO `file_upload` VALUES (151, '7152E918-38B8-4f42-974B-1C148FD8935A.png', 'http://192.168.1.191:8082/zhizhong-system-cms/20201016/af10f805d02b426bbb202558f8cf448d.png', '2020-10-16 17:39:21');
INSERT INTO `file_upload` VALUES (152, '7152E918-38B8-4f42-974B-1C148FD8935A.png', 'http://127.0.0.1:8082/zhizhong-system-cms/20201016/0d8a4979599b46ce9d7e2f8732c4d124.png', '2020-10-16 17:43:24');
INSERT INTO `file_upload` VALUES (153, '7152E918-38B8-4f42-974B-1C148FD8935A.png', 'http://127.0.0.1:8082/zhizhong-system-cms/20201016/1666c20b20d943c484d6e06e7afd973d.png', '2020-10-16 17:45:03');
INSERT INTO `file_upload` VALUES (154, '7152E918-38B8-4f42-974B-1C148FD8935A.png', 'http://127.0.0.1:8082/zhizhong-system-cms/20201016/434efa700ad94c8080e24781410eadb2.png', '2020-10-16 17:45:12');
INSERT INTO `file_upload` VALUES (155, '7152E918-38B8-4f42-974B-1C148FD8935A.png', 'http://192.168.1.191:8082/zhizhong-system-cms/20201016/5ebf50ab6e1f446a97367c2a83a000c8.png', '2020-10-16 18:02:12');
INSERT INTO `file_upload` VALUES (156, '7152E918-38B8-4f42-974B-1C148FD8935A.png', 'https://192.168.1.191:8082/zhizhong-system-cms/20201016/e8462d7c38ec4ecdb24211172eae3e7b.png', '2020-10-16 18:21:34');
INSERT INTO `file_upload` VALUES (157, '7152E918-38B8-4f42-974B-1C148FD8935A.png', 'https://192.168.1.191:8082/zhizhong-system-cms/20201016/24f4997320ae42589073a73533b2553f.png', '2020-10-16 18:22:29');
INSERT INTO `file_upload` VALUES (158, '7152E918-38B8-4f42-974B-1C148FD8935A.png', 'http://192.168.1.191:8082/zhizhong-system-cms/20201016/ddca7a2cbca345028f6268eaafc229cd.png', '2020-10-16 18:29:23');
INSERT INTO `file_upload` VALUES (159, '7152E918-38B8-4f42-974B-1C148FD8935A.png', 'http://192.168.1.191:8082/zhizhong-system-cms/20201016/5fc68142736f417eb13077c823e1858f.png', '2020-10-16 18:29:39');
INSERT INTO `file_upload` VALUES (160, '7152E918-38B8-4f42-974B-1C148FD8935A.png', 'http://192.168.1.191:8082/zhizhong-system-cms/20201016/16813ec4f9af4b4ea70476d2d4428aa2.png', '2020-10-16 18:29:46');
INSERT INTO `file_upload` VALUES (161, '7152E918-38B8-4f42-974B-1C148FD8935A.png', 'http://192.168.1.191:8082/zhizhong-system-cms/20201016/ed70e1594a194d109e10ed641af5e2b6.png', '2020-10-16 18:32:30');
INSERT INTO `file_upload` VALUES (162, '7152E918-38B8-4f42-974B-1C148FD8935A.png', 'http://192.168.1.191:8082/zhizhong-system-cms/20201016/3ce6dc586e1a4bb998a70c0a52758a10.png', '2020-10-16 18:38:41');
INSERT INTO `file_upload` VALUES (163, '1602844836(1).jpg', 'https://192.168.1.191:8082/zhizhong-system-cms/20201016/998f616a5edf42c284721b84af61064b.jpg', '2020-10-16 18:42:27');
INSERT INTO `file_upload` VALUES (164, '1602844836(1).jpg', 'https://192.168.1.191:8082/zhizhong-system-cms/20201016/3b0330bd0df24f02bb73527727cc3258.jpg', '2020-10-16 18:42:29');
INSERT INTO `file_upload` VALUES (165, '1602844836(1).jpg', 'http://192.168.1.191:8082/zhizhong-system-cms/20201016/1f9308bab9564feb8e03f05196a632bd.jpg', '2020-10-16 18:43:28');
INSERT INTO `file_upload` VALUES (166, '1602844836(1).jpg', 'http://192.168.1.191:8082/zhizhong-system-cms/20201016/bfa271a1e31c4260ad7cf3605077fe5c.jpg', '2020-10-16 18:45:03');
INSERT INTO `file_upload` VALUES (167, '1602844836(1).jpg', 'http://192.168.1.191:8082/zhizhong-system-cms/20201016/a594cb39e45544acad92b8929705fd7d.jpg', '2020-10-16 18:46:12');
INSERT INTO `file_upload` VALUES (168, '4d36c63d78124e48977bc0a41fe6a65d.jpg', 'http://192.168.1.191:8082/zhizhong-system-cms/20201019/1934393c3de94e83b87c16bbb552f244.jpg', '2020-10-19 14:15:56');
INSERT INTO `file_upload` VALUES (169, 'F53CB1D3-6436-460d-985D-3C34F9B6E347.png', 'http://192.168.1.191:8082/zhizhong-system-cms/20201019/090a628356314b70b2c8986cf60a41b4.png', '2020-10-19 14:16:43');
INSERT INTO `file_upload` VALUES (170, '微信截图_20201019143525.png', 'http://192.168.1.191:8082/zhizhong-system-cms/20201019/d5deb3c405f34e119308768f801ca30b.png', '2020-10-19 14:36:45');
INSERT INTO `file_upload` VALUES (171, '微信截图_20201019143525.png', 'http://192.168.1.191:8082/zhizhong-system-cms/20201019/f305c603f1b8494db35869053c4f9f0e.png', '2020-10-19 14:37:06');
INSERT INTO `file_upload` VALUES (172, '1d936d0c-98a8-4b5d-9f75-70faace960ca.png', 'http://192.168.1.191:8082/zhizhong-system-cms/20201019/3925b41f243b4524b73dd0181cca500e.png', '2020-10-19 17:42:03');
INSERT INTO `file_upload` VALUES (173, '1d936d0c-98a8-4b5d-9f75-70faace960ca.png', 'http://192.168.1.191:8082/zhizhong-system-cms/20201019/3d0edd54b0f94bd2905c7a4468bc1008.png', '2020-10-19 17:55:20');
INSERT INTO `file_upload` VALUES (174, 'QzpcVXNlcnNcRGVsbFxBcHBEYXRhXFJvYW1pbmdcRGluZ1RhbGtcNzQ3MTE2MTEzX3YyXEltYWdlRmlsZXNcMTYwMzEwMTc3OTg4OF9EODQxRkM5My1EN0I5LTQ1ZDYtODQyRi0yNkMwRkJERURGQ0EucG5n.png', 'http://192.168.1.191:8082/zhizhong-system-cms/20201019/2f21fdbcb6014faaac0de6d8d2205871.png', '2020-10-19 18:03:13');
INSERT INTO `file_upload` VALUES (175, 'QzpcVXNlcnNcRGVsbFxBcHBEYXRhXFJvYW1pbmdcRGluZ1RhbGtcNzQ3MTE2MTEzX3YyXEltYWdlRmlsZXNcMTYwMzEwMTg2NzAyN18wOEM3NUIyRi0yMkUyLTQ2ZDgtODgyNy0xQkY3NDRERDhERjQucG5n.png', 'http://192.168.1.191:8082/zhizhong-system-cms/20201019/852abe795863481ea46c73e2957f707e.png', '2020-10-19 18:04:49');
INSERT INTO `file_upload` VALUES (176, 'QzpcVXNlcnNcRGVsbFxBcHBEYXRhXFJvYW1pbmdcRGluZ1RhbGtcNzQ3MTE2MTEzX3YyXEltYWdlRmlsZXNcMTYwMzEwMTg2NzAyN18wOEM3NUIyRi0yMkUyLTQ2ZDgtODgyNy0xQkY3NDRERDhERjQucG5n.png', 'http://192.168.1.191:8082/zhizhong-system-cms/20201019/8f179fffd9e042e8a82ac4854e45bfaf.png', '2020-10-19 18:07:44');
INSERT INTO `file_upload` VALUES (177, 'ting.jpg', 'http://192.168.1.191:8082/zhizhong-system-cms/20201019/a2c4744207ed4e65a9b0161e2f7c488d.jpg', '2020-10-19 18:13:18');
INSERT INTO `file_upload` VALUES (178, 'ting.jpg', 'http://192.168.1.191:8082/zhizhong-system-cms/20201019/20b50f81b43249318b2b8e0fd9659896.jpg', '2020-10-19 18:13:47');
INSERT INTO `file_upload` VALUES (179, '1d936d0c-98a8-4b5d-9f75-70faace960ca.png', 'http://192.168.1.191:8082/zhizhong-system-cms/20201019/226832a8b7a8453ba35f16246f1391a3.png', '2020-10-19 18:14:27');
INSERT INTO `file_upload` VALUES (180, '1d936d0c-98a8-4b5d-9f75-70faace960ca.png', 'http://192.168.1.191:8082/zhizhong-system-cms/20201019/d4280cb88fd24785aad7d9f7098c1509.png', '2020-10-19 18:35:47');
INSERT INTO `file_upload` VALUES (181, '1d936d0c-98a8-4b5d-9f75-70faace960ca.png', 'http://192.168.1.191:8082/zhizhong-system-cms/20201019/7ce9578da2a543d8b9e412928b5f373d.png', '2020-10-19 18:39:15');
INSERT INTO `file_upload` VALUES (182, '1d936d0c-98a8-4b5d-9f75-70faace960ca.png', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/368ff985ae0c44b98c40be35ea461261.png', '2020-10-20 10:24:36');
INSERT INTO `file_upload` VALUES (183, '官网上传资料.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/e0c22a8e16714d8596ff387d9197f0dd.docx', '2020-10-20 10:24:58');
INSERT INTO `file_upload` VALUES (184, '官网上传资料.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/b6e1571599b34e72a974504ac7766f8f.docx', '2020-10-20 10:25:00');
INSERT INTO `file_upload` VALUES (185, '官网上传资料.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/58f2d3bb04194dd9a758c8c251f75ebd.docx', '2020-10-20 10:25:00');
INSERT INTO `file_upload` VALUES (186, '官网上传资料.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/1f6551d4ba2644c2b772ee484d33c06e.docx', '2020-10-20 10:25:00');
INSERT INTO `file_upload` VALUES (187, '官网上传资料.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/13ed24a7e6034633970de36960d9f120.docx', '2020-10-20 10:25:00');
INSERT INTO `file_upload` VALUES (188, '官网上传资料.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/6e481884d55b460da1b351a870abeba1.docx', '2020-10-20 10:25:01');
INSERT INTO `file_upload` VALUES (189, '官网上传资料.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/8bba337d3bea4147bc5df1dc93313062.docx', '2020-10-20 10:25:01');
INSERT INTO `file_upload` VALUES (190, '官网上传资料.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/8674cf087b584f099e502b75d022eba1.docx', '2020-10-20 10:25:02');
INSERT INTO `file_upload` VALUES (191, '官网上传资料.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/2aefd0698540433ea2d204dbdec46fe7.docx', '2020-10-20 10:25:03');
INSERT INTO `file_upload` VALUES (192, '官网上传资料.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/ef62ca786c5c43529fcc8e0070fe4c2c.docx', '2020-10-20 10:25:03');
INSERT INTO `file_upload` VALUES (193, '官网上传资料.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/0e775ff0b03146e6ae0d187ffb5d6d7d.docx', '2020-10-20 10:25:03');
INSERT INTO `file_upload` VALUES (194, '官网上传资料.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/20a5a896577d444983a1b6eef929e3f1.docx', '2020-10-20 10:25:03');
INSERT INTO `file_upload` VALUES (195, '1d936d0c-98a8-4b5d-9f75-70faace960ca.png', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/34e81558742f47aba4b9677a76ddc6c8.png', '2020-10-20 10:28:52');
INSERT INTO `file_upload` VALUES (196, '官网上传资料.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/dd9ba596918d4a8d936c6b6fd63b3a7a.docx', '2020-10-20 10:29:26');
INSERT INTO `file_upload` VALUES (197, '官网上传资料.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/3cb4a905a82f402b818a991c54f56df0.docx', '2020-10-20 10:29:27');
INSERT INTO `file_upload` VALUES (198, '官网上传资料.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/e5c9e796c90e4865931c6c2c3e7be7cf.docx', '2020-10-20 10:29:27');
INSERT INTO `file_upload` VALUES (199, '官网上传资料.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/02d411c795024c939f4730ddd16c8019.docx', '2020-10-20 10:29:31');
INSERT INTO `file_upload` VALUES (200, '官网上传资料.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/34d9755063854baaa1460ade0c15e7b2.docx', '2020-10-20 10:29:32');
INSERT INTO `file_upload` VALUES (201, '官网上传资料.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/6eb1b8398e6747dfb255a5225b707313.docx', '2020-10-20 10:29:32');
INSERT INTO `file_upload` VALUES (202, '官网上传资料.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/6cdb44d1e3834edb8689f2673717e8f4.docx', '2020-10-20 10:29:49');
INSERT INTO `file_upload` VALUES (203, '官网上传资料.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/dccbf72948574cbd9fc1dfe6a2e88358.docx', '2020-10-20 10:29:50');
INSERT INTO `file_upload` VALUES (204, '官网上传资料.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/fabeaeba30054acfbf9f69d0f589b591.docx', '2020-10-20 10:29:50');
INSERT INTO `file_upload` VALUES (205, '官网上传资料.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/8d86f054989a43acb828b485d1a812f7.docx', '2020-10-20 10:30:14');
INSERT INTO `file_upload` VALUES (206, '官网上传资料.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/c51b9ecd20f4408288aecf59f9404b1a.docx', '2020-10-20 10:30:15');
INSERT INTO `file_upload` VALUES (207, '官网上传资料.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/9379c33bdeec410398aec1561b3bea9c.docx', '2020-10-20 10:30:15');
INSERT INTO `file_upload` VALUES (208, '官网上传资料.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/caa09ec3fa434e5297ddbee286eeb61f.docx', '2020-10-20 10:30:15');
INSERT INTO `file_upload` VALUES (209, '官网上传资料.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/dc87a2a91af9479b86aa00390e5e2b0a.docx', '2020-10-20 10:30:31');
INSERT INTO `file_upload` VALUES (210, '官网上传资料.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/3f31039da60141079a3ee0b08476c303.docx', '2020-10-20 10:30:32');
INSERT INTO `file_upload` VALUES (211, '官网上传资料.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/424cfa839fee4f73baeb624db8105ce3.docx', '2020-10-20 10:30:32');
INSERT INTO `file_upload` VALUES (212, 'ting.jpg', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/a455e8b38c7248739f4459ad4c57ea6e.jpg', '2020-10-20 11:09:44');
INSERT INTO `file_upload` VALUES (213, 'login_icon.fa76e72.png', 'https://192.168.1.191:8082/zhizhong-system-cms/20201020/0c11c00888324704a4464785a3437ac7.png', '2020-10-20 11:33:54');
INSERT INTO `file_upload` VALUES (214, '中卫六需求方案.docx', 'https://192.168.1.191:8082/zhizhong-system-cms/20201020/8ff3962595374ed1bb64fbd5cafd2464.docx', '2020-10-20 11:47:03');
INSERT INTO `file_upload` VALUES (215, '中卫六需求方案.docx', 'https://192.168.1.191:8082/zhizhong-system-cms/20201020/1351614bbbc646ce813c7b7fdb47d2fa.docx', '2020-10-20 11:47:10');
INSERT INTO `file_upload` VALUES (216, '中卫六需求方案.docx', 'https://192.168.1.191:8082/zhizhong-system-cms/20201020/580581e08e724dc8bfbc198f0dc23f8b.docx', '2020-10-20 11:50:38');
INSERT INTO `file_upload` VALUES (217, '中卫六需求方案.docx', 'https://192.168.1.191:8082/zhizhong-system-cms/20201020/a3c1e1bad9b242e7933f685ddd342318.docx', '2020-10-20 11:52:24');
INSERT INTO `file_upload` VALUES (218, '中卫六需求方案.docx', 'https://192.168.1.191:8082/zhizhong-system-cms/20201020/b90030a5f5674880839cf2fca1f3fc02.docx', '2020-10-20 11:53:10');
INSERT INTO `file_upload` VALUES (219, '中卫六需求方案.docx', 'https://192.168.1.191:8082/zhizhong-system-cms/20201020/a19dc3b9d2ca4205a4a952ed036f76c5.docx', '2020-10-20 13:19:46');
INSERT INTO `file_upload` VALUES (220, '中卫六需求方案.docx', 'https://192.168.1.191:8082/zhizhong-system-cms/20201020/431c89ff83704eef90baab398f3f67e8.docx', '2020-10-20 13:29:27');
INSERT INTO `file_upload` VALUES (221, '中卫六需求方案.docx', 'https://192.168.1.191:8082/zhizhong-system-cms/20201020/02fe7b20ae2c43928ac18d5ee7486928.docx', '2020-10-20 14:59:43');
INSERT INTO `file_upload` VALUES (222, '中卫六需求方案.docx', 'https://192.168.1.191:8082/zhizhong-system-cms/20201020/f06fcc3cefa54be1a6b0b58398b0117f.docx', '2020-10-20 15:05:44');
INSERT INTO `file_upload` VALUES (223, '中卫六需求方案.docx', 'https://192.168.1.191:8082/zhizhong-system-cms/20201020/fd835aa8936b4f24ba53298e8c0e2b74.docx', '2020-10-20 15:07:51');
INSERT INTO `file_upload` VALUES (224, '中卫六需求方案.docx', 'https://192.168.1.191:8082/zhizhong-system-cms/20201020/366bb162b5b5483da68c2acdb2403180.docx', '2020-10-20 15:07:54');
INSERT INTO `file_upload` VALUES (225, '中卫六需求方案.docx', 'https://192.168.1.191:8082/zhizhong-system-cms/20201020/5801d27818fc445c84b024e16c5db6e1.docx', '2020-10-20 15:08:28');
INSERT INTO `file_upload` VALUES (226, '中卫六需求方案.docx', 'https://192.168.1.191:8082/zhizhong-system-cms/20201020/75a842d5175043d99d7d51011f31e710.docx', '2020-10-20 15:09:09');
INSERT INTO `file_upload` VALUES (227, '6620f124-64df-44ed-9f7b-f09e103eccff.png', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/8876141410414b9f93b71a5ccec0a5bf.png', '2020-10-20 15:35:14');
INSERT INTO `file_upload` VALUES (228, '7a7267cf-8073-4bb4-8c0a-6b6baab4e12a.png', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/67da2019b87943cc81a83f90d39de878.png', '2020-10-20 15:39:57');
INSERT INTO `file_upload` VALUES (229, '中卫六需求方案.docx', 'https://192.168.1.191:8082/zhizhong-system-cms/20201020/ed26cc8177da4e398d72476dde5e31ad.docx', '2020-10-20 16:29:50');
INSERT INTO `file_upload` VALUES (230, '中卫六需求方案.docx', 'https://192.168.1.191:8082/zhizhong-system-cms/20201020/7fa6aeff3a92434dbe5fb4ae11bc2146.docx', '2020-10-20 16:33:28');
INSERT INTO `file_upload` VALUES (231, '中卫六需求方案.docx', 'https://192.168.1.191:8082/zhizhong-system-cms/20201020/ca9d9b9ff74b4b26ab55ce35f63ca400.docx', '2020-10-20 16:33:39');
INSERT INTO `file_upload` VALUES (232, 'ting.jpg', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/768aaf084def455492744fbf0472e0b0.jpg', '2020-10-20 17:16:56');
INSERT INTO `file_upload` VALUES (233, '中卫六需求方案.docx', 'https://192.168.1.191:8082/zhizhong-system-cms/20201020/cb1a1b96d60f48b09bb5e0cfa6a99685.docx', '2020-10-20 17:33:53');
INSERT INTO `file_upload` VALUES (234, '中卫六需求方案.docx', 'https://192.168.1.191:8082/zhizhong-system-cms/20201020/2b791687142441a6bb4461c53212014c.docx', '2020-10-20 17:35:37');
INSERT INTO `file_upload` VALUES (235, '1603186978(1).jpg', 'https://192.168.1.191:8082/zhizhong-system-cms/20201020/9625207d086449bface5952e848b3244.jpg', '2020-10-20 17:43:11');
INSERT INTO `file_upload` VALUES (236, '1603186978(1).jpg', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/131b9ece626845ac84eb7e44c0ec2f23.jpg', '2020-10-20 17:43:41');
INSERT INTO `file_upload` VALUES (237, '中卫六需求方案.docx', 'https://192.168.1.191:8082/zhizhong-system-cms/20201020/cd06ce5304c34122893f98c2f75e41c7.docx', '2020-10-20 17:45:13');
INSERT INTO `file_upload` VALUES (238, '中卫六需求方案.docx', 'https://192.168.1.191:8082/zhizhong-system-cms/20201020/b923a09bfd4943a59204aa6a4f2523f3.docx', '2020-10-20 17:45:22');
INSERT INTO `file_upload` VALUES (239, '中卫六需求方案.docx', 'https://192.168.1.191:8082/zhizhong-system-cms/20201020/39eae3535a694782973a49ecce8e193f.docx', '2020-10-20 17:45:46');
INSERT INTO `file_upload` VALUES (240, '中卫六需求方案.docx', 'https://192.168.1.191:8082/zhizhong-system-cms/20201020/f715ebcd6b144f15a75b9b2d70ab0d92.docx', '2020-10-20 17:45:49');
INSERT INTO `file_upload` VALUES (241, '1603190362(1).jpg', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/20332e247ec24bd88d9a8b179ced1916.jpg', '2020-10-20 18:41:04');
INSERT INTO `file_upload` VALUES (242, '1603190598(1).jpg', 'https://192.168.1.191:8082/zhizhong-system-cms/20201020/3500f1d82a144840b11edb44c08d4aa6.jpg', '2020-10-20 18:43:32');
INSERT INTO `file_upload` VALUES (243, '1603190598(1).jpg', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/0c21e3f8659c43a5884f7b8aad967a85.jpg', '2020-10-20 18:44:00');
INSERT INTO `file_upload` VALUES (244, '1603190983(1).jpg', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/1d1749b35a694f36bab559f261efd4cc.jpg', '2020-10-20 18:50:05');
INSERT INTO `file_upload` VALUES (245, '1603192788(1).jpg', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/b29b4d87f8314f1993dc2c25d4f0dbca.jpg', '2020-10-20 19:20:02');
INSERT INTO `file_upload` VALUES (246, 'ting.jpg', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/b905326fef884de2b3c4c472f18a314c.jpg', '2020-10-20 19:29:51');
INSERT INTO `file_upload` VALUES (247, 'ting.jpg', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/22cef11934bd43249658f4953ad24397.jpg', '2020-10-20 19:31:36');
INSERT INTO `file_upload` VALUES (248, '新建 Microsoft Word 文档.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/4357e498337d4311b1afcd7cf59046b9.docx', '2020-10-20 19:31:51');
INSERT INTO `file_upload` VALUES (249, '新建 Microsoft Word 文档.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/a2766ad72a804097bb357988e8e87030.docx', '2020-10-20 19:31:57');
INSERT INTO `file_upload` VALUES (250, 'ting.jpg', 'http://192.168.1.191:8082/zhizhong-system-cms/20201020/6bd938a6a50b43c3b60b5b073891e6d1.jpg', '2020-10-20 19:33:46');
INSERT INTO `file_upload` VALUES (251, 'ting.jpg', 'http://192.168.1.191:8082/zhizhong-system-cms/20201021/a48311218cdf4808aeab4b80f7847fbb.jpg', '2020-10-21 10:19:23');
INSERT INTO `file_upload` VALUES (252, 'ting.jpg', 'https://192.168.1.191:8082/zhizhong-system-cms/20201021/e4c3b6a245204c77b719f5af651201cd.jpg', '2020-10-21 11:00:10');
INSERT INTO `file_upload` VALUES (253, 'ting.jpg', 'https://192.168.1.191:8082/zhizhong-system-cms/20201021/8c42443448c04ce2bd7123ddbcd27055.jpg', '2020-10-21 11:01:22');
INSERT INTO `file_upload` VALUES (254, '新建 Microsoft Word 文档.docx', 'https://192.168.1.191:8082/zhizhong-system-cms/20201021/2b2933e93b4e425ba534922741774947.docx', '2020-10-21 11:03:30');
INSERT INTO `file_upload` VALUES (255, '新建 Microsoft Word 文档.docx', 'https://192.168.1.191:8082/zhizhong-system-cms/20201021/1f5f7671196e44db9091c4847ad30f5c.docx', '2020-10-21 11:04:10');
INSERT INTO `file_upload` VALUES (256, 'ting.jpg', 'https://192.168.1.191:8082/zhizhong-system-cms/20201021/46b37b05902c43989ebf01b73e242c00.jpg', '2020-10-21 11:19:13');
INSERT INTO `file_upload` VALUES (257, '4d36c63d78124e48977bc0a41fe6a65d.jpg', 'https://192.168.1.191:8082/zhizhong-system-cms/20201021/2fef22920adb47cbb5eae2837aa7ada3.jpg', '2020-10-21 11:31:27');
INSERT INTO `file_upload` VALUES (258, '中卫六需求方案.docx', 'https://192.168.1.191:8082/zhizhong-system-cms/20201021/772a200e536c4725a44e6125f82d4b39.docx', '2020-10-21 11:35:14');
INSERT INTO `file_upload` VALUES (259, '中卫六需求方案.docx', 'https://192.168.1.191:8082/zhizhong-system-cms/20201021/5ee5eb869814460daf014329b2ff934b.docx', '2020-10-21 11:35:37');
INSERT INTO `file_upload` VALUES (260, '中卫六需求方案.docx', 'https://192.168.1.191:8082/zhizhong-system-cms/20201021/1224415b998646abb150aaf981cfcb5f.docx', '2020-10-21 11:35:56');
INSERT INTO `file_upload` VALUES (261, '中卫六需求方案.docx', 'https://192.168.1.191:8082/zhizhong-system-cms/20201021/40f9f5b4a418437cac54be3f6d82b710.docx', '2020-10-21 11:36:09');
INSERT INTO `file_upload` VALUES (262, '中卫六需求方案.docx', 'https://192.168.1.191:8082/zhizhong-system-cms/20201021/6e4d619cf07b4100ba42c84f289bb30f.docx', '2020-10-21 11:37:25');
INSERT INTO `file_upload` VALUES (263, '中卫六需求方案.docx', 'https://192.168.1.191:8082/zhizhong-system-cms/20201021/96e20392527e46bf8a8260bb8bbe5412.docx', '2020-10-21 11:41:15');
INSERT INTO `file_upload` VALUES (264, '中卫六需求方案.docx', 'https://192.168.1.27:8088/zhizhong-system-cms/20201021/90c277a5a0f947d19c5f7ca898d62fe9.docx', '2020-10-21 13:42:25');
INSERT INTO `file_upload` VALUES (265, '中卫六需求方案.docx', 'https://192.168.1.27:8088/zhizhong-system-cms/20201021/eda3313724eb4767ab6a7c275c413b3f.docx', '2020-10-21 13:43:01');
INSERT INTO `file_upload` VALUES (266, '中卫六需求方案.docx', 'https://192.168.1.27:8088/zhizhong-system-cms/20201021/e97f46e29e6c4e278d1ee3044599ac53.docx', '2020-10-21 13:43:18');
INSERT INTO `file_upload` VALUES (267, '中卫六需求方案.docx', 'http://192.168.1.27:8088/zhizhong-system-cms/20201021/b90c5bbb943c4c998326c63df081783a.docx', '2020-10-21 13:49:31');
INSERT INTO `file_upload` VALUES (268, 'ting.jpg', 'http://192.168.1.27:8088/zhizhong-system-cms/20201021/7005efc2195343ccaf311f844a985694.jpg', '2020-10-21 13:55:08');
INSERT INTO `file_upload` VALUES (269, '新建 Microsoft Word 文档.docx', 'http://192.168.1.27:8088/zhizhong-system-cms/20201021/dcec46d7b7a1489082c225d3f4c00af3.docx', '2020-10-21 13:56:04');
INSERT INTO `file_upload` VALUES (270, '新建 Microsoft Word 文档.docx', 'http://192.168.1.27:8088/zhizhong-system-cms/20201021/a456fddcae3f472393ad6646f908c1b5.docx', '2020-10-21 13:56:14');
INSERT INTO `file_upload` VALUES (271, '微信截图_20201021164506.png', 'http://192.168.1.191:8082/zhizhong-system-cms/20201021/5125c19bcf8c42848aa1f34dc408bc98.png', '2020-10-21 16:45:20');
INSERT INTO `file_upload` VALUES (272, '营业执照.jpg', 'http://192.168.1.191:8082/zhizhong-system-cms/20201023/1c2edb11acc4442eaf8a9305ca9c02ba.jpg', '2020-10-23 14:02:10');
INSERT INTO `file_upload` VALUES (273, '“尤科斯案”公益座谈会第四期预告4.5.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201023/c4b61003f6f144eab74054163db79851.docx', '2020-10-23 14:10:56');
INSERT INTO `file_upload` VALUES (274, '“尤科斯案”公益座谈会第四期预告4.5.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201023/686206dc14974c20958561bdc63efed0.docx', '2020-10-23 14:11:19');
INSERT INTO `file_upload` VALUES (275, '111.jpg', 'http://192.168.1.191:8082/zhizhong-system-cms/20201023/21d69568aa694eca8e46e8901c6fd592.jpg', '2020-10-23 14:17:15');
INSERT INTO `file_upload` VALUES (276, '处长签名.jpg', 'http://192.168.1.191:8082/zhizhong-system-cms/20201023/a823433c9e1b40f0814a7dea24d67ac4.jpg', '2020-10-23 14:22:47');
INSERT INTO `file_upload` VALUES (277, '撤回申请书-青岛.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201023/b296833dc28a4ee2ac4d0af5ccea8120.docx', '2020-10-23 14:23:13');
INSERT INTO `file_upload` VALUES (278, '撤回申请书-青岛.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201023/e3e9106f5733424f980be056f10b9c8c.docx', '2020-10-23 14:23:16');
INSERT INTO `file_upload` VALUES (279, '撤回申请书-青岛.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201023/099572cc6cc04d0a8987753d41cd2cc1.docx', '2020-10-23 14:23:24');
INSERT INTO `file_upload` VALUES (280, '个人签名.jpg', 'http://192.168.1.191:8082/zhizhong-system-cms/20201023/65ddce02f665418789c042d8f49b1f8c.jpg', '2020-10-23 14:23:54');
INSERT INTO `file_upload` VALUES (281, '分管主任签名.jpg', 'http://192.168.1.191:8082/zhizhong-system-cms/20201023/c6b0abf1b7474d47933d0845b4842ae6.jpg', '2020-10-23 14:28:56');
INSERT INTO `file_upload` VALUES (282, '处长签名.jpg', 'http://192.168.1.191:8082/zhizhong-system-cms/20201023/f8545700afb145c3a4a149705d7eabf1.jpg', '2020-10-23 14:36:31');
INSERT INTO `file_upload` VALUES (283, '缴费凭证.jpg', 'http://192.168.1.191:8082/zhizhong-system-cms/20201023/421143d95cb040e0bc042847021dd48c.jpg', '2020-10-23 14:37:00');
INSERT INTO `file_upload` VALUES (284, 'QzpcVXNlcnNcRGVsbFxBcHBEYXRhXFJvYW1pbmdcRGluZ1RhbGtcNzQ3MTE2MTEzX3YyXEltYWdlRmlsZXNcMTYwMzEwMTg2NzAyN18wOEM3NUIyRi0yMkUyLTQ2ZDgtODgyNy0xQkY3NDRERDhERjQucG5n.png', 'http://192.168.1.191:8082/zhizhong-system-cms/20201023/4e2e47a638f9406b9024b330eb11562e.png', '2020-10-23 14:39:13');
INSERT INTO `file_upload` VALUES (285, '官网上传资料.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201023/cd5dc1a5a4f6445ba69322d2df826112.docx', '2020-10-23 14:43:36');
INSERT INTO `file_upload` VALUES (286, '官网上传资料.docx', 'http://192.168.1.191:8082/zhizhong-system-cms/20201023/2595f0bef7dd48d58180de7233807da0.docx', '2020-10-23 14:45:26');
INSERT INTO `file_upload` VALUES (287, '个人签名.jpg', 'http://192.168.1.191:8082/zhizhong-system-cms/20201023/8025e793f90042b9b80a95bb70cee638.jpg', '2020-10-23 15:00:24');
INSERT INTO `file_upload` VALUES (288, 'ting.jpg', 'http://192.168.1.191:8082/zhizhong-system-cms/20201023/073b352ae0e44bd5925d5e6f2c3dfbe5.jpg', '2020-10-23 16:02:08');
INSERT INTO `file_upload` VALUES (289, 'ting.jpg', 'http://192.168.1.27:8088/zhizhong-system-cms/20201026/0f40acfebdc3414e9b5ba6567773e2ec.jpg', '2020-10-26 16:19:33');
INSERT INTO `file_upload` VALUES (290, 'ting.jpg', 'http://192.168.1.27:8088/zhizhong-system-cms/20201026/a4efd1a191e643719412f5d073caa878.jpg', '2020-10-26 16:20:45');
INSERT INTO `file_upload` VALUES (291, 'ting.jpg', 'http://192.168.1.27:8088/zhizhong-system-cms/20201026/8d15449ae84147969f9ac03e08038db1.jpg', '2020-10-26 16:25:28');
INSERT INTO `file_upload` VALUES (292, 'ting.jpg', 'http://192.168.1.27:8088/zhizhong-system-cms/20201026/d5b2f360a7d84684a2aa8c2aaf1bb4f1.jpg', '2020-10-26 16:26:03');
INSERT INTO `file_upload` VALUES (293, 'ting.jpg', 'http://192.168.1.27:8088/zhizhong-system-cms/20201026/b96d4f33a99e4aa6896f2a71adc56d1c.jpg', '2020-10-26 16:26:52');
INSERT INTO `file_upload` VALUES (294, 'ting.jpg', 'http://192.168.1.27:8088/zhizhong-system-cms/20201026/da49585feea14f46a42545e60ceb8954.jpg', '2020-10-26 16:27:25');
INSERT INTO `file_upload` VALUES (295, 'ting.jpg', 'http://192.168.1.27:8088/zhizhong-system-cms/20201026/f59bc3e34d0548e4aebadc6f30f06ca9.jpg', '2020-10-26 16:27:59');
INSERT INTO `file_upload` VALUES (296, 'ting.jpg', 'http://192.168.1.27:8088/zhizhong-system-cms/20201026/729e45a16f87406aa1a5759199d19561.jpg', '2020-10-26 16:28:31');
INSERT INTO `file_upload` VALUES (297, 'ting.jpg', 'http://192.168.1.27:8088/zhizhong-system-cms/20201026/ae0208585edc42b18c1f3406aa872674.jpg', '2020-10-26 16:31:26');
INSERT INTO `file_upload` VALUES (298, 'ting.jpg', 'http://192.168.1.27:8088/zhizhong-system-cms/20201026/d383b92ea3ce455e9100d1b743716ffc.jpg', '2020-10-26 16:33:02');
INSERT INTO `file_upload` VALUES (299, 'ting.jpg', 'http://192.168.1.27:8088/zhizhong-system-cms/20201026/eea2234cca4f430684a71c76b647f2be.jpg', '2020-10-26 16:34:15');
INSERT INTO `file_upload` VALUES (300, 'ting.jpg', 'http://192.168.1.27:8088/zhizhong-system-cms/20201026/218b0f847edd42be9c267ac0e47ab049.jpg', '2020-10-26 16:35:23');
INSERT INTO `file_upload` VALUES (301, 'ting.jpg', 'http://192.168.1.27:8088/zhizhong-system-cms/20201026/7c22ee7d8e9f422f9886cc901ecd58fc.jpg', '2020-10-26 16:35:31');
INSERT INTO `file_upload` VALUES (302, 'ting.jpg', 'http://192.168.1.27:8088/zhizhong-system-cms/20201026/0625b771daf14f2fa318f217335252b3.jpg', '2020-10-26 16:36:24');
INSERT INTO `file_upload` VALUES (303, 'ting.jpg', 'http://192.168.1.27:8088/zhizhong-system-cms/20201026/cdef006f314d4faf8cd62353c9209c34.jpg', '2020-10-26 16:36:45');
INSERT INTO `file_upload` VALUES (304, 'ting.jpg', 'http://192.168.1.27:8088/zhizhong-system-cms/20201026/bf32ec39f4f440ea92a55a55691c56a5.jpg', '2020-10-26 16:37:00');
INSERT INTO `file_upload` VALUES (305, 'ting.jpg', 'http://192.168.1.27:8088/zhizhong-system-cms/20201026/c9d964497a67469aafd2ae73359da59f.jpg', '2020-10-26 16:37:08');
INSERT INTO `file_upload` VALUES (306, 'ting.jpg', 'http://192.168.1.27:8088/zhizhong-system-cms/20201026/89afb40963094c97864ea48583ee6850.jpg', '2020-10-26 16:38:25');
INSERT INTO `file_upload` VALUES (307, 'ting.jpg', 'http://192.168.1.27:8088/zhizhong-system-cms/20201026/562b13c0aedd45a18f4f46bed26442e9.jpg', '2020-10-26 16:39:23');
INSERT INTO `file_upload` VALUES (308, 'ting.jpg', 'http://192.168.1.27:8088/zhizhong-system-cms/20201026/1bd94962443b480faa1c9ba5678b7201.jpg', '2020-10-26 16:39:33');
INSERT INTO `file_upload` VALUES (309, 'ting.jpg', 'http://192.168.1.27:8088/zhizhong-system-cms/20201026/cd04f2a5b7a649e5a53340cc1aa3361d.jpg', '2020-10-26 18:41:28');
INSERT INTO `file_upload` VALUES (310, 'ting.jpg', 'http://192.168.1.27:8088/zhizhong-system-cms/20201026/a11d7b2c73bf4ca1810eed98bdf3603a.jpg', '2020-10-26 18:44:15');
INSERT INTO `file_upload` VALUES (311, 'ting.jpg', 'http://192.168.1.27:8088/zhizhong-system-cms/20201026/8c525b9840614120965b6dbfd002a670.jpg', '2020-10-26 18:45:01');
INSERT INTO `file_upload` VALUES (312, 'ting.jpg', 'http://192.168.1.27:8088/zhizhong-system-cms/20201026/617991a2178b46ccb6179e2d56df3f47.jpg', '2020-10-26 18:48:05');
INSERT INTO `file_upload` VALUES (313, 'carsoul1.png', 'http://192.168.1.191:8082/zhizhong-system-cms/20201028/0fb058f8544c460ea91a1288b74ca8f3.png', '2020-10-28 10:27:55');
INSERT INTO `file_upload` VALUES (314, 'carsoul2.png', 'http://192.168.1.191:8082/zhizhong-system-cms/20201028/030b76e17ab240e796e0d2d07d78e19f.png', '2020-10-28 10:28:12');
INSERT INTO `file_upload` VALUES (315, 'carsoul3.png', 'http://192.168.1.191:8082/zhizhong-system-cms/20201028/9e6262287b214d62932e394e845c26d3.png', '2020-10-28 10:28:24');
INSERT INTO `file_upload` VALUES (316, 'carsoul1.png', 'http://192.168.1.27:8088/zhizhong-system-cms/20201028/83dd017fe5b8449cb000f7ef70332e66.png', '2020-10-28 13:37:15');
INSERT INTO `file_upload` VALUES (317, 'carsoul2.png', 'http://192.168.1.27:8088/zhizhong-system-cms/20201028/b1eff679da63440caa7ab179f817c327.png', '2020-10-28 13:38:36');
INSERT INTO `file_upload` VALUES (318, 'ting.jpg', 'http://192.168.1.27:8088/zhizhong-system-cms/20201028/a48a6e9d5a174b809f3564b0df0be18b.jpg', '2020-10-28 14:40:15');
INSERT INTO `file_upload` VALUES (319, 'ting.jpg', 'http://192.168.1.27:8088/zhizhong-system-cms/20201028/e105f512cace457493da482805ae2f62.jpg', '2020-10-28 14:40:27');
INSERT INTO `file_upload` VALUES (320, 'ting.jpg', 'http://192.168.1.27:8088/zhizhong-system-cms/20201028/d6c66cdffe7c49209ec870a82c7c7428.jpg', '2020-10-28 14:40:43');
INSERT INTO `file_upload` VALUES (321, 'ting.jpg', 'http://192.168.1.27:8088/zhizhong-system-cms/20201029/569bd125365248e4b843517528af74f5.jpg', '2020-10-29 16:41:40');
INSERT INTO `file_upload` VALUES (322, '1.jpg', 'http://192.168.1.191:8082/zhizhong-system-cms/20201030/747f2b85a695490fb4426ff11b896ef7.jpg', '2020-10-30 16:14:50');
INSERT INTO `file_upload` VALUES (323, 'u=714959140,249834321&fm=173&app=25&f=JPEG.jpg', 'http://192.168.1.191:8082/zhizhong-system-cms/20201030/433657f5e46648d79588329428238c82.jpg', '2020-10-30 18:17:10');
INSERT INTO `file_upload` VALUES (324, 'ting.jpg', 'http://192.168.1.191:8082/zhizhong-system-cms/20201103/844d9d68a8b24c1296d289a1202febcd.jpg', '2020-11-03 14:17:38');
INSERT INTO `file_upload` VALUES (325, '身份负.jpg', 'http://192.168.1.191:8082/zhizhong-system-cms/20201106/b2967c983e2648458b830899c337bea7.jpg', '2020-11-06 15:08:20');
INSERT INTO `file_upload` VALUES (326, '6213D760-3C9B-4ea7-8E51-A74D922C61CF.png', 'http://192.168.1.191:8082/zhizhong-system-cms/20201106/bd38d4cac5694eba863f10303d9a3791.png', '2020-11-06 15:08:55');

-- ----------------------------
-- Table structure for function
-- ----------------------------
DROP TABLE IF EXISTS `function`;
CREATE TABLE `function`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源名称',
  `resource_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求url',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `resource_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源id (按钮时使用）',
  `resource_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源图标',
  `state` int(4) NULL DEFAULT NULL COMMENT '状态 1-启用 2-停用',
  `type` int(4) NULL DEFAULT NULL COMMENT '资源类型 1-菜单 2-按钮',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级资源id',
  `level` int(4) NULL DEFAULT NULL COMMENT '层级',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `sort` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of function
-- ----------------------------
INSERT INTO `function` VALUES (1, '用户管理', 'user_page', '用户管理', 'USER_AUTH', NULL, 1, 1, 1, 1, '2019-03-12 13:19:45', '1');
INSERT INTO `function` VALUES (2, '知仲活动管理', 'activity_page', '知仲活动管理', 'ACTIVITY_AUTH', NULL, 1, 1, 1, 1, '2019-03-12 13:22:01', '2');
INSERT INTO `function` VALUES (3, '新闻动态管理', 'news_page', '新闻动态管理', 'NEWS_AUTH', NULL, 1, 1, 1, 1, '2019-03-12 13:23:19', '3');
INSERT INTO `function` VALUES (4, 'banner管理', 'banner_page', 'banner管理', 'BANNER_AUTH', NULL, 1, 1, 1, 1, '2019-03-12 13:23:44', '4');
INSERT INTO `function` VALUES (5, '招聘管理', 'recruitment_page', '招聘管理', 'RECRUIT_AUTH', NULL, 1, 1, 1, 1, '2019-03-12 13:24:08', '5');

-- ----------------------------
-- Table structure for leaving
-- ----------------------------
DROP TABLE IF EXISTS `leaving`;
CREATE TABLE `leaving`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '留言' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of leaving
-- ----------------------------
INSERT INTO `leaving` VALUES (1, '张三', '17600821340', '问题1', '2020-09-16 17:38:49');
INSERT INTO `leaving` VALUES (2, '张三', '18686968917', '是大的萨达', '2020-09-23 10:36:02');
INSERT INTO `leaving` VALUES (3, '张三', '18686968917', '是大的萨达', '2020-09-23 10:36:05');
INSERT INTO `leaving` VALUES (4, '张三', '18686968917', '是大的萨达', '2020-09-23 10:45:26');
INSERT INTO `leaving` VALUES (5, '1张三', '13389941910', '是大的萨', '2020-09-23 10:45:56');
INSERT INTO `leaving` VALUES (6, '曾祥', '18686968917', 'Asdasd阿萨德', '2020-09-23 11:15:25');
INSERT INTO `leaving` VALUES (7, '下水道', '18686968917', 'Asdasd', '2020-09-23 11:18:27');
INSERT INTO `leaving` VALUES (8, '曾祥', '18686968917', '1啊实打实', '2020-09-23 11:20:42');
INSERT INTO `leaving` VALUES (9, '张壮壮', '18210161579', '打啊打撒', '2020-09-27 11:57:46');
INSERT INTO `leaving` VALUES (10, 'joker', '18686968917', '1111', '2020-10-19 13:58:16');
INSERT INTO `leaving` VALUES (11, 'joker', '18686968917', 'qewqw', '2020-10-19 14:05:35');
INSERT INTO `leaving` VALUES (12, 'joker', '18686968917', 'qewqw', '2020-10-19 14:05:39');
INSERT INTO `leaving` VALUES (13, 'joker', '18686968917', 'qewqw', '2020-10-19 14:05:40');
INSERT INTO `leaving` VALUES (14, 'joker', '18686968917', 'qewqw', '2020-10-19 14:05:40');
INSERT INTO `leaving` VALUES (15, 'joker', '18686968917', 'qewqw', '2020-10-19 14:05:40');
INSERT INTO `leaving` VALUES (16, 'joker', '18686968917', 'qewqw', '2020-10-19 14:05:41');
INSERT INTO `leaving` VALUES (17, 'zx', '18686968917', 'asdas ', '2020-10-19 14:40:11');
INSERT INTO `leaving` VALUES (18, '王咪雪', '14512642560', '虽然事情已经过去五个月，但四川宜宾市民罗女士每每想起儿子被殴打的惨状时仍心有余悸。连日来，红星新闻记者调查采访过程中接触到的涉事学校负责人、处理纠纷的派出所民警，都对这一发生在校内的家长施暴事件感到震惊和不可理解。', '2020-10-22 14:31:51');
INSERT INTO `leaving` VALUES (19, '123', '18612853780', '111', '2020-10-22 17:37:57');
INSERT INTO `leaving` VALUES (20, '曹清嗯', '13141314971', '测试', '2020-10-27 17:00:12');
INSERT INTO `leaving` VALUES (21, '曹清', '13141314971', '测试咨询', '2020-10-27 17:00:33');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色编码',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型 1-超管 2-管理员 3-员工',
  `state` int(4) NULL DEFAULT NULL COMMENT '状态 1-启用 2-停用',
  `create_user` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', 'SUPERMANAGER', '超级管理员', '1', 1, 0, '2019-03-13 17:15:34');
INSERT INTO `role` VALUES (3, '一般员工', 'EMPLOEE', '一般员工', '3', 1, 0, '2019-03-13 17:16:40');

-- ----------------------------
-- Table structure for user_function
-- ----------------------------
DROP TABLE IF EXISTS `user_function`;
CREATE TABLE `user_function`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户编号',
  `function_id` int(11) NULL DEFAULT NULL COMMENT '功能编号',
  `state` int(11) NULL DEFAULT NULL COMMENT '状态 0:启用 1:停用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 801 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色功能关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_function
-- ----------------------------
INSERT INTO `user_function` VALUES (796, 1, 1, 0, '2020-09-07 14:39:14');
INSERT INTO `user_function` VALUES (797, 1, 2, 0, '2020-09-07 14:39:14');
INSERT INTO `user_function` VALUES (798, 1, 3, 0, '2020-09-07 14:39:14');
INSERT INTO `user_function` VALUES (799, 1, 4, 0, '2020-09-07 14:39:14');
INSERT INTO `user_function` VALUES (800, 1, 5, 0, '2020-09-07 14:39:14');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `create_user` int(11) NULL DEFAULT NULL COMMENT '创建人id',
  `ismaster` int(4) NULL DEFAULT NULL COMMENT '是否管理员 1-是 2-否',
  `state` int(4) NULL DEFAULT NULL COMMENT '状态 1-启用 2-冻结',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色id',
  `company_id` int(11) NULL DEFAULT NULL COMMENT '公司id 关联ma_organization表',
  `dept_id` int(11) NULL DEFAULT NULL COMMENT '部门id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', 'b9d11b3be25f5a1a7dc8ca04cd310b28', '超级管理员', '15811022365', 0, 1, 1, 1, 0, 0, '2019-03-13 17:57:22');

SET FOREIGN_KEY_CHECKS = 1;
