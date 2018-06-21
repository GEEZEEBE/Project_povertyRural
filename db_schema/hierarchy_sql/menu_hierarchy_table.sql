CREATE TABLE menu (
	groupId VARCHAR(255),
	title VARCHAR(255),
	createDate DATE,
	createUser VARCHAR(255),
	PRIMARY KEY (groupId)
) ENGINE=InnoDB;

INSERT INTO menu(groupId,title,createDate) VALUES ('m001','main test',sysdate());

CREATE TABLE menu_category (
	groupId VARCHAR(255),
	id VARCHAR(255) NOT NULL,
	title VARCHAR(20) NOT NULL,
	linkUrl VARCHAR(255),
	openWindowYn VARCHAR(255),
	openMenuYn VARCHAR(255),
	imgNormal VARCHAR(255),
	imgMouseover VARCHAR(255),
	imgChoose VARCHAR(255),
	lft INT NOT NULL,
	rgt INT NOT NULL,
	createDate DATE,
	createUser VARCHAR(255),
	PRIMARY KEY (id)
) ENGINE=InnoDB;


INSERT INTO menu_category
(groupId,id,title,lft,rgt)
VALUES('m001','1','ELECTRONICS',1,20),('m001','2','TELEVISIONS',2,9),('m001','3','TUBE',3,4),
('m001','4','LCD',5,6),('m001','5','PLASMA',7,8),('m001','6','PORTABLE ELECTRONICS',10,19),
('m001','7','MP3 PLAYERS',11,14),('m001','8','FLASH',12,13),
('m001','9','CD PLAYERS',15,16),('m001','10','2 WAY RADIOS',17,18);

DROP TABLE nested_category