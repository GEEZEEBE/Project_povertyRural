package com.skt.mars.adm.cm.sch;

import java.util.List;

public interface Worker {

    public void work();

    public void work(String folder, String table_name, String trafficType, List columnNameList);

    public void workMacListToFile(String file_name, String trafficType);
}
