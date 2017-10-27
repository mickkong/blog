/*
Navicat MySQL Data Transfer

Source Server         : mickkong
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : blog_v1.3

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2017-10-27 15:52:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(32) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  `readcount` int(11) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('2', '7187976ecfa54695afbcb4ea6054913c', 'test', 'test', '2017-10-27 11:11:35', '2017-10-27 11:11:35', '0');
INSERT INTO `article` VALUES ('3', '7187976ecfa54695afbcb4ea6054913c', '11', '11', '2017-10-27 11:14:25', '2017-10-27 11:14:25', '17');
INSERT INTO `article` VALUES ('4', '7187976ecfa54695afbcb4ea6054913c', '22', 'test', '2017-10-27 11:15:22', '2017-10-27 11:15:22', '2');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(32) DEFAULT NULL,
  `aid` int(11) DEFAULT NULL,
  `content` varchar(50) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('2', '7187976ecfa54695afbcb4ea6054913c', '3', '22', '2017-10-20 10:15:39');
INSERT INTO `comment` VALUES ('3', '7187976ecfa54695afbcb4ea6054913c', '3', '11', '2017-10-18 14:14:42');
INSERT INTO `comment` VALUES ('5', '7187976ecfa54695afbcb4ea6054913c', '3', '33', '2017-10-27 15:51:36');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` varchar(32) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('7187976ecfa54695afbcb4ea6054913c', 'mickkong', 'ULPVr4x3eWsp2U8o5/5V/A==', '17699999999', 'mickkong@yeah.net', null);
