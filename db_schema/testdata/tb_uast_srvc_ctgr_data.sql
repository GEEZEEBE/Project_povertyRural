DELETE FROM tb_uast_srvc_ctgr;

INSERT INTO tb_uast_srvc_ctgr 
VALUES
(1,'CBC Basic','','N',1,2,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
,(2,'Learning Service','','N',3,52,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
	,(3,'Smart Class','','N',4,41,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
		,(4,'YEAR4','','N',5,14,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
			,(5,'English','','N',6,7,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
			,(6,'Math','','N',8,9,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
			,(7,'Science','','N',10,11,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
			,(8,'Malay','','N',12,13,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
		,(9,'YEAR5','','N',15,24,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
			,(10,'English','','N',16,17,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
			,(11,'Math','','N',18,19,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
			,(12,'Science','','N',20,21,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
			,(13,'Malay','','N',22,23,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
		,(14,'YEAR6','','N',25,34,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
			,(15,'English','','N',26,27,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
			,(16,'Math','','N',28,29,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
			,(17,'Science','','N',30,31,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
			,(18,'Malay','','N',32,33,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
		,(19,'Advanced English','','N',35,40,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
			,(20,'Bulats','','N',36,37,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
			,(21,'Bulats In Action','','N',38,39,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
		,(22,'English Village','','N',42,51,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
			,(23,'VOD','','N',43,46,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
				,(25,'Download VOD','','N',44,45,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
			,(24,'eBook','','N',47,50,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
				,(43,'Download eBook','','N',48,49,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
,(26,'Commerce Service','','N',53,74,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
	,(33,'Promotion','','N',54,61,SYSDATE(),'kut0000',SYSDATE(),'kut0000')	-- sub Commerce
		,(44,'Facebook','','N',55,56,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
		,(45,'Blogspot','','N',57,58,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
		,(46,'Twiiter','','N',59,60,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
	,(34,'Label Print','','N',62,67,SYSDATE(),'kut0000',SYSDATE(),'kut0000')	-- sub Commerce
		,(38,'Color','','N',63,64,SYSDATE(),'kut0000',SYSDATE(),'kut0000')	-- sub Commerce
		,(39,'B&W','','N',65,66,SYSDATE(),'kut0000',SYSDATE(),'kut0000')	-- sub Commerce
	,(35,'Brochure Print','','N',68,73,SYSDATE(),'kut0000',SYSDATE(),'kut0000')	-- sub Commerce
		,(40,'Color','','N',69,70,SYSDATE(),'kut0000',SYSDATE(),'kut0000')	-- sub Commerce
		,(41,'B&W','','N',71,72,SYSDATE(),'kut0000',SYSDATE(),'kut0000')	-- sub Commerce
,(27,'Health Service','','N',75,80,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
	,(36,'Touch Print','','N',76,77,SYSDATE(),'kut0000',SYSDATE(),'kut0000')	-- sub Health
	,(37,'Print','','N',78,79,SYSDATE(),'kut0000',SYSDATE(),'kut0000')	-- sub Health
;

-- add sub CBC
update tb_uast_srvc_ctgr
set LEFT_SRVC_ID = LEFT_SRVC_ID + 20 
	, RIGHT_SRVC_ID = RIGHT_SRVC_ID + 20
WHERE SRVC_ID > 1
;
INSERT INTO tb_uast_srvc_ctgr 
VALUES
	(28,'EnrollCBC','','N',2,3,SYSDATE(),'kut0000',SYSDATE(),'kut0000')	-- sub CBC Basic
	,(29,'LogAccessManager','','N',4,5,SYSDATE(),'kut0000',SYSDATE(),'kut0000')	-- sub CBC Basic
	,(30,'LogAccessUser','','N',6,7,SYSDATE(),'kut0000',SYSDATE(),'kut0000')	-- sub CBC Basic
	,(31,'UsingPC','','N',8,9,SYSDATE(),'kut0000',SYSDATE(),'kut0000')	-- sub CBC Basic	-> by PCAgency
	,(32,'Print','','N',10,11,SYSDATE(),'kut0000',SYSDATE(),'kut0000')	-- sub CBC Basic
	,(42,'InteractiveWhiteBoard','','N',12,13,SYSDATE(),'kut0000',SYSDATE(),'kut0000')	-- sub CBC Basic
	,(47,'TabletRental','','N',14,15,SYSDATE(),'kut0000',SYSDATE(),'kut0000') -- sub CBC Basic
    ,(48,'SmartBeamUsing ','','N',16,17,SYSDATE(),'kut0000',SYSDATE(),'kut0000') -- sub CBC Basic
    ,(49,'BookRental','','N',18,19,SYSDATE(),'kut0000',SYSDATE(),'kut0000')    -- sub CBC Basic
    ,(50,'DVDRental','','N',20,21,SYSDATE(),'kut0000',SYSDATE(),'kut0000')  -- sub CBC Basic    -> by PCAgency
;
update tb_uast_srvc_ctgr
set RIGHT_SRVC_ID = RIGHT_SRVC_ID + 20
WHERE SRVC_ID = 1
;

INSERT INTO tb_uast_srvc_ctgr 
VALUES
    (51,'VOD Download','','H',101,102,SYSDATE(),'kut0000',SYSDATE(),'kut0000') -- sub CBC Basic
    ,(52,'eBook Download','','H',103,104,SYSDATE(),'kut0000',SYSDATE(),'kut0000') -- sub CBC Basic
;


-- set Hidden category
update tb_uast_srvc_ctgr
set DEL_YN = 'H'
WHERE SRVC_ID IN (25,43,28,29,30,31,32,38,39,40,41,36,37,47,48,49,50);

-- old data
INSERT INTO tb_uast_srvc_ctgr 
VALUES
(1,'CBC Basic','','N',1,2,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
,(2,'Learning Service','','N',3,50,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
	,(3,'Smart Class','','N',4,41,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
		,(4,'YEAR4','','N',5,14,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
			,(5,'English','','N',6,7,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
			,(6,'Math','','N',8,9,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
			,(7,'Science','','N',10,11,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
			,(8,'Malay','','N',12,13,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
		,(9,'YEAR5','','N',15,24,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
			,(10,'English','','N',16,17,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
			,(11,'Math','','N',18,19,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
			,(12,'Science','','N',20,21,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
			,(13,'Malay','','N',22,23,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
		,(14,'YEAR6','','N',25,34,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
			,(15,'English','','N',26,27,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
			,(16,'Math','','N',28,29,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
			,(17,'Science','','N',30,31,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
			,(18,'Malay','','N',32,33,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
		,(19,'Advanced English','','N',35,40,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
			,(20,'Grammar','','N',36,37,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
			,(21,'Listening','','N',38,39,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
		,(22,'English Village','','N',42,49,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
			,(23,'VOD','','N',43,46,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
				,(25,'Download VOD','','N',44,45,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
			,(24,'eBook','','N',47,48,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
--				,(43,'Download eBook','','N',47,48,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
,(26,'Commerce Service','','N',51,66,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
	,(33,'Promotion','','N',52,53,SYSDATE(),'kut0000',SYSDATE(),'kut0000')	-- sub Commerce
--		,(44,'Facebook','','N',47,48,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
--		,(45,'Blogspot','','N',47,48,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
--		,(46,'Twiiter','','N',47,48,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
	,(34,'Label Print','','N',54,59,SYSDATE(),'kut0000',SYSDATE(),'kut0000')	-- sub Commerce
		,(38,'Color','','N',55,56,SYSDATE(),'kut0000',SYSDATE(),'kut0000')	-- sub Commerce
		,(39,'B&W','','N',57,58,SYSDATE(),'kut0000',SYSDATE(),'kut0000')	-- sub Commerce
	,(35,'Brochure Print','','N',60,65,SYSDATE(),'kut0000',SYSDATE(),'kut0000')	-- sub Commerce
		,(40,'Color','','N',61,62,SYSDATE(),'kut0000',SYSDATE(),'kut0000')	-- sub Commerce
		,(41,'B&W','','N',63,64,SYSDATE(),'kut0000',SYSDATE(),'kut0000')	-- sub Commerce
,(27,'Health Service','','N',67,72,SYSDATE(),'kut0000',SYSDATE(),'kut0000')
	,(36,'Touch Print','','N',68,69,SYSDATE(),'kut0000',SYSDATE(),'kut0000')	-- sub Health
	,(37,'Print','','N',70,71,SYSDATE(),'kut0000',SYSDATE(),'kut0000')	-- sub Health
;

