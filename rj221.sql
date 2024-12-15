/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80036
Source Host           : localhost:3306
Source Database       : rj221

Target Server Type    : MYSQL
Target Server Version : 80036
File Encoding         : 65001

Date: 2024-07-02 17:53:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '用户id',
  `dish_id` int NOT NULL,
  `restaurant_id` int NOT NULL,
  `price` double NOT NULL COMMENT '单价',
  `quantity` int NOT NULL,
  `checked` tinyint(1) DEFAULT '0' COMMENT '是否选中',
  `created_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `version` int NOT NULL DEFAULT '0',
  `deleted` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cart_dish_id_fk` (`dish_id`),
  KEY `cart_user_id_fk` (`user_id`),
  KEY `cart_restaurant_id_fk` (`restaurant_id`),
  CONSTRAINT `cart_dish_id_fk` FOREIGN KEY (`dish_id`) REFERENCES `dish` (`id`),
  CONSTRAINT `cart_restaurant_id_fk` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`),
  CONSTRAINT `cart_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户购物车表';

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('199', '18', '11', '3', '45', '2', '0', '2024-07-02 16:58:32', '2024-07-02 16:58:32', '0', '0');
INSERT INTO `cart` VALUES ('200', '18', '15', '3', '66', '1', '0', '2024-07-02 16:58:32', '2024-07-02 16:58:32', '0', '0');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '分类ID，自增主键',
  `name` varchar(100) NOT NULL COMMENT '分类名称',
  `description` text COMMENT '分类描述',
  `category_id` int NOT NULL,
  `restaurant_id` int NOT NULL COMMENT '所属店铺ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `version` int NOT NULL DEFAULT '0' COMMENT '乐观锁版本号',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记，0表示未删除，1表示已删除',
  PRIMARY KEY (`id`),
  KEY `fk_category_restaurant` (`restaurant_id`),
  CONSTRAINT `fk_category_restaurant` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商品分类表';

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '热销推荐', '华莱士', '1', '1', '2024-06-07 16:25:25', '2024-06-07 16:26:32', '0', '0');
INSERT INTO `category` VALUES ('2', '新品上市', '华莱士', '2', '1', '2024-06-07 16:25:25', '2024-06-07 16:26:32', '0', '0');
INSERT INTO `category` VALUES ('3', '多人套餐', '华莱士', '3', '1', '2024-06-07 16:25:25', '2024-06-07 16:26:32', '0', '0');
INSERT INTO `category` VALUES ('4', '张亮专属', '张亮麻辣烫', '1', '2', '2024-06-07 16:43:54', '2024-06-07 16:43:54', '0', '0');
INSERT INTO `category` VALUES ('5', '福利专区', '张亮麻辣烫', '2', '2', '2024-06-07 16:43:54', '2024-06-07 16:43:54', '0', '0');
INSERT INTO `category` VALUES ('6', '健康素食', '张亮麻辣烫', '3', '2', '2024-06-07 16:43:54', '2024-06-07 16:43:54', '0', '0');
INSERT INTO `category` VALUES ('7', '门店推荐', '7cake榴莲千层蛋糕', '1', '3', '2024-06-07 16:43:54', '2024-06-07 16:43:54', '0', '0');
INSERT INTO `category` VALUES ('8', '四寸小蛋糕', '7cake榴莲千层蛋糕', '2', '3', '2024-06-07 16:43:54', '2024-06-07 16:43:54', '0', '0');
INSERT INTO `category` VALUES ('9', '千层蛋糕', '7cake榴莲千层蛋糕', '3', '3', '2024-06-07 16:43:54', '2024-06-07 16:43:54', '0', '0');
INSERT INTO `category` VALUES ('10', '蛋糕盒子', '7cake榴莲千层蛋糕', '4', '3', '2024-06-07 16:43:54', '2024-06-07 16:43:54', '0', '0');
INSERT INTO `category` VALUES ('11', '清新果茶', '蜜雪冰城', '1', '5', '2024-06-07 16:47:54', '2024-06-07 16:47:54', '0', '0');
INSERT INTO `category` VALUES ('12', '圣代', '蜜雪冰城', '2', '5', '2024-06-07 16:47:54', '2024-06-07 16:47:54', '0', '0');
INSERT INTO `category` VALUES ('13', '奶茶', '蜜雪冰城', '3', '5', '2024-06-07 16:47:54', '2024-06-07 16:47:54', '0', '0');
INSERT INTO `category` VALUES ('14', '美味汉堡', '汉堡王', '1', '6', '2024-06-07 16:47:54', '2024-06-07 16:47:54', '0', '0');
INSERT INTO `category` VALUES ('15', '香辣鸡翅', '汉堡王', '2', '6', '2024-06-07 16:47:54', '2024-06-07 16:47:54', '0', '0');
INSERT INTO `category` VALUES ('16', '多人套餐', '汉堡王', '3', '6', '2024-06-07 16:47:54', '2024-06-07 16:47:54', '0', '0');
INSERT INTO `category` VALUES ('17', '韩式炸鸡', '正谈炸鸡', '1', '7', '2024-06-07 16:50:19', '2024-06-07 16:50:19', '0', '0');
INSERT INTO `category` VALUES ('18', '多人超值炸鸡', '正谈炸鸡', '2', '7', '2024-06-07 16:50:19', '2024-06-07 16:50:19', '0', '0');
INSERT INTO `category` VALUES ('19', '折扣小吃', '正谈炸鸡', '3', '7', '2024-06-07 16:50:19', '2024-06-07 16:50:19', '0', '0');
INSERT INTO `category` VALUES ('20', '招牌推荐', '米村拌饭', '1', '8', '2024-06-07 16:57:17', '2024-06-07 16:57:17', '0', '0');
INSERT INTO `category` VALUES ('21', '烤肉拌饭', '米村拌饭', '2', '8', '2024-06-07 16:57:17', '2024-06-07 16:57:17', '0', '0');
INSERT INTO `category` VALUES ('22', '脆皮鸡饭', '米村拌饭', '3', '8', '2024-06-07 16:57:17', '2024-06-07 16:57:17', '0', '0');
INSERT INTO `category` VALUES ('23', '特色炸鸡排', '小食王', '1', '9', '2024-06-07 16:57:17', '2024-06-07 16:57:17', '0', '0');
INSERT INTO `category` VALUES ('24', '特色炸串', '小食王', '2', '9', '2024-06-07 16:57:17', '2024-06-07 16:57:17', '0', '0');
INSERT INTO `category` VALUES ('25', '美味小吃', '小食王', '3', '9', '2024-06-07 16:57:17', '2024-06-07 16:57:17', '0', '0');
INSERT INTO `category` VALUES ('26', '半只烤鸭', '青年餐厅.烤鸭', '1', '10', '2024-06-07 16:57:17', '2024-06-07 16:57:17', '0', '0');
INSERT INTO `category` VALUES ('27', '整只烤鸭', '青年餐厅.烤鸭', '2', '10', '2024-06-07 16:57:17', '2024-06-07 16:57:17', '0', '0');
INSERT INTO `category` VALUES ('28', '特色小吃', '青年餐厅.烤鸭', '3', '10', '2024-06-07 16:57:17', '2024-06-07 16:57:17', '0', '0');

-- ----------------------------
-- Table structure for dish
-- ----------------------------
DROP TABLE IF EXISTS `dish`;
CREATE TABLE `dish` (
  `id` int NOT NULL AUTO_INCREMENT,
  `restaurant_id` int NOT NULL,
  `category_id` int NOT NULL COMMENT '关联分类表',
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `unit` varchar(100) DEFAULT NULL COMMENT '菜品单位',
  `description` text,
  `image_url` varchar(200) DEFAULT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT '1',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `version` int NOT NULL DEFAULT '0' COMMENT '乐观锁版本号',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `quantity` int DEFAULT '0' COMMENT '数量',
  PRIMARY KEY (`id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `dish_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of dish
-- ----------------------------
INSERT INTO `dish` VALUES ('1', '2', '2', '单人套餐', '15.80', '份', '单人套餐', 'https://p0.meituan.net/wmproduct/376191c9bb107b66cd5abcabcc711159117774.jpg@225w', '1', '2024-06-06 22:31:29', '2024-06-06 22:31:40', '0', '0', '0');
INSERT INTO `dish` VALUES ('2', '2', '1', '有汤有面张亮套餐', '20.80', '份', '有汤有面张亮套餐', 'https://p1.meituan.net/wmproduct/bdfa4466dce445516951c6a49d353f5f110433.jpg@225w', '1', '2024-06-06 22:34:17', '2024-06-06 22:34:17', '0', '0', '0');
INSERT INTO `dish` VALUES ('3', '2', '2', '撒尿牛丸', '2.00', '个', '撒尿牛丸', 'https://p1.meituan.net/wmproduct/2e25b8731cee1383d3312fd462f0b61f67201.jpg@225w', '1', '2024-06-06 22:37:25', '2024-06-06 22:37:25', '0', '0', '0');
INSERT INTO `dish` VALUES ('4', '2', '3', '娃娃菜', '1.00', '片', '娃娃菜', 'https://p0.meituan.net/wmproduct/4df8d1a334bc2c313dc9d71dd31af8a661893.jpg', '1', '2024-06-06 22:37:25', '2024-06-06 22:37:25', '0', '0', '0');
INSERT INTO `dish` VALUES ('5', '2', '1', '肥牛卷', '3.00', '个', '肥牛卷', 'https://p0.meituan.net/wmproduct/510c4fd4a249cef9d19a67032e995c3992589.jpg@225w', '1', '2024-06-06 22:37:25', '2024-06-06 22:37:25', '0', '0', '0');
INSERT INTO `dish` VALUES ('6', '2', '3', '土豆片', '0.50', '片', '土豆片', 'https://p0.meituan.net/wmproduct/dfd8135d93c850fe1638384b098d5151349473.jpg@225w', '1', '2024-06-06 22:37:25', '2024-06-06 22:37:25', '0', '0', '0');
INSERT INTO `dish` VALUES ('7', '2', '3', '油麦菜', '1.00', '片', '油麦菜', 'https://p0.meituan.net/wmproduct/9983acf0117f8e86d150129155b0e526324213.jpg@225w', '1', '2024-06-06 22:45:35', '2024-06-06 22:45:35', '0', '0', '0');
INSERT INTO `dish` VALUES ('8', '2', '3', '菠菜', '1.00', '片', '菠菜', 'https://p0.meituan.net/wmproduct/50768aff64b3de511311e8472d10b542383164.jpg@225w', '1', '2024-06-06 22:45:35', '2024-06-06 22:45:35', '0', '0', '0');
INSERT INTO `dish` VALUES ('9', '2', '1', '蟹肉棒', '2.00', '个', '蟹肉棒', 'https://p0.meituan.net/wmproduct/7eacfe1364fa759b006d927fe0f0b1af332098.jpg@225w', '1', '2024-06-06 22:45:35', '2024-06-06 22:45:35', '0', '0', '0');
INSERT INTO `dish` VALUES ('10', '2', '2', '鱼豆腐', '1.00', '个', '鱼豆腐', 'https://p1.meituan.net/wmproduct/cff89494e74e98763005c7da82d10fe6363347.jpg@225w', '1', '2024-06-06 22:45:35', '2024-06-06 22:45:35', '0', '0', '0');
INSERT INTO `dish` VALUES ('11', '3', '1', '青草蛋糕', '45.00', '个', '青草蛋糕', 'https://p0.meituan.net/wmproduct/9c1e056ca1e89564365a0ec602ad2aba5106700.jpg@225w', '1', '2024-06-06 22:57:50', '2024-06-06 22:57:50', '0', '0', '0');
INSERT INTO `dish` VALUES ('12', '3', '2', '小淘气蛋糕', '65.00', '个', '小淘气蛋糕', 'https://p1.meituan.net/wmproduct/9f0f92e6689e6b3f28f76c53a9b9598f1685005.jpg@225w', '1', '2024-06-06 22:57:50', '2024-06-06 22:57:50', '0', '0', '0');
INSERT INTO `dish` VALUES ('13', '3', '4', '熊开心便当盒子蛋糕', '88.00', '个', '熊开心便当盒子蛋糕', 'https://p1.meituan.net/wmproduct/9f0f92e6689e6b3f28f76c53a9b9598f1685005.jpg@225w', '1', '2024-06-06 22:57:50', '2024-06-06 22:57:50', '0', '0', '0');
INSERT INTO `dish` VALUES ('14', '3', '2', '一起躺平鸭蛋糕', '55.00', '个', '一起躺平鸭蛋糕', 'https://p0.meituan.net/wmproduct/67037e7c7ab7925891f7caa1a23e18e93281954.jpg@225w', '1', '2024-06-06 22:57:50', '2024-06-06 22:57:50', '0', '0', '0');
INSERT INTO `dish` VALUES ('15', '3', '1', '茫茫遇你蛋糕', '66.00', '个', '茫茫遇你蛋糕', 'https://p0.meituan.net/wmproduct/9f5ed12a188ffe30f3da2086c2abaa9b2760194.jpg@225w', '1', '2024-06-06 22:57:50', '2024-06-06 22:57:50', '0', '0', '0');
INSERT INTO `dish` VALUES ('16', '3', '3', '草莓千层盒子', '25.00', '个', '草莓千层盒子', 'https://p1.meituan.net/wmproduct/37827eafc0efee2eccd65b402d263f321524261.jpg@225w', '1', '2024-06-06 22:57:50', '2024-06-06 22:57:50', '0', '0', '0');
INSERT INTO `dish` VALUES ('17', '3', '4', '便当盒子', '20.00', '个', '便当盒子', 'https://p0.meituan.net/wmproduct/b3c93e330c31459a6c843ef2ecd36de31682937.jpg@225w', '1', '2024-06-06 22:57:50', '2024-06-06 22:57:50', '0', '0', '0');
INSERT INTO `dish` VALUES ('18', '3', '1', '笑嘻嘻蛋糕', '35.00', '个', '笑嘻嘻蛋糕', 'https://p0.meituan.net/wmproduct/bd82f8f28c0d1514e402d123cc0180a6683955.jpg@225w', '1', '2024-06-06 22:57:50', '2024-06-06 22:57:50', '0', '0', '0');
INSERT INTO `dish` VALUES ('19', '3', '3', '芋泥千层蛋糕', '55.00', '个', '芋泥千层蛋糕', 'https://p0.meituan.net/wmproduct/86bab8f48ade4c6b2a3c9aaeb997b1a61002663.jpg@225w', '1', '2024-06-06 22:57:50', '2024-06-06 22:57:50', '0', '0', '0');
INSERT INTO `dish` VALUES ('20', '3', '3', '巧克力千层可力蛋糕', '99.00', '个', '巧克力千层可力蛋糕', 'https://p0.meituan.net/wmproduct/86bab8f48ade4c6b2a3c9aaeb997b1a61002663.jpg@225w', '1', '2024-06-06 22:57:50', '2024-06-06 22:57:50', '0', '0', '0');
INSERT INTO `dish` VALUES ('26', '1', '1', '十翅一桶', '29.90', '份', '十翅一桶', 'https://p0.meituan.net/wmproduct/d4b875903268ed31e938a890bbc9c4a559413.jpg@225w', '1', '2024-06-06 23:12:02', '2024-06-06 23:12:02', '0', '0', '0');
INSERT INTO `dish` VALUES ('27', '1', '1', '香辣鸡翅', '8.00', '个', '香辣鸡翅', 'https://p0.meituan.net/wmproduct/df28bea1eed825c02757301ea4c357ba45624.jpg@225w', '0', '2024-06-06 23:12:02', '2024-06-06 23:12:02', '0', '0', '0');
INSERT INTO `dish` VALUES ('28', '1', '1', '三个鸡腿堡', '18.80', '个', '三个鸡腿堡', 'https://p1.meituan.net/wmproduct/05b8638b0fc5ecded1f9e8bf274a852a87189.jpg@225w', '1', '2024-06-06 23:12:02', '2024-06-06 23:12:02', '0', '0', '0');
INSERT INTO `dish` VALUES ('29', '1', '2', '香酥鸡腿', '6.00', '个', '香酥鸡腿', 'https://p0.meituan.net/wmproduct/ff7138132062da99a0063d4396c8ce8755740.jpg@225w', '0', '2024-06-06 23:12:02', '2024-06-06 23:12:02', '0', '0', '0');
INSERT INTO `dish` VALUES ('30', '1', '1', '香辣鸡翅套餐', '26.50', '份', '香辣鸡翅套餐', 'https://p0.meituan.net/wmproduct/fe4f058ee21d7c67420843ccdbda56cf82029.jpg@225w', '1', '2024-06-06 23:12:02', '2024-06-06 23:12:02', '0', '0', '0');
INSERT INTO `dish` VALUES ('31', '1', '2', '香辣鸡腿堡+中可', '16.50', '份', '香辣鸡腿堡+中可', 'https://p0.meituan.net/wmproduct/fe4f058ee21d7c67420843ccdbda56cf82029.jpg@225w', '1', '2024-06-06 23:12:02', '2024-06-06 23:12:02', '0', '0', '0');
INSERT INTO `dish` VALUES ('32', '1', '3', '欢享三人餐', '36.50', '份', '欢享三人餐', 'https://p1.meituan.net/wmproduct/da21ac6b2651e4c224da6477de545d8a97174.jpg@225w', '1', '2024-06-06 23:25:09', '2024-06-06 23:25:09', '0', '0', '0');
INSERT INTO `dish` VALUES ('33', '1', '3', '自选三人餐', '36.50', '份', '自选三人餐', 'https://p1.meituan.net/wmproduct/51070ad350683f3f625ca5ae63359b9298133.jpg@225w', '1', '2024-06-06 23:25:09', '2024-06-06 23:25:09', '0', '0', '0');
INSERT INTO `dish` VALUES ('34', '1', '2', '鳕鱼堡', '6.00', '个', '鳕鱼堡', 'https://p0.meituan.net/xianfu/50997215dc63d8f17afc74da95d67ee559205.jpg@225w', '1', '2024-06-06 23:26:35', '2024-06-06 23:26:35', '0', '0', '0');
INSERT INTO `dish` VALUES ('35', '1', '1', '卷堡多肉五件套', '45.50', '份', '卷堡多肉五件套', 'https://p0.meituan.net/wmproduct/9244487461ccfbe086a043f1f05cd6f576914.jpg@225w', '1', '2024-06-06 23:26:35', '2024-06-06 23:26:35', '0', '0', '0');
INSERT INTO `dish` VALUES ('36', '5', '2', '奥利奥圣代', '8.00', '个', '奥利奥圣代', 'https://p0.meituan.net/xianfu/ce657e872036d6cf9ec0977afdec2a31534766.png@225w', '1', '2024-06-07 00:04:32', '2024-06-07 00:04:32', '0', '0', '0');
INSERT INTO `dish` VALUES ('37', '5', '1', '菠萝百香果', '9.00', '杯', '菠萝百香果', 'https://p0.meituan.net/xianfu/12886d3e3cc0ed71e39843f3796faa3d269842.png@225w', '1', '2024-06-07 00:04:32', '2024-06-07 00:04:32', '0', '0', '0');
INSERT INTO `dish` VALUES ('38', '5', '1', '蜜桃四季春', '9.00', '杯', '蜜桃四季春', 'https://p0.meituan.net/xianfu/12886d3e3cc0ed71e39843f3796faa3d269842.png@225w', '1', '2024-06-07 00:04:32', '2024-06-07 00:04:32', '0', '0', '0');
INSERT INTO `dish` VALUES ('39', '5', '1', '芋圆葡萄', '12.00', '杯', '芋圆葡萄', 'https://p0.meituan.net/xianfu/12886d3e3cc0ed71e39843f3796faa3d269842.png@225w', '1', '2024-06-07 00:04:32', '2024-06-07 00:04:32', '0', '0', '0');
INSERT INTO `dish` VALUES ('40', '5', '1', '棒打鲜橙', '7.00', '杯', '棒打鲜橙', 'https://p1.meituan.net/xianfu/d802272351cdd3772c1050fa5b0ef34d543520.png@225w', '1', '2024-06-07 00:04:32', '2024-06-07 00:04:32', '0', '0', '0');
INSERT INTO `dish` VALUES ('41', '5', '2', '脆皮圣代', '7.00', '个', '脆皮圣代', 'https://p0.meituan.net/xianfu/3520fff5413cfc31c5bec174fcb4058b487049.png@225w', '1', '2024-06-07 00:04:32', '2024-06-07 00:04:32', '0', '0', '0');
INSERT INTO `dish` VALUES ('42', '5', '1', '满杯百香果', '9.00', '杯', '满杯百香果', 'https://p0.meituan.net/xianfu/cbdb78681c607f5c652ac8a58604a181528134.png@225w', '1', '2024-06-07 00:04:32', '2024-06-07 00:04:32', '0', '0', '0');
INSERT INTO `dish` VALUES ('43', '5', '1', '冰鲜柠檬水', '5.00', '杯', '冰鲜柠檬水', 'https://p0.meituan.net/xianfu/d7166bf8b99e5bf2d9eb18c2bfe16850606134.png@225w', '1', '2024-06-07 00:04:32', '2024-06-07 00:04:32', '0', '0', '0');
INSERT INTO `dish` VALUES ('44', '5', '3', '珍珠奶茶', '8.00', '杯', '珍珠奶茶', 'https://p0.meituan.net/xianfu/6df9a6f88db622dd51427b0fc3f6c7a5491757.png@225w', '1', '2024-06-07 00:04:32', '2024-06-07 00:04:32', '0', '0', '0');
INSERT INTO `dish` VALUES ('45', '5', '3', '草莓啵啵', '10.00', '杯', '草莓啵啵', 'https://p0.meituan.net/xianfu/a7635005d2f16b9edd52a6563f6928f1554101.png@225w', '1', '2024-06-07 00:04:32', '2024-06-07 00:04:32', '0', '0', '0');
INSERT INTO `dish` VALUES ('46', '6', '2', '十翅一桶', '15.00', '份', '十翅一桶', 'https://p0.meituan.net/wmproduct/d4b875903268ed31e938a890bbc9c4a559413.jpg@225w', '1', '2024-06-07 00:13:13', '2024-06-07 00:13:13', '0', '0', '0');
INSERT INTO `dish` VALUES ('47', '6', '2', '香辣鸡翅', '6.00', '个', '香辣鸡翅', 'https://p0.meituan.net/wmproduct/df28bea1eed825c02757301ea4c357ba45624.jpg@225w', '1', '2024-06-07 00:13:13', '2024-06-07 00:13:13', '0', '0', '0');
INSERT INTO `dish` VALUES ('48', '6', '1', '三个鸡腿堡', '15.00', '份', '三个鸡腿堡', 'https://p1.meituan.net/wmproduct/05b8638b0fc5ecded1f9e8bf274a852a87189.jpg@225w', '1', '2024-06-07 00:13:13', '2024-06-07 00:13:13', '0', '0', '0');
INSERT INTO `dish` VALUES ('49', '6', '2', '香酥鸡腿', '6.00', '个', '香酥鸡腿', 'https://p0.meituan.net/wmproduct/ff7138132062da99a0063d4396c8ce8755740.jpg@225w', '1', '2024-06-07 00:13:13', '2024-06-07 00:13:13', '0', '0', '0');
INSERT INTO `dish` VALUES ('50', '6', '3', '香辣鸡翅套餐', '14.50', '份', '香辣鸡翅套餐', 'https://p0.meituan.net/wmproduct/fe4f058ee21d7c67420843ccdbda56cf82029.jpg@225w', '1', '2024-06-07 00:13:13', '2024-06-07 00:13:13', '0', '0', '0');
INSERT INTO `dish` VALUES ('51', '6', '3', '香辣鸡腿堡+中可', '16.50', '份', '香辣鸡腿堡+中可', 'https://p0.meituan.net/wmproduct/fe4f058ee21d7c67420843ccdbda56cf82029.jpg@225w', '1', '2024-06-07 00:13:13', '2024-06-07 00:13:13', '0', '0', '0');
INSERT INTO `dish` VALUES ('52', '6', '3', '欢享三人餐', '33.50', '份', '欢享三人餐', 'https://p1.meituan.net/wmproduct/da21ac6b2651e4c224da6477de545d8a97174.jpg@225w', '1', '2024-06-07 00:13:13', '2024-06-07 00:13:13', '0', '0', '0');
INSERT INTO `dish` VALUES ('53', '6', '3', '自选三人餐', '33.50', '份', '自选三人餐', 'https://p1.meituan.net/wmproduct/51070ad350683f3f625ca5ae63359b9298133.jpg@225w', '1', '2024-06-07 00:13:13', '2024-06-07 00:13:13', '0', '0', '0');
INSERT INTO `dish` VALUES ('54', '6', '1', '鳕鱼堡', '6.00', '个', '鳕鱼堡', 'https://p0.meituan.net/xianfu/50997215dc63d8f17afc74da95d67ee559205.jpg@225w', '1', '2024-06-07 00:13:13', '2024-06-07 00:13:13', '0', '0', '0');
INSERT INTO `dish` VALUES ('55', '6', '3', '卷堡多肉五件套', '15.50', '份', '卷堡多肉五件套', 'https://p0.meituan.net/wmproduct/9244487461ccfbe086a043f1f05cd6f576914.jpg@225w', '1', '2024-06-07 00:13:13', '2024-06-07 00:13:13', '0', '0', '0');
INSERT INTO `dish` VALUES ('56', '7', '1', '韩式炸鸡双拼', '22.50', '份', '韩式炸鸡双拼', 'https://p0.meituan.net/wmproduct/00e0b32c698c632ebe213b983cdec175915389.jpg@225w', '1', '2024-06-07 00:19:54', '2024-06-07 00:19:54', '0', '0', '0');
INSERT INTO `dish` VALUES ('57', '7', '1', '三拼韩式炸鸡', '23.50', '份', '三拼韩式炸鸡', 'https://p0.meituan.net/wmproduct/0b6ae3dcf50ace2d8ad73fb8bddda80e1041133.jpg@225w', '1', '2024-06-07 00:19:54', '2024-06-07 00:19:54', '0', '0', '0');
INSERT INTO `dish` VALUES ('58', '7', '3', '秘酱炸鸡', '24.50', '份', '秘酱炸鸡', 'https://p0.meituan.net/wmproduct/25c9d83a4e890c732c5aa74120b928f6930861.jpg@225w', '1', '2024-06-07 00:19:54', '2024-06-07 00:19:54', '0', '0', '0');
INSERT INTO `dish` VALUES ('59', '7', '3', '酱酱裹炸年糕', '15.50', '份', '酱酱裹炸年糕', 'https://p0.meituan.net/wmproduct/667a9cb8b1bd1bbeb4ec082a8c9299f6747914.jpg@225w', '1', '2024-06-07 00:19:54', '2024-06-07 00:19:54', '0', '0', '0');
INSERT INTO `dish` VALUES ('60', '7', '1', '韩式无骨炸鸡', '16.50', '份', '韩式无骨炸鸡', 'https://p0.meituan.net/wmproduct/d3a07c949ec2a47856d18956de309ccf856940.jpg@225w', '1', '2024-06-07 00:19:54', '2024-06-07 00:19:54', '0', '0', '0');
INSERT INTO `dish` VALUES ('61', '7', '2', '青花椒拌鸡+中杯可乐', '26.50', '份', '青花椒拌鸡+中杯可乐', 'https://p0.meituan.net/wmproduct/222e03099d9c089bc3a42b61648211ad1013971.jpg@225w', '1', '2024-06-07 00:19:54', '2024-06-07 00:19:54', '0', '0', '0');
INSERT INTO `dish` VALUES ('62', '7', '2', '黄金脆半鸡+大暑+中可', '36.50', '份', '黄金脆半鸡+大暑+中可', 'https://p0.meituan.net/wmproduct/784dc6d693a8f7e61c8acf21fd0e491053144.jpg@225w', '1', '2024-06-07 00:19:54', '2024-06-07 00:19:54', '0', '0', '0');
INSERT INTO `dish` VALUES ('63', '7', '1', '现炸脆皮半鸡', '19.50', '只', '现炸脆皮半鸡', 'https://p0.meituan.net/wmproduct/54b63162475fdb76bad231a08e1fbfbe234242.jpg@225w', '1', '2024-06-07 00:19:54', '2024-06-07 00:19:54', '0', '0', '0');
INSERT INTO `dish` VALUES ('64', '7', '1', '蜂蜜芥末秘酱炸鸡中份', '24.50', '份', '蜂蜜芥末秘酱炸鸡中份', 'https://p0.meituan.net/wmproduct/d75da98e84e0607d44b6b3c8f0f54c4d1037289.jpg@225w', '1', '2024-06-07 00:19:54', '2024-06-07 00:19:54', '0', '0', '0');
INSERT INTO `dish` VALUES ('65', '7', '3', '1个无骨鸡肉+1个香酥翅根', '9.50', '个', '1个无骨鸡肉+1个香酥翅根', 'https://p0.meituan.net/wmproduct/40f14d40a8ce60faba990bd4a4c1e8e3764375.jpg@225w', '1', '2024-06-07 00:19:54', '2024-06-07 00:19:54', '0', '0', '0');
INSERT INTO `dish` VALUES ('66', '8', '2', '蜜汁烤肉拌饭', '13.50', '份', '蜜汁烤肉拌饭', 'https://p0.meituan.net/wmproduct/ab69e0e28a35cfb7ecd0dbe0f0efc9101003962.jpg@225w', '1', '2024-06-07 00:26:23', '2024-06-07 00:26:23', '0', '0', '0');
INSERT INTO `dish` VALUES ('67', '8', '1', '招牌烤肉拌饭', '16.50', '份', '招牌烤肉拌饭', 'https://p0.meituan.net/wmproduct/0d362a5aff8cc15409172dabeb94904a1006500.jpg@225w', '1', '2024-06-07 00:26:23', '2024-06-07 00:26:23', '0', '0', '0');
INSERT INTO `dish` VALUES ('68', '8', '3', '蜜汁脆皮鸡饭', '12.50', '份', '蜜汁脆皮鸡饭', 'https://p1.meituan.net/wmproduct/86d265e08b1cfae1f0e7725249c3f84d1020807.jpg@225w', '1', '2024-06-07 00:26:23', '2024-06-07 00:26:23', '0', '0', '0');
INSERT INTO `dish` VALUES ('69', '8', '1', '沙拉烤肉拌饭', '15.50', '份', '沙拉烤肉拌饭', 'https://p0.meituan.net/wmproduct/296fc750f24ec987958fe6f512a2a17a971026.jpg@225w', '1', '2024-06-07 00:26:23', '2024-06-07 00:26:23', '0', '0', '0');
INSERT INTO `dish` VALUES ('70', '8', '1', '蜜汁烤肉拌饭+四种配菜', '18.50', '份', '蜜汁烤肉拌饭+四种配菜', 'https://p0.meituan.net/wmproduct/991be552dc6ed7002443dc928028df50260590.jpg@225w', '1', '2024-06-07 00:26:23', '2024-06-07 00:26:23', '0', '0', '0');
INSERT INTO `dish` VALUES ('71', '8', '2', '孜然烤肉拌饭', '15.50', '份', '孜然烤肉拌饭', 'https://p0.meituan.net/wmproduct/8131ecd3745018298db59a7bad5c8e3c277435.jpg@225w', '1', '2024-06-07 00:26:23', '2024-06-07 00:26:23', '0', '0', '0');
INSERT INTO `dish` VALUES ('72', '8', '2', '麻辣烤肉拌饭', '15.00', '份', '麻辣烤肉拌饭', 'https://p1.meituan.net/wmproduct/b7a6291553ceef5a3227565bf55412721018985.jpg@225w', '1', '2024-06-07 00:26:23', '2024-06-07 00:26:23', '0', '0', '0');
INSERT INTO `dish` VALUES ('73', '8', '1', '黑椒烤肉拌饭', '16.00', '份', '黑椒烤肉拌饭', 'https://p0.meituan.net/wmproduct/98b894bb11b8717794cabda82f915325993822.jpg@225w', '1', '2024-06-07 00:26:23', '2024-06-07 00:26:23', '0', '0', '0');
INSERT INTO `dish` VALUES ('74', '8', '3', '孜然脆皮鸡拌饭', '14.00', '份', '孜然脆皮鸡拌饭', 'https://p0.meituan.net/wmproduct/2f23f240ddeb7072c9e14bbf639b333e1046978.jpg@225w', '1', '2024-06-07 00:26:23', '2024-06-07 00:26:23', '0', '0', '0');
INSERT INTO `dish` VALUES ('75', '8', '3', '叉烧脆皮鸡饭', '13.50', '份', '叉烧脆皮鸡饭', 'https://p0.meituan.net/wmproduct/005b0fc076dc88ac4840fb9551c32b19986817.jpg@225w', '1', '2024-06-07 00:26:23', '2024-06-07 00:26:23', '0', '0', '0');
INSERT INTO `dish` VALUES ('76', '9', '2', '淀粉肠', '1.50', '根', '淀粉肠', 'https://p0.meituan.net/wmproduct/b1b9064901d54cce942e4774de13ccf4524339.jpg@225w', '1', '2024-06-07 00:32:49', '2024-06-07 00:32:49', '0', '0', '0');
INSERT INTO `dish` VALUES ('77', '9', '2', '咖喱鸡肉串', '3.50', '根', '咖喱鸡肉串', 'https://p0.meituan.net/wmproduct/4946cf2ad1ed98e5ca36902fb0b37398439713.jpg@225w', '1', '2024-06-07 00:32:49', '2024-06-07 00:32:49', '0', '0', '0');
INSERT INTO `dish` VALUES ('78', '9', '2', '裹糠土豆片', '2.00', '片', '裹糠土豆片', 'https://p0.meituan.net/wmproduct/a55532e372701c54cef714cd38675d0d517623.jpg@225w', '1', '2024-06-07 00:32:49', '2024-06-07 00:32:49', '0', '0', '0');
INSERT INTO `dish` VALUES ('79', '9', '3', '素肚', '2.00', '个', '素肚', 'https://p0.meituan.net/wmproduct/23693b0311ee44ecbfc21a1d69fc1120500980.jpg@225w', '1', '2024-06-07 00:32:49', '2024-06-07 00:32:49', '0', '0', '0');
INSERT INTO `dish` VALUES ('80', '9', '3', '炸豆皮金针菇', '3.00', '串', '炸豆皮金针菇', 'https://p0.meituan.net/wmproduct/30e86efabddf985ee3e989401645de98766204.jpg@225w', '1', '2024-06-07 00:32:49', '2024-06-07 00:32:49', '0', '0', '0');
INSERT INTO `dish` VALUES ('81', '9', '3', '素串', '3.00', '串', '素串', 'https://p0.meituan.net/wmproduct/c89419b8387fccdf3c663d4d83d43d97517880.jpg@225w', '1', '2024-06-07 00:32:49', '2024-06-07 00:32:49', '0', '0', '0');
INSERT INTO `dish` VALUES ('82', '9', '3', '千叶豆腐', '3.00', '串', '千叶豆腐', 'https://p0.meituan.net/wmproduct/5bdfcdb955ecb0568db4f39a958825d9552827.jpg@225w', '1', '2024-06-07 00:32:49', '2024-06-07 00:32:49', '0', '0', '0');
INSERT INTO `dish` VALUES ('83', '9', '2', '自制鸡胗子', '4.50', '串', '自制鸡胗子', 'https://p0.meituan.net/wmproduct/887c5a940a7a776f9de9949aac799e74566627.jpg@225w', '1', '2024-06-07 00:32:49', '2024-06-07 00:32:49', '0', '0', '0');
INSERT INTO `dish` VALUES ('84', '9', '1', '手工原味炸鸡排', '6.00', '个', '手工原味炸鸡排', 'https://p0.meituan.net/wmproduct/b93b015091601e9f6b8a9d75d8e9c590593301.jpg@225w', '1', '2024-06-07 00:32:49', '2024-06-07 00:32:49', '0', '0', '0');
INSERT INTO `dish` VALUES ('85', '9', '1', '手工奥尔良炸鸡排', '9.00', '个', '手工奥尔良炸鸡排', 'https://p0.meituan.net/wmproduct/2006b0b5a44bc78400dd9f64131e3869577844.jpg@225w', '1', '2024-06-07 00:32:49', '2024-06-07 00:32:49', '0', '0', '0');
INSERT INTO `dish` VALUES ('86', '10', '2', '整只鸭套餐', '88.00', '只', '整只鸭套餐', 'https://p0.meituan.net/wmproduct/ebdcc9c3f9ea08cc2c7d468c802ae3fd99088.jpg@225w', '1', '2024-06-07 00:38:40', '2024-06-07 00:38:40', '0', '0', '0');
INSERT INTO `dish` VALUES ('87', '10', '2', '整只烤鸭+椒盐鸭架+春饼+葱丝黄瓜+鸭酱', '101.00', '份', '整只烤鸭+椒盐鸭架+春饼+葱丝黄瓜+鸭酱', 'https://p1.meituan.net/wmproduct/a337de9dc2b9c668e8326fc4053503f1125386.jpg@225w', '1', '2024-06-07 00:38:40', '2024-06-07 00:38:40', '0', '0', '0');
INSERT INTO `dish` VALUES ('88', '10', '2', '北京烤鸭套餐', '129.00', '份', '北京烤鸭套餐', 'https://p0.meituan.net/wmproduct/c31e901ca15c1304c82ec2d8b2d65b8f88849.jpg@225w', '1', '2024-06-07 00:38:40', '2024-06-07 00:38:40', '0', '0', '0');
INSERT INTO `dish` VALUES ('89', '10', '1', '烤鸭两只', '199.00', '份', '烤鸭两只', 'https://p0.meituan.net/wmproduct/7220ac942659887b562b25981eb4abf3110630.jpg@225w', '1', '2024-06-07 00:38:40', '2024-06-07 00:38:40', '0', '0', '0');
INSERT INTO `dish` VALUES ('90', '10', '1', '半只烤鸭', '55.00', '只', '半只烤鸭', 'https://p0.meituan.net/wmproduct/2db6e3cf9ec3f0b385d4f70e995ef95d119974.jpg@225w', '1', '2024-06-07 00:38:40', '2024-06-07 00:38:40', '0', '0', '0');
INSERT INTO `dish` VALUES ('91', '10', '1', '北京烤鸭半只', '66.00', '只', '北京烤鸭半只', 'https://p0.meituan.net/wmproduct/a3a115b77c77c265d8d5ba8a2433106783842.jpg@225w', '1', '2024-06-07 00:38:40', '2024-06-07 00:38:40', '0', '0', '0');
INSERT INTO `dish` VALUES ('92', '10', '3', '半只烤鸭加春饼', '58.00', '份', '半只烤鸭加春饼', 'https://p0.meituan.net/wmproduct/ac9314b85170378bd2f20ea106227552111470.jpg@225w', '1', '2024-06-07 00:38:40', '2024-06-07 00:38:40', '0', '0', '0');
INSERT INTO `dish` VALUES ('93', '10', '3', '半只烤鸭加春饼加椒盐鸡架', '77.00', '份', '半只烤鸭加春饼加椒盐鸡架', 'https://p0.meituan.net/wmproduct/98ddb76b7645abd1330a95fcee5f3670114317.jpg@225w', '1', '2024-06-07 00:38:40', '2024-06-07 00:38:40', '0', '0', '0');
INSERT INTO `dish` VALUES ('94', '10', '3', '原味春饼', '3.00', '张', '原味春饼', 'https://p0.meituan.net/wmproduct/f6299aa9c01394d8f94250779f3d103c101555.jpg@225w', '1', '2024-06-07 00:38:40', '2024-06-07 00:38:40', '0', '0', '0');
INSERT INTO `dish` VALUES ('95', '10', '1', '香酥炸鸡架', '10.00', '个', '香酥炸鸡架', 'https://p1.meituan.net/wmproduct/78de49eca44975eabbf1b467f68d7e9f114491.jpg@225w', '1', '2024-06-07 00:38:40', '2024-06-07 00:38:40', '0', '0', '0');

-- ----------------------------
-- Table structure for merchant_category
-- ----------------------------
DROP TABLE IF EXISTS `merchant_category`;
CREATE TABLE `merchant_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `restaurant_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int NOT NULL DEFAULT '0' COMMENT '乐观锁版本号',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  PRIMARY KEY (`id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `merchant_category_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商家专属分类表';

-- ----------------------------
-- Records of merchant_category
-- ----------------------------

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `dish_id` int NOT NULL,
  `dish_name` varchar(100) DEFAULT NULL,
  `restaurant_id` int DEFAULT NULL,
  `quantity` int NOT NULL COMMENT '数量',
  `unit_price` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `sub_total` decimal(10,2) NOT NULL COMMENT '小计',
  `image_url` varchar(200) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `version` int NOT NULL DEFAULT '0' COMMENT '乐观锁版本号',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `dish_id` (`dish_id`),
  CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`dish_id`) REFERENCES `dish` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `restaurant_id` int NOT NULL,
  `address_id` int DEFAULT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `order_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(100) NOT NULL,
  `remark` text COMMENT '备注',
  `image_url` varchar(200) DEFAULT NULL,
  `restaurant_name` varchar(100) DEFAULT NULL,
  `expected_delivery_time` datetime DEFAULT NULL COMMENT '预计送达时间',
  `actual_delivery_time` datetime DEFAULT NULL COMMENT '实际送达时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `version` int NOT NULL DEFAULT '0' COMMENT '乐观锁版本号',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `restaurant_id` (`restaurant_id`),
  KEY `orders_useraddresses_id_fk` (`address_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `orders_useraddresses_id_fk` FOREIGN KEY (`address_id`) REFERENCES `useraddresses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for restaurant
-- ----------------------------
DROP TABLE IF EXISTS `restaurant`;
CREATE TABLE `restaurant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '店名',
  `address` varchar(200) NOT NULL COMMENT '地址',
  `contact_phone` varchar(20) NOT NULL COMMENT '联系人电话',
  `description` text COMMENT '描述',
  `opening_hours` varchar(50) DEFAULT NULL COMMENT '商家营业时间',
  `status` int DEFAULT '0' COMMENT '营业状态 0为营业 1为关门',
  `approval_status` int DEFAULT '0' COMMENT '平台审核状态 0为未通过 1为通过',
  `website` varchar(200) DEFAULT NULL COMMENT '官方网址',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `version` int NOT NULL DEFAULT '0' COMMENT '乐观锁版本号',
  `image_url` varchar(200) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  `contact_name` varchar(100) NOT NULL COMMENT '联系人姓名',
  `email` varchar(200) DEFAULT NULL,
  `rating` double DEFAULT NULL COMMENT '星级评价',
  `delivery_fees` double DEFAULT NULL COMMENT '配送费',
  `restaurant_category_id` int DEFAULT NULL COMMENT '商家分类信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of restaurant
-- ----------------------------
INSERT INTO `restaurant` VALUES ('1', '华莱士', '天津市北辰区西堤头镇', '19999999999', '华莱士真好吃', '08:00-00:00', '0', '0', 'http://hualaishi.com', '2024-06-03 14:05:55', '2024-06-03 14:05:55', '14', 'https://p1.meituan.net/waimaipoi/75904b776141696edbd269fd88fd4fd9273211.jpg@130w', '0', '冯承轩', 'fengchengxuan@sb.com', '3.8', '2', null);
INSERT INTO `restaurant` VALUES ('2', '天水麻辣烫', '成都市武侯区小吃街1号', '028-12345678', '地道四川麻辣烫，辣而不燥，回味悠长。', '10:00-22:00', '0', '1', 'http://tianshuimlt.com', '2024-06-03 21:41:57', '2024-06-03 21:41:57', '4', 'https://p1.meituan.net/business/86d57adee42578b98b87e3e104474f841502755.png', '0', '张师傅', 'tianshuimlt@spicy.com', '2', '1', null);
INSERT INTO `restaurant` VALUES ('3', '7cake榴莲千层蛋糕', '广州市天河区甜品中心201室', '020-88889999', '选用优质榴莲，层层叠叠，香甜不腻', '11:00-23:00', '0', '1', 'http://7cakeshop.com', '2024-06-03 21:41:57', '2024-06-03 21:41:57', '5', 'https://p1.meituan.net/business/2955c775400e8ff74ad3659c462f70e9440726.png', '0', '林小姐', '7cake@duriancake.com', '4', '1.5', null);
INSERT INTO `restaurant` VALUES ('4', 'CHAGEE霸王茶姬', '上海市长宁区时尚广场B1层', '021-55556666', '新中式茶饮，茶香浓郁，口感独特。', '10:00-22:00', '0', '1', 'http://chageetea.com', '2024-06-03 21:41:57', '2024-06-03 21:41:57', '1', 'https://p0.meituan.net/waimaipoi/9901776b0f454eec838c36cbce1b8e01257296.jpg', '0', '陈先生', 'chagee@teashop.com', '0', '2', null);
INSERT INTO `restaurant` VALUES ('5', '蜜雪冰城', '成都市锦江区春熙路步行街', '028-12312345', '流行饮品店，提供多样甜品与茶饮', '09:00-23:00', '0', '1', 'http://xiaoshouwang.com', '2024-06-03 21:41:57', '2024-06-03 21:41:57', '6', 'https://p0.meituan.net/waimaipoi/9a71de3fabceb5cc2dc495f4310e3564664708.jpg', '0', '赵店长', 'xiaoshouwang@duck.com', '1', '2.5', null);
INSERT INTO `restaurant` VALUES ('6', '汉堡王', '杭州市上城区湖滨银泰', '0571-23456789', '国际快餐品牌，主打各式汉堡套餐', '10:00-22:00', '0', '1', 'http://xiaoshouwang.com', '2024-06-03 21:41:57', '2024-06-03 21:41:57', '5', 'https://p0.meituan.net/waimaipoi/e11a46643f168f8a5c895bd4031c5a47122850.png', '0', '陈经理', 'xiaoshouwang@duck.com', '5', '2', null);
INSERT INTO `restaurant` VALUES ('7', '正谈炸鸡', '武汉市江汉路步行街', '027-34567890', '韩式炸鸡，外酥里嫩，多种口味选择', '11:00-21:30', '0', '1', 'http://xiaoshouwang.com', '2024-06-03 21:41:57', '2024-06-03 21:41:57', '1', 'https://p0.meituan.net/business/97d963ef30b82bc99f68117a8ff1557b349759.png', '0', '周老板', 'xiaoshouwang@duck.com', '0', '1', null);
INSERT INTO `restaurant` VALUES ('8', '米村拌饭', '南京市秦淮区夫子庙', '025-45678901', '传统韩式拌饭，配料丰富，口感层次分明', '10:30-22:00', '0', '1', 'http://xiaoshouwang.com', '2024-06-03 21:41:57', '2024-06-03 21:41:57', '0', 'https://p0.meituan.net/waimaipoi/eb25ebf7ce0d73eed62a7f9b555c7b8f184991.jpg', '0', '吴厨师长', 'xiaoshouwang@duck.com', '4.6', '3', null);
INSERT INTO `restaurant` VALUES ('9', '小食王', '北京市朝阳区三里屯SOHO', '010-12345678', '提供正宗炸串', '10:00-22:00', '0', '1', 'http://xiaoshouwang.com', '2024-06-03 21:41:57', '2024-06-03 21:41:57', '0', 'https://p0.meituan.net/waimaipoi/468ed38d5844b7092c24cb347fc21bbd1221485.png', '0', '张经理', 'xiaoshouwang@duck.com', '2.1', '1', null);
INSERT INTO `restaurant` VALUES ('10', '青年餐厅.烤鸭', '北京市朝阳区三里屯SOHO', '010-12345678', '提供正宗北京烤鸭及各类精品菜肴', '10:00-22:00', '0', '1', 'http://erxiangli.com', '2024-06-03 21:41:57', '2024-06-03 21:41:57', '0', 'https://p0.meituan.net/waimaipoi/468ed38d5844b7092c24cb347fc21bbd1221485.png', '0', '张经理', 'erxiangli@duck.com', '2.6', '2.5', null);
INSERT INTO `restaurant` VALUES ('11', '二巷里碳烤排骨', '南京市秦淮区美食街123号', '025-44445555', '秘制碳烤排骨，外焦里嫩，香气扑鼻。', '11:30-23:00', '0', '1', 'http://erxiangli.com', '2024-06-03 21:41:57', '2024-06-03 21:41:57', '0', 'https://p0.meituan.net/waimaipoi/d30dcccc278c2456bb0b3555b13966e6281944.jpg', '0', '老李', 'erxiangli@ribs.com', '2.4', '3', null);
INSERT INTO `restaurant` VALUES ('12', '西贝莜面村', '北京市朝阳区燕莎商城3楼', '010-99998888', '西北风情，健康莜面，传统美味。', '10:00-21:30', '0', '1', 'http://xbeimian.com', '2024-06-03 21:41:57', '2024-06-03 21:41:57', '0', 'https://p0.meituan.net/waimaipoi/7177207a470cc107f56e3f426a83a97e62401.jpg', '0', '王经理', 'xbeimian@northflavor.com', '5', '1', null);
INSERT INTO `restaurant` VALUES ('13', '云水谣云南菜馆', '广州市天河区体育西路', '020-88889999', '云南菜', '11:00-22:00', '0', '1', 'http://xbeimian.com', '2024-06-03 21:41:57', '2024-06-03 21:41:57', '0', 'https://p0.meituan.net/waimaipoi/59d35cd106510475729cd84229de22bf62956.jpg', '0', '老刘', 'zb-skewers@nightmarket.com', '4.9', '1.5', null);
INSERT INTO `restaurant` VALUES ('14', '尚品轩烤鱼坊', '深圳市南山区海岸城', '0755-77778888', '烤鱼', '10:30-23:30', '0', '1', 'http://xbeimian.com', '2024-06-03 21:41:57', '2024-06-03 21:41:57', '0', 'https://p0.meituan.net/waimaipoi/7177207a470cc107f56e3f426a83a97e62401.jpg', '0', '老六', 'zb-skewers@nightmarket.com', '4.6', '1', null);
INSERT INTO `restaurant` VALUES ('15', '遇见小面', '重庆市渝中区解放碑', '023-66667777', '重庆小面', '08:00-23:00', '0', '1', 'http://xbeimian.com', '2024-06-03 21:41:57', '2024-06-03 21:41:57', '0', 'https://p0.meituan.net/waimaipoi/b2d23144b71b06bae2720a2de914113b170071.jpg', '0', '老马', 'zb-skewers@nightmarket.com', '3.5', '2', null);
INSERT INTO `restaurant` VALUES ('16', '老北京炸酱面', '北京市东城区王府井大街', '010-99991111', '京味面食', '09:30-21:00', '0', '1', 'http://xbeimian.com', '2024-06-03 21:41:57', '2024-06-03 21:41:57', '0', 'https://p0.meituan.net/waimaipoi/c37e8f962b50c18302ef744c9bc5913e730724.png', '0', '老郭', 'zb-skewers@nightmarket.com', '4.2', '2.5', null);
INSERT INTO `restaurant` VALUES ('17', '安悦煎饼', '杭州市下城区早点街1号', '0571-77776666', '传统手艺，薄脆可口，营养早餐。', '06:30-10:00, 15:00-20:00', '0', '1', 'http://anyuejb.com', '2024-06-03 21:41:57', '2024-06-03 21:41:57', '0', 'https://p0.meituan.net/business/09a86eba247810f56a3a7350529b8f46336056.jpg', '0', '刘阿姨', 'anyue@jianbing.com', '4.6', '3', null);
INSERT INTO `restaurant` VALUES ('18', '淄博烧烤', '淄博市张店区夜市一条街A区', '0533-66667777', '地道淄博风味，烧烤种类丰富，深夜食堂。', '17:00-次日02:00', '0', '1', 'http://zb烧烤.com', '2024-06-03 21:41:57', '2024-06-03 21:41:57', '0', 'https://p0.meituan.net/business/b93af5c26afbd2680277690e9eb31c1e150228.jpg', '0', '老孙', 'zb-skewers@nightmarket.com', '4.1', '4', null);
INSERT INTO `restaurant` VALUES ('19', '北京烤鸭', '北京市东城区王府井大街', '010-99991111', '京味面食', '09:30-21:00', '0', '1', 'http://xbeimian.com', '2024-06-03 21:41:57', '2024-06-03 21:41:57', '0', 'https://p0.meituan.net/waimaipoi/c37e8f962b50c18302ef744c9bc5913e730724.png', '0', '老郭', 'zb-skewers@nightmarket.com', '3.5', '2.5', null);
INSERT INTO `restaurant` VALUES ('20', '火星烤串', '北京市朝阳区三里屯SOHO', '010-12345678', '火星主题烧烤，异域风情，深夜美食探索地。', '18:00-次日03:00', '1', '1', 'http://mars-grill.com', '2024-06-03 21:41:57', '2024-06-03 21:41:57', '0', 'https://img.alicdn.com/imgextra/i1/2214500291780/O1CN01IrmbfB1P1HsAp8kP0_!!2214500291780-2-koubei.png_400x400Q85s50.jpg_.webp', '1', '李火星', 'mars-grill@example.com', '3.6', '3', null);
INSERT INTO `restaurant` VALUES ('21', '海边烧烤小屋', '厦门市曾厝垵海滨路1号', '0592-88889999', '海景边的烧烤体验，海鲜新鲜，氛围浪漫。', '16:00-23:00', '1', '0', 'http://seaside-grill.com', '2024-06-03 21:41:57', '2024-06-03 21:41:57', '0', 'https://cube.elemecdn.com/8/c3/c0899ea9b8326bd22180bd022b053png.png?x-oss-process=image/resize,m_mfit,w_400,h_400/format,webp/quality,q_85', '0', '张海风', 'seaside-grill@example.com', '3.4', '1', null);
INSERT INTO `restaurant` VALUES ('22', '胡同里的串儿', '天津市和平区五大道', '022-77778888', '藏于老胡同，传统烤串手艺，老天津卫味道。', '17:30-22:00', '1', '1', 'http://hutong-skewers.com', '2024-06-03 21:41:57', '2024-06-03 21:41:57', '0', 'https://img.alicdn.com/imgextra/i1/2216584806874/O1CN01m7ajed20eLR02utmq_!!2216584806874-0-koubei.jpg_400x400Q85s50.jpg_.webp', '1', '赵大爷', 'hutong-skewers@example.com', '3.5', '3', null);
INSERT INTO `restaurant` VALUES ('23', '江南烤吧', '杭州市西湖区河坊街', '0571-99997777', '江南水乡特色烧烤，环境优雅，口味独特。', '19:00-次日01:00', '1', '1', 'http://jiangnan-grill.com', '2024-06-03 21:41:57', '2024-06-03 21:41:57', '0', 'https://cube.elemecdn.com/8/b1/e4fced451dd056e50c3ba91ac7efbjpeg.jpeg?x-oss-process=image/resize,m_mfit,w_400,h_400/format,webp/quality,q_85', '0', '吴梅', 'jiangnan-grill@example.com', '2.4', '2', null);
INSERT INTO `restaurant` VALUES ('24', '川香烤串工坊', '成都市锦江区春熙路', '028-66661111', '地道四川辣味烧烤，夜宵必选之地。', '17:00-次日03:00', '1', '1', 'http://sichuan-skewers.com', '2024-06-03 21:41:57', '2024-06-03 21:41:57', '0', 'https://img.alicdn.com/imgextra/i1/2201192056653/O1CN012SO21f1z17c9HX6Xu_!!2201192056653-0-koubei.jpg_400x400Q85s50.jpg_.webp', '1', '刘川香', 'sichuan-skewers@example.com', '2.6', '1', null);
INSERT INTO `restaurant` VALUES ('25', '草原风情烤羊腿', '呼和浩特市赛罕区蒙古大营', '0471-22223333', '正宗草原风味，大口吃肉，畅饮美酒。', '16:30-22:30', '1', '0', 'http://prairie-grill.com', '2024-06-03 21:41:57', '2024-06-03 21:41:57', '0', 'https://img.alicdn.com/imgextra/i4/2216502322810/O1CN01fiLOYg1Wd1pGavTcX_!!2216502322810-2-koubei.png_400x400Q85s50.jpg_.webp', '0', '巴图', 'prairie-grill@example.com', '3.1', '1.5', null);
INSERT INTO `restaurant` VALUES ('26', '星夜烤吧', '广州市天河区体育西路', '020-88886666', '现代风格烤吧，夜间璀璨，烧烤与音乐的完美结合。', '18:00-02:00', '1', '1', 'http://starlightgrill.com', '2024-06-03 21:41:57', '2024-06-03 21:41:57', '0', 'https://img.alicdn.com/imgextra/i2/2217712179001/O1CN01y8stYd2GMVw1a5q8S_!!2217712179001-2-koubei.png_400x400Q85s50.jpg_.webp', '1', '陈星宇', 'starlightgrill@example.com', '2.9', '2.5', null);
INSERT INTO `restaurant` VALUES ('27', '老街坊串串香', '重庆市渝中区解放碑', '023-77779999', '传统重庆串串，麻辣鲜香，街头巷尾的地道滋味。', '16:30-01:00', '1', '1', 'http://oldalleyhotpot.com', '2024-06-03 21:41:57', '2024-06-03 21:41:57', '0', 'https://img.alicdn.com/imgextra/i1/2216395966008/O1CN01jK4scj1uFiQzhbhXj_!!2216395966008-2-koubei.png_400x400Q85s50.jpg_.webp', '0', '张阿姨', 'oldalley@example.com', '2.8', '3.5', null);
INSERT INTO `restaurant` VALUES ('28', '海韵烧烤舫', '青岛市市南区海边路', '0532-55553333', '海边烧烤船，海鲜直供，海风与美食的双重享受。', '17:00-23:30', '0', '1', 'http://oceanbbqboat.com', '2024-06-03 21:41:57', '2024-06-03 21:41:57', '0', 'https://img.alicdn.com/imgextra/i2/2217923151668/O1CN01ARgdXg1OBzb7Oie9Q_!!2217923151668-2-koubei.png_400x400Q85s50.jpg_.webp', '1', '李船长', 'oceanbbq@example.com', '4.1', '2', null);
INSERT INTO `restaurant` VALUES ('29', '深夜食堂烤串', '南京市秦淮区夫子庙', '025-11112222', '文化古迹旁的小资烤串，故事与美味同在。', '20:00-03:00', '1', '1', 'http://latesupperbbq.com', '2024-06-03 21:41:57', '2024-06-03 21:41:57', '0', 'https://img.alicdn.com/imgextra/i3/2216975973588/O1CN019dVwCB1cNLz7fghRz_!!2216975973588-2-koubei.png_400x400Q85s50.jpg_.webp', '0', '赵老板', 'latesupper@example.com', '3.6', '3', null);
INSERT INTO `restaurant` VALUES ('30', '山城烤鱼馆', '重庆市沙坪坝区磁器口', '023-66668888', '特色烤鱼，鲜嫩多汁，搭配秘制调料，回味无穷。', '17:00-01:00', '1', '1', 'http://mountaincityfish.com', '2024-06-03 21:41:57', '2024-06-03 21:41:57', '0', 'https://img.alicdn.com/imgextra/i2/2217709935156/O1CN01hEC4481nxV3lg3SLo_!!2217709935156-2-koubei.png_400x400Q85s50.jpg_.webp', '1', '周师傅', 'mountaincity@example.com', '5', '1', null);
INSERT INTO `restaurant` VALUES ('31', '草原牧歌烤肉', '呼和浩特市新城区草原广场', '0471-33334444', '蒙古包内体验草原风情烤肉，大块朵颐的豪迈之选。', '19:00-00:00', '0', '1', 'http://grasslandbbq.com', '2024-06-03 21:41:57', '2024-06-03 21:41:57', '0', 'https://img.alicdn.com/imgextra/i2/2217623942200/O1CN01BtvG5C1S7eHVCCwlB_!!2217623942200-2-koubei.png_400x400Q85s50.jpg_.webp', '0', '额尔敦', 'grasslandbbq@example.com', '4.2', '2.5', null);

-- ----------------------------
-- Table structure for restaurant_swiper_image
-- ----------------------------
DROP TABLE IF EXISTS `restaurant_swiper_image`;
CREATE TABLE `restaurant_swiper_image` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键约束，确保每条记录的唯一性',
  `image_url` varchar(500) NOT NULL,
  `title` varchar(100) NOT NULL COMMENT '轮播图的标题，简短描述轮播内容',
  `description` text COMMENT '轮播图的详细描述，可选，进一步解释轮播内容或引导信息',
  `display_order` int NOT NULL DEFAULT '0' COMMENT '显示顺序，用于控制轮播图的展示次序，数值越小越靠前，默认为0',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用该轮播图，TRUE表示启用，FALSE表示禁用，默认启用',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建该轮播图的时间，自动获取系统当前时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录最近一次更新轮播图信息的时间，每次更新时自动刷新',
  `version` int NOT NULL DEFAULT '0',
  `deleted` tinyint NOT NULL DEFAULT '0',
  `restaurant_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `restaurant_swiper_image_restaurant_id_fk` (`restaurant_id`),
  CONSTRAINT `restaurant_swiper_image_restaurant_id_fk` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='存储每一个商家的轮播图表信息的表，用于网站或应用首页的动态展示';

-- ----------------------------
-- Records of restaurant_swiper_image
-- ----------------------------
INSERT INTO `restaurant_swiper_image` VALUES ('1', 'https://img.zcool.cn/community/01e0c66237e0f90002c3290fe9852f.jpg?x-oss-process=image/crop,h_1440,g_north', '华莱士轮播图1', '华莱士轮播图1', '0', '1', '2024-06-11 22:45:52', '2024-06-11 22:45:52', '0', '0', '1');
INSERT INTO `restaurant_swiper_image` VALUES ('2', 'https://tse1-mm.cn.bing.net/th/id/OIP-C.B91b9xMyjoguWRMgLAbG3wAAAA?rs=1&pid=ImgDetMain', '华莱士轮播图2', '华莱士轮播图2', '0', '1', '2024-06-11 22:45:52', '2024-06-11 22:45:52', '0', '0', '1');
INSERT INTO `restaurant_swiper_image` VALUES ('3', 'https://img.36krcdn.com/20210816/v2_1947f9f44bb0443ba9062eefd4cf0661_img_000', '华莱士轮播图3', '华莱士轮播图3', '0', '1', '2024-06-11 22:45:52', '2024-06-11 22:45:52', '0', '0', '1');
INSERT INTO `restaurant_swiper_image` VALUES ('4', 'https://store.is.autonavi.com/showpic/6ea626fb59ecf3bacc7a1a1ccfddb4d9?type=pic', '天水麻辣烫轮播图1', '天水麻辣烫轮播图1', '0', '1', '2024-06-11 23:53:29', '2024-06-11 23:53:29', '0', '0', '2');
INSERT INTO `restaurant_swiper_image` VALUES ('5', 'https://store.is.autonavi.com/showpic/264f08bcd047a5f0c63403acb72528f8', '天水麻辣烫轮播图2', '天水麻辣烫轮播图2', '0', '1', '2024-06-11 23:54:13', '2024-06-11 23:54:13', '0', '0', '2');
INSERT INTO `restaurant_swiper_image` VALUES ('6', 'https://store.is.autonavi.com/showpic/7a7c107261b7520a49a003dca3389ae7', '天水麻辣烫轮播图3', '天水麻辣烫轮播图3', '0', '1', '2024-06-11 23:54:49', '2024-06-11 23:54:49', '0', '0', '2');
INSERT INTO `restaurant_swiper_image` VALUES ('7', 'https://store.is.autonavi.com/showpic/90518a92fea5dfde973384c93e65faef?type=pic', '7cake榴莲千层蛋糕轮播图1', '7cake榴莲千层蛋糕轮播图1', '0', '1', '2024-06-11 23:56:59', '2024-06-11 23:56:59', '0', '0', '3');
INSERT INTO `restaurant_swiper_image` VALUES ('8', 'https://store.is.autonavi.com/showpic/90518a92fea5dfde973384c93e65faef', '7cake榴莲千层蛋糕轮播图2', '7cake榴莲千层蛋糕轮播图2', '0', '1', '2024-06-11 23:56:59', '2024-06-11 23:56:59', '0', '0', '3');
INSERT INTO `restaurant_swiper_image` VALUES ('9', 'https://store.is.autonavi.com/showpic/51c604855f00a7fbc9c4dcb844a118ab', '7cake榴莲千层蛋糕轮播图3', '7cake榴莲千层蛋糕轮播图3', '0', '1', '2024-06-11 23:56:59', '2024-06-11 23:56:59', '0', '0', '3');
INSERT INTO `restaurant_swiper_image` VALUES ('10', 'https://store.is.autonavi.com/showpic/04a8c1eedb6a7ba27480531f74e80041?type=pic', '霸王茶姬轮播图1', '霸王茶姬轮播图1', '0', '1', '2024-06-11 23:58:45', '2024-06-11 23:58:45', '0', '0', '4');
INSERT INTO `restaurant_swiper_image` VALUES ('11', 'https://store.is.autonavi.com/showpic/a55a0ed19bd3884ffb03cdb64f07f727', '霸王茶姬轮播图2', '霸王茶姬轮播图2', '0', '1', '2024-06-11 23:58:45', '2024-06-11 23:58:45', '0', '0', '4');
INSERT INTO `restaurant_swiper_image` VALUES ('12', 'https://store.is.autonavi.com/showpic/32df3b7bc62bf395b400f31e86f27921?type=pic', '霸王茶姬轮播图3', '霸王茶姬轮播图3', '0', '1', '2024-06-11 23:58:45', '2024-06-11 23:58:45', '0', '0', '4');
INSERT INTO `restaurant_swiper_image` VALUES ('13', 'https://store.is.autonavi.com/showpic/88e8522b6f914216bf4f46e354b360b4', '蜜雪冰城轮播图1', '蜜雪冰城轮播图1', '0', '1', '2024-06-12 00:03:40', '2024-06-12 00:03:40', '0', '0', '5');
INSERT INTO `restaurant_swiper_image` VALUES ('14', 'https://store.is.autonavi.com/showpic/159c8e19b0474fb083529ff7ad54d78d', '蜜雪冰城轮播图2', '蜜雪冰城轮播图2', '0', '1', '2024-06-12 00:03:40', '2024-06-12 00:03:40', '0', '0', '5');
INSERT INTO `restaurant_swiper_image` VALUES ('15', 'https://store.is.autonavi.com/showpic/25be9041aa66eba5cbbe3901eabbb92a', '蜜雪冰城轮播图3', '蜜雪冰城轮播图3', '0', '1', '2024-06-12 00:03:40', '2024-06-12 00:03:40', '0', '0', '5');
INSERT INTO `restaurant_swiper_image` VALUES ('16', 'https://store.is.autonavi.com/showpic/0205751b31081add9eba69c723453504', '正谈鸡排轮播图1', '正谈鸡排轮播图1', '0', '1', '2024-06-12 00:03:40', '2024-06-12 00:10:27', '0', '0', '7');
INSERT INTO `restaurant_swiper_image` VALUES ('17', 'https://store.is.autonavi.com/showpic/d52af5fa4c909513c3054b1e9dda483e', '正谈鸡排轮播图2', '正谈鸡排轮播图2', '0', '1', '2024-06-12 00:03:40', '2024-06-12 00:10:27', '0', '0', '7');
INSERT INTO `restaurant_swiper_image` VALUES ('18', 'https://store.is.autonavi.com/showpic/fd04cbdd416679b48dd893979c775f8a', '正谈鸡排轮播图3', '正谈鸡排轮播图3', '0', '1', '2024-06-12 00:03:40', '2024-06-12 00:10:27', '0', '0', '7');
INSERT INTO `restaurant_swiper_image` VALUES ('19', 'https://store.is.autonavi.com/showpic/91f20e0c62aaca8aa3ae3b218bec59a5', '米村拌饭轮播图1', '米村拌饭轮播图1', '0', '1', '2024-06-12 00:10:27', '2024-06-12 00:10:27', '0', '0', '8');
INSERT INTO `restaurant_swiper_image` VALUES ('20', 'https://store.is.autonavi.com/showpic/bba7e1cfc1f01a252155e54d208c4c8d', '米村拌饭轮播图2', '米村拌饭轮播图2', '0', '1', '2024-06-12 00:10:27', '2024-06-12 00:10:27', '0', '0', '8');
INSERT INTO `restaurant_swiper_image` VALUES ('21', 'https://store.is.autonavi.com/showpic/29edfde34037b07a6e86f318d91295cd', '米村拌饭轮播图3', '米村拌饭轮播图3', '0', '1', '2024-06-12 00:10:27', '2024-06-12 00:10:27', '0', '0', '8');
INSERT INTO `restaurant_swiper_image` VALUES ('22', 'https://store.is.autonavi.com/showpic/62c140183736a035fc7c0b268948c7d6', '小食王轮播图1', '小食王轮播图1', '0', '1', '2024-06-12 00:10:27', '2024-06-12 00:10:27', '0', '0', '9');
INSERT INTO `restaurant_swiper_image` VALUES ('23', 'https://store.is.autonavi.com/showpic/71f39e1b8be5b348dc22b0443f7469a3', '小食王轮播图2', '小食王轮播图2', '0', '1', '2024-06-12 00:10:27', '2024-06-12 00:10:27', '0', '0', '9');
INSERT INTO `restaurant_swiper_image` VALUES ('24', 'https://store.is.autonavi.com/showpic/8e80ae13ca38402addcafaf3bc6c2864', '小食王轮播图3', '小食王轮播图3', '0', '1', '2024-06-12 00:10:27', '2024-06-12 00:10:27', '0', '0', '9');
INSERT INTO `restaurant_swiper_image` VALUES ('25', 'https://store.is.autonavi.com/showpic/5198151b78703d7c5db4774db6887fc7?type=pic', '青年餐厅·烤鸭轮播图1', '青年餐厅·烤鸭轮播图1', '0', '1', '2024-06-12 00:10:27', '2024-06-12 00:10:27', '0', '0', '10');
INSERT INTO `restaurant_swiper_image` VALUES ('26', 'https://store.is.autonavi.com/showpic/0cf791f45d3e6fb05da60fd8778e2c92', '青年餐厅·烤鸭轮播图2', '青年餐厅·烤鸭轮播图2', '0', '1', '2024-06-12 00:10:27', '2024-06-12 00:10:27', '0', '0', '10');
INSERT INTO `restaurant_swiper_image` VALUES ('27', 'https://store.is.autonavi.com/showpic/2500fabe9b87ec7a8283ae8d33587bbc', '青年餐厅·烤鸭轮播图3', '青年餐厅·烤鸭轮播图3', '0', '1', '2024-06-12 00:10:27', '2024-06-12 00:10:27', '0', '0', '10');
INSERT INTO `restaurant_swiper_image` VALUES ('28', 'https://ts1.cn.mm.bing.net/th/id/R-C.d8f48fdde524f24d454b71849f541c70?rik=rkzAhXxMD5y37w&riu=http%3a%2f%2froifestival.storage.comocloud.net%2froifestival%2f2018%2f05%2f18%2f201805181054152d67fc08.9.jpg&ehk=Z6cQY4SuzrZrGDIRCLOqRJfETsev%2fUu8TzBUvdyuzyM%3d&risl=&pid=ImgRaw&r=0', '汉堡王轮播图1', '汉堡王轮播图1', '0', '1', '2024-06-12 00:12:18', '2024-06-12 00:12:18', '0', '0', '6');
INSERT INTO `restaurant_swiper_image` VALUES ('29', 'https://img.zcool.cn/community/01c384570f0bb832f875a839779c28.jpg@2o.jpg', '汉堡王轮播图2', '汉堡王轮播图2', '0', '1', '2024-06-12 00:12:18', '2024-06-12 00:12:18', '0', '0', '6');
INSERT INTO `restaurant_swiper_image` VALUES ('30', 'https://ts1.cn.mm.bing.net/th/id/R-C.7e054b9238b6562bb4ccd12fc19420b6?rik=ibtW6DZhf4%2bv3A&riu=http%3a%2f%2fam.zdmimg.com%2f201903%2f19%2f5c90715f495df1836.jpg_e600.jpg&ehk=7zVkLbhYYjdHiJ3ZHrpWdDA%2blw8zgWcmfNNHPj%2b2Jb4%3d&risl=&pid=ImgRaw&r=0', '汉堡王轮播图3', '汉堡王轮播图3', '0', '1', '2024-06-12 00:12:18', '2024-06-12 00:12:18', '0', '0', '6');

-- ----------------------------
-- Table structure for reviewcomments
-- ----------------------------
DROP TABLE IF EXISTS `reviewcomments`;
CREATE TABLE `reviewcomments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `restaurantId` int NOT NULL,
  `Rating` tinyint NOT NULL,
  `CommentContent` text,
  `CommentTime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `reviewcomments_user_id_fk` (`userId`),
  KEY `reviewcomments_restaurant_id_fk` (`restaurantId`),
  CONSTRAINT `reviewcomments_restaurant_id_fk` FOREIGN KEY (`restaurantId`) REFERENCES `restaurant` (`id`),
  CONSTRAINT `reviewcomments_user_id_fk` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `reviewcomments_chk_1` CHECK ((`Rating` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of reviewcomments
-- ----------------------------
INSERT INTO `reviewcomments` VALUES ('1', '18', '1', '5', '饭菜量很足，价钱也非常合理，送得也很及时。', '2024-07-02 02:56:52');
INSERT INTO `reviewcomments` VALUES ('2', '18', '1', '5', '味道不错很好吃，及时送达，服务态度好，下次再来', '2024-07-02 02:59:24');
INSERT INTO `reviewcomments` VALUES ('3', '18', '3', '5', '饭菜量很足，价钱也非常合理，送得也很及时。', '2024-07-02 03:01:25');
INSERT INTO `reviewcomments` VALUES ('4', '18', '1', '3', '饭菜量很足，价钱也非常合理，送得也很及时。', '2024-07-02 03:02:47');
INSERT INTO `reviewcomments` VALUES ('5', '18', '2', '2', '饭菜量很足，价钱也非常合理，送得也很及时。', '2024-07-02 03:15:16');
INSERT INTO `reviewcomments` VALUES ('6', '18', '1', '1', '非常难吃,避雷', '2024-07-02 12:49:24');
INSERT INTO `reviewcomments` VALUES ('7', '18', '1', '5', '饭菜量很足，价钱也非常合理，送得也很及时。', '2024-07-02 16:15:47');
INSERT INTO `reviewcomments` VALUES ('8', '18', '6', '5', '饭菜量很足，价钱也非常合理，送得也很及时。', '2024-07-02 16:31:09');
INSERT INTO `reviewcomments` VALUES ('9', '18', '5', '1', '真的难喝', '2024-07-02 16:48:04');
INSERT INTO `reviewcomments` VALUES ('10', '18', '3', '3', '饭菜量很足，价钱也非常合理，送得也很及时。', '2024-07-02 17:00:59');

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score` (
  `id` int NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `score` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='软件221成绩表';

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES ('18', 'vue', '7');
INSERT INTO `score` VALUES ('2', 'php', '88');
INSERT INTO `score` VALUES ('4', 'php', '88');
INSERT INTO `score` VALUES ('6', 'php', '88');
INSERT INTO `score` VALUES ('7', 'php', '88');
INSERT INTO `score` VALUES ('9', 'php', '88');
INSERT INTO `score` VALUES ('10', 'php', '88');
INSERT INTO `score` VALUES ('11', 'php', '88');
INSERT INTO `score` VALUES ('12', 'php', '88');
INSERT INTO `score` VALUES ('13', 'php', '88');
INSERT INTO `score` VALUES ('14', 'php', '88');
INSERT INTO `score` VALUES ('16', 'php', '88');
INSERT INTO `score` VALUES ('17', 'php', '88');
INSERT INTO `score` VALUES ('19', 'php', '88');
INSERT INTO `score` VALUES ('20', 'php', '88');
INSERT INTO `score` VALUES ('4', 'vue', '90');
INSERT INTO `score` VALUES ('4', '软件测试', '90');
INSERT INTO `score` VALUES ('4', 'JavaEE框架', '90');
INSERT INTO `score` VALUES ('4', 'uniapp', '90');
INSERT INTO `score` VALUES ('4', '计算机基础', '90');
INSERT INTO `score` VALUES ('18', '计算机网络', '100');
INSERT INTO `score` VALUES ('49', '计算机网络', '80');
INSERT INTO `score` VALUES ('55', 'vue前端框架', '99');
INSERT INTO `score` VALUES ('3', 'vue前端框架', '55');

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `sid` int NOT NULL AUTO_INCREMENT,
  `sname` varchar(100) DEFAULT NULL,
  `mid` int DEFAULT NULL,
  `descr` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES ('1', '计算机网络', '5', 'TCP/IP');
INSERT INTO `subject` VALUES ('2', 'vue前端框架', '5', 'vue原理');
INSERT INTO `subject` VALUES ('3', '计算机组装与维护', '3', '声卡,显卡,外设');

-- ----------------------------
-- Table structure for swiper_image
-- ----------------------------
DROP TABLE IF EXISTS `swiper_image`;
CREATE TABLE `swiper_image` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自增ID，轮播图的唯一标识',
  `image_url` varchar(500) NOT NULL,
  `title` varchar(100) NOT NULL COMMENT '轮播图的标题，简短描述轮播内容',
  `description` text COMMENT '轮播图的详细描述，可选，进一步解释轮播内容或引导信息',
  `display_order` int NOT NULL DEFAULT '0' COMMENT '显示顺序，用于控制轮播图的展示次序，数值越小越靠前，默认为0',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用该轮播图，TRUE表示启用，FALSE表示禁用，默认启用',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建该轮播图的时间，自动获取系统当前时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录最近一次更新轮播图信息的时间，每次更新时自动刷新',
  `version` int NOT NULL DEFAULT '0',
  `deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) COMMENT '主键约束，确保每条记录的唯一性'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='存储轮播图表信息的表，用于网站或应用首页的动态展示';

-- ----------------------------
-- Records of swiper_image
-- ----------------------------
INSERT INTO `swiper_image` VALUES ('1', 'https://img.tukuppt.com/ad_preview/00/13/56/5c997778258a2.jpg!/fw/980', '轮播图1', '轮播图1', '0', '1', '2024-05-31 23:45:29', '2024-06-04 21:57:44', '0', '0');
INSERT INTO `swiper_image` VALUES ('2', 'https://img.zcool.cn/community/014d215e733f15a80120a895e3e1cd.png?x-oss-process=image/auto-orient,1/resize,m_lfit,w_1280,limit_1/sharpen,100', '轮播图2', '轮播图2', '0', '1', '2024-05-31 23:47:20', '2024-05-31 23:47:20', '0', '0');
INSERT INTO `swiper_image` VALUES ('3', 'https://bpic.588ku.com/back_pic/06/12/10/946230530305816.jpg', '轮播图3', '轮播图3', '0', '1', '2024-05-31 23:47:59', '2024-05-31 23:47:59', '0', '0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `openid` varchar(100) NOT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `version` int NOT NULL DEFAULT '0' COMMENT '乐观锁版本号',
  `avatar` text,
  `back_img` text COMMENT '背景图片',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('18', null, null, '郭继业', 'oATED7VQxfgEx8Vnv9nN3gDnKACw', '男', '2471794531@qq.com', '18704749630', '内蒙古自治区乌兰察布市', '2024-06-14 22:27:33', '2024-06-14 22:27:33', '0', 'https://ts1.cn.mm.bing.net/th/id/R-C.a3326dfea8ea5544ebd406b824137ee9?rik=c6C3lRiXIQoEYg&riu=http%3a%2f%2fimg.touxiangwu.com%2fzb_users%2fupload%2f2022%2f11%2f202211021667379370320460.jpg&ehk=VTjaG57lKTodjm5E3FWOUlJf%2fWxUbyZ8lw%2bMXV2END4%3d&risl=&pid=ImgRaw&r=0', 'https://5b0988e595225.cdn.sohucs.com/images/20190819/48edd475ca1e43fbbd97d7bda9e3b333.jpeg', '0');

-- ----------------------------
-- Table structure for useraddresses
-- ----------------------------
DROP TABLE IF EXISTS `useraddresses`;
CREATE TABLE `useraddresses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `contact_name` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `address_detail` text NOT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `useraddresses_user_id_fk` (`user_id`),
  CONSTRAINT `useraddresses_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of useraddresses
-- ----------------------------
INSERT INTO `useraddresses` VALUES ('1', '18', '郭继业', '18704749630', '天津市北辰区', '天津渤海职业技术学院', '1', '2024-06-29 00:40:58', '2024-06-29 00:42:35');
INSERT INTO `useraddresses` VALUES ('32', '18', '000', '000', '北京市-市辖区-西城区', '000', '0', '2024-07-02 16:17:17', '2024-07-02 16:17:17');
INSERT INTO `useraddresses` VALUES ('33', '18', '陈', '18522829052', '天津市-市辖区-和平区', '123', '0', '2024-07-02 16:29:40', '2024-07-02 16:29:40');

-- ----------------------------
-- Procedure structure for user_procedure
-- ----------------------------
DROP PROCEDURE IF EXISTS `user_procedure`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_procedure`(
    IN input_gender VARCHAR(2),
    OUT num INT
)
BEGIN
    -- 临时存储变量，用于存放统计结果
    DECLARE count_gender INT;

    -- 执行统计查询，并将结果赋值给临时变量
    SELECT COUNT(*) INTO count_gender FROM users WHERE gender = input_gender;

    -- 将统计结果赋值给输出参数
    SET num = count_gender;
END
;;
DELIMITER ;
