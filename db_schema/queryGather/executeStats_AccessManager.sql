-- stats > Acess Manager > Month(USER List) 	
		select USE_HS.USER_ID
		from TB_UAST_GODS GODS
				, TB_UAST_USE_HS USE_HS
		where 1 = 1
		and gods.srvc_id in (29,30)
		and gods.gods_id = USE_HS.gods_id
		and gods.del_yn = 'N'
		AND USE_HS.STRT_TM LIKE '2013%'	-- terms
		GROUP BY USE_HS.USER_ID

-- stats > Acess Manager > Month 	
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
	, USE_H.*		
FROM (
			SELECT USE_HS.MONTHLY
						, MAX(USE_HS.kut0000)	-- terms from
						, MAX(USE_HS.kut0107)
						, MAX(USE_HS.kut0108)
						, MAX(USE_HS.kut0109)	-- terms to
			from (
				select SUBSTR(USE_HiS.STRT_TM,5,2) MONTHLY
					,IF(USE_HIS.USER_ID = 'kut0000',count(*),0) kut0000	-- terms from
					,IF(USE_HIS.USER_ID = 'kut0107',count(*),0) kut0107
					,IF(USE_HIS.USER_ID = 'kut0108',count(*),0) kut0108
					,IF(USE_HIS.USER_ID = 'kut0109',count(*),0) kut0109	-- terms to
						from TB_UAST_GODS GODS
								, TB_UAST_USE_HS USE_HiS
						where 1 = 1
						and gods.srvc_id in (29,30)
						and gods.gods_id = USE_HiS.gods_id
						and gods.del_yn = 'N'
						AND USE_HiS.STRT_TM LIKE '2013%'	-- terms
						GROUP BY SUBSTR(USE_HiS.STRT_TM,5,2), USE_HiS.USER_ID
			) USE_HS
			GROUP BY USE_HS.MONTHLY
	) USE_H
	right join (
		-- GET ALL MONTH
		SELECT LPAD( rnum.rownum, 2, '0' ) AS MONTHLY
		FROM (
			SELECT @rownum:=@rownum+1 rownum
			FROM (SELECT @rownum:=0) r, TB_UAST_CODE limit 12
		) rnum	
	) cal
	on USE_H.MONTHLY = cal.MONTHLY

-- stats > Acess Manager > Day(USER List) 	
		select USE_HS.USER_ID 
		from TB_UAST_GODS GODS
				, TB_UAST_USE_HS USE_HS
		where 1 = 1
		and gods.srvc_id in (29,30)
		and gods.gods_id = USE_HS.gods_id
		and gods.del_yn = 'N'
		AND USE_HS.STRT_TM LIKE '201303%'	-- terms
		GROUP BY USE_HS.USER_ID

-- stats > Acess Manager > Day(need to horizontal loop) 	
SELECT cal.*
	, USE_HIS.*
FROM (
			SELECT USE_HS.END_DAILY
						, MAX(USE_HS.kut0000)	-- terms from
						, MAX(USE_HS.kut0107)
						, MAX(USE_HS.kut0108)
						, MAX(USE_HS.kut0109)	-- terms to
			from (
				select SUBSTR(USE_HiS.STRT_TM,1,8) END_DAILY
					,IF(USE_HIS.USER_ID = 'kut0000',count(*),0) kut0000	-- terms from
					,IF(USE_HIS.USER_ID = 'kut0107',count(*),0) kut0107
					,IF(USE_HIS.USER_ID = 'kut0108',count(*),0) kut0108
					,IF(USE_HIS.USER_ID = 'kut0109',count(*),0) kut0109	-- terms to
						from TB_UAST_GODS GODS
								, TB_UAST_USE_HS USE_HiS
						where 1 = 1
						and gods.srvc_id in (29,30)
						and gods.gods_id = USE_HiS.gods_id
						and gods.del_yn = 'N'
						AND USE_HiS.STRT_TM LIKE '201303%'	-- terms
						GROUP BY SUBSTR(USE_HiS.STRT_TM,1,8), USE_HiS.USER_ID
			) USE_HS
			GROUP BY USE_HS.END_DAILY
	) USE_HIS
	right join (
		-- GET ALL DAY OF MONTH
		SELECT DAILY, REPLACE(DAILY,'-','') END_DAILY, WEEKDAY(DAILY) DAY, DAYNAME(DAILY) DAYNAME
		FROM (
			SELECT DATE_ADD(CONCAT('201303','01'), INTERVAL rownum-1 DAY) AS DAILY	-- terms '201303'
			FROM (
				SELECT @rownum:=@rownum+1 rownum
				FROM (SELECT @rownum:=0) r, TB_UAST_CODE limit 31
			) rnum
			WHERE rownum <= (SELECT DAYOFMONTH(LAST_DAY(CONCAT('201303','01'))))	-- terms '201303'
		) CAL_DAILY
	) cal
	on USE_HIS.END_DAILY = cal.END_DAILY
