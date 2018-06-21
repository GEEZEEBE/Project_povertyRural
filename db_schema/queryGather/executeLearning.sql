-- learning > Day > total	
SELECT CAL_DAILY.*, USE_HIS.*
FROM (
		-- GET USING HISTORY
		SELECT SUBSTR(USE_HS.END_TM, 1, 8) END_TM
			, sum( if( GODS.SRVC_ID = 1, 1, 0 ) ) AS basic
			, sum( if( GODS.SRVC_ID = 23, 1, 0 ) ) AS VOD
			, sum( if( GODS.SRVC_ID = 24, 1, 0 ) ) AS eBook
		FROM TB_UAST_USE_HS USE_HS
			, TB_UAST_GODS GODS
		WHERE 1 = 1
		AND USE_HS.END_TM LIKE '201302%'	-- terms
		AND USE_HS.CMPL_YN = 'E'
		AND USE_HS.GODS_ID = GODS.GODS_ID 
		AND GODS.SRVC_ID IN(1,23,24)
		AND USE_HS.USER_ID IN (SELECT USER_ID 
							FROM TB_UAST_USER 
							WHERE 1 = 1 
							AND 1 = 1 
							OR SEX = 'M' -- terms
							OR BIRTHDAY BETWEEN DATE_ADD(CURDATE(), INTERVAL -0 YEAR) AND DATE_ADD(CURDATE(), INTERVAL -20 YEAR))	-- terms
		GROUP BY SUBSTR(USE_HS.END_TM, 1, 8)
	) USE_HIS
	right join (
		-- GET ALL DAY OF MONTH
		SELECT DAILY, REPLACE(DAILY,'-','') END_DAILY, WEEKDAY(DAILY) DAY, DAYNAME(DAILY) DAYNAME
		FROM (
			SELECT DATE_ADD(CONCAT('201302','01'), INTERVAL rownum-1 DAY) AS DAILY
			FROM (
				SELECT @rownum:=@rownum+1 rownum
				FROM (SELECT @rownum:=0) r, TB_UAST_CODE limit 31
			) rnum
			WHERE rownum <= (SELECT DAYOFMONTH(LAST_DAY(CONCAT('201302','01'))))	-- terms 
		) cal
	) CAL_DAILY
	on USE_HIS.END_TM = CAL_DAILY.END_DAILY

-- learning > Day > smartclass	
SELECT CAL_DAILY.*, USE_HIS.*
FROM (
		-- GET USING HISTORY
		SELECT SUBSTR(USE_HS.END_TM, 1, 8) END_TM
			, sum( case when GODS.SRVC_ID >= 3 and GODS.SRVC_ID <= 8 then 1 else 0 end ) AS year4
			, sum( case when GODS.SRVC_ID >= 9 and GODS.SRVC_ID <= 13 then 1 else 0 end ) AS year5
			, sum( case when GODS.SRVC_ID >= 14 and GODS.SRVC_ID <= 18 then 1 else 0 end ) AS year6
			, sum( case when GODS.SRVC_ID >= 19 and GODS.SRVC_ID <= 21 then 1 else 0 end ) AS advanceEnglish
			, sum( case when GODS.SRVC_ID >= 3 and GODS.SRVC_ID <= 8 then 1 else 0 end ) AS electBoard	-- need to check id of srvc_id
		FROM TB_UAST_USE_HS USE_HS
			, TB_UAST_GODS GODS
		WHERE 1 = 1
		AND USE_HS.END_TM LIKE '201302%'	-- terms
		AND USE_HS.CMPL_YN = 'E'
		AND USE_HS.GODS_ID = GODS.GODS_ID 
		AND GODS.SRVC_ID between 3 and 21
		AND USE_HS.USER_ID IN (SELECT USER_ID 
							FROM TB_UAST_USER 
							WHERE 1 = 1 
							AND 1 = 1 OR SEX = 'M' OR BIRTHDAY BETWEEN DATE_ADD(CURDATE(), INTERVAL -0 YEAR) AND DATE_ADD(CURDATE(), INTERVAL -20 YEAR))	-- terms
		GROUP BY SUBSTR(USE_HS.END_TM, 1, 8)
	) USE_HIS
	right join (
		-- GET ALL DAY OF MONTH
		SELECT DAILY, REPLACE(DAILY,'-','') END_DAILY, WEEKDAY(DAILY) DAY, DAYNAME(DAILY) DAYNAME
		FROM (
			SELECT DATE_ADD(CONCAT('201302','01'), INTERVAL rownum-1 DAY) AS DAILY
			FROM (
				SELECT @rownum:=@rownum+1 rownum
				FROM (SELECT @rownum:=0) r, TB_UAST_CODE limit 31
			) rnum
			WHERE rownum <= (SELECT DAYOFMONTH(LAST_DAY(CONCAT('201302','01'))))	-- terms 
		) cal
	) CAL_DAILY
	on USE_HIS.END_TM = CAL_DAILY.END_DAILY

-- learning > Day > English Village	
SELECT CAL_DAILY.*, USE_HIS.*
FROM (
		-- GET USING HISTORY
		SELECT SUBSTR(USE_HS.END_TM, 1, 8) END_TM
			, sum( case when GODS.SRVC_ID >= 23 and GODS.SRVC_ID <= 23 then 1 else 0 end ) AS vod
			, sum( case when GODS.SRVC_ID >= 24 and GODS.SRVC_ID <= 24 then 1 else 0 end ) AS eBook
			, sum( case when GODS.SRVC_ID >= 25 and GODS.SRVC_ID <= 25 then 1 else 0 end ) AS rentDVD
			, sum( case when GODS.SRVC_ID >= 23 and GODS.SRVC_ID <= 23 then 1 else 0 end ) AS rentBook	-- need to check id of srvc_id
			, sum( case when GODS.SRVC_ID >= 23 and GODS.SRVC_ID <= 23 then 1 else 0 end ) AS rentTablet	-- need to check id of srvc_id
		FROM TB_UAST_USE_HS USE_HS
			, TB_UAST_GODS GODS
		WHERE 1 = 1
		AND USE_HS.END_TM LIKE '201302%'	-- terms
		AND USE_HS.CMPL_YN = 'E'
		AND USE_HS.GODS_ID = GODS.GODS_ID 
		AND GODS.SRVC_ID between 22 and 25
		AND USE_HS.USER_ID IN (SELECT USER_ID 
							FROM TB_UAST_USER 
							WHERE 1 = 1 
							AND 1 = 1 OR SEX = 'M' OR BIRTHDAY BETWEEN DATE_ADD(CURDATE(), INTERVAL -0 YEAR) AND DATE_ADD(CURDATE(), INTERVAL -20 YEAR))	-- terms
		GROUP BY SUBSTR(USE_HS.END_TM, 1, 8)
	) USE_HIS
	right join (
		-- GET ALL DAY OF MONTH
		SELECT DAILY, REPLACE(DAILY,'-','') END_DAILY, WEEKDAY(DAILY) DAY, DAYNAME(DAILY) DAYNAME
		FROM (
			SELECT DATE_ADD(CONCAT('201302','01'), INTERVAL rownum-1 DAY) AS DAILY
			FROM (
				SELECT @rownum:=@rownum+1 rownum
				FROM (SELECT @rownum:=0) r, TB_UAST_CODE limit 31
			) rnum
			WHERE rownum <= (SELECT DAYOFMONTH(LAST_DAY(CONCAT('201302','01'))))	-- terms 
		) cal
	) CAL_DAILY
	on USE_HIS.END_TM = CAL_DAILY.END_DAILY

-- learning > Month > total	
SELECT if( CTGR.SRVC_ID = 1, 'Enroll Count', if( CTGR.SRVC_ID = 23, 'view VOD Count', 'view e-Book Count') ) AS SRVC_NAME
	, USE_HIS.*
FROM (
		-- GET USING HISTORY
		SELECT GODS.SRVC_ID
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '01', 1, 0 ) ) AS jan
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '02', 1, 0 ) ) AS feb
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '03', 1, 0 ) ) AS mar
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '04', 1, 0 ) ) AS apr
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '05', 1, 0 ) ) AS may
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '06', 1, 0 ) ) AS jun
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '07', 1, 0 ) ) AS jul
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '08', 1, 0 ) ) AS aug
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '09', 1, 0 ) ) AS sep
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '10', 1, 0 ) ) AS oct
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '11', 1, 0 ) ) AS nov
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '12', 1, 0 ) ) AS dece
		FROM TB_UAST_USE_HS USE_HS
			, TB_UAST_GODS GODS
		WHERE 1 = 1
		AND USE_HS.END_TM LIKE '2013%'	-- terms
		AND USE_HS.CMPL_YN = 'E'
		AND USE_HS.GODS_ID = GODS.GODS_ID 
		AND GODS.SRVC_ID IN(1,23,24)
		AND USE_HS.USER_ID IN (SELECT USER_ID 
							FROM TB_UAST_USER 
							WHERE 1 = 1 
							AND 1 = 1 OR SEX = 'M' OR BIRTHDAY BETWEEN DATE_ADD(CURDATE(), INTERVAL -0 YEAR) AND DATE_ADD(CURDATE(), INTERVAL -20 YEAR))	-- terms
		GROUP BY GODS.SRVC_ID
	) USE_HIS
	right join (
		-- GET ALL DAY OF MONTH
		SELECT *
		FROM TB_UAST_SRVC_CTGR 
		WHERE SRVC_ID IN(1,23,24)
	) CTGR
	on USE_HIS.SRVC_ID = CTGR.SRVC_ID

-- learning > Month > smartclass	
SELECT CASE 
			when CTGR.SRVC_ID >= 3 and CTGR.SRVC_ID <= 8 then 'YEAR4'
			when CTGR.SRVC_ID >= 9 and CTGR.SRVC_ID <= 13 then 'YEAR5'
			when CTGR.SRVC_ID >= 14 and CTGR.SRVC_ID <= 18 then 'YEAR6'
			when CTGR.SRVC_ID >= 19 and CTGR.SRVC_ID <= 21 then 'Advanced English'
			when CTGR.SRVC_ID >= 22 and CTGR.SRVC_ID <= 22 then 'Interactive White Board'	-- need to check id of srvc_id
		END AS SRVC_NAME
	, USE_HIS.*
FROM (
		-- GET USING HISTORY
		SELECT GODS.SRVC_ID
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '01', 1, 0 ) ) AS jan
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '02', 1, 0 ) ) AS feb
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '03', 1, 0 ) ) AS mar
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '04', 1, 0 ) ) AS apr
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '05', 1, 0 ) ) AS may
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '06', 1, 0 ) ) AS jun
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '07', 1, 0 ) ) AS jul
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '08', 1, 0 ) ) AS aug
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '09', 1, 0 ) ) AS sep
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '10', 1, 0 ) ) AS oct
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '11', 1, 0 ) ) AS nov
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '12', 1, 0 ) ) AS dece
		FROM TB_UAST_USE_HS USE_HS
			, TB_UAST_GODS GODS
		WHERE 1 = 1
		AND USE_HS.END_TM LIKE '2013%'	-- terms
		AND USE_HS.CMPL_YN = 'E'
		AND USE_HS.GODS_ID = GODS.GODS_ID 
		AND GODS.SRVC_ID between 3 and 21
		AND USE_HS.USER_ID IN (SELECT USER_ID 
							FROM TB_UAST_USER 
							WHERE 1 = 1 
							AND 1 = 1 OR SEX = 'M' OR BIRTHDAY BETWEEN DATE_ADD(CURDATE(), INTERVAL -0 YEAR) AND DATE_ADD(CURDATE(), INTERVAL -20 YEAR))	-- terms
		GROUP BY GODS.SRVC_ID
	) USE_HIS
	right join (
		-- GET srvc_id of samrt class
		SELECT *
		FROM TB_UAST_SRVC_CTGR 
		WHERE SRVC_ID between 3 and 22	-- need to check id of srvc_id
	) CTGR
	on USE_HIS.SRVC_ID = CTGR.SRVC_ID
WHERE 1 = 1	
GROUP BY CASE 
			when CTGR.SRVC_ID >= 3 and CTGR.SRVC_ID <= 8 then 'YEAR4'
			when CTGR.SRVC_ID >= 9 and CTGR.SRVC_ID <= 13 then 'YEAR5'
			when CTGR.SRVC_ID >= 14 and CTGR.SRVC_ID <= 18 then 'YEAR6'
			when CTGR.SRVC_ID >= 19 and CTGR.SRVC_ID <= 21 then 'Advanced English'
			when CTGR.SRVC_ID >= 21 and CTGR.SRVC_ID <= 21 then 'Interactive White Board'	-- need to check id of srvc_id
		END 
ORDER BY CTGR.SRVC_ID	

-- learning > Month > English Village	
SELECT CASE 
			when CTGR.SRVC_ID >= 23 and CTGR.SRVC_ID <= 23 then 'View VOD'
			when CTGR.SRVC_ID >= 24 and CTGR.SRVC_ID <= 24 then 'View eBook'
			when CTGR.SRVC_ID >= 25 and CTGR.SRVC_ID <= 25 then 'rent DVD'
			when CTGR.SRVC_ID >= 26 and CTGR.SRVC_ID <= 26 then 'rent Book'	-- need to check id of srvc_id
			when CTGR.SRVC_ID >= 27 and CTGR.SRVC_ID <= 27 then 'rent Tablet'	-- need to check id of srvc_id
		END AS SRVC_NAME
	, USE_HIS.*
FROM (
		-- GET USING HISTORY
		SELECT GODS.SRVC_ID
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '01', 1, 0 ) ) AS jan
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '02', 1, 0 ) ) AS feb
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '03', 1, 0 ) ) AS mar
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '04', 1, 0 ) ) AS apr
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '05', 1, 0 ) ) AS may
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '06', 1, 0 ) ) AS jun
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '07', 1, 0 ) ) AS jul
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '08', 1, 0 ) ) AS aug
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '09', 1, 0 ) ) AS sep
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '10', 1, 0 ) ) AS oct
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '11', 1, 0 ) ) AS nov
			, sum( if( SUBSTR(USE_HS.END_TM, 5, 2) = '12', 1, 0 ) ) AS dece
		FROM TB_UAST_USE_HS USE_HS
			, TB_UAST_GODS GODS
		WHERE 1 = 1
		AND USE_HS.END_TM LIKE '2013%'	-- terms
		AND USE_HS.CMPL_YN = 'E'
		AND USE_HS.GODS_ID = GODS.GODS_ID 
		AND GODS.SRVC_ID between 22 and 25
		AND USE_HS.USER_ID IN (SELECT USER_ID 
							FROM TB_UAST_USER 
							WHERE 1 = 1 
							AND 1 = 1 OR SEX = 'M' OR BIRTHDAY BETWEEN DATE_ADD(CURDATE(), INTERVAL -0 YEAR) AND DATE_ADD(CURDATE(), INTERVAL -20 YEAR))	-- terms
		GROUP BY GODS.SRVC_ID
	) USE_HIS
	right join (
		-- GET srvc_id of samrt class
		SELECT *
		FROM TB_UAST_SRVC_CTGR 
		WHERE SRVC_ID between 23 and 27	-- need to check id of srvc_id
	) CTGR
	on USE_HIS.SRVC_ID = CTGR.SRVC_ID
WHERE 1 = 1	
GROUP BY CASE 
			when CTGR.SRVC_ID >= 23 and CTGR.SRVC_ID <= 23 then 'View VOD'
			when CTGR.SRVC_ID >= 24 and CTGR.SRVC_ID <= 24 then 'View eBook'
			when CTGR.SRVC_ID >= 25 and CTGR.SRVC_ID <= 25 then 'rent DVD'
			when CTGR.SRVC_ID >= 26 and CTGR.SRVC_ID <= 26 then 'rent Book'	-- need to check id of srvc_id
			when CTGR.SRVC_ID >= 27 and CTGR.SRVC_ID <= 27 then 'rent Tablet'	-- need to check id of srvc_id
		END
ORDER BY CTGR.SRVC_ID	
