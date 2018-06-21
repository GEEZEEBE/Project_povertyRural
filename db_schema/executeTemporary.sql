ALTER TABLE TB_UAST_USE_HS ADD COLUMN BILLING_YN VARCHAR(5) DEFAULT 'N' COMMENT 'BILLING_YN'

UPDATE TB_UAST_USE_HS
SET BILLING_YN = 'N'

SELECT STR_TO_DATE(USE_HS.END_TM,'%Y%m%d%H%i%s') END_TM_date
		,STR_TO_DATE(USE_HS.STRT_TM,'%Y%m%d%H%i%s') STRT_TM_DATE
		, TIMEDIFF(STR_TO_DATE(USE_HS.END_TM,'%Y%m%d%H%i%s'), STR_TO_DATE(USE_HS.STRT_TM,'%Y%m%d%H%i%s'))  AS USING_TIME
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
						and SRVC_ID in (29,30)	-- terms LogAccessManager, LogAccessUser
--						AND SRVC_ID in (31)		-- terms UsingPC	
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
 AND USE_HS.USER_ID = 'kut0103'	-- terms kut0103
AND USE_HS.CMPL_YN in ('E')
order by CT_GODS.SRVC_ID, USE_HS.FRST_RGST_DT desc

SELECT ''
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
						and SRVC_ID in (29,30)	-- terms LogAccessManager, LogAccessUser
--						AND SRVC_ID in (31)		-- terms UsingPC	
		             	and del_yn in ('N', 'H', 'D')
					) GODS
					on GODS.GODS_ID = ITEM.GODS_ID
		) CT_GODS
		, TB_UAST_PRIC PRIC
WHERE 1 = 1
AND CT_GODS.TAGET_ID = PRIC.TAGET_ID 

select *
from TB_UAST_USE_HS
where 1 = 1
and GODS_ID in ('501', '502')
and item_id is null