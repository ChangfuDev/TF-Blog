CREATE TABLE blog_category (
  id INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  title VARCHAR(30) NOT NULL COMMENT '名称',
  intro VARCHAR(200) NOT NULL COMMENT '描述',
  gmt_create DATETIME DEFAULT NOW() COMMENT '录入时间',
  gmt_modified DATETIME DEFAULT NOW() COMMENT '更新时间'
)
CREATE TABLE blog_article (
  id INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  category_id INT(10) NOT NULL COMMENT '文章类别id',
  title VARCHAR(30) NOT NULL COMMENT '标题',
  author VARCHAR(15) NOT NULL COMMENT '作者',
  intro VARCHAR(50) COMMENT '简介',
  content TEXT NOT NULL COMMENT '正文',
  gmt_create DATETIME DEFAULT NOW() COMMENT '录入时间',
  gmt_modified DATETIME DEFAULT NOW() COMMENT '更新时间',
  sort_no INT(10) UNSIGNED DEFAULT 0 COMMENT '显示顺序,越大越靠前',
  is_stick TINYINT(1) UNSIGNED ZEROFILL DEFAULT 0 COMMENT '是否置顶',
  is_draft TINYINT(1) UNSIGNED ZEROFILL DEFAULT 0 COMMENT '是否草稿',
  is_deleted TINYINT(1) UNSIGNED ZEROFILL DEFAULT 0 COMMENT '是否删除',
  FOREIGN KEY(category_id) REFERENCES blog_category(id)
)
CREATE TABLE blog_comment (
  id INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT '主键',
  pid INT(10) DEFAULT 0 COMMENT '父id',
  rootid INT(10) DEFAULT 0 COMMENT '根id',
  member_name VARCHAR(20) DEFAULT NULL COMMENT '用户名',
  content VARCHAR(200) NOT NULL COMMENT '评论',
  pdate DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  isleaf INT(10) DEFAULT 0 COMMENT '是否叶子节点',
  article_id INT(10) DEFAULT NULL COMMENT '文章id'
)