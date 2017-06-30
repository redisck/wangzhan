-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017 年 06 月 30 日 13:09
-- 服务器版本: 5.5.40
-- PHP 版本: 5.4.33

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `dami`
--

-- --------------------------------------------------------

--
-- 表的结构 `dami_activity`
--

CREATE TABLE IF NOT EXISTS `dami_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '活动标题',
  `vice-heading` varchar(255) NOT NULL COMMENT '副标题',
  `add_time` int(11) NOT NULL COMMENT '更新时间',
  `url` varchar(255) NOT NULL COMMENT '活动url',
  `activity` text COMMENT '简要',
  `img` varchar(255) DEFAULT NULL COMMENT '图片',
  `description` text COMMENT '活动信息描述',
  `score` int(11) DEFAULT NULL COMMENT '评分',
  `time_status` tinyint(1) DEFAULT NULL COMMENT '状态',
  `commentary` text COMMENT '用户评论',
  `collect_status` tinyint(1) DEFAULT NULL COMMENT '收藏状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='活动表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dami_admin`
--

CREATE TABLE IF NOT EXISTS `dami_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(255) NOT NULL COMMENT '管理员用户名',
  `admin_password` varchar(255) NOT NULL COMMENT '管理员密码',
  `role_id` int(11) NOT NULL COMMENT '角色ID(权限控制用)',
  `is_effect` tinyint(1) NOT NULL COMMENT '状态',
  `login_time` int(11) NOT NULL COMMENT '最后登录时间',
  `login_ip` varchar(255) NOT NULL COMMENT '最后登录IP',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_admin_name` (`admin_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='后台管理员表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `dami_admin`
--

INSERT INTO `dami_admin` (`id`, `admin_name`, `admin_password`, `role_id`, `is_effect`, `login_time`, `login_ip`) VALUES
(1, '184698553@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 1, 0, 0, ''),
(2, 'ss@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 2, 0, 1498786536, '127.0.0.1'),
(3, 'ss3@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 4, 0, 1498786588, '127.0.0.1');

-- --------------------------------------------------------

--
-- 表的结构 `dami_applications`
--

CREATE TABLE IF NOT EXISTS `dami_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logo` varchar(255) NOT NULL COMMENT '上边图片',
  `middle_pic` varchar(255) NOT NULL COMMENT '中图',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `vice-heading` varchar(255) NOT NULL COMMENT '副标题',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='招聘表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dami_city`
--

CREATE TABLE IF NOT EXISTS `dami_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) NOT NULL COMMENT '城市',
  `img` varchar(255) NOT NULL COMMENT '图片',
  `summary` varchar(255) DEFAULT NULL COMMENT '概要',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `tel` varchar(255) NOT NULL DEFAULT '电话',
  `business_hours` int(11) NOT NULL COMMENT '营业时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品城市表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dami_company`
--

CREATE TABLE IF NOT EXISTS `dami_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `vice-heading` varchar(255) NOT NULL COMMENT '副标题',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `author` varchar(255) NOT NULL COMMENT '管理(提交人)',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='公司表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dami_msg_box`
--

CREATE TABLE IF NOT EXISTS `dami_msg_box` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `msg_title` varchar(255) NOT NULL COMMENT '消息标题',
  `msg_content` varchar(255) NOT NULL COMMENT '消息内容',
  `add_time` int(11) NOT NULL COMMENT '更新时间',
  `img` varchar(255) NOT NULL COMMENT '图片',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='消息表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dami_product`
--

CREATE TABLE IF NOT EXISTS `dami_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `vice_heading` varchar(255) NOT NULL COMMENT '副标题',
  `activity` text COMMENT '概要',
  `city` int(11) NOT NULL COMMENT '城市0:全国1:上海2:北京',
  `all_store` int(11) NOT NULL COMMENT '',
  `add_time` int(11) NOT NULL COMMENT '上新时间',
  `img` varchar(255) NOT NULL COMMENT '图片',
  `collect_status` tinyint(1) DEFAULT NULL COMMENT '是否收藏',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='产品表' AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `dami_product`
--

--
-- 表的结构 `dami_role`
--

CREATE TABLE IF NOT EXISTS `dami_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='后台管理员角色表' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `dami_role`
--


-- --------------------------------------------------------

--
-- 表的结构 `dami_role_access`
--

CREATE TABLE IF NOT EXISTS `dami_role_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `node` varchar(255) NOT NULL COMMENT '节点模块名',
  `controller` varchar(255) NOT NULL COMMENT '控制器名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='后台角色权限配置表' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `dami_role_access`
--

INSERT INTO `dami_role_access` (`id`, `role_id`, `node`, `controller`) VALUES
(1, 1, '', ''),
(2, 4, 'Order', 'close'),
(3, 4, 'Order', 'edit'),
(4, 4, 'Goods', 'add'),
(5, 4, 'Goods', 'edit');

-- --------------------------------------------------------

--
-- 表的结构 `dami_substance`
--

CREATE TABLE IF NOT EXISTS `dami_substance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `substance` varchar(255) NOT NULL COMMENT '招聘分类',
  `img` varchar(255) NOT NULL COMMENT '图片',
  `content` text NOT NULL COMMENT '招聘内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='招聘分类表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dami_user`
--

CREATE TABLE IF NOT EXISTS `dami_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL COMMENT '会员名',
  `user_pwd` varchar(255) NOT NULL COMMENT '会员密码',
  `email` varchar(255) DEFAULT NULL COMMENT '会员邮箱',
  `mobile` varchar(255) DEFAULT NULL COMMENT '会员手机号',
  `sex` tinyint(1) NOT NULL DEFAULT '-1' COMMENT '性别',
  `create_time` int(11) NOT NULL COMMENT '注册时间',
  `last_login_time` int(11) NOT NULL COMMENT '最后一次登录时间',
  `visit_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `birthday` int(11) NOT NULL COMMENT '会员生日',
  `address` varchar(255) DEFAULT NULL COMMENT '会员地址',
  `my_intro` varchar(255) DEFAULT NULL COMMENT '会员简介',
  `real_name` varchar(255) DEFAULT NULL COMMENT '会员真实姓名',
  `qq` varchar(50) DEFAULT NULL COMMENT 'qq号码',
  `weixin` varchar(255) DEFAULT NULL COMMENT '微信号',
  `xpoint` float(10,6) DEFAULT NULL COMMENT '经度',
  `ypoint` float(10,6) DEFAULT NULL COMMENT '纬度',
  `is_effect` tinyint(1) NOT NULL COMMENT '是否验证',
  `sina_app_secret` varchar(255) NOT NULL COMMENT '新浪的同步验证密码',
  `sina_app_key` varchar(255) NOT NULL COMMENT '新浪的同步验证key',
  `sina_token` varchar(255) NOT NULL COMMENT '新浪的授权码',
  `sina_id` varchar(255) NOT NULL COMMENT '新浪同步的会员ID',
  `openid` varchar(255) NOT NULL COMMENT '腾讯微信ID',
  `headpic` varchar(255) NOT NULL COMMENT '头像',
  `wx_Province` varchar(80) DEFAULT NULL COMMENT '微信省份',
  `wx_City` varchar(80) DEFAULT NULL COMMENT '微信城市',
  `wx_Name` varchar(255) DEFAULT NULL COMMENT '微信昵称',
  `tencent_qq_id` varchar(255) DEFAULT NULL COMMENT '腾讯qqID',
  `tencent_app_key` varchar(255) DEFAULT NULL COMMENT '腾讯的同步验证key',
  `tencent_app_secret` varchar(255) DEFAULT NULL COMMENT '腾讯的同步验证密码',
  `is_tmp` tinyint(1) NOT NULL COMMENT '是否为临时用户',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unk_user_name` (`user_name`),
  UNIQUE KEY `unk_email` (`email`),
  UNIQUE KEY `unk_mobile` (`mobile`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dami_user_collect`
--

CREATE TABLE IF NOT EXISTS `dami_user_collect` (
  `col_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '会员ID',
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '收藏的商品ID',
  `store_id` mediumint(8) DEFAULT NULL COMMENT '店铺ID',
  `is_attention` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否关注该收藏商品,1是；0否',
  `add_time` int(11) NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`col_id`),
  KEY `user_id` (`user_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户收藏表' AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
