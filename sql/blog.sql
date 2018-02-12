CREATE TABLE blog_category (
  id INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  title VARCHAR(30) NOT NULL COMMENT '名称',
  intro VARCHAR(200) NOT NULL COMMENT '描述',
  gmt_create DATETIME DEFAULT NULL COMMENT '录入时间',
  gmt_modified DATETIME DEFAULT NULL COMMENT '更新时间'
)
CREATE TABLE blog_article (
  id INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  category_id INT(10) NOT NULL COMMENT '文章类别id',
  title VARCHAR(30) NOT NULL COMMENT '标题',
  author VARCHAR(15) NOT NULL COMMENT '作者',
  intro VARCHAR(50) COMMENT '简介',
  content TEXT NOT NULL COMMENT '正文',
  gmt_create DATETIME DEFAULT NOW() COMMENT '录入时间',
  gmt_modified DATETIME DEFAULT NULL COMMENT '更新时间',
  sort_no INT(10) UNSIGNED DEFAULT 0 COMMENT '显示顺序,越大越靠前',
  is_stick TINYINT(1) UNSIGNED ZEROFILL DEFAULT 0 COMMENT '是否置顶',
  is_draft TINYINT(1) UNSIGNED ZEROFILL DEFAULT 0 COMMENT '是否草稿',
  is_deleted TINYINT(1) UNSIGNED ZEROFILL DEFAULT 0 COMMENT '是否删除',
  FOREIGN KEY(category_id) REFERENCES blog_category(id)
)
