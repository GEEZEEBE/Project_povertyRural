package com.skt.mars.adm.cm.sch;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

/**
 * An asynchronous worker
 */
@Component("asyncWorker")
public class AsyncWorker implements Worker {

    protected static Logger logger = Logger.getLogger("service");

    /**
     * This method will be wrapped in a proxy so that the method is actually invoked by a TaskExecutor instance
     */
    @Override
    @Async
    public void work() {
        String threadName = Thread.currentThread().getName();
        logger.debug("   " + threadName + " has began working.");
        try {
            logger.debug("working...");
            Thread.sleep(10000); // simulates work
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
        logger.debug("   " + threadName + " has completed work.");
    }

    @Override
    public void work(String folder, String table_name, String trafficType, List columnNameList) {
        // TODO Auto-generated method stub

    }

    @Override
    public void workMacListToFile(String file_name, String trafficType) {
        // TODO Auto-generated method stub

    }

}
