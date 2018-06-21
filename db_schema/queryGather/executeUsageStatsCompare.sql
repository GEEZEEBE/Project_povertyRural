		 SELECT USER.USER_ID    , USER.NAME   
		 FROM TB_UAST_USER AS USER
		WHERE 1=1 
		and AUTHORITY in ('U')
		and USER.USER_ID IN (SELECT a.USER_ID
									          FROM TB_UAST_USE_HS a
									          			, TB_UAST_GODS GODS
									          			, TB_UAST_USER USER
									          WHERE 1 = 1
									          	and USER.USER_ID = a.USER_ID
									          	AND A.GODS_ID = GODS.GODS_ID
												AND GODS.SRVC_ID not in  (1,2,26,25,28,29,30,36) 
											AND a.STRT_TM >= '201304030000'                      
											AND a.END_TM <= '201304031700'               
											and USER.USER_ID LIKE 'kut0104' 
								--			and a.BILLING_YN = 'Y'
									        GROUP BY a.USER_ID)
	        
-- Usage status list
SELECT USER.USER_ID    , USER.NAME       
FROM TB_UAST_USER AS USER   
WHERE 1=1    and AUTHORITY in ('U')   
and USER.USER_ID IN 
(SELECT a.*            
FROM TB_UAST_USE_HS a
left join TB_UAST_GODS b 
on a.GODS_ID=b.GODS_ID            
AND b.SRVC_ID not in  (1,2,26,25,28,29,30,36)    
WHERE 1 = 1                      
AND a.STRT_TM >= '201304030000'                      
AND a.END_TM <= '201304031700'               
and ( a.USER_ID LIKE CONCAT('%', replace(replace('kut0104','%','\%'),'_','\_'), '%') 
GROUP BY a.USER_ID)

-- check to be Usage status list
SELECT b.SRVC_ID, a.*            
FROM TB_UAST_USE_HS a
		, TB_UAST_GODS b 
WHERE 1 = 1                      
and a.GODS_ID=b.GODS_ID            
AND a.STRT_TM >= '201304030000'                      
AND a.END_TM <= '201304031700'               
and  a.USER_ID LIKE 'kut0119' 
AND a.SRVC_ID not in  (1,2,26,25,28,29,30,36) 

-- Usage status details
		SELECT TOT.*
				, PAYMENT.*
				, IFNULL(PAYMENT.DPST_AMT,0) CHARGE_AMT
		FROM (
				SELECT STR_TO_DATE(USE_HS.END_TM,'%Y%m%d%H%i%s') END_TM_date
						,STR_TO_DATE(USE_HS.STRT_TM,'%Y%m%d%H%i%s') STRT_TM_DATE
						, DATEDIFF(STR_TO_DATE(END_TM,'%Y%m%d'), STR_TO_DATE(STRT_TM,'%Y%m%d'))  AS USING_DATE
		                , CASE
							when CT_GODS.SRVC_ID = 31 then 
									TIMEDIFF(STR_TO_DATE(SUBSTR(END_TM, 9,6),'%H%i%s'), STR_TO_DATE(SUBSTR(STRT_TM,9,6),'%H%i%s'))
							else STR_TO_DATE(SUBSTR(END_TM, 9,6),'%H%i%s')
						  end AS USING_TIME
						, USE_HS.*
						, CT_GODS.GODS_NAME, CT_GODS.CNTS_NAME, CT_GODS.SRVC_ID
				FROM (
						select GODS.GODS_ID, GODS.GODS_NAME, GODS.SRVC_ID , GODS.DEL_YN
								, ITEM.ITEM_ID, CNTS_NAME, ITEM.DEL_YN ITEM_DEL_YN
								, IFNULL(ITEM.ITEM_ID,GODS.GODS_ID) TAGET_ID
						from (
						            select *
						             from TB_UAST_ITEM
						             where 1 = 1
						             and del_yn in ('N', 'H', 'D')
						             ) ITEM
						          right join  (
										select *
										from	TB_UAST_GODS
										where 1 = 1
									<dynamic prepend="and SRVC_ID IN">	--  terms LogAccessManager, LogAccessUser -->
										<iterate property="srvcID" open="(" conjunction="," close=")">#srvcID[]#</iterate>
									</dynamic>
										-- and SRVC_ID in (#srvcID#) -->
						             	and del_yn in ('N', 'H', 'D')
									) GODS
									on GODS.GODS_ID = ITEM.GODS_ID
						) CT_GODS
						-- , TB_UAST_PRIC PRIC -->
						, TB_UAST_USE_HS USE_HS 
				WHERE 1 = 1
		          AND USE_HS.STRT_TM >= '201304030000'  
		          AND USE_HS.END_TM END_TM <= '201304031700'       
				AND USE_HS.GODS_ID = CT_GODS.GODS_ID
				AND USE_HS.ITEM_ID = CT_GODS.ITEM_ID	-- terms switch USE_HS.ITEM_ID --> 
				 AND USE_HS.USER_ID = 'kut0119'  	-- terms kut0103 -->
				AND USE_HS.CMPL_YN in ('S', 'E','N','Y') -- Need to delete parameter  'N','Y' -->
				) TOT
				left join
				TB_UAST_PAYMENT PAYMENT
				on TOT.USE_HS_NMBR_ID = PAYMENT.USE_HS_NMBR_ID
				order by TOT.SRVC_ID, TOT.FRST_RGST_DT desc

-- check to be Usage status details
				SELECT STR_TO_DATE(USE_HS.END_TM,'%Y%m%d%H%i%s') END_TM_date
						,STR_TO_DATE(USE_HS.STRT_TM,'%Y%m%d%H%i%s') STRT_TM_DATE
						, DATEDIFF(STR_TO_DATE(END_TM,'%Y%m%d'), STR_TO_DATE(STRT_TM,'%Y%m%d'))  AS USING_DATE
		                , CASE
							when CT_GODS.SRVC_ID = 31 then 
									TIMEDIFF(STR_TO_DATE(SUBSTR(END_TM, 9,6),'%H%i%s'), STR_TO_DATE(SUBSTR(STRT_TM,9,6),'%H%i%s'))
							else STR_TO_DATE(SUBSTR(END_TM, 9,6),'%H%i%s')
						  end AS USING_TIME
						, USE_HS.*
						, CT_GODS.GODS_NAME, CT_GODS.CNTS_NAME, CT_GODS.SRVC_ID
				FROM (
						select GODS.GODS_ID, GODS.GODS_NAME, GODS.SRVC_ID , GODS.DEL_YN
								, ITEM.ITEM_ID, CNTS_NAME, ITEM.DEL_YN ITEM_DEL_YN
								, IFNULL(ITEM.ITEM_ID,GODS.GODS_ID) TAGET_ID
						from (
						            select *
						             from TB_UAST_ITEM
						             where 1 = 1
						             and del_yn in ('N', 'H', 'D')
						             ) ITEM
						          right join  (
										select *
										from	TB_UAST_GODS
										where 1 = 1
										-- and SRVC_ID in (#srvcID#) -->
						             	and del_yn in ('N', 'H', 'D')
									) GODS
									on GODS.GODS_ID = ITEM.GODS_ID
						) CT_GODS
						-- , TB_UAST_PRIC PRIC -->
						, TB_UAST_USE_HS USE_HS 
				WHERE 1 = 1
		          AND USE_HS.STRT_TM >= '201304030000'  
		          AND USE_HS.END_TM <= '201304031700'       
				AND USE_HS.GODS_ID = CT_GODS.GODS_ID
				AND USE_HS.ITEM_ID = CT_GODS.ITEM_ID	-- terms switch USE_HS.ITEM_ID --> 
				 AND USE_HS.USER_ID = 'kut0119'  	-- terms kut0103 -->
				AND USE_HS.CMPL_YN in ('S', 'E','N','Y') -- Need to delete parameter  'N','Y' -->
