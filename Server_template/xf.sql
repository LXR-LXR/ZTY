SET NAMES UTF8;
DROP DATABASE IF EXISTS zty;
CREATE DATABASE zty CHARSET=UTF8;
USE zty;

/**用户信息------注册,登录 用户查询数据表中有该用户**/
CREATE TABLE zty_user(
  uid INT PRIMARY KEY AUTO_INCREMENT, 
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone VARCHAR(16),
  age DATE,
  avatar VARCHAR(128),        #头像图片路径
  user_name VARCHAR(32),      #用户名，如王小明
  gender INT                  #性别  0-女  1-男
);



/**商品信息------首页**/

CREATE TABLE zty_index_product(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(64),
  subtitle VARCHAR(128),
  pic VARCHAR(128),
  price DECIMAL(10,2),
  href VARCHAR(128),
  people INT
);





/**商品信息------详情页**/

/**商品详情**/
CREATE TABLE zty_laptop(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  family_id INT,              #所属型号家族编号
  subtitle VARCHAR(128),      #评分出行
  title VARCHAR(128),         #主标题
  price DECIMAL(10,2),        #价格
  spec VARCHAR(64),           #规格/团期价格
  people INT,
  lname VARCHAR(32),          #商品名称
  details VARCHAR(1024),      #详情
  p_img VARCHAR(128),          #详情页的图片
  p_ban1 VARCHAR(128),         #详情页的轮播图
  p_ban2 VARCHAR(128),         #详情页的轮播图
  p_ban3 VARCHAR(128),         #详情页的轮播图
  adult INT,                   #成人价格
  children INT,                #儿童价格
  organize INT                 #组团价格
);
/**购物车条目**/
CREATE TABLE zty_shoppingcart_item(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,      #用户编号
  product_id INT,   #商品编号
  count INT,        #购买数量
  is_checked BOOLEAN #是否已勾选，确定购买
);

/**用户订单**/
CREATE TABLE zty_order(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  uname VARCHAR(255),
  phone VARCHAR(16),
  price DECIMAL(10,2),
  status INT,             #订单状态  1-待付款  2-待出行  3-待评价
  adult INT,     #成人票数量
  children INT,  #儿童票数量
  organize INT   #团购票数量
)AUTO_INCREMENT=10000000;

/**用户购物车表**/
CREATE TABLE zty_cart (
 id INT PRIMARY KEY AUTO_INCREMENT,
 uid INT,
 lid INT,
 adult INT,     #成人票数量
 children INT,  #儿童票数量
 organize INT,   #团购票数量
 uname VARCHAR(255),
 phone VARCHAR(16),
 address VARCHAR(32),
 price DECIMAL(10,2)
);


/****首页轮播广告商品****/
CREATE TABLE zty_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  href VARCHAR(128)
);

/**插入数据**/
/****注册****/
INSERT INTO zty_user VALUES
(NULL, 'dingding', md5(123456), 'ding@qq.com', '13501234567','1998-12-12', 'img/avatar/default.png', '丁伟', '1'),
(NULL, 'dangdang', md5(123456), 'dang@qq.com', '13501234568','1998-12-12',  'img/avatar/default.png', '林当', '1'),
(NULL, 'doudou', md5(123456), 'dou@qq.com', '13501234569','1998-12-12',  'img/avatar/default.png', '窦志强', '1'),
(NULL, 'yaya', md5(123456), 'ya@qq.com', '13501234560','1998-12-12',  'img/avatar/default.png', '秦小雅', '0');

/****首页商品****/
INSERT INTO zty_index_product VALUES
(1, '北京欢乐谷门票', '5', 'image/pic/huanlegu.jpg', '179.00', '1', 1634),
(2, '北京独角兽星空艺术馆', '4.9', 'image/pic/dujiaoshou.jpg', '188.00', '2', 782),
(3, '八达岭长城、明十三陵、鸟巢一日游', '4.9', 'image/pic/changcheng.jpg', '399.00', '3', 1024),
(4, '古北水镇、司马台长城1日游', '4.6', 'image/pic/gubeishuiizhen.jpg', '666.00', '4', 999),
(5, '上海迪士尼', '4.9', 'image/pic/shanghai.jpg', '299.00', '5', 756),
(6, '上海杜莎夫人蜡像馆', '4.4', 'image/pic/shda1.jpg', '199.00', '6', 239),
(7, '上海外塘星空错觉艺术馆', '5.0', 'image/pic/shanghaiyishu1.jpg', '799.00', '7', 1246),
(8, '深圳海上世界', '5.0', 'image/pic/shenzhen3.jpg', '799.00', '8', 1246),
(9, '梧桐山', '5.0', 'image/pic/shenzheng2.jpg', '899.00', '9', 1246),
(10, '世界之窗', '5.0', 'image/pic/shenzhen1.jpg', '799.00', '10', 1246);

/***商品详情数据***/
INSERT INTO zty_laptop VALUES
(1, 1, '5', '北京欢乐谷门票', '179.00', '规格', 1634, '夏威夷出游', '欢乐谷作为中国主题公园的开拓者和领军企业，欢乐谷集团始终以“创造、传递、分享欢乐”为使命，以“繁华都市开心地”为定位，在不同的城市，奉献同样的欢乐，让每一位游客都能与所爱尽享欢乐时光！', 'image/pic/huanlegu.jpg', 'image/pic/hlg_ban1.jpg', 'image/pic/hlg_ban2.jpg', 'image/pic/hlg_ban3.jpg', 200, 100, 176),
(2, 1, '4.9', '北京独角兽星空艺术馆', '188.00', '规格', 782, '夏威夷出游', '北京独角兽星空艺术馆有近1000平大型光影,场面庞大恢弘,灯光精美绝伦,堪称一场视觉盛宴', 'image/pic/djs_detail.jpg', 'image/pic/djs_ban1.jpg', 'image/pic/djs_ban2.jpg', 'image/pic/djs_ban3.jpg', 300, 400, 500),
(3, 1, '4.9', '八达岭长城、明十三陵、鸟巢一日游', '399.00', '规格', 1024, '夏威夷出游', '长城（The Great Wall），又称万里长城，是中国古代的军事防御工程，是一道高大、坚固而连绵不断的长垣，用以限隔敌骑的行动。长城不是一道单纯孤立的城墙，而是以城墙为主体，同大量的城、障、亭、标相结合的防御体系1961年3月4日，长城被国务院公布为第一批全国重点文物保护单位 。1987年12月，长城被列入世界文化遗产', 'image/pic/cc_detail.jpg', 'image/pic/cc_ban1.jpg', 'image/pic/cc_ban2.jpg', 'image/pic/cc_ban3.jpg', 300, 150, 1500),
(5, 1, '4.7', '上海迪士尼', '599.00', '规格', 6756, '夏威夷出游', '上海迪士尼乐园，是中国内地首座迪士尼主题乐园，位于上海市浦东新区川沙新镇，于2016年6月16日正式开园。它是中国第二个、中国内地第一个、亚洲第三个、世界第六个迪士尼主题公园。上海迪士尼乐园拥有七大主题园区：米奇大街、奇想花园、探险岛、宝藏湾、明日世界、梦幻世界、玩具总动员；两座主题酒...', 'image/pic/shanghai.1.jpg', 'image/pic/shangha_ban1.jpg', 'image/pic/shanghai._ban2.jpg', 'image/pic/shanghai_ban3.jpg', 450, 250, 1250),
(6, 1, '4.4', '上海杜莎夫人蜡像馆', '199.00', '规格', 239, '夏威夷出游', '上海新世界城装修重整期间,上海杜莎夫人蜡像馆仍正常营业。开放时间为每天10:00-21:00 (最后售票时间20:00)注册立刻注册以便收到杜莎夫人蜡像馆最新信息', 'image/pic/shda1.jpg', 'image/pic/shds_ban1.jpg', 'image/pic/shds_ban2.jpg', 'image/pic/shds_ban3.jpg', 550, 750, 650),
(7, 1, '5.0', '上海外塘星空错觉艺术馆', '199.00', '规格', 239, '夏威夷出游', '上海外塘星空错觉艺术馆', 'image/pic/shanghaiyishu2.jpg', 'image/pic/hlg_ban1.jpg', 'image/pic/hlg_ban2.jpg', 'image/pic/hlg_ban3.jpg', 550, 750, 650),
(8, 1, '4.4', '深圳海上世界', '199.00', '规格', 239, '夏威夷出游', '深圳又称鹏城，比邻香港。这里依山傍海，整洁美丽，四季如春，景色秀丽，气候宜人，拥有着丰富的自然人文旅游娱乐资源和设施。2004年，她华丽转身，变成了一个无农村的现代化国际大都市', 'image/pic/shenzhen1.jpg', 'image/pic/shds_ban1.jpg', 'image/pic/shds_ban2.jpg', 'image/pic/shds_ban3.jpg', 550, 750, 650),
(9, 1, '4.5', '梧桐山', '199.00', '规格', 239, '夏威夷出游', '深圳又称鹏城，比邻香港。这里依山傍海，整洁美丽，四季如春，景色秀丽，气候宜人，拥有着丰富的自然人文旅游娱乐资源和设施。2004年，她华丽转身，变成了一个无农村的现代化国际大都市', 'image/pic/shenzheng2.jpg', 'image/pic/shds_ban1.jpg', 'image/pic/shds_ban2.jpg', 'image/pic/shds_ban3.jpg', 550, 750, 650),
(10, 1, '4.6', '世界之窗', '199.00', '规格', 239, '夏威夷出游', '深圳又称鹏城，比邻香港。这里依山傍海，整洁美丽，四季如春，景色秀丽，气候宜人，拥有着丰富的自然人文旅游娱乐资源和设施。2004年，她华丽转身，变成了一个无农村的现代化国际大都市', 'image/pic/shenzhen3.jpg', 'image/pic/shds_ban1.jpg', 'image/pic/shds_ban2.jpg', 'image/pic/shds_ban3.jpg', 550, 750, 650);


/****首页轮播广告商品****/
INSERT INTO zty_index_carousel VALUES
(NULL, 'img/index/banner1.png','product_details.html?lid=28'),
(NULL, 'img/index/banner2.png','product_details.html?lid=19'),
(NULL, 'img/index/banner3.png','product_details.html?lid=19'),
(NULL, 'img/index/banner4.png','product_details.html?lid=19');