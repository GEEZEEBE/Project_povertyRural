-- check data
					SELECT END_HOUR
							,TOT_UP - WIFI_UP as LAN_UP_MIN
							,TOT_DOWN - WIFI_DOWN as LAN_DOWN_MIN
							, TRA.*
					FROM (
						SELECT SUBSTR(END_TM,9,2) AS END_HOUR, END_TM
							, TX_OCTET TOT_UP, RX_OCTET TOT_DOWN
							, 0 WIFI_UP, 0 WIFI_DOWN
						FROM AC_STAT_TRAFFIC
						WHERE END_TM BETWEEN '20130329000000' AND '20130329245959'
						UNION ALL
						SELECT SUBSTR(END_TM,9,2) AS _HOUR, END_TM
							, 0 TOT_UP, 0 TOT_DOWN
							, TX_BYTE WIFI_UP, RX_BYTE WIFI_DOWN
						FROM AC_STAT_AP_TRAFFIC
						WHERE END_TM BETWEEN '20130329000000' AND '20130329245959'
					) TRA
					where END_HOUR in ('09')
					
-- stats > network > AC monitoring > month
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
	, ALARM.*		
FROM (
		SELECT SUBSTR(END_TM, 4, 2) MONTH		
			, SUM(CPU_CRITICAL)
			, SUM(CPU_MAJOR)
			, SUM(MEMORY_CRITICAL)
			, SUM(MEMORY_MAJOR)
			, SUM(MEMORY_MINOR)
			, SUM(DISK_CRITICAL)
			, SUM(DISK_MAJOR)
			, SUM(DISK_MINOR)
		FROM AC_STAT_ALARM
		WHERE END_TM LIKE '2013%'	-- terms
		GROUP BY SUBSTR(END_TM, 1, 8)
	) ALARM
	right join (
		-- GET ALL MONTH
		SELECT LPAD( rnum.rownum, 2, '0' ) AS MONTHLY
		FROM (
			SELECT @rownum:=@rownum+1 rownum
			FROM (SELECT @rownum:=0) r, TB_UAST_CODE limit 12
		) rnum	
	) cal
	on ALARM.MONTH = cal.MONTHLY
WHERE 1 = 1

-- stats > network > AC monitoring > day
SELECT	CAL_DAILY.*
	, ALARM.*		
FROM (
		SELECT SUBSTR(END_TM, 1, 8) END_DAILY		
			, SUM(CPU_CRITICAL)
			, SUM(CPU_MAJOR)
			, SUM(MEMORY_CRITICAL)
			, SUM(MEMORY_MAJOR)
			, SUM(MEMORY_MINOR)
			, SUM(DISK_CRITICAL)
			, SUM(DISK_MAJOR)
			, SUM(DISK_MINOR)
		FROM AC_STAT_ALARM
		WHERE END_TM LIKE '201301%'	-- terms
		GROUP BY SUBSTR(END_TM, 1, 8)	-- yyyyMMdd
	) ALARM
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
	on ALARM.END_DAILY = CAL_DAILY.END_DAILY
WHERE 1 = 1

-- stats > network > AC monitoring > time
SELECT	CAL.*
	, ALARM.*		
FROM (
		SELECT SUBSTR(END_TM, 8, 2) END_HOUR		
			, SUM(CPU_CRITICAL)
			, SUM(CPU_MAJOR)
			, SUM(MEMORY_CRITICAL)
			, SUM(MEMORY_MAJOR)
			, SUM(MEMORY_MINOR)
			, SUM(DISK_CRITICAL)
			, SUM(DISK_MAJOR)
			, SUM(DISK_MINOR)
		FROM AC_STAT_ALARM
		WHERE END_TM BETWEEN CONCAT('20130101','000000') AND CONCAT('20130103','245959')	-- terms
		GROUP BY SUBSTR(END_TM, 8, 2)	-- hh
	) ALARM
	right join (
		-- GET ALL HOURS
		SELECT LPAD( rnum.rownum, 2, '0' ) AS END_HOUR
		FROM (
			SELECT @rownum:=@rownum+1 rownum
			FROM (SELECT @rownum:=0) r, TB_UAST_CODE limit 24
		) rnum	
	) cal
	on ALARM.END_HOUR = cal.END_HOUR
WHERE 1 = 1

-- stats > network > traffic > month
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
	, TRAFFIC.*		
FROM (
		SELECT SUBSTR(TRA.Y_MONTH,4,2) MONTHLY
			, (TOT_UP - WIFI_UP) LAN_UP
			, (TOT_DOWN - WIFI_DOWN) LAN_DOWN
			,TRA.* 
		FROM (
			SELECT SUBSTR(END_TM,1,6) AS Y_MONTH
				, SUM(TX_OCTET) TOT_UP, SUM(RX_OCTET) TOT_DOWN
				, 0 WIFI_UP, 0 WIFI_DOWN
			FROM AC_STAT_TRAFFIC
			WHERE END_TM LIKE '2008%'	-- terms
			GROUP BY SUBSTR(END_TM,1,6)
			UNION ALL
			SELECT SUBSTR(END_TM,1,6) AS Y_MONTH
				, 0 TOT_UP, 0 TOT_DOWN
				, SUM(TX_BYTE) WIFI_UP, SUM(RX_BYTE) WIFI_DOWN
			FROM AC_STAT_AP_TRAFFIC
			WHERE END_TM LIKE '2008%'	-- terms
			GROUP BY SUBSTR(END_TM,1,6)
		) TRA
		GROUP BY Y_MONTH
	) TRAFFIC
	right join (
		-- GET ALL MONTH
		SELECT LPAD( rnum.rownum, 2, '0' ) AS MONTHLY
		FROM (
			SELECT @rownum:=@rownum+1 rownum
			FROM (SELECT @rownum:=0) r, TB_UAST_CODE limit 12
		) rnum	
	) cal
	on TRAFFIC.MONTHLY = cal.MONTHLY
WHERE 1 = 1
-- stats > network > traffic > day
SELECT	cal.*
	, TRAFFIC.*		
FROM (
		SELECT SUBSTR(TRA.Y_M_DAY,6,2) END_DAILY
			, (TOT_UP - WIFI_UP) LAN_UP
			, (TOT_DOWN - WIFI_DOWN) LAN_DOWN
			,TRA.* 
		FROM (
			SELECT SUBSTR(END_TM,1,8) AS Y_M_DAY
				, SUM(TX_OCTET) TOT_UP, SUM(RX_OCTET) TOT_DOWN
				, 0 WIFI_UP, 0 WIFI_DOWN
			FROM AC_STAT_TRAFFIC
			WHERE END_TM LIKE '200801%'	-- terms '200801'
			GROUP BY SUBSTR(END_TM,1,8)	-- get year-month
			UNION ALL
			SELECT SUBSTR(END_TM,1,6) AS Y_M_DAY
				, 0 TOT_UP, 0 TOT_DOWN
				, SUM(TX_BYTE) WIFI_UP, SUM(RX_BYTE) WIFI_DOWN
			FROM AC_STAT_AP_TRAFFIC
			WHERE END_TM LIKE '200801%'	-- terms '200801'
			GROUP BY SUBSTR(END_TM,1,8)	-- get year-month
		) TRA
		GROUP BY Y_M_DAY
	) TRAFFIC
	right join (
		-- GET ALL DAY OF MONTH
		SELECT DAILY, REPLACE(DAILY,'-','') END_DAILY, WEEKDAY(DAILY) DAY, DAYNAME(DAILY) DAYNAME
		FROM (
			SELECT DATE_ADD(CONCAT('200801','01'), INTERVAL rownum-1 DAY) AS DAILY	-- terms '200801'
			FROM (
				SELECT @rownum:=@rownum+1 rownum
				FROM (SELECT @rownum:=0) r, TB_UAST_CODE limit 31
			) rnum
			WHERE rownum <= (SELECT DAYOFMONTH(LAST_DAY(CONCAT('200801','01'))))	-- terms '200801' 
		) CAL_DAILY
	) cal
	on TRAFFIC.END_DAILY = cal.END_DAILY
-- stats > network > traffic > time
SELECT	cal.*
	, TRAFFIC.*		
FROM (
		SELECT (TOT_UP - WIFI_UP) LAN_UP
			, (TOT_DOWN - WIFI_DOWN) LAN_DOWN
			,TRA.* 
		FROM (
			SELECT SUBSTR(END_TM,8,2) AS END_HOUR
				, SUM(TX_OCTET) TOT_UP, SUM(RX_OCTET) TOT_DOWN
				, 0 WIFI_UP, 0 WIFI_DOWN
			FROM AC_STAT_TRAFFIC
			WHERE END_TM BETWEEN CONCAT('20080101','000000') AND CONCAT('20080103','245959')	-- -- terms '20080101' '20080103'
			GROUP BY SUBSTR(END_TM,8,2)	-- get Hour 
			UNION ALL
			SELECT SUBSTR(END_TM,8,2) AS _HOUR
				, 0 TOT_UP, 0 TOT_DOWN
				, SUM(TX_BYTE) WIFI_UP, SUM(RX_BYTE) WIFI_DOWN
			FROM AC_STAT_AP_TRAFFIC
			WHERE END_TM BETWEEN CONCAT('20080101','000000') AND CONCAT('20080103','245959')	-- -- terms '20080101' '20080103'
			GROUP BY SUBSTR(END_TM,8,2)	-- get Hour 
		) TRA
		GROUP BY END_HOUR
	) TRAFFIC
	right join (
		-- GET ALL HOURS
		SELECT LPAD( rnum.rownum, 2, '0' ) AS END_HOUR
		FROM (
			SELECT @rownum:=@rownum+1 rownum
			FROM (SELECT @rownum:=0) r, TB_UAST_CODE limit 24
		) rnum	
	) cal
	on TRAFFIC.END_HOUR = cal.END_HOUR

