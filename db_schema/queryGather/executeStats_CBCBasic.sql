-- stats > CBC Basic > Using > Month
SELECT CASE cal.MONTHLY
			when '01' then 'Jan'
			when '02' then 'Feb'
			when '03' then 'Mar'
			when '04' then 'Apr'
			when '05' then 'May'
			when '06' then 'Jun'
			when '07' then 'Jul'
			when '08' then 'Aug'
			when '09' then 'Sep'
			when '10' then 'Oct'
			when '11' then 'Nov'
			when '12' then 'Dec'
		END AS MONTH_NAME
	, USE_HIS.*		
FROM (	
		SELECT 
			SUBSTR(USE_HS.END_TM, 5, 2) MONTH
			, sum( if( GODS.SRVC_ID = 28, 1, 0 ) ) AS NEW_CBC
			, sum( if( GODS.SRVC_ID = 31, 
								(cast(HOUR(TIMEDIFF(DATE_FORMAT(end_tm, '%Y-%m-%d %H'), DATE_FORMAT(strt_tm, '%Y-%m-%d %H')))*60 as unsigned)+
		                        cast(MINUTE(TIMEDIFF(DATE_FORMAT(end_tm, '%Y-%m-%d %H:%i'), DATE_FORMAT(strt_tm, '%Y-%m-%d %H:%i'))) as unsigned))
		                        , 0 ) ) AS USED_PC
			, sum( if( GODS.SRVC_ID = 31, 1, 0 ) ) AS USED_CNT_PC
			, sum( if( GODS.SRVC_ID = 30, 1, 0 ) ) AS USED_USER
		FROM TB_UAST_USE_HS USE_HS
			, TB_UAST_GODS GODS
		WHERE 1 = 1
		AND USE_HS.END_TM LIKE '2013%'	-- terms
		AND GODS.GODS_ID = USE_HS.GODS_ID
		AND GODS.SRVC_ID in (28, 30, 31)
		AND USE_HS.USER_ID IN (SELECT USER_ID 
							FROM TB_UAST_USER 
							WHERE 1 = 1 
							AND 1 = 1 
							OR SEX = 'M' -- terms
							OR BIRTHDAY BETWEEN DATE_ADD(CURDATE(), INTERVAL -0 YEAR) AND DATE_ADD(CURDATE(), INTERVAL -20 YEAR))	-- terms -0, -20
		GROUP BY SUBSTR(USE_HS.END_TM, 5, 2)
	) USE_HIS
	right join (
		-- GET ALL DAY OF MONTH
		SELECT LPAD( rnum.rownum, 2, '0' ) AS MONTHLY
		FROM (
			SELECT @rownum:=@rownum+1 rownum
			FROM (SELECT @rownum:=0) r, TB_UAST_CODE limit 12
		) rnum	
	) cal
	on USE_HIS.MONTH = cal.MONTHLY

-- stats > CBC Basic > Using > Day
SELECT CAL_DAILY.*, USE_HIS.*
FROM (
		-- GET USING HISTORY
		SELECT 
			SUBSTR(USE_HS.END_TM, 1, 8) END_DAILY
			, sum( if( GODS.SRVC_ID = 28, 1, 0 ) ) AS NEW_CBC
			, sum( if( GODS.SRVC_ID = 31, 
								(cast(HOUR(TIMEDIFF(DATE_FORMAT(end_tm, '%Y-%m-%d %H'), DATE_FORMAT(strt_tm, '%Y-%m-%d %H')))*60 as unsigned)+
		                        cast(MINUTE(TIMEDIFF(DATE_FORMAT(end_tm, '%Y-%m-%d %H:%i'), DATE_FORMAT(strt_tm, '%Y-%m-%d %H:%i'))) as unsigned))
		                        , 0 ) ) AS USED_PC
			, sum( if( GODS.SRVC_ID = 31, 1, 0 ) ) AS USED_CNT_PC
			, sum( if( GODS.SRVC_ID = 30, 1, 0 ) ) AS USED_USER
		FROM TB_UAST_USE_HS USE_HS
			, TB_UAST_GODS GODS
		WHERE 1 = 1
		AND USE_HS.END_TM LIKE '201310%'	-- terms
		AND GODS.GODS_ID = USE_HS.GODS_ID
		AND GODS.SRVC_ID in (28, 30, 31)
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
			SELECT DATE_ADD(CONCAT('201302','01'), INTERVAL rownum-1 DAY) AS DAILY	-- terms
			FROM (
				SELECT @rownum:=@rownum+1 rownum
				FROM (SELECT @rownum:=0) r, TB_UAST_CODE limit 31
			) rnum
			WHERE rownum <= (SELECT DAYOFMONTH(LAST_DAY(CONCAT('201302','01'))))	-- terms 
		) cal
	) CAL_DAILY
	on USE_HIS.END_DAILY = CAL_DAILY.END_DAILY

-- stats > CBC Basic > Payment (need to be search box by year)
SELECT CASE cal.MONTHLY
			when '01' then 'Jan'
			when '02' then 'Feb'
			when '03' then 'Mar'
			when '04' then 'Apr'
			when '05' then 'May'
			when '06' then 'Jun'
			when '07' then 'Jul'
			when '08' then 'Aug'
			when '09' then 'Sep'
			when '10' then 'Oct'
			when '11' then 'Nov'
			when '12' then 'Dec'
		END AS MONTH_NAME
	, PAY.*		
FROM (		
		SELECT SUBSTR(PAYMENT.MONTHLY, 5, 2) MONTH		
			, SUM(PAYMENT.DPST_AMT)	PAY_AMT
			, SUM(PAYMENT.RETURN_AMT) REFUND_AMT
		FROM (
			-- PAYMENT
			SELECT DSPT_DT MONTHLY, DPST_AMT, 0 RETURN_AMT
			FROM TB_UAST_PAYMENT
			WHERE 1 = 1
			AND DSPT_DT LIKE '2013%' -- terms
			UNION ALL
			-- REFUND
			SELECT RETURN_DT MONTHLY, 0, RETURN_AMT
			FROM TB_UAST_PAYMENT
			WHERE 1 = 1
			AND RETURN_DT LIKE '2013%' -- terms
		) PAYMENT
		GROUP BY SUBSTR(PAYMENT.MONTHLY, 5, 2)
	) PAY
	right join (
		-- GET ALL DAY OF MONTH
		SELECT LPAD( rnum.rownum, 2, '0' ) AS MONTHLY
		FROM (
			SELECT @rownum:=@rownum+1 rownum
			FROM (SELECT @rownum:=0) r, TB_UAST_CODE limit 12
		) rnum	
	) cal
	on PAY.MONTH = cal.MONTHLY


-- stats > CBC Basic > Assests
Select *
from TB_UAST_ASSETS
WHERE 1 = 1
AND DEL_YN = 'N'
AND ASSET_TYPE_CD = ''	-- terms

