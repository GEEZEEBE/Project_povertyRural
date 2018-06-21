package com.skt.mars.adm.cm.sch;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

/**
 * Scheduler for handling jobs
 */
@Service
public class SchedulerService {

    protected final Log logger = LogFactory.getLog(getClass());

    @Autowired
    @Qualifier("syncWorker")
    private Worker worker;

    /**
     * You can opt for cron expression or fixedRate or fixedDelay
     * <p>
     * See Spring Framework 3 Reference: Chapter 25.5 Annotation Support for Scheduling and Asynchronous Execution The
     * field order of the cronExpression is 1.Seconds 2.Minutes 3.Hours 4.Day-of-Month 5.Month 6.Day-of-Week 7.Year
     * (optional field) ex) every 30 minute -> 0 0/30 * * *
     */
    // @Scheduled(fixedDelay=5000)
    // @Scheduled(fixedRate=5000)
//    @Scheduled(cron = "0 0/5 * * * ?")
    public void doApTrafficSchedule() {
        logger.debug("Start schedule");

        // trafficType in Common code
        String trafficType = "02102";

        // use both file and table name
        String table_name = "ac_stat_ap_traffic";

        String folder = "aptraffic\\";

        // column Name
        List<String> columnNameList = new ArrayList();

        columnNameList.add("TX_BYTE");
        columnNameList.add("RX_BYTE");
        columnNameList.add("TX_BPS");
        columnNameList.add("RX_BPS");

        worker.work(folder, table_name, trafficType, columnNameList);

        logger.debug("End schedule");
    }

//    @Scheduled(cron = "0 0/5 * * * ?")
    public void doAlarmSchedule() {
        logger.debug("Start schedule");

        // trafficType in Common code
        String trafficType = "02101";

        // use both file and table name
        String table_name = "ac_stat_alarm";

        String folder = "acalarm\\";

        // column Name
        List<String> columnNameList = new ArrayList();

        columnNameList.add("CPU_CRITICAL");
        columnNameList.add("CPU_MAJOR");
        columnNameList.add("MEMORY_CRITICAL");
        columnNameList.add("MEMORY_MAJOR");
        columnNameList.add("MEMORY_MINOR");
        columnNameList.add("DISK_CRITICAL");
        columnNameList.add("DISK_MAJOR");
        columnNameList.add("DISK_MINOR");

        worker.work(folder, table_name, trafficType, columnNameList);

        logger.debug("End schedule");
    }

    // Not using(every 10 second)
    //	@Scheduled(cron = "*/10 * * * * ?")
    public void doCallSchedule() {
        logger.debug("Start schedule");

        // trafficType in Common code
        String trafficType = "02103";

        // use both file and table name
        String table_name = "ac_stat_call";

        String folder = "accall\\";

        // column Name
        List<String> columnNameList = new ArrayList();

        columnNameList.add("ATTEMPT");
        columnNameList.add("SUCCESS");
        columnNameList.add("ASSOC_TOT");
        columnNameList.add("AUTH_TOT");
        columnNameList.add("AUTH_FAIL");
        columnNameList.add("DHCP_TOT");
        columnNameList.add("DHCP_FAIL");
        columnNameList.add("STATE_MISMATCH");
        columnNameList.add("ROAMING_ATT");
        columnNameList.add("ROAMING_SUC");
        columnNameList.add("ROAMING_FAIL");
        columnNameList.add("CUR_USER");

        worker.work(folder, table_name, trafficType, columnNameList);

        logger.debug("End schedule");
    }

//    @Scheduled(cron = "0 0/5 * * * ?")
    public void doTrafficSchedule() {
        logger.debug("Start schedule");

        // trafficType in Common code
        String trafficType = "02104";

        // use both file and table name
        String table_name = "ac_stat_traffic";

        String folder = "actraffic\\";
        // column Name
        List<String> columnNameList = new ArrayList();

        columnNameList.add("TX_OCTET");
        columnNameList.add("RX_OCTET");
        columnNameList.add("TX_PACKET");
        columnNameList.add("RX_PACKET");
        columnNameList.add("TX_ERROR");
        columnNameList.add("RX_ERROR");
        columnNameList.add("TX_OCTET_BPS");
        columnNameList.add("RX_OCTET_BPS");

        worker.work(folder, table_name, trafficType, columnNameList);

        logger.debug("End schedule");
    }

    //	@Scheduled(cron = "0/10 * * * * ?")
//    @Scheduled(cron = "0 0 0/1 * * ?")
    public void doMacListToFileSchedule() {
        logger.debug("Start schedule");

        // trafficType in Common code
        String trafficType = "02105";

        // Default file path and part of file name 
        String file_name = "marsweb_mac";

        worker.workMacListToFile(file_name, trafficType);

        logger.debug("End schedule");
    }
}
