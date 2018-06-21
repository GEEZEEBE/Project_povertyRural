SELECT STR_TO_DATE(USE_HS.END_TM,'%Y%m%d%H%i%s') END_TM_date
		,STR_TO_DATE(USE_HS.STRT_TM,'%Y%m%d%H%i%s') STRT_TM_DATE
		, CONCAT(DATEDIFF(STR_TO_DATE(END_TM,'%Y%m%d'), STR_TO_DATE(STRT_TM,'%Y%m%d')),' day '
				, TIMEDIFF(STR_TO_DATE(SUBSTR(END_TM, 9,6),'%H%i%s'), STR_TO_DATE(SUBSTR(STRT_TM,9,6),'%H%i%s')))  AS USING_TIME
		, USE_HS.*
		, PRIC.*
		, CT_GODS.*
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
--						and SRVC_ID in (29,30)	-- terms LogAccessManager, LogAccessUser
						AND SRVC_ID in (5,6,7)		-- terms UsingPC	
		             	and del_yn in ('N', 'H', 'D')
					) GODS
					on GODS.GODS_ID = ITEM.GODS_ID
		) CT_GODS
		, TB_UAST_PRIC PRIC
		, TB_UAST_USE_HS USE_HS 
WHERE 1 = 1
AND CT_GODS.TAGET_ID = PRIC.TAGET_ID 
AND USE_HS.GODS_ID = CT_GODS.GODS_ID
-- AND USE_HS.ITEM_ID is null	-- terms switch USE_HS.ITEM_ID
-- AND USE_HS.ITEM_ID = CT_GODS.ITEM_ID	-- terms switch USE_HS.ITEM_ID 
-- AND USE_HS.USER_ID = 'kut0103'	-- terms kut0103
AND USE_HS.CMPL_YN in ('E','N','Y') 
order by CT_GODS.SRVC_ID, USE_HS.FRST_RGST_DT desc

SELECT CT_GODS.*, PRIC.*
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
--						and SRVC_ID in (29,30)	-- terms LogAccessManager, LogAccessUser
						AND SRVC_ID in (4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21)		-- terms UsingPC	
		             	and del_yn in ('N', 'H', 'D')
					) GODS
					on GODS.GODS_ID = ITEM.GODS_ID
		) CT_GODS
		, TB_UAST_PRIC PRIC
WHERE 1 = 1
AND CT_GODS.TAGET_ID = PRIC.TAGET_ID 

select END_TM, STRT_TM
		,SUBSTR(END_TM, 9,6), SUBSTR(STRT_TM,9,6)
		, STR_TO_DATE(SUBSTR(END_TM, 9,6),'%H%i%s'), STR_TO_DATE(SUBSTR(STRT_TM,9,6),'%H%i%s')
		, CONCAT(DATEDIFF(STR_TO_DATE(END_TM,'%Y%m%d'), STR_TO_DATE(STRT_TM,'%Y%m%d')),'Day'
		, TIMEDIFF(STR_TO_DATE(SUBSTR(END_TM, 9,6),'%H%i%s'), STR_TO_DATE(SUBSTR(STRT_TM,9,6),'%H%i%s')))  AS USING_TIME
from TB_UAST_USE_HS
where 1 = 1
and user_id = 'kut0106'
and GODS_ID in (
SELECT CT_GODS.gods_id
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
--						and SRVC_ID in (29,30)	-- terms LogAccessManager, LogAccessUser
						AND SRVC_ID in (4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21)		-- terms UsingPC	
		             	and del_yn in ('N', 'H', 'D')
					) GODS
					on GODS.GODS_ID = ITEM.GODS_ID
		) CT_GODS
		, TB_UAST_PRIC PRIC
WHERE 1 = 1
AND CT_GODS.TAGET_ID = PRIC.TAGET_ID )
