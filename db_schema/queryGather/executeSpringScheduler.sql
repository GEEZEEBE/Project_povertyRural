delete from ac_stat_ap_traffic;

delete from ac_stat_alarm;

delete from ac_stat_traffic;

delete from TRAFFIC_PROCESS_LOG;

select *
from ac_stat_traffic;

select count(*)
from ac_stat_ap_traffic;

select count(*)
from ac_stat_alarm;

select count(*)
from ac_stat_traffic;

select count(*)
from TRAFFIC_PROCESS_LOG
where TRAFFIC_TYPE = '02105'

select *
from TRAFFIC_PROCESS_LOG;

		select LAST_CRCT_DT, item_01
		from TB_UAST_ASSETS
		where 1 = 1
		and LAST_CRCT_DT between STR_TO_DATE(201302121928, '%Y%m%d%H%i') and STR_TO_DATE(201303121928, '%Y%m%d%H%i')
		and ASSET_TYPE_CD IN ('00606')

		
		select *
		from TB_UAST_ASSETS
		where 1 = 1
		and LAST_CRCT_DT between STR_TO_DATE(201302121928, '%Y%m%d%H%i') 
										and STR_TO_DATE(#maxStrtTm#, #currentDate#, '%Y%m%d%H%i')
		and ASSET_TYPE_CD IN ('00606')
		
		
select DATE_FORMAT(DATE_ADD(SYSDATE(), INTERVAL -1 YEAR), '%Y-%m-%d %H:%i')


