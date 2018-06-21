select *
from TB_UAST_USE_HS
where 1 = 1
and USE_HS_NMBR_ID=  '201303271548560911498'

delete from TB_UAST_USE_HS
where USE_HS_NMBR_ID in (
			SELECT USE_HIS.USE_HS_NMBR_ID
			FROM (
		                	SELECT * FROM TB_UAST_USE_HS
	          ) USE_HIS
	          right join (
	                     select ITEM.*
	                     		from TB_UAST_ITEM ITEM
							,TB_UAST_GODS GODS
					where 1 = 1
					and GODS.GODS_ID = ITEM.GODS_ID
					AND GODS.SRVC_ID = 31
				) CT_GOS
	     			on CT_GOS.GODS_ID = USE_HIS.GODS_ID
	     			 and CT_GOS.ITEM_ID = USE_HIS.ITEM_ID
	     			AND USE_HIS.CMPL_YN = 'S'
	     			)
	     			
	     						SELECT CT_GOS.CNTS_NAME CNTS_NAME
						, USE_HIS.*
			FROM (
		                	SELECT * FROM TB_UAST_USE_HS
	          ) USE_HIS
	          right join (
	                     select ITEM.*
	                     		from TB_UAST_ITEM ITEM
							,TB_UAST_GODS GODS
					where 1 = 1
					and GODS.GODS_ID = ITEM.GODS_ID
					AND GODS.SRVC_ID = 31
				) CT_GOS
	     			on CT_GOS.GODS_ID = USE_HIS.GODS_ID
	     			 and CT_GOS.ITEM_ID = USE_HIS.ITEM_ID
		       			AND USE_HIS.CMPL_YN = 'E'       --  not  end using -->
