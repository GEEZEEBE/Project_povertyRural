-- stats > Summary
-- 작업 시 문의 바람
SELECT SUMMERY.*
FROM (
	SELECT GODS.SRVC_ID
		,	CASE 
				when GODS.SRVC_ID = 28 then 'CBC Register'
				when GODS.SRVC_ID = 31 or GODS.SRVC_ID = 31 then 'Used CBC'
				when GODS.SRVC_ID = 30 then 'User Portal'
				when GODS.SRVC_ID = 30 then 'Network'	-- need to check ID
				when GODS.SRVC_ID = 23 or GODS.SRVC_ID = 24 or GODS.SRVC_ID = 25 then 'Learning '
				when GODS.SRVC_ID = 33 or GODS.SRVC_ID = 38 or GODS.SRVC_ID = 39
					or GODS.SRVC_ID = 40 or GODS.SRVC_ID = 41
					then 'Commerce'
				when GODS.SRVC_ID = 36 OR GODS.SRVC_ID = 37 then 'Health'
			END as SERVICE_TITLE
		,	CASE 
				when GODS.SRVC_ID = 28 then 'Register Conut'
				when GODS.SRVC_ID = 31 then 'Used PC Time'
				when GODS.SRVC_ID = 31 then 'Used PC User'	-- need to check query	
				when GODS.SRVC_ID = 30 then 'Hit Count'
				when GODS.SRVC_ID = 30 then 'Traffic rate'	-- need to check ID
				when GODS.SRVC_ID = 23 then 'VOD Hits '
				when GODS.SRVC_ID = 24 then 'e-Book Hits'
				when GODS.SRVC_ID = 25 then 'VOD Download'
				when GODS.SRVC_ID = 33 then 'Promotion'
				when GODS.SRVC_ID = 38 OR GODS.SRVC_ID = 39 then 'Label Print'
				when GODS.SRVC_ID = 40 OR GODS.SRVC_ID = 41 then 'Brochure Print'
				when GODS.SRVC_ID = 36 OR GODS.SRVC_ID = 37 then 'Result Print'
			END as SERVICE_NAME
		, COUNT(USE_HS.GODS_ID) CNT 	-- need to check query
		,	CASE 
				when GODS.SRVC_ID = 28 then 1
				when GODS.SRVC_ID = 31 then 2
				when GODS.SRVC_ID = 31 then 3	-- need to check query	
				when GODS.SRVC_ID = 30 then 4
				when GODS.SRVC_ID = 30 then 5	-- need to check ID
				when GODS.SRVC_ID = 23 then 6
				when GODS.SRVC_ID = 24 then 7
				when GODS.SRVC_ID = 25 then 8
				when GODS.SRVC_ID = 33 then 9
				when GODS.SRVC_ID = 38 OR GODS.SRVC_ID = 39 then 10
				when GODS.SRVC_ID = 40 OR GODS.SRVC_ID = 41 then 11
				when GODS.SRVC_ID = 36 OR GODS.SRVC_ID = 37 then 12
			END as _ORDERBY
	FROM TB_UAST_USE_HS USE_HS
		RIGHT JOIN (SELECT PRO.* 
					FROM TB_UAST_GODS PRO
					WHERE PRO.SRVC_ID IN (23,24,25,28,30,31,33,36,37,38,39,40,41)
					) GODS
		ON USE_HS.GODS_ID = GODS.GODS_ID
	WHERE 1 = 1
	GROUP BY CASE 
				when GODS.SRVC_ID = 28 then 'Register Conut'
				when GODS.SRVC_ID = 31 then 'Used PC Time'
				when GODS.SRVC_ID = 31 then 'Used PC User'	-- need to check query	
				when GODS.SRVC_ID = 30 then 'Hit Count'
				when GODS.SRVC_ID = 30 then 'Traffic rate'	-- need to check ID
				when GODS.SRVC_ID = 23 then 'VOD Hits '
				when GODS.SRVC_ID = 24 then 'e-Book Hits'
				when GODS.SRVC_ID = 25 then 'VOD Download'
				when GODS.SRVC_ID = 33 then 'Promotion'
				when GODS.SRVC_ID = 38 OR GODS.SRVC_ID = 39 then 'Label Print'
				when GODS.SRVC_ID = 40 OR GODS.SRVC_ID = 41 then 'Brochure Print'
				when GODS.SRVC_ID = 36 OR GODS.SRVC_ID = 37 then 'Result Print'
			END
) SUMMERY
ORDER BY SUMMERY._ORDERBY

