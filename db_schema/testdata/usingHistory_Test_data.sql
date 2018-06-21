select DATE_FORMAT(SYSDATE(), '%Y%m%d%H%i%s%f')


select *
from tb_uast_use_hs
where USE_HS_NMBR_ID = '20130101010101000'

delete from tb_uast_use_hs
where USE_HS_NMBR_ID = '20130101010101000'

	   	insert into tb_uast_use_hs( 
	    	USE_HS_NMBR_ID,
	    	STRT_TM,
	    	END_TM,
	    	CMPL_YN,
	    	PAY_KIND,
	    	PRIC_TYPE,
	    	PRIC_UNIT,
	    	FLAT_RATE,
	    	DEPOSIT_RATE,
	    	RENT_DAY,
	    	USER_ID,
	    	GODS_ID,
	    	ITEM_ID,
	    	FRST_RGST_DT,
	    	FRST_RGST_USER_ID,
	    	LAST_CRCT_DT,
	    	LAST_CRCT_USER_ID 
	    )
	    select '20130101010101003'
		, DATE_FORMAT(SYSDATE(), '%Y%m%d%H%i%s%f')
		, ''
		, 'S'
		, pric.PAY_KIND
		, pric.PRIC_TYPE
		, pric.PRIC_UNIT
		, pric.FLAT_RATE
		, pric.DEPOSIT_RATE
		, pric.RENT_DAY
		, 'kut0100'
		, gods.gods_id
		, null
		, SYSDATE()
		, 'kut0100'
		,  SYSDATE()
		, 'kut0100'
from TB_UAST_GODS GODS
		, TB_UAST_PRIC pric
where 1 = 1
and gods.srvc_id = 31
and gods.gods_id = pric.taget_id