/*
Navicat MySQL Data Transfer

Source Server         : XRJ
Source Server Version : 80013
Source Host           : localhost:3306
Source Database       : crm_2022

Target Server Type    : MYSQL
Target Server Version : 80013
File Encoding         : 65001

Date: 2023-02-12 15:04:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tbl_activity
-- ----------------------------
DROP TABLE IF EXISTS `tbl_activity`;
CREATE TABLE `tbl_activity` (
  `id` char(32) NOT NULL,
  `owner` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `start_date` char(10) DEFAULT NULL,
  `end_date` char(10) DEFAULT NULL,
  `cost` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `create_time` char(19) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `edit_time` char(19) DEFAULT NULL,
  `edit_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_activity
-- ----------------------------
INSERT INTO `tbl_activity` VALUES ('10f6a111c27140e3a9fcc5b0c34e361b', '06f5fc056eac41558a964f96daa7f27c', 'test04', '2022-05-18', '2022-05-24', '2312', '44444444444444', '2022-05-28 22:13:58', '06f5fc056eac41558a964f96daa7f27c', null, null);
INSERT INTO `tbl_activity` VALUES ('1117335e166741f88063ae6afe38c0f2', '06f5fc056eac41558a964f96daa7f27c', '交易活动测试04', '2022-06-01', '2022-06-17', '88888', '静态数据交易测试', '2022-06-13 22:28:05', '06f5fc056eac41558a964f96daa7f27c', null, null);
INSERT INTO `tbl_activity` VALUES ('1d916e4814ee4706a107260c87d07b32', '06f5fc056eac41558a964f96daa7f27c', '模板4', '2022-01-01', '2022-02-02', '444', '44444441', '2022-06-02 14:52:08', '06f5fc056eac41558a964f96daa7f27c', '2022-06-03 17:39:30', '06f5fc056eac41558a964f96daa7f27c');
INSERT INTO `tbl_activity` VALUES ('1fb0c1b5fa004b0495711c8e6b47e75b', '40f6cdea0bd34aceb77492a1656d9fb3', 'zs的test03', '2022-05-12', '2022-05-28', '123123', '3333333333333333333333333', '2022-05-29 18:59:17', '06f5fc056eac41558a964f96daa7f27c', null, null);
INSERT INTO `tbl_activity` VALUES ('2eb452410c604da59fa17b19482e7b8c', '06f5fc056eac41558a964f96daa7f27c', '模板111', '2022-05-31', '2022-06-01', '555', '模板文件', '2022-05-31 21:45:32', '06f5fc056eac41558a964f96daa7f27c', '2022-05-31 21:48:58', '06f5fc056eac41558a964f96daa7f27c');
INSERT INTO `tbl_activity` VALUES ('5a297f58ce7b4ff1a2d6cc358dc13f20', '06f5fc056eac41558a964f96daa7f27c', '导入活动', '2022-02-02', '2022-03-03', '3333.0', '333', '2022-06-14 18:49:18', '06f5fc056eac41558a964f96daa7f27c', null, null);
INSERT INTO `tbl_activity` VALUES ('60370fde21d84d35a02439752df13dec', '40f6cdea0bd34aceb77492a1656d9fb3', 'zs的test06', '2022-05-02', '2022-05-18', '6666', '66666666666666616666修改', '2022-05-29 11:40:15', '06f5fc056eac41558a964f96daa7f27c', '2022-05-29 11:43:42', '06f5fc056eac41558a964f96daa7f27c');
INSERT INTO `tbl_activity` VALUES ('6455dc0f518a4d7f9ae985f0460d2e18', '06f5fc056eac41558a964f96daa7f27c', '市场测试活动01', '2000-10-13', '2019-6-30', '88888', '创建了一个市场活动的添加测试', '2022-05-27 17:44:39', '06f5fc056eac41558a964f96daa7f27c', null, null);
INSERT INTO `tbl_activity` VALUES ('69cbde6bafad42ea8dacd1289589b3df', '06f5fc056eac41558a964f96daa7f27c', '导入数据2223', '2020-01-01', '2020-02-02', '222.0', '导入数据', '2022-05-31 21:22:43', '06f5fc056eac41558a964f96daa7f27c', null, null);
INSERT INTO `tbl_activity` VALUES ('70cae195f8cd414d9015dc567ca36d99', '06f5fc056eac41558a964f96daa7f27c', 'test01', '2022-05-04', '2022-05-11', '3213', '测试1', '2022-05-28 10:52:35', '06f5fc056eac41558a964f96daa7f27c', null, null);
INSERT INTO `tbl_activity` VALUES ('7fb261c1301944a6858c42dc1e41214e', '40f6cdea0bd34aceb77492a1656d9fb3', 'zs的test01', '2022-05-03', '2022-05-28', '111', '11111', '2022-05-29 11:42:31', '06f5fc056eac41558a964f96daa7f27c', '2022-05-29 11:55:31', '06f5fc056eac41558a964f96daa7f27c');
INSERT INTO `tbl_activity` VALUES ('834f6fce21cf4a339c48e776dfd80779', '06f5fc056eac41558a964f96daa7f27c', '模板333', '2022-05-31', '2022-06-02', '333', '33333333', '2022-05-31 21:50:59', '06f5fc056eac41558a964f96daa7f27c', '2022-05-31 21:51:23', '06f5fc056eac41558a964f96daa7f27c');
INSERT INTO `tbl_activity` VALUES ('8dd09fe8507d4569abaaca838fcc3a2f', '06f5fc056eac41558a964f96daa7f27c', 'test03', '2022-05-02', '2022-06-01', '242333', '33333333', '2022-05-28 21:15:54', '06f5fc056eac41558a964f96daa7f27c', '2022-05-29 11:43:48', '06f5fc056eac41558a964f96daa7f27c');
INSERT INTO `tbl_activity` VALUES ('a0898b9120634c74bb023765a9d3165c', '40f6cdea0bd34aceb77492a1656d9fb3', 'test02', '2022-05-01', '2022-05-21', '242', '测试2', '2022-05-28 10:54:59', '06f5fc056eac41558a964f96daa7f27c', null, null);
INSERT INTO `tbl_activity` VALUES ('a680b1d3f8224c33b30b70bc65586439', '06f5fc056eac41558a964f96daa7f27c', '市场测试活动02', '2022-01-03', '2022-10-2', '9', '', '2022-05-27 17:43:17', '06f5fc056eac41558a964f96daa7f27c', '2022-05-29 11:55:42', '06f5fc056eac41558a964f96daa7f27c');
INSERT INTO `tbl_activity` VALUES ('ad0a9a838a6840c7879ca181243d37c8', '06f5fc056eac41558a964f96daa7f27c', '市场测试活动03', '2000-10-13', '2019-5-30', '2312', '第三个测试用例', '2022-05-27 20:17:26', '06f5fc056eac41558a964f96daa7f27c', null, null);
INSERT INTO `tbl_activity` VALUES ('b2d01480836d4c11bb8ca5f5f96de074', '06f5fc056eac41558a964f96daa7f27c', '朝阳活动', '2022-12-14', '2022-12-30', '88888', '朝阳器', '2022-12-05 21:30:53', '06f5fc056eac41558a964f96daa7f27c', null, null);
INSERT INTO `tbl_activity` VALUES ('b359363c2a2640ce808ceacef76a313b', '06f5fc056eac41558a964f96daa7f27c', '模板222', '2022-11-11', '2022-12-12', '222.0', '模板2', '2022-05-31 21:48:31', '06f5fc056eac41558a964f96daa7f27c', null, null);
INSERT INTO `tbl_activity` VALUES ('c1911c7c41684934bdd956ff9ff71a26', '40f6cdea0bd34aceb77492a1656d9fb3', 'zs的test', '2022-05-04', '2022-05-31', '3213', '张三的老婆饼', '2022-05-28 22:15:20', '06f5fc056eac41558a964f96daa7f27c', null, null);
INSERT INTO `tbl_activity` VALUES ('d1821b697f574e92b836ad453adf451c', '06f5fc056eac41558a964f96daa7f27c', '导入数据111', '2020-01-01', '2020-02-02', '1113.0', '导入数据', '2022-05-31 21:24:42', '06f5fc056eac41558a964f96daa7f27c', null, null);
INSERT INTO `tbl_activity` VALUES ('d85c866370c04139af0304650e3b251a', '06f5fc056eac41558a964f96daa7f27c', '导入数据333', '2020-01-01', '2020-02-02', '333.0', '导入数据', '2022-05-31 21:24:00', '06f5fc056eac41558a964f96daa7f27c', null, null);
INSERT INTO `tbl_activity` VALUES ('e7888fc022a14d0d9eea3c06576edd27', '06f5fc056eac41558a964f96daa7f27c', '蓝天市场活动', '2022-12-14', '2022-12-31', '88888', '测试的蓝天市场活动111', '2022-12-04 16:08:29', '06f5fc056eac41558a964f96daa7f27c', '2022-12-04 16:11:43', '06f5fc056eac41558a964f96daa7f27c');
INSERT INTO `tbl_activity` VALUES ('f0400a6d8f6a4be5bd6b1023e2431cf3', '06f5fc056eac41558a964f96daa7f27c', 'Excel导入市场活动233', '2022-10-13', '2022-11-11', '6666.0', '模板活动', '2022-12-04 21:20:18', '06f5fc056eac41558a964f96daa7f27c', null, null);
INSERT INTO `tbl_activity` VALUES ('f9d38b3ad17d4d3bb06ccf081016aff5', '06f5fc056eac41558a964f96daa7f27c', 'test05', '2022-04-24', '2022-04-26', '88888', '55555', '2022-05-28 22:14:32', '06f5fc056eac41558a964f96daa7f27c', null, null);

-- ----------------------------
-- Table structure for tbl_activity_remark
-- ----------------------------
DROP TABLE IF EXISTS `tbl_activity_remark`;
CREATE TABLE `tbl_activity_remark` (
  `id` char(32) NOT NULL,
  `note_content` varchar(255) DEFAULT NULL,
  `create_time` char(19) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `edit_time` char(19) DEFAULT NULL,
  `edit_by` varchar(255) DEFAULT NULL,
  `edit_flag` char(1) DEFAULT NULL COMMENT '0表示未修改，1表示已修改',
  `activity_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_activity_remark
-- ----------------------------
INSERT INTO `tbl_activity_remark` VALUES ('01c477be92b545999578f5fb916b1a6e', '在干嘛？', '2022-06-03 18:21:55', '06f5fc056eac41558a964f96daa7f27c', null, null, '0', 'd1821b697f574e92b836ad453adf451c');
INSERT INTO `tbl_activity_remark` VALUES ('0364031acc994631bbb2c569416f6097', '备注测试', '2022-06-03 18:31:09', '06f5fc056eac41558a964f96daa7f27c', null, null, '0', '834f6fce21cf4a339c48e776dfd80779');
INSERT INTO `tbl_activity_remark` VALUES ('0e65c96580cc4fac9ac7547c1c91e932', '干什么。。。', '2022-06-03 17:51:35', '06f5fc056eac41558a964f96daa7f27c', null, null, '0', '2eb452410c604da59fa17b19482e7b8c');
INSERT INTO `tbl_activity_remark` VALUES ('1e56f88ba69d4cf6853578e41ce1acf2', '好了 okay', '2022-06-03 17:55:31', '06f5fc056eac41558a964f96daa7f27c', null, null, '0', '1d916e4814ee4706a107260c87d07b32');
INSERT INTO `tbl_activity_remark` VALUES ('2cac743d3d604f7a8eb9bf376ecd5ee6', '测试成功', '2022-06-03 17:43:00', '06f5fc056eac41558a964f96daa7f27c', null, null, '0', '1d916e4814ee4706a107260c87d07b32');
INSERT INTO `tbl_activity_remark` VALUES ('2df8012d43d840c7a59779498b5de9ed', 'very good', '2022-06-03 17:44:48', '06f5fc056eac41558a964f96daa7f27c', null, null, '0', '1d916e4814ee4706a107260c87d07b32');
INSERT INTO `tbl_activity_remark` VALUES ('5410ac496e2d41e99efe4465f306bbe1', '好了 万事大吉', '2022-06-03 17:59:55', '06f5fc056eac41558a964f96daa7f27c', null, null, '0', '834f6fce21cf4a339c48e776dfd80779');
INSERT INTO `tbl_activity_remark` VALUES ('55068d37fdde4a5bba4d3590712c7cdb', '？？？？？？？', '2022-06-03 17:41:47', '06f5fc056eac41558a964f96daa7f27c', '2022-06-03 21:09:05', '06f5fc056eac41558a964f96daa7f27c', '1', '1d916e4814ee4706a107260c87d07b32');
INSERT INTO `tbl_activity_remark` VALUES ('70d117e1b44240489f90e5c3802e5098', '123123', '2023-02-12 14:58:08', '06f5fc056eac41558a964f96daa7f27c', null, null, '0', '9e89b865f706466e85cbafc335711e8b');
INSERT INTO `tbl_activity_remark` VALUES ('72edd72ee1414778a2e8cbb19e8b7aaf', '111', '2022-12-05 21:30:57', '06f5fc056eac41558a964f96daa7f27c', null, null, '0', 'b2d01480836d4c11bb8ca5f5f96de074');
INSERT INTO `tbl_activity_remark` VALUES ('76542cbe78c2414bad04f1110dabbd18', '白云修改', '2023-01-20 22:42:15', '06f5fc056eac41558a964f96daa7f27c', '2023-01-20 22:42:21', '06f5fc056eac41558a964f96daa7f27c', '1', 'e7888fc022a14d0d9eea3c06576edd27');
INSERT INTO `tbl_activity_remark` VALUES ('76e022668e8740eabd37385a4e9caa25', '你在干什么啊', '2022-06-14 19:03:59', '06f5fc056eac41558a964f96daa7f27c', null, null, '0', '5a297f58ce7b4ff1a2d6cc358dc13f20');
INSERT INTO `tbl_activity_remark` VALUES ('8466f6b2b19745519fbb676289694f85', '嗡嗡嗡', '2022-11-20 15:32:35', '06f5fc056eac41558a964f96daa7f27c', '2022-11-20 15:32:43', '06f5fc056eac41558a964f96daa7f27c', '1', '5a297f58ce7b4ff1a2d6cc358dc13f20');
INSERT INTO `tbl_activity_remark` VALUES ('9283c1b776c24e2cafdf0810032567eb', '三生三世333', '2022-06-03 17:55:18', '06f5fc056eac41558a964f96daa7f27c', '2022-06-03 21:09:36', '06f5fc056eac41558a964f96daa7f27c', '1', '1d916e4814ee4706a107260c87d07b32');
INSERT INTO `tbl_activity_remark` VALUES ('96ebb828656a4271a3098d3f4fb07d38', 'emmmmm', '2022-06-12 18:26:30', '06f5fc056eac41558a964f96daa7f27c', null, null, '0', 'd1821b697f574e92b836ad453adf451c');
INSERT INTO `tbl_activity_remark` VALUES ('998e6cb15b164721804f5df1b532a0f8', '111', '2022-12-04 21:20:25', '06f5fc056eac41558a964f96daa7f27c', null, null, '0', 'f0400a6d8f6a4be5bd6b1023e2431cf3');
INSERT INTO `tbl_activity_remark` VALUES ('a9ece84401e64ceea161c10fd9990a01', '嘻嘻嘻嘻嘻嘻', '2022-06-03 17:47:25', '06f5fc056eac41558a964f96daa7f27c', '2022-06-12 17:41:33', '06f5fc056eac41558a964f96daa7f27c', '1', '1d916e4814ee4706a107260c87d07b32');
INSERT INTO `tbl_activity_remark` VALUES ('ac968c9e09d347708cfcc657e74508cc', '测试备注111111', '2022-06-03 17:42:31', '06f5fc056eac41558a964f96daa7f27c', '2022-06-03 21:09:09', '06f5fc056eac41558a964f96daa7f27c', '1', '1d916e4814ee4706a107260c87d07b32');
INSERT INTO `tbl_activity_remark` VALUES ('ae99933d20674af5ab9dbf9ede97dbf3', '嗡嗡嗡', '2022-06-03 17:52:35', '06f5fc056eac41558a964f96daa7f27c', null, null, '0', '1d916e4814ee4706a107260c87d07b32');
INSERT INTO `tbl_activity_remark` VALUES ('afb80ce8dc0c47fd911dfc2cded47ce2', '蓝天', '2023-01-20 22:42:11', '06f5fc056eac41558a964f96daa7f27c', null, null, '0', 'e7888fc022a14d0d9eea3c06576edd27');
INSERT INTO `tbl_activity_remark` VALUES ('bc8925423000486082f79f2d8b9c1dc8', '备注测试', '2022-06-03 18:28:15', '06f5fc056eac41558a964f96daa7f27c', null, null, '0', '1fb0c1b5fa004b0495711c8e6b47e75b');
INSERT INTO `tbl_activity_remark` VALUES ('d1a8fffa7c7a47f1b6012af3d0cceb95', '你在干什么？', '2022-06-03 17:49:46', '06f5fc056eac41558a964f96daa7f27c', null, null, '0', '7fb261c1301944a6858c42dc1e41214e');
INSERT INTO `tbl_activity_remark` VALUES ('ec633bb247c441dfba1546a744797826', '在干什么?', '2022-06-03 18:22:35', '06f5fc056eac41558a964f96daa7f27c', null, null, '0', '69cbde6bafad42ea8dacd1289589b3df');
INSERT INTO `tbl_activity_remark` VALUES ('fa495f2311ea4c2aa2b2065e41674568', '特殊活动的备注修改', '2022-11-29 17:34:54', '06f5fc056eac41558a964f96daa7f27c', '2022-11-29 17:35:00', '06f5fc056eac41558a964f96daa7f27c', '1', '94d56c0e03da4229a182fe7939b353f1');
INSERT INTO `tbl_activity_remark` VALUES ('fb75c9b572a842f28de11292ec657217', '你在肝肾', '2022-06-14 18:54:18', '06f5fc056eac41558a964f96daa7f27c', null, null, '0', '5a297f58ce7b4ff1a2d6cc358dc13f20');
INSERT INTO `tbl_activity_remark` VALUES ('ff04a7058c42485090f43468e1c83ff2', '。。。', '2022-06-14 18:46:34', '06f5fc056eac41558a964f96daa7f27c', null, null, '0', '5508d7c5c44d4886b398ebf848dacaf9');

-- ----------------------------
-- Table structure for tbl_clue
-- ----------------------------
DROP TABLE IF EXISTS `tbl_clue`;
CREATE TABLE `tbl_clue` (
  `id` char(32) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `appellation` varchar(255) DEFAULT NULL,
  `owner` char(32) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `mphone` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` char(19) DEFAULT NULL,
  `edit_by` varchar(255) DEFAULT NULL,
  `edit_time` char(19) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `contact_summary` varchar(255) DEFAULT NULL,
  `next_contact_time` char(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_clue
-- ----------------------------
INSERT INTO `tbl_clue` VALUES ('0ad75264272b4aa7a422389aa8f17d98', '山', '59795c49896947e1ab61b7312bd0597c', '06f5fc056eac41558a964f96daa7f27c', '罗德岛', '少爷', '1563906465@qq.com', '888-88888888', '1563906465@qq.com', '17687940673', '966170ead6fa481284b7d21f90364984', 'fd677cc3b5d047d994e16f6ece4d3d45', '06f5fc056eac41558a964f96daa7f27c', '2022-06-12 21:22:02', null, null, '监狱相遇', '任职请示', '2022-06-17', '罗德岛监狱');
INSERT INTO `tbl_clue` VALUES ('55f3eb89c2524e71be3da5ac2ddee459', '薛仁俊', '59795c49896947e1ab61b7312bd0597c', '06f5fc056eac41558a964f96daa7f27c', '蓝心公司', '董事长', '1563906465@qq.com', '888-88888888', '1563906465@qq.com', '17687940673', '966170ead6fa481284b7d21f90364984', '12302fd42bd349c1bb768b19600e6b20', '06f5fc056eac41558a964f96daa7f27c', '2022-06-04 17:47:28', null, null, '交易时讨论合作的伙伴，有购买产品的意向', '工作日联系', '2022-06-01', '江西市鹰潭市贵溪市');
INSERT INTO `tbl_clue` VALUES ('5b0f3cc8f33540b98f874bf62e085d40', '银灰', '59795c49896947e1ab61b7312bd0597c', '06f5fc056eac41558a964f96daa7f27c', '罗德岛', '盟友', '1563906465@qq.com', '666-66666666', '1563906465@qq.com', '17687940673', '966170ead6fa481284b7d21f90364984', '12302fd42bd349c1bb768b19600e6b20', '06f5fc056eac41558a964f96daa7f27c', '2022-06-04 19:28:40', '06f5fc056eac41558a964f96daa7f27c', '2022-06-04 21:55:00', '罗德岛近卫', '罗德岛近卫', '2022-06-01', '冰天雪地');
INSERT INTO `tbl_clue` VALUES ('5fa602de94c546dd889f95ff1c3c1ba4', '黑键', '59795c49896947e1ab61b7312bd0597c', '06f5fc056eac41558a964f96daa7f27c', '罗德岛', '幕后打工仔', '1563906465@qq.com', '666-66666666', '1563906465@qq.com', '17687940673', '06e3cbdf10a44eca8511dddfc6896c55', '6b86f215e69f4dbd8a2daa22efccf0cf', '06f5fc056eac41558a964f96daa7f27c', '2022-12-04 16:21:04', '06f5fc056eac41558a964f96daa7f27c', '2022-12-04 16:22:56', '5球的十万大C', '十万大C', '2022-12-01', '术士职业111');
INSERT INTO `tbl_clue` VALUES ('61f7bb87783e4f8e8b2bc0527a3802bb', '号角', 'e5f383d2622b4fc0959f4fe131dafc80', '06f5fc056eac41558a964f96daa7f27c', '罗德岛', '重装', '1563906465@qq.com', '666-66666666', '1563906465@qq.com', '17687940673', '1e0bd307e6ee425599327447f8387285', 'a83e75ced129421dbf11fab1f05cf8b4', '06f5fc056eac41558a964f96daa7f27c', '2022-12-04 16:42:57', null, null, '老花镜攻击', '照明弹反隐', '2022-12-10', '罗德岛');
INSERT INTO `tbl_clue` VALUES ('62aa2b1e2add4f2d9cc21ffac265a43b', '德克萨斯', 'e5f383d2622b4fc0959f4fe131dafc80', '06f5fc056eac41558a964f96daa7f27c', '企鹅物流', '王牌快递员', '1563906465@qq.com', '666-66666666', '1563906465@qq.com', '17687940673', '966170ead6fa481284b7d21f90364984', 'db867ea866bc44678ac20c8a4a8bfefb', '06f5fc056eac41558a964f96daa7f27c', '2022-06-04 21:56:14', '06f5fc056eac41558a964f96daa7f27c', '2022-06-05 11:38:35', '使命必达', '使命必达', '2022-06-17', '使命必达');
INSERT INTO `tbl_clue` VALUES ('7071391de9ba491d9197743a764cdaff', '能天使', 'e5f383d2622b4fc0959f4fe131dafc80', '06f5fc056eac41558a964f96daa7f27c', '企鹅物流', '企鹅快递员', '1563906465@qq.com', '666-66666666', '1563906465@qq.com', '17687940673', '9e6d6e15232549af853e22e703f3e015', '3a39605d67da48f2a3ef52e19d243953', '06f5fc056eac41558a964f96daa7f27c', '2022-06-04 21:43:48', '06f5fc056eac41558a964f96daa7f27c', '2022-06-04 21:54:50', '使命必达', '使命必达', '2022-06-18', '贸易战');
INSERT INTO `tbl_clue` VALUES ('7ea8abf8c01f48778f1f048120182e8a', '凯尔希', '176039d2a90e4b1a81c5ab8707268636', '06f5fc056eac41558a964f96daa7f27c', '罗德岛', '召唤医疗', '1563906465@qq.com', '666-66666666', '1563906465@qq.com', '17687940673', '966170ead6fa481284b7d21f90364984', '72f13af8f5d34134b5b3f42c5d477510', '06f5fc056eac41558a964f96daa7f27c', '2022-06-04 19:27:42', null, null, '罗德岛医疗', '罗德岛医疗', '2022-06-03', '龙门市区');
INSERT INTO `tbl_clue` VALUES ('b1c3b347c5214dcb8f80790e1d440709', '刀塔客', '31539e7ed8c848fc913e1c2c93d76fd1', '06f5fc056eac41558a964f96daa7f27c', '罗德岛', '幕后打工仔', '1563906465@qq.com', '666-66666666', '1563906465@qq.com', '17687940673', '9e6d6e15232549af853e22e703f3e015', '72f13af8f5d34134b5b3f42c5d477510', '06f5fc056eac41558a964f96daa7f27c', '2022-06-04 19:23:20', null, null, '源石病药物研发公司，合作伙伴分享', '源石病药物研发公司，合作伙伴分享', '2022-06-02', '龙门市区');

-- ----------------------------
-- Table structure for tbl_clue_activity_relation
-- ----------------------------
DROP TABLE IF EXISTS `tbl_clue_activity_relation`;
CREATE TABLE `tbl_clue_activity_relation` (
  `id` char(32) NOT NULL,
  `clue_id` char(32) DEFAULT NULL,
  `activity_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_clue_activity_relation
-- ----------------------------
INSERT INTO `tbl_clue_activity_relation` VALUES ('0f6e5747a0a44864ac5116a54f6468f8', '61f7bb87783e4f8e8b2bc0527a3802bb', '2eb452410c604da59fa17b19482e7b8c');
INSERT INTO `tbl_clue_activity_relation` VALUES ('130ddb5652aa4846beca71d93a92254c', '5b0f3cc8f33540b98f874bf62e085d40', '6455dc0f518a4d7f9ae985f0460d2e18');
INSERT INTO `tbl_clue_activity_relation` VALUES ('13116ba8373d44118895c32adc6927fa', 'dd1e879272f646f4b8f7f009896e0913', '7fb261c1301944a6858c42dc1e41214e');
INSERT INTO `tbl_clue_activity_relation` VALUES ('15fa81a0709a4ca8ab835bfecaa1e5d2', 'b1c3b347c5214dcb8f80790e1d440709', 'b359363c2a2640ce808ceacef76a313b');
INSERT INTO `tbl_clue_activity_relation` VALUES ('1ef7b52e814549779602c5af9e64ffa7', 'dd1e879272f646f4b8f7f009896e0913', '70cae195f8cd414d9015dc567ca36d99');
INSERT INTO `tbl_clue_activity_relation` VALUES ('2183cdc3743744db8044f4949dc32fe6', '7ea8abf8c01f48778f1f048120182e8a', '6455dc0f518a4d7f9ae985f0460d2e18');
INSERT INTO `tbl_clue_activity_relation` VALUES ('260093c7be614bb0a9634bcd479ba237', '7071391de9ba491d9197743a764cdaff', '7fb261c1301944a6858c42dc1e41214e');
INSERT INTO `tbl_clue_activity_relation` VALUES ('2ad994505e25400593fb8a2a3ff1aecb', '7ea8abf8c01f48778f1f048120182e8a', '70cae195f8cd414d9015dc567ca36d99');
INSERT INTO `tbl_clue_activity_relation` VALUES ('2bdabadb89ee49c09f7e05f5e407f036', '55f3eb89c2524e71be3da5ac2ddee459', '70cae195f8cd414d9015dc567ca36d99');
INSERT INTO `tbl_clue_activity_relation` VALUES ('2dddd46cb600469688a12150fd568f6b', '7071391de9ba491d9197743a764cdaff', '70cae195f8cd414d9015dc567ca36d99');
INSERT INTO `tbl_clue_activity_relation` VALUES ('34be2020b6fb491a9f43c042ee1f479d', '5fa602de94c546dd889f95ff1c3c1ba4', '7fb261c1301944a6858c42dc1e41214e');
INSERT INTO `tbl_clue_activity_relation` VALUES ('4b1303d6ed3b46d8ae5c984105c3a7fb', '0ad75264272b4aa7a422389aa8f17d98', '70cae195f8cd414d9015dc567ca36d99');
INSERT INTO `tbl_clue_activity_relation` VALUES ('4d281f7746f2410185a01c77c5ca07ca', '62aa2b1e2add4f2d9cc21ffac265a43b', '2eb452410c604da59fa17b19482e7b8c');
INSERT INTO `tbl_clue_activity_relation` VALUES ('549aee0d10a54e3fa6ae98dc7a451b5b', 'b1c3b347c5214dcb8f80790e1d440709', 'a680b1d3f8224c33b30b70bc65586439');
INSERT INTO `tbl_clue_activity_relation` VALUES ('585f64dda24e4e6ab06fae00aaccd26d', '5fa602de94c546dd889f95ff1c3c1ba4', '70cae195f8cd414d9015dc567ca36d99');
INSERT INTO `tbl_clue_activity_relation` VALUES ('9bdfdaac5464468b959d3951255192f8', '62aa2b1e2add4f2d9cc21ffac265a43b', '7fb261c1301944a6858c42dc1e41214e');
INSERT INTO `tbl_clue_activity_relation` VALUES ('9ecc29a41b4c4494b3d208106f876942', '5b0f3cc8f33540b98f874bf62e085d40', 'd1821b697f574e92b836ad453adf451c');
INSERT INTO `tbl_clue_activity_relation` VALUES ('a0d5b94053924cce807950cb6aa5f746', '7ea8abf8c01f48778f1f048120182e8a', 'd1821b697f574e92b836ad453adf451c');
INSERT INTO `tbl_clue_activity_relation` VALUES ('a425be13860b447092f8d86e6a4ffdf3', '0ad75264272b4aa7a422389aa8f17d98', '7fb261c1301944a6858c42dc1e41214e');
INSERT INTO `tbl_clue_activity_relation` VALUES ('adcdc9f2ffd7499ca0495b5cfa0a662a', '62aa2b1e2add4f2d9cc21ffac265a43b', '6455dc0f518a4d7f9ae985f0460d2e18');
INSERT INTO `tbl_clue_activity_relation` VALUES ('af3e258917fd4899a457a28895a2d1ba', 'dd1e879272f646f4b8f7f009896e0913', '6455dc0f518a4d7f9ae985f0460d2e18');
INSERT INTO `tbl_clue_activity_relation` VALUES ('b14ac4352bf24de18b58d083f86f2b2f', '5b0f3cc8f33540b98f874bf62e085d40', '70cae195f8cd414d9015dc567ca36d99');
INSERT INTO `tbl_clue_activity_relation` VALUES ('b8538e4e4ad54d60bb71689f22a3f2ca', '61f7bb87783e4f8e8b2bc0527a3802bb', 'a0898b9120634c74bb023765a9d3165c');
INSERT INTO `tbl_clue_activity_relation` VALUES ('bd20c422fc58409bbee1446540d7e0b6', '7071391de9ba491d9197743a764cdaff', 'd1821b697f574e92b836ad453adf451c');
INSERT INTO `tbl_clue_activity_relation` VALUES ('bd21926605424a41b02cde0df99209b9', '62aa2b1e2add4f2d9cc21ffac265a43b', '70cae195f8cd414d9015dc567ca36d99');
INSERT INTO `tbl_clue_activity_relation` VALUES ('bf25922af4494d9cb361d1fc57558557', '5fa602de94c546dd889f95ff1c3c1ba4', 'd1821b697f574e92b836ad453adf451c');
INSERT INTO `tbl_clue_activity_relation` VALUES ('bf9819bd503f48a1b79ba62b3584885b', 'b1c3b347c5214dcb8f80790e1d440709', 'a0898b9120634c74bb023765a9d3165c');
INSERT INTO `tbl_clue_activity_relation` VALUES ('c19d451dcfdb45acac83894d7553d22d', 'b1c3b347c5214dcb8f80790e1d440709', '2eb452410c604da59fa17b19482e7b8c');
INSERT INTO `tbl_clue_activity_relation` VALUES ('efb64cfaee034a1fb8f7be109e6db4b8', '55f3eb89c2524e71be3da5ac2ddee459', '6455dc0f518a4d7f9ae985f0460d2e18');

-- ----------------------------
-- Table structure for tbl_clue_remark
-- ----------------------------
DROP TABLE IF EXISTS `tbl_clue_remark`;
CREATE TABLE `tbl_clue_remark` (
  `id` char(32) NOT NULL,
  `note_content` varchar(255) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` char(19) DEFAULT NULL,
  `edit_by` varchar(255) DEFAULT NULL,
  `edit_time` char(19) DEFAULT NULL,
  `edit_flag` char(1) DEFAULT NULL,
  `clue_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_clue_remark
-- ----------------------------
INSERT INTO `tbl_clue_remark` VALUES ('0310b0abeaf742bb8d9fad8c9425942b', '十万大c', '06f5fc056eac41558a964f96daa7f27c', '2022-12-04 16:23:49', null, null, '0', '5fa602de94c546dd889f95ff1c3c1ba4');
INSERT INTO `tbl_clue_remark` VALUES ('4dcaa9ac00e247a99391cb36a5160f5e', '得狗不如狗。。', '06f5fc056eac41558a964f96daa7f27c', '2022-06-12 18:25:34', null, null, '0', '62aa2b1e2add4f2d9cc21ffac265a43b');
INSERT INTO `tbl_clue_remark` VALUES ('a1dfbb980a7442ab95ca86536ffb5b19', '剑雨~', '06f5fc056eac41558a964f96daa7f27c', '2022-06-12 20:53:29', null, null, '0', '62aa2b1e2add4f2d9cc21ffac265a43b');
INSERT INTO `tbl_clue_remark` VALUES ('a21e4d6ba2ee4e41ab875557c52e0bba', '啊苦咯拍', '06f5fc056eac41558a964f96daa7f27c', '2022-06-12 18:27:11', null, null, '0', '7071391de9ba491d9197743a764cdaff');
INSERT INTO `tbl_clue_remark` VALUES ('a9c9a1bfd2a94964ade3ac61b4ce847a', '请认清楚本人再叫', '06f5fc056eac41558a964f96daa7f27c', '2022-06-12 21:22:17', '06f5fc056eac41558a964f96daa7f27c', '2022-06-12 21:22:26', '1', '0ad75264272b4aa7a422389aa8f17d98');
INSERT INTO `tbl_clue_remark` VALUES ('b7963f26d85f4ccd9d9fc1938ae0fcb4', '情人是真实的我', '06f5fc056eac41558a964f96daa7f27c', '2022-11-20 16:37:05', null, null, '0', '0ad75264272b4aa7a422389aa8f17d98');
INSERT INTO `tbl_clue_remark` VALUES ('ccfbcb4c71094f9e9857a94d81646bbd', 'xrjXRJ', '06f5fc056eac41558a964f96daa7f27c', '2022-06-12 21:44:53', '06f5fc056eac41558a964f96daa7f27c', '2022-06-12 21:45:00', '1', '55f3eb89c2524e71be3da5ac2ddee459');
INSERT INTO `tbl_clue_remark` VALUES ('fdd840b63e454ae28e44c45b9da0f421', '得狗好脆啊aa', '06f5fc056eac41558a964f96daa7f27c', '2022-06-12 18:25:48', '06f5fc056eac41558a964f96daa7f27c', '2022-06-12 21:20:11', '1', '62aa2b1e2add4f2d9cc21ffac265a43b');

-- ----------------------------
-- Table structure for tbl_contacts
-- ----------------------------
DROP TABLE IF EXISTS `tbl_contacts`;
CREATE TABLE `tbl_contacts` (
  `id` char(32) NOT NULL,
  `owner` char(32) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `customer_id` char(32) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `appellation` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mphone` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` char(19) DEFAULT NULL,
  `edit_by` varchar(255) DEFAULT NULL,
  `edit_time` char(19) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `contact_summary` varchar(255) DEFAULT NULL,
  `next_contact_time` char(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_contacts
-- ----------------------------
INSERT INTO `tbl_contacts` VALUES ('18792df55244483aab9195d8b420a208', '06f5fc056eac41558a964f96daa7f27c', '3a39605d67da48f2a3ef52e19d243953', 'd5387e10a70e4225869080c2707d2c20', '凯尔希', 'e5f383d2622b4fc0959f4fe131dafc80', '1563906465@qq.com', '17687940673', '召唤医疗', '06f5fc056eac41558a964f96daa7f27c', '2022-11-20 17:57:02', null, null, '召唤医疗', '医疗', '2022-06-06', '罗德岛');
INSERT INTO `tbl_contacts` VALUES ('2f236f688aae46a5a37b881ad2241fd2', '06f5fc056eac41558a964f96daa7f27c', '86c56aca9eef49058145ec20d5466c17', 'd5387e10a70e4225869080c2707d2c20', '银灰', '59795c49896947e1ab61b7312bd0597c', '1563906465@qq.com', '123123', '董事长', '06f5fc056eac41558a964f96daa7f27c', '2022-11-20 17:50:09', null, null, '', '', '', '');
INSERT INTO `tbl_contacts` VALUES ('3d470332411d4874ac17fc40fa3aba6d', '06f5fc056eac41558a964f96daa7f27c', '86c56aca9eef49058145ec20d5466c17', 'd5387e10a70e4225869080c2707d2c20', '红', 'e5f383d2622b4fc0959f4fe131dafc80', '1563906465@qq.com', '17687940673', '快递员', '06f5fc056eac41558a964f96daa7f27c', '2022-12-04 15:31:35', '06f5fc056eac41558a964f96daa7f27c', '2022-12-04 15:31:44', '快活', '随叫随到', '2022-12-13', '身边');
INSERT INTO `tbl_contacts` VALUES ('71a6446b608747759d42dd9da891bbd7', '06f5fc056eac41558a964f96daa7f27c', '86c56aca9eef49058145ec20d5466c17', 'd5387e10a70e4225869080c2707d2c20', '粉毛', 'e5f383d2622b4fc0959f4fe131dafc80', '1563906465@qq.com', '17687940673', '理发师', '06f5fc056eac41558a964f96daa7f27c', '2022-06-12 16:48:34', null, null, '粉末啊', '粉末啊', '2022-06-23', '粉末啊');
INSERT INTO `tbl_contacts` VALUES ('c143c35740db42028fcb1b49f941011e', '06f5fc056eac41558a964f96daa7f27c', 'db867ea866bc44678ac20c8a4a8bfefb', 'd5387e10a70e4225869080c2707d2c20', '异德', 'e5f383d2622b4fc0959f4fe131dafc80', '1563906465@qq.com', '17687940673', '快递员', '06f5fc056eac41558a964f96daa7f27c', '2022-11-20 19:21:21', '06f5fc056eac41558a964f96daa7f27c', '2022-11-29 17:39:20', '张飞123', '快活', '2022-06-06', '意大利');
INSERT INTO `tbl_contacts` VALUES ('d06a9b9474b044b7ac1beab335890a77', '06f5fc056eac41558a964f96daa7f27c', '12302fd42bd349c1bb768b19600e6b20', 'd5387e10a70e4225869080c2707d2c20', '空弦', 'e5f383d2622b4fc0959f4fe131dafc80', '1563906465@qq.com', '17687940673', '酿酒师', '06f5fc056eac41558a964f96daa7f27c', '2022-12-04 16:33:49', '06f5fc056eac41558a964f96daa7f27c', '2022-12-04 16:33:54', '空门', '兰登战术没有兰登', '2022-12-17', '罗德岛11');
INSERT INTO `tbl_contacts` VALUES ('ff776679f44c4d4d97fed6f237812f1c', '06f5fc056eac41558a964f96daa7f27c', '72f13af8f5d34134b5b3f42c5d477510', '7cef319837324b80ae4e07ce5d1a8ae3', '殺君者', 'e5f383d2622b4fc0959f4fe131dafc80', '1563906465@qq.com', '17687940673', '领袖', '06f5fc056eac41558a964f96daa7f27c', '2022-12-04 21:10:30', null, null, '重量太轻', '推拉坑', '2022-12-10', '整合部队');

-- ----------------------------
-- Table structure for tbl_contacts_activity_relation
-- ----------------------------
DROP TABLE IF EXISTS `tbl_contacts_activity_relation`;
CREATE TABLE `tbl_contacts_activity_relation` (
  `id` char(32) NOT NULL,
  `contacts_id` char(32) DEFAULT NULL,
  `activity_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_contacts_activity_relation
-- ----------------------------
INSERT INTO `tbl_contacts_activity_relation` VALUES ('27a2a9b88a974244893a6d92c430c3de', '71a6446b608747759d42dd9da891bbd7', '70cae195f8cd414d9015dc567ca36d99');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('3a4766e252b94e9ebd775e5ed37ad210', '71a6446b608747759d42dd9da891bbd7', '6455dc0f518a4d7f9ae985f0460d2e18');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('452be888d8e24d8c89702ca4b1849d2e', 'ff776679f44c4d4d97fed6f237812f1c', '7fb261c1301944a6858c42dc1e41214e');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('576f546c0e1c427bb6f6ff3ddac29e71', 'cecf2e894ad44fbcaf0380bac05f761e', '70cae195f8cd414d9015dc567ca36d99');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('72bf5435ff22480e946b07d7a3244f74', 'ff776679f44c4d4d97fed6f237812f1c', '70cae195f8cd414d9015dc567ca36d99');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('7aabc4ba970f4a26b70564e8119db24a', 'ff776679f44c4d4d97fed6f237812f1c', 'd1821b697f574e92b836ad453adf451c');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('8a32139bcd4245dcbec00014b098c97c', 'c143c35740db42028fcb1b49f941011e', 'a680b1d3f8224c33b30b70bc65586439');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('af8a8d3689e44b52a93ff65984a6eeb7', 'c143c35740db42028fcb1b49f941011e', 'a0898b9120634c74bb023765a9d3165c');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('b8b54b9348a24be19b5041ea4a8afbdc', '71a6446b608747759d42dd9da891bbd7', 'd1821b697f574e92b836ad453adf451c');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('bf2f34d5783248ae8cdee879f10b4fee', '71a6446b608747759d42dd9da891bbd7', '7fb261c1301944a6858c42dc1e41214e');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('e9ad25b25b1844c08d9cfac5ede8951b', 'cecf2e894ad44fbcaf0380bac05f761e', '2eb452410c604da59fa17b19482e7b8c');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('eec570774fe7446499e62775dc2ef06a', 'cecf2e894ad44fbcaf0380bac05f761e', 'd1821b697f574e92b836ad453adf451c');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('f30b71e692164175915ff898820578c2', 'cecf2e894ad44fbcaf0380bac05f761e', '6455dc0f518a4d7f9ae985f0460d2e18');

-- ----------------------------
-- Table structure for tbl_contacts_remark
-- ----------------------------
DROP TABLE IF EXISTS `tbl_contacts_remark`;
CREATE TABLE `tbl_contacts_remark` (
  `id` char(32) NOT NULL,
  `note_content` varchar(255) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` char(19) DEFAULT NULL,
  `edit_by` varchar(255) DEFAULT NULL,
  `edit_time` char(19) DEFAULT NULL,
  `edit_flag` char(1) DEFAULT NULL,
  `contacts_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_contacts_remark
-- ----------------------------
INSERT INTO `tbl_contacts_remark` VALUES ('0d40ec2fba074eacada07d14bf71c563', '你怎么你看关心你的Monstar', '06f5fc056eac41558a964f96daa7f27c', '2022-11-21 20:48:36', null, null, '0', '18792df55244483aab9195d8b420a208');
INSERT INTO `tbl_contacts_remark` VALUES ('1580a6707c2649ecb214ef6841cba541', '太强啦', '06f5fc056eac41558a964f96daa7f27c', '2022-11-21 17:54:37', null, null, '0', 'c143c35740db42028fcb1b49f941011e');
INSERT INTO `tbl_contacts_remark` VALUES ('199764ca93ef44ffbe413b92d562c662', '顶级控制，近地悬浮克星', '06f5fc056eac41558a964f96daa7f27c', '2022-11-21 17:55:59', '06f5fc056eac41558a964f96daa7f27c', '2022-11-21 17:56:14', '1', 'c143c35740db42028fcb1b49f941011e');
INSERT INTO `tbl_contacts_remark` VALUES ('23654047ad8541f0b054fb09ab59eb96', '顶级术士，单体最强', '06f5fc056eac41558a964f96daa7f27c', '2022-11-23 17:37:39', '06f5fc056eac41558a964f96daa7f27c', '2022-11-23 17:37:51', '1', '71a6446b608747759d42dd9da891bbd7');
INSERT INTO `tbl_contacts_remark` VALUES ('680f93523a9e434dabe5f2951147cfc8', '仙术杯100%的含金量', '06f5fc056eac41558a964f96daa7f27c', '2022-11-21 17:41:50', null, null, '0', 'c143c35740db42028fcb1b49f941011e');
INSERT INTO `tbl_contacts_remark` VALUES ('8c24e5fee0c34306b3439a4acd510874', '别老关注Monstar了', '06f5fc056eac41558a964f96daa7f27c', '2022-11-21 20:48:48', null, null, '0', '18792df55244483aab9195d8b420a208');
INSERT INTO `tbl_contacts_remark` VALUES ('e7a0f1d1131f473a916ee5d8a77b404f', '额哒哒哒哒', '06f5fc056eac41558a964f96daa7f27c', '2022-06-14 18:50:20', '06f5fc056eac41558a964f96daa7f27c', '2022-11-20 15:31:13', '1', '8012cd0db5d14655b6424f04754f73f1');

-- ----------------------------
-- Table structure for tbl_customer
-- ----------------------------
DROP TABLE IF EXISTS `tbl_customer`;
CREATE TABLE `tbl_customer` (
  `id` char(32) NOT NULL,
  `owner` char(32) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` char(19) DEFAULT NULL,
  `edit_by` varchar(255) DEFAULT NULL,
  `edit_time` char(19) DEFAULT NULL,
  `contact_summary` varchar(255) DEFAULT NULL,
  `next_contact_time` char(10) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_customer
-- ----------------------------
INSERT INTO `tbl_customer` VALUES ('019a5a162c7a4ea1a483de92c61f69c8', '06f5fc056eac41558a964f96daa7f27c', '柯蓝贸易', '132@qq.com', '64564', '06f5fc056eac41558a964f96daa7f27c', '2022-06-14 23:12:01', null, null, null, null, null, null);
INSERT INTO `tbl_customer` VALUES ('678d1d7c8b4d4a5da502ed222b53a87e', '06f5fc056eac41558a964f96daa7f27c', '克朗', '156315@163.com', '6456', '06f5fc056eac41558a964f96daa7f27c', '2022-06-16 12:30:26', '06f5fc056eac41558a964f96daa7f27c', '2022-11-19 18:28:57', '妮可妮可', '2022-06-18', 'Nike', '黄金');
INSERT INTO `tbl_customer` VALUES ('7cef319837324b80ae4e07ce5d1a8ae3', '06f5fc056eac41558a964f96daa7f27c', '领袖部队', '1563906465@qq.com', '666-66666666', '06f5fc056eac41558a964f96daa7f27c', '2022-12-04 21:10:30', '06f5fc056eac41558a964f96daa7f27c', '2022-12-04 21:11:11', '推拉坑', '2022-12-10', '重量太轻', '整合部队');
INSERT INTO `tbl_customer` VALUES ('7e8f15463c224ea285141fedeaa1aa1a', '06f5fc056eac41558a964f96daa7f27c', '深境螺旋', '米哈游', '321312', '06f5fc056eac41558a964f96daa7f27c', '2022-11-19 20:29:19', '06f5fc056eac41558a964f96daa7f27c', '2022-11-19 20:40:59', '你凝视深渊', '2022-06-06', '深渊凝视你', '深渊螺旋');
INSERT INTO `tbl_customer` VALUES ('893be3dbf45f4d7e80339f2d936b2281', '06f5fc056eac41558a964f96daa7f27c', '整合部队', '465@gmail.com', '12312', '06f5fc056eac41558a964f96daa7f27c', '2022-06-15 11:10:54', null, null, null, null, null, null);
INSERT INTO `tbl_customer` VALUES ('ae77aca081374d9c8bd78897919a0756', '06f5fc056eac41558a964f96daa7f27c', '斗阵血脉', '鲜蔬杯', '123123', '06f5fc056eac41558a964f96daa7f27c', '2022-11-19 20:25:38', '06f5fc056eac41558a964f96daa7f27c', '2022-11-19 20:28:00', '刀舞', '2022-06-18', '老爷子', '龙门新街');
INSERT INTO `tbl_customer` VALUES ('c89a7a962ef04f44a3ae29ce11da8bf8', '06f5fc056eac41558a964f96daa7f27c', '龙门新兴街', '1563906465@qq.com', '666-66666666', '06f5fc056eac41558a964f96daa7f27c', '2022-11-21 15:56:23', '06f5fc056eac41558a964f96daa7f27c', '2022-11-29 17:38:39', '1560哥', '2022-06-06', '1750哥', '龙门新街大道');
INSERT INTO `tbl_customer` VALUES ('d5387e10a70e4225869080c2707d2c20', '06f5fc056eac41558a964f96daa7f27c', '罗德岛', '1563906465@qq.com', '666-66666666', '06f5fc056eac41558a964f96daa7f27c', '2022-06-12 16:48:34', null, null, '粉末啊', '2022-06-23', '粉末啊', '粉末啊');
INSERT INTO `tbl_customer` VALUES ('dd087e25e1b94f0290c0062318f10387', '06f5fc056eac41558a964f96daa7f27c', '仙术杯', '鲜蔬杯', '123123', '06f5fc056eac41558a964f96daa7f27c', '2022-11-19 20:22:24', '06f5fc056eac41558a964f96daa7f27c', '2022-11-19 20:22:45', 'maybe', '2022-06-18', 'maybe', '龙哥哥');
INSERT INTO `tbl_customer` VALUES ('f39bc054ac1b4afab7b53bf8b33e6c89', '06f5fc056eac41558a964f96daa7f27c', '毒王争霸赛', '鲜蔬杯', '123123', '06f5fc056eac41558a964f96daa7f27c', '2022-11-19 20:24:09', null, null, null, null, '误入奇境', '');
INSERT INTO `tbl_customer` VALUES ('f6594241cdb748e38c96925ccb304e00', '06f5fc056eac41558a964f96daa7f27c', '龙门', '46546@163.com', '87686', '06f5fc056eac41558a964f96daa7f27c', '2022-06-16 12:31:16', '06f5fc056eac41558a964f96daa7f27c', '2022-11-19 19:53:50', '冷漠啦啦啦', '2022-06-18', '啦啦啦', '龙门新街');

-- ----------------------------
-- Table structure for tbl_customer_remark
-- ----------------------------
DROP TABLE IF EXISTS `tbl_customer_remark`;
CREATE TABLE `tbl_customer_remark` (
  `id` char(32) NOT NULL,
  `note_content` varchar(255) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` char(19) DEFAULT NULL,
  `edit_by` varchar(255) DEFAULT NULL,
  `edit_time` char(19) DEFAULT NULL,
  `edit_flag` char(1) DEFAULT NULL,
  `customer_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_customer_remark
-- ----------------------------
INSERT INTO `tbl_customer_remark` VALUES ('123', '太难了，好呐', '40f6cdea0bd34aceb77492a1656d9fb3', '2022-06-12 18:25:34', '06f5fc056eac41558a964f96daa7f27c', '2022-11-21 14:44:47', '1', '7e8f15463c224ea285141fedeaa1aa1a');
INSERT INTO `tbl_customer_remark` VALUES ('3a7de8399a424142a7cf3d94e7854207', '血量厚', '06f5fc056eac41558a964f96daa7f27c', '2022-11-20 16:32:43', null, null, '0', '7e8f15463c224ea285141fedeaa1aa1a');
INSERT INTO `tbl_customer_remark` VALUES ('86404530a8d44949a74a7853fe2125ef', '好难', '06f5fc056eac41558a964f96daa7f27c', '2022-11-20 16:32:27', null, null, '0', '7e8f15463c224ea285141fedeaa1aa1a');
INSERT INTO `tbl_customer_remark` VALUES ('b076fefcb9d14b448637157712056db2', '太脆了', '06f5fc056eac41558a964f96daa7f27c', '2022-12-04 21:11:20', null, null, '0', '7cef319837324b80ae4e07ce5d1a8ae3');
INSERT INTO `tbl_customer_remark` VALUES ('c477bdf8c0044d929ab09aa85b1a5152', '额哒哒哒哒', '06f5fc056eac41558a964f96daa7f27c', '2022-06-14 18:50:20', '06f5fc056eac41558a964f96daa7f27c', '2022-11-20 15:31:13', '1', '8012cd0db5d14655b6424f04754f73f1');
INSERT INTO `tbl_customer_remark` VALUES ('ecc1edf9745b4cf291042b9a233dbdff', '生存压力大，护盾也顶不住', '06f5fc056eac41558a964f96daa7f27c', '2022-11-20 16:37:52', '06f5fc056eac41558a964f96daa7f27c', '2022-11-20 16:51:15', '1', '7e8f15463c224ea285141fedeaa1aa1a');

-- ----------------------------
-- Table structure for tbl_dic_type
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dic_type`;
CREATE TABLE `tbl_dic_type` (
  `code` varchar(255) NOT NULL COMMENT '编码是主键，不能为空，不能含有中文。',
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_dic_type
-- ----------------------------
INSERT INTO `tbl_dic_type` VALUES ('appellation', '称呼', '');
INSERT INTO `tbl_dic_type` VALUES ('clueState', '线索状态', '');
INSERT INTO `tbl_dic_type` VALUES ('returnPriority', '回访优先级', '');
INSERT INTO `tbl_dic_type` VALUES ('returnState', '回访状态', '');
INSERT INTO `tbl_dic_type` VALUES ('source', '来源', '');
INSERT INTO `tbl_dic_type` VALUES ('stage', '阶段', '');
INSERT INTO `tbl_dic_type` VALUES ('transactionType', '交易类型', '');

-- ----------------------------
-- Table structure for tbl_dic_value
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dic_value`;
CREATE TABLE `tbl_dic_value` (
  `id` char(32) NOT NULL COMMENT '主键，采用UUID',
  `value` varchar(255) DEFAULT NULL COMMENT '不能为空，并且要求同一个字典类型下字典值不能重复，具有唯一性。',
  `text` varchar(255) DEFAULT NULL COMMENT '可以为空',
  `order_no` varchar(255) DEFAULT NULL COMMENT '可以为空，但不为空的时候，要求必须是正整数',
  `type_code` varchar(255) DEFAULT NULL COMMENT '外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_dic_value
-- ----------------------------
INSERT INTO `tbl_dic_value` VALUES ('06e3cbdf10a44eca8511dddfc6896c55', '虚假线索', '虚假线索', '4', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('0fe33840c6d84bf78df55d49b169a894', '销售邮件', '销售邮件', '8', 'source');
INSERT INTO `tbl_dic_value` VALUES ('12302fd42bd349c1bb768b19600e6b20', '交易会', '交易会', '11', 'source');
INSERT INTO `tbl_dic_value` VALUES ('1615f0bb3e604552a86cde9a2ad45bea', '最高', '最高', '2', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('176039d2a90e4b1a81c5ab8707268636', '教授', '教授', '5', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('1e0bd307e6ee425599327447f8387285', '将来联系', '将来联系', '2', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('2173663b40b949ce928db92607b5fe57', '丢失线索', '丢失线索', '5', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('2876690b7e744333b7f1867102f91153', '未启动', '未启动', '1', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('29805c804dd94974b568cfc9017b2e4c', '成交', '成交', '7', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('310e6a49bd8a4962b3f95a1d92eb76f4', '试图联系', '试图联系', '1', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('31539e7ed8c848fc913e1c2c93d76fd1', '博士', '博士', '4', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('37ef211719134b009e10b7108194cf46', '资质审查', '资质审查', '1', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('391807b5324d4f16bd58c882750ee632', '丢失的线索', '丢失的线索', '8', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('3a39605d67da48f2a3ef52e19d243953', '聊天', '聊天', '14', 'source');
INSERT INTO `tbl_dic_value` VALUES ('474ab93e2e114816abf3ffc596b19131', '低', '低', '3', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('48512bfed26145d4a38d3616e2d2cf79', '广告', '广告', '1', 'source');
INSERT INTO `tbl_dic_value` VALUES ('4d03a42898684135809d380597ed3268', '合作伙伴研讨会', '合作伙伴研讨会', '9', 'source');
INSERT INTO `tbl_dic_value` VALUES ('59795c49896947e1ab61b7312bd0597c', '先生', '先生', '1', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('5c6e9e10ca414bd499c07b886f86202a', '高', '高', '1', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('67165c27076e4c8599f42de57850e39c', '夫人', '夫人', '2', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('68a1b1e814d5497a999b8f1298ace62b', '因竞争丢失关闭', '因竞争丢失关闭', '9', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('6b86f215e69f4dbd8a2daa22efccf0cf', 'web调研', 'web调研', '13', 'source');
INSERT INTO `tbl_dic_value` VALUES ('72f13af8f5d34134b5b3f42c5d477510', '合作伙伴', '合作伙伴', '6', 'source');
INSERT INTO `tbl_dic_value` VALUES ('7c07db3146794c60bf975749952176df', '未联系', '未联系', '6', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('86c56aca9eef49058145ec20d5466c17', '内部研讨会', '内部研讨会', '10', 'source');
INSERT INTO `tbl_dic_value` VALUES ('9095bda1f9c34f098d5b92fb870eba17', '进行中', '进行中', '3', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('954b410341e7433faa468d3c4f7cf0d2', '已有业务', '已有业务', '1', 'transactionType');
INSERT INTO `tbl_dic_value` VALUES ('966170ead6fa481284b7d21f90364984', '已联系', '已联系', '3', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('96b03f65dec748caa3f0b6284b19ef2f', '推迟', '推迟', '2', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('97d1128f70294f0aac49e996ced28c8a', '新业务', '新业务', '2', 'transactionType');
INSERT INTO `tbl_dic_value` VALUES ('9ca96290352c40688de6596596565c12', '完成', '完成', '4', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('9e6d6e15232549af853e22e703f3e015', '需要条件', '需要条件', '7', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('9ff57750fac04f15b10ce1bbb5bb8bab', '需求分析', '需求分析', '2', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('a70dc4b4523040c696f4421462be8b2f', '等待某人', '等待某人', '5', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('a83e75ced129421dbf11fab1f05cf8b4', '推销电话', '推销电话', '2', 'source');
INSERT INTO `tbl_dic_value` VALUES ('ab8472aab5de4ae9b388b2f1409441c1', '常规', '常规', '5', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('ab8c2a3dc05f4e3dbc7a0405f721b040', '提案/报价', '提案/报价', '5', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('b924d911426f4bc5ae3876038bc7e0ad', 'web下载', 'web下载', '12', 'source');
INSERT INTO `tbl_dic_value` VALUES ('c13ad8f9e2f74d5aa84697bb243be3bb', '价值建议', '价值建议', '3', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('c83c0be184bc40708fd7b361b6f36345', '最低', '最低', '4', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('db867ea866bc44678ac20c8a4a8bfefb', '员工介绍', '员工介绍', '3', 'source');
INSERT INTO `tbl_dic_value` VALUES ('e44be1d99158476e8e44778ed36f4355', '确定决策者', '确定决策者', '4', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('e5f383d2622b4fc0959f4fe131dafc80', '女士', '女士', '3', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('e81577d9458f4e4192a44650a3a3692b', '谈判/复审', '谈判/复审', '6', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('fb65d7fdb9c6483db02713e6bc05dd19', '在线商场', '在线商场', '5', 'source');
INSERT INTO `tbl_dic_value` VALUES ('fd677cc3b5d047d994e16f6ece4d3d45', '公开媒介', '公开媒介', '7', 'source');
INSERT INTO `tbl_dic_value` VALUES ('ff802a03ccea4ded8731427055681d48', '外部介绍', '外部介绍', '4', 'source');

-- ----------------------------
-- Table structure for tbl_tran
-- ----------------------------
DROP TABLE IF EXISTS `tbl_tran`;
CREATE TABLE `tbl_tran` (
  `id` char(32) NOT NULL,
  `owner` char(32) DEFAULT NULL,
  `money` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `expected_date` char(10) DEFAULT NULL,
  `customer_id` char(32) DEFAULT NULL,
  `stage` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `activity_id` char(32) DEFAULT NULL,
  `contacts_id` char(32) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` char(19) DEFAULT NULL,
  `edit_by` varchar(255) DEFAULT NULL,
  `edit_time` char(19) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `contact_summary` varchar(255) DEFAULT NULL,
  `next_contact_time` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_tran
-- ----------------------------
INSERT INTO `tbl_tran` VALUES ('0fb585489a5e4773a928d5c6b8086e05', '06f5fc056eac41558a964f96daa7f27c', '33332', '罗德岛-测试的转换交易01', '2022-07-01', 'd5387e10a70e4225869080c2707d2c20', 'e44be1d99158476e8e44778ed36f4355', '97d1128f70294f0aac49e996ced28c8a', '12302fd42bd349c1bb768b19600e6b20', '6455dc0f518a4d7f9ae985f0460d2e18', '71a6446b608747759d42dd9da891bbd7', '06f5fc056eac41558a964f96daa7f27c', '2022-06-12 16:48:34', '06f5fc056eac41558a964f96daa7f27c', '2022-11-23 15:41:39', '描述测试0222', '描述测试0222', '2022-04-04');
INSERT INTO `tbl_tran` VALUES ('1243f910beb140669822b628268200f1', '06f5fc056eac41558a964f96daa7f27c', '66666', '蓝灯贸易', '2022-02-02', 'd5387e10a70e4225869080c2707d2c20', 'ab8c2a3dc05f4e3dbc7a0405f721b040', '954b410341e7433faa468d3c4f7cf0d2', 'db867ea866bc44678ac20c8a4a8bfefb', '70cae195f8cd414d9015dc567ca36d99', '71a6446b608747759d42dd9da891bbd7', '06f5fc056eac41558a964f96daa7f27c', '2022-11-22 20:47:37', null, null, '兰登', '工会体系', '2022-06-06');
INSERT INTO `tbl_tran` VALUES ('2b96bf00232d4333b7ce207d5a13d9d2', '06f5fc056eac41558a964f96daa7f27c', '55555', '交易测试05', '2022-02-02', '678d1d7c8b4d4a5da502ed222b53a87e', 'c13ad8f9e2f74d5aa84697bb243be3bb', '97d1128f70294f0aac49e996ced28c8a', 'b924d911426f4bc5ae3876038bc7e0ad', '1117335e166741f88063ae6afe38c0f2', '71a6446b608747759d42dd9da891bbd7', '06f5fc056eac41558a964f96daa7f27c', '2022-06-16 12:30:26', null, null, '交易测试05', '交易测试05', '2022-03-03');
INSERT INTO `tbl_tran` VALUES ('2f785f74c6ca440d8229500d42ce3f3c', '06f5fc056eac41558a964f96daa7f27c', '66666', '交易测试06', '2022-02-02', 'f6594241cdb748e38c96925ccb304e00', 'e44be1d99158476e8e44778ed36f4355', '97d1128f70294f0aac49e996ced28c8a', 'ff802a03ccea4ded8731427055681d48', '1117335e166741f88063ae6afe38c0f2', '71a6446b608747759d42dd9da891bbd7', '06f5fc056eac41558a964f96daa7f27c', '2022-06-16 12:31:16', null, null, '交易测试06', '交易测试06', '2022-06-06');
INSERT INTO `tbl_tran` VALUES ('310f687aa7b24126896cb5409ecbd2f6', '06f5fc056eac41558a964f96daa7f27c', '33333', '交易测试0111', '2022-02-02', '019a5a162c7a4ea1a483de92c61f69c8', 'ab8c2a3dc05f4e3dbc7a0405f721b040', '97d1128f70294f0aac49e996ced28c8a', '12302fd42bd349c1bb768b19600e6b20', '1117335e166741f88063ae6afe38c0f2', '71a6446b608747759d42dd9da891bbd7', '06f5fc056eac41558a964f96daa7f27c', '2022-06-14 23:12:01', '06f5fc056eac41558a964f96daa7f27c', '2022-12-04 16:39:04', '描述测试0111', '描述测试0111', '2022-03-03');
INSERT INTO `tbl_tran` VALUES ('394a6d3e504c4319a8d40f431d5270a6', '06f5fc056eac41558a964f96daa7f27c', '66666', '123', '2022-02-02', 'd5387e10a70e4225869080c2707d2c20', '391807b5324d4f16bd58c882750ee632', '97d1128f70294f0aac49e996ced28c8a', 'b924d911426f4bc5ae3876038bc7e0ad', 'b359363c2a2640ce808ceacef76a313b', '71a6446b608747759d42dd9da891bbd7', '06f5fc056eac41558a964f96daa7f27c', '2022-11-22 18:12:11', '06f5fc056eac41558a964f96daa7f27c', '2022-11-23 14:53:07', '123', '123', '2022-06-06');
INSERT INTO `tbl_tran` VALUES ('6d5e4a89c4ed47009faeedf594dc987d', '06f5fc056eac41558a964f96daa7f27c', '8888', '领袖部队-君君的交易', '2022-12-17', '7cef319837324b80ae4e07ce5d1a8ae3', 'c13ad8f9e2f74d5aa84697bb243be3bb', '97d1128f70294f0aac49e996ced28c8a', 'b924d911426f4bc5ae3876038bc7e0ad', '7fb261c1301944a6858c42dc1e41214e', 'ff776679f44c4d4d97fed6f237812f1c', '06f5fc056eac41558a964f96daa7f27c', '2022-12-04 21:10:30', null, null, null, null, null);
INSERT INTO `tbl_tran` VALUES ('7721b2c049fa4933bc333a7b35aee80b', '06f5fc056eac41558a964f96daa7f27c', '99999', '龙门-测试交易011', '2020-02-02', '893be3dbf45f4d7e80339f2d936b2281', 'e44be1d99158476e8e44778ed36f4355', '97d1128f70294f0aac49e996ced28c8a', '12302fd42bd349c1bb768b19600e6b20', '1117335e166741f88063ae6afe38c0f2', '71a6446b608747759d42dd9da891bbd7', '06f5fc056eac41558a964f96daa7f27c', '2022-06-15 11:10:54', null, null, '龙门-测试交易0111111', '龙门-测试交易0111111', '2022-02-03');
INSERT INTO `tbl_tran` VALUES ('dbd381ad86af43a0b6da80422de6aae6', '06f5fc056eac41558a964f96daa7f27c', '66666', '兰登贸易', '2022-02-02', 'dd087e25e1b94f0290c0062318f10387', 'e44be1d99158476e8e44778ed36f4355', '97d1128f70294f0aac49e996ced28c8a', '6b86f215e69f4dbd8a2daa22efccf0cf', 'a680b1d3f8224c33b30b70bc65586439', '71a6446b608747759d42dd9da891bbd7', '06f5fc056eac41558a964f96daa7f27c', '2022-12-04 15:34:09', '06f5fc056eac41558a964f96daa7f27c', '2022-12-04 15:42:21', '酒', '攻回酒', '2022-12-08');
INSERT INTO `tbl_tran` VALUES ('f0060938a313411182d3e21d26dc03c8', '06f5fc056eac41558a964f96daa7f27c', '66666', '仙术杯决赛', '2022-02-03', 'dd087e25e1b94f0290c0062318f10387', '29805c804dd94974b568cfc9017b2e4c', '97d1128f70294f0aac49e996ced28c8a', 'b924d911426f4bc5ae3876038bc7e0ad', '69cbde6bafad42ea8dacd1289589b3df', '71a6446b608747759d42dd9da891bbd7', '06f5fc056eac41558a964f96daa7f27c', '2022-11-23 14:16:36', null, null, '术特绝活', '流星飞', '2022-06-06');
INSERT INTO `tbl_tran` VALUES ('f07082d528ac4ebe93886ceaecbc280b', '06f5fc056eac41558a964f96daa7f27c', '443321', '龙门大道贸易', '2022-02-02', '893be3dbf45f4d7e80339f2d936b2281', '29805c804dd94974b568cfc9017b2e4c', '954b410341e7433faa468d3c4f7cf0d2', '72f13af8f5d34134b5b3f42c5d477510', '6455dc0f518a4d7f9ae985f0460d2e18', '18792df55244483aab9195d8b420a208', '06f5fc056eac41558a964f96daa7f27c', '2022-11-22 18:05:03', null, null, '龙门新街', '燕国', '2022-06-06');

-- ----------------------------
-- Table structure for tbl_tran_history
-- ----------------------------
DROP TABLE IF EXISTS `tbl_tran_history`;
CREATE TABLE `tbl_tran_history` (
  `id` char(32) NOT NULL,
  `stage` varchar(255) DEFAULT NULL,
  `money` varchar(255) DEFAULT NULL,
  `expected_date` char(10) DEFAULT NULL,
  `create_time` char(19) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `tran_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_tran_history
-- ----------------------------
INSERT INTO `tbl_tran_history` VALUES ('17875a6fef594e72870fa0ebf54183c7', 'e81577d9458f4e4192a44650a3a3692b', '66666', '2022-02-02', '2022-11-22 18:07:23', '06f5fc056eac41558a964f96daa7f27c', '084e1c1675c24e34a6a91c28932dee20');
INSERT INTO `tbl_tran_history` VALUES ('2302b392c201483882452a79aadc67d3', 'e44be1d99158476e8e44778ed36f4355', '66666', '2022-02-02', '2022-11-22 20:57:31', '06f5fc056eac41558a964f96daa7f27c', '3744d26f8b99435c8a43a6ceacdec3b7');
INSERT INTO `tbl_tran_history` VALUES ('23a6b5dbfaf4453e854b4b40e8bdf236', 'ab8c2a3dc05f4e3dbc7a0405f721b040', '66666', '2022-02-02', '2022-11-22 20:47:37', '06f5fc056eac41558a964f96daa7f27c', 'f516d5a785b6443ba4fffdd5c95a8d2e');
INSERT INTO `tbl_tran_history` VALUES ('2712a6cd534f4495b3a4450ed74cd7cf', 'e44be1d99158476e8e44778ed36f4355', '33332', '2022-07-01', '2022-11-23 15:41:39', '06f5fc056eac41558a964f96daa7f27c', '0fb585489a5e4773a928d5c6b8086e05');
INSERT INTO `tbl_tran_history` VALUES ('2807585aa2744d33acb92bf7d6375b05', 'e44be1d99158476e8e44778ed36f4355', '99999', '2020-02-02', '2022-06-15 11:10:54', '06f5fc056eac41558a964f96daa7f27c', '7721b2c049fa4933bc333a7b35aee80b');
INSERT INTO `tbl_tran_history` VALUES ('309c53796f874ebf92389a193101b0e8', '29805c804dd94974b568cfc9017b2e4c', '66666', '2022-02-02', '2022-11-23 14:46:34', '06f5fc056eac41558a964f96daa7f27c', '394a6d3e504c4319a8d40f431d5270a6');
INSERT INTO `tbl_tran_history` VALUES ('3833316e9faf411c81ec592f1773abf4', '9ff57750fac04f15b10ce1bbb5bb8bab', '66666', '2022-02-02', '2022-11-29 17:40:42', '06f5fc056eac41558a964f96daa7f27c', '40d65d2c48924b3e97938552683ca925');
INSERT INTO `tbl_tran_history` VALUES ('431543f1c10d48c39f16e94b8fe78dc7', 'ab8c2a3dc05f4e3dbc7a0405f721b040', '66666', '2022-02-02', '2022-11-22 20:47:37', '06f5fc056eac41558a964f96daa7f27c', '1243f910beb140669822b628268200f1');
INSERT INTO `tbl_tran_history` VALUES ('485149252a694d45ab2a684ca6239c9f', '29805c804dd94974b568cfc9017b2e4c', '66666', '2022-02-02', '2022-11-23 14:45:52', '06f5fc056eac41558a964f96daa7f27c', '394a6d3e504c4319a8d40f431d5270a6');
INSERT INTO `tbl_tran_history` VALUES ('48d02e02ce7b44afb71e7e43541884d5', '29805c804dd94974b568cfc9017b2e4c', '66666', '2022-02-02', '2022-11-22 18:12:11', '06f5fc056eac41558a964f96daa7f27c', '394a6d3e504c4319a8d40f431d5270a6');
INSERT INTO `tbl_tran_history` VALUES ('4e3e4d12cf3248c587a5b264f461176c', 'e44be1d99158476e8e44778ed36f4355', '66666', '2022-02-02', '2022-12-04 15:42:21', '06f5fc056eac41558a964f96daa7f27c', 'dbd381ad86af43a0b6da80422de6aae6');
INSERT INTO `tbl_tran_history` VALUES ('56d7ca0773c741bb9743a91614c6ccc6', '391807b5324d4f16bd58c882750ee632', '66666', '2022-02-02', '2022-11-23 14:53:07', '06f5fc056eac41558a964f96daa7f27c', '394a6d3e504c4319a8d40f431d5270a6');
INSERT INTO `tbl_tran_history` VALUES ('5cb8da59a831434286b068ae2bdd5bbf', 'e44be1d99158476e8e44778ed36f4355', '66666', '2022-02-02', '2022-12-04 15:34:32', '06f5fc056eac41558a964f96daa7f27c', 'dbd381ad86af43a0b6da80422de6aae6');
INSERT INTO `tbl_tran_history` VALUES ('62050c048574451586434c281f093746', 'e44be1d99158476e8e44778ed36f4355', '66666', '2022-02-02', '2022-12-04 15:36:58', '06f5fc056eac41558a964f96daa7f27c', 'dbd381ad86af43a0b6da80422de6aae6');
INSERT INTO `tbl_tran_history` VALUES ('7cc91fe4f4454f5a9289b2a2101b6436', 'e44be1d99158476e8e44778ed36f4355', '66666', '2022-02-02', '2022-12-04 15:42:17', '06f5fc056eac41558a964f96daa7f27c', 'dbd381ad86af43a0b6da80422de6aae6');
INSERT INTO `tbl_tran_history` VALUES ('80e7a83dfe574ab498b5ca43502681f3', 'ab8c2a3dc05f4e3dbc7a0405f721b040', '33333', '2022-02-02', '2022-12-04 16:39:04', '06f5fc056eac41558a964f96daa7f27c', '310f687aa7b24126896cb5409ecbd2f6');
INSERT INTO `tbl_tran_history` VALUES ('861b32c235934fc6ad1650925e5c01b5', 'e44be1d99158476e8e44778ed36f4355', '66666', '2022-02-02', '2022-06-16 12:31:16', '06f5fc056eac41558a964f96daa7f27c', '2f785f74c6ca440d8229500d42ce3f3c');
INSERT INTO `tbl_tran_history` VALUES ('a56e83ec5bf2424d8e69430516e80ed3', 'e44be1d99158476e8e44778ed36f4355', '33333', '2022-02-02', '2022-12-04 16:38:59', '06f5fc056eac41558a964f96daa7f27c', '310f687aa7b24126896cb5409ecbd2f6');
INSERT INTO `tbl_tran_history` VALUES ('a5a1076dcad34fcaba86e333080fb4bd', 'ab8c2a3dc05f4e3dbc7a0405f721b040', '66666', '2022-02-02', '2022-11-22 20:57:56', '06f5fc056eac41558a964f96daa7f27c', 'ac0e9e6e62f446a4b19eac1a0d6df2a8');
INSERT INTO `tbl_tran_history` VALUES ('ab43fc3f1a914e2b98c6ad12e48fa576', '29805c804dd94974b568cfc9017b2e4c', '66666', '2022-02-02', '2022-11-23 14:46:15', '06f5fc056eac41558a964f96daa7f27c', '394a6d3e504c4319a8d40f431d5270a6');
INSERT INTO `tbl_tran_history` VALUES ('ac2773e7503c4e1f85ec79bf1748a37e', '29805c804dd94974b568cfc9017b2e4c', '443321', '2022-02-02', '2022-11-22 18:05:03', '06f5fc056eac41558a964f96daa7f27c', 'f07082d528ac4ebe93886ceaecbc280b');
INSERT INTO `tbl_tran_history` VALUES ('ae3722d38adb4dc1bbecbf361a38fd95', 'e81577d9458f4e4192a44650a3a3692b', '66666', '2022-02-02', '2022-11-22 20:48:53', '06f5fc056eac41558a964f96daa7f27c', 'a9df973ec7394e5cbf54fbb2058be358');
INSERT INTO `tbl_tran_history` VALUES ('c049640ac016481c95d3d0b9eb54c92b', '29805c804dd94974b568cfc9017b2e4c', '66666', '2022-02-02', '2022-11-23 14:39:37', '06f5fc056eac41558a964f96daa7f27c', '3d43876aad4e450a9a9042aecf7d50f6');
INSERT INTO `tbl_tran_history` VALUES ('c39a9711744b4f8aa637106b6b1f432c', '29805c804dd94974b568cfc9017b2e4c', '66666', '2022-02-02', '2022-11-23 14:16:36', '06f5fc056eac41558a964f96daa7f27c', 'f0060938a313411182d3e21d26dc03c8');
INSERT INTO `tbl_tran_history` VALUES ('c6b882a7538c4c6cbb01db6511fa0795', 'c13ad8f9e2f74d5aa84697bb243be3bb', '66666', '2022-02-02', '2022-11-22 15:05:35', '06f5fc056eac41558a964f96daa7f27c', 'b2b0855c580045a79fe62ee4d0c06363');
INSERT INTO `tbl_tran_history` VALUES ('c920805185fd451aafa2d25c38942490', 'c13ad8f9e2f74d5aa84697bb243be3bb', '55555', '2022-02-02', '2022-06-16 12:30:26', '06f5fc056eac41558a964f96daa7f27c', '2b96bf00232d4333b7ce207d5a13d9d2');
INSERT INTO `tbl_tran_history` VALUES ('cd3c1ea997b04023ab7315683149f4b5', 'e44be1d99158476e8e44778ed36f4355', '66666', '2022-02-02', '2022-12-04 15:34:09', '06f5fc056eac41558a964f96daa7f27c', 'dbd381ad86af43a0b6da80422de6aae6');
INSERT INTO `tbl_tran_history` VALUES ('e09efdc919a54e419e641ae6fe94c0a5', '29805c804dd94974b568cfc9017b2e4c', '66666', '2022-02-02', '2022-11-23 14:32:34', '06f5fc056eac41558a964f96daa7f27c', 'ff01961634a94f9fbbc0d33992f561f7');
INSERT INTO `tbl_tran_history` VALUES ('e6a39028db81483ca4914695e6c1710a', '29805c804dd94974b568cfc9017b2e4c', '66666', '2022-02-02', '2022-11-23 14:45:06', '06f5fc056eac41558a964f96daa7f27c', '74f336c97284451698b029330f821989');
INSERT INTO `tbl_tran_history` VALUES ('ec814e7de66c4fac81f8cb46cf96290e', '29805c804dd94974b568cfc9017b2e4c', '66666', '2022-02-02', '2022-11-23 14:38:48', '06f5fc056eac41558a964f96daa7f27c', 'e1dc484cde5944a3a937e739702d9080');
INSERT INTO `tbl_tran_history` VALUES ('ec937c39549048b9aa79447ff399dc97', 'c13ad8f9e2f74d5aa84697bb243be3bb', '3333', '2022-07-01', '2022-11-23 15:41:09', '06f5fc056eac41558a964f96daa7f27c', '0fb585489a5e4773a928d5c6b8086e05');
INSERT INTO `tbl_tran_history` VALUES ('f33db619a6ed415faf01ead69f8ae5aa', 'e44be1d99158476e8e44778ed36f4355', '66666', '2022-02-02', '2022-11-22 17:05:33', '06f5fc056eac41558a964f96daa7f27c', '73dc6ee709f248859dcfb4ed724a1197');
INSERT INTO `tbl_tran_history` VALUES ('f8ed60a163ac43e9946f661f74b7bbc1', 'e44be1d99158476e8e44778ed36f4355', '66666', '2022-02-02', '2022-12-04 15:35:21', '06f5fc056eac41558a964f96daa7f27c', 'dbd381ad86af43a0b6da80422de6aae6');
INSERT INTO `tbl_tran_history` VALUES ('fa3154ec63fc4b928f665176445da216', 'c13ad8f9e2f74d5aa84697bb243be3bb', '66666', '2022-02-02', '2022-11-22 15:14:21', '06f5fc056eac41558a964f96daa7f27c', 'e618ab00c9d54505ad970544ac90889f');
INSERT INTO `tbl_tran_history` VALUES ('fdb8104f20aa4109ba8ea2bddf4558dd', '29805c804dd94974b568cfc9017b2e4c', '66666', '2022-02-02', '2022-11-23 14:41:28', '06f5fc056eac41558a964f96daa7f27c', 'a808cc638f654fa386659ad93dbe8aba');

-- ----------------------------
-- Table structure for tbl_tran_remark
-- ----------------------------
DROP TABLE IF EXISTS `tbl_tran_remark`;
CREATE TABLE `tbl_tran_remark` (
  `id` char(32) NOT NULL,
  `note_content` varchar(255) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` char(19) DEFAULT NULL,
  `edit_by` varchar(255) DEFAULT NULL,
  `edit_time` char(19) DEFAULT NULL,
  `edit_flag` char(1) DEFAULT NULL,
  `tran_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_tran_remark
-- ----------------------------
INSERT INTO `tbl_tran_remark` VALUES ('1f989d2b9669433696e0d441940da277', '额哒哒哒哒', '06f5fc056eac41558a964f96daa7f27c', '2022-06-14 18:50:20', '06f5fc056eac41558a964f96daa7f27c', '2022-11-20 15:31:13', '1', '6ee54c3f4a9445d5ba7fdb2855c57d0a');
INSERT INTO `tbl_tran_remark` VALUES ('443f61cb82214494b4e89d26cf156672', '备注测试01', '06f5fc056eac41558a964f96daa7f27c', '2021-11-30 23:50:55', null, null, '0', '0fb585489a5e4773a928d5c6b8086e05');
INSERT INTO `tbl_tran_remark` VALUES ('4963e355b5004f97b6c7215b1109f19f', '123', '06f5fc056eac41558a964f96daa7f27c', '2022-11-23 15:40:49', null, null, '0', '0fb585489a5e4773a928d5c6b8086e05');
INSERT INTO `tbl_tran_remark` VALUES ('a7476a170ed14d8f9d3e81a6a1d26d6c', '1123123嗡嗡嗡', '06f5fc056eac41558a964f96daa7f27c', '2022-11-23 15:30:10', '06f5fc056eac41558a964f96daa7f27c', '2022-11-23 15:30:14', '1', '394a6d3e504c4319a8d40f431d5270a6');
INSERT INTO `tbl_tran_remark` VALUES ('c3e6a2d9621744fd9a9f0279ce404cd5', '备注测试02', '06f5fc056eac41558a964f96daa7f27c', '2021-11-30 23:50:55', null, null, '0', '0fb585489a5e4773a928d5c6b8086e05');

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `id` char(32) NOT NULL COMMENT 'uuid\r\n            ',
  `login_act` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `login_pwd` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码不能采用明文存储，采用密文，MD5加密之后的数据',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `expire_time` char(19) DEFAULT NULL COMMENT '失效时间为空的时候表示永不失效，失效时间为2018-10-10 10:10:10，则表示在该时间之前该账户可用。',
  `lock_state` char(1) DEFAULT NULL COMMENT '锁定状态为空时表示启用，为0时表示锁定，为1时表示启用。',
  `deptno` char(4) DEFAULT NULL,
  `allow_ips` varchar(255) DEFAULT NULL COMMENT '允许访问的IP为空时表示IP地址永不受限，允许访问的IP可以是一个，也可以是多个，当多个IP地址的时候，采用半角逗号分隔。允许IP是192.168.100.2，表示该用户只能在IP地址为192.168.100.2的机器上使用。',
  `createTime` char(19) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `edit_time` char(19) DEFAULT NULL,
  `edit_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('06f5fc056eac41558a964f96daa7f27c', 'xrj', '薛仁俊', '123', 'xrj@163.com', '2028-10-13 21:50:05', '1', 'A001', '192.168.1.1,0:0:0:0:0:0:0:1,127.0.0.1', '2018-11-22 12:11:40', 'admin', null, null);
INSERT INTO `tbl_user` VALUES ('40f6cdea0bd34aceb77492a1656d9fb3', 'admin', 'admin', 'admin', 'admin@qq.com', '2028-11-30 23:50:55', '1', 'A001', '192.168.1.1,192.168.1.2,127.0.0.1,0:0:0:0:0:0:0:1', '2018-11-22 11:37:34', 'admin', null, null);
