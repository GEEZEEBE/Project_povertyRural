package com.skt.mars.adm.cm.sch;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.skt.mars.adm.cm.CommonCodeService;
import com.skt.mars.adm.cm.ut.DateFormatUtil;

/**
 * A synchronous worker
 */
@Component("syncWorker")
public class SyncWorker implements Worker {

	@Value("#{commonProperty['traffic.file.path']}")
	private String trafficFilePath;

	// local path for file of Macaddress information
	@Value("#{commonProperty['network.file.output.path']}")
	private String networkFileOutputPath;

	// remote FTP
	@Value("#{commonProperty['remote.ftp.server']}")
	private String remoteFTPServer;
	@Value("#{commonProperty['remote.ftp.port']}")
	private int remoteFTPPort;
	@Value("#{commonProperty['remote.ftp.user']}")
	private String remoteFTPUser;
	@Value("#{commonProperty['remote.ftp.password']}")
	private String remoteFTPpassword;
	@Value("#{commonProperty['remote.ftp.file.path']}")
	private String remoteFTPFilePath;

	@Autowired
	private CommonCodeService commonCodeService; // modify here

	protected final Log logger = LogFactory.getLog(getClass());

	public void work() {
		String threadName = Thread.currentThread().getName();
		logger.debug("   " + threadName + " has began working.");
		logger.debug("   " + threadName + " has completed work.");
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.skt.mars.adm.cm.sch.Worker#work(java.lang.String,
	 * java.lang.String, java.util.Map)
	 * 
	 * @parameter
	 * 
	 * table_name : use both file and table name trafficType : trafficType in
	 * Common code columnNameMap : // column Name
	 */
	public void work(String table_name, String trafficType, List columnNameList) {

		File fl = null;
		FileReader fr = null;
		BufferedReader br = null;

		try {

			// Default file path and part of file name
			String partOfFileName = trafficFilePath + table_name + "_";

			// query ID by insert
			String sqlMapMaxId = "traffic.processLog.select.max";

			// get Max Parameter by trafficType
			Map resultMap = (Map) commonCodeService.selectByObject(sqlMapMaxId,
					trafficType);

			// get inserted Max data from DB Process log
			String maxStrtTm = (String) resultMap.get("STRT_TM");
			String maxAcStrtTM = (String) resultMap.get("AC_STRT_TM");

			String currentDate = DateFormatUtil.getDateFormat("yyyyMMdd");

			String fileNameDate = maxStrtTm.substring(0, 8);

			// full file name
			String fileName = null;

			// read Line information
			String sCurrentLine;

			// query ID by insert
			String sqlMapId = "traffic." + table_name + ".insert";

			// initial variables
			Map insertMap = new HashMap(); // insert data
			Iterator itr = null; // loop column name list
			String colName = null; // column name by column name list
			int colLoop = 0;

			String strtTM = null;
			String endTM = null;
			String acStrtTM = null;
			String acEndTM = null;

			Map processLogMap = null;

			boolean compareCheck = false;
			int cntNextFile = 0;
			int compareLength = maxAcStrtTM.length();

			for (int i = 0; fileNameDate.compareTo(currentDate) <= 0; i++) {

				fileName = partOfFileName + fileNameDate;

				fl = new File(fileName);

				// check to exists target file
				if (fl.exists()) {

					fr = new FileReader(fileName);

					br = new BufferedReader(fr);

					if (br != null) {
						String[] strArray = null; // get line date from file

						// loop until BufferedReader size
						while ((sCurrentLine = br.readLine()) != null) {

							compareCheck = false;
							// logger.debug(fileNameDate+ " line : "+ cnt++ +
							// " - "+ sCurrentLine);

							// compare whether insert or skip
							compareCheck = (compareLength <= 16 || maxAcStrtTM
									.compareTo(sCurrentLine.substring(0,
											compareLength)) < 0);

							if (compareCheck) {
								// convert Line to Array with split function
								strArray = sCurrentLine.split(" ");

								strtTM = null;
								endTM = null;
								acStrtTM = null;
								acEndTM = null;

								// get rid of characters '-' and ':'
								strtTM = strArray[0].replaceAll("-", "")
										+ strArray[1].replaceAll(":", "");
								endTM = strArray[3].replaceAll("-", "")
										+ strArray[4].replaceAll(":", "");

								// get common columns
								insertMap.put("STRT_TM", strtTM);
								insertMap.put("END_TM", endTM);

								// merge date and time
								acStrtTM = strArray[0] + " " + strArray[1];
								acEndTM = strArray[3] + " " + strArray[4];

								// get common columns
								insertMap.put("AC_STRT_TM", acStrtTM);
								insertMap.put("AC_END_TM", acEndTM);

								itr = null;
								itr = columnNameList.iterator();

								// start looping count by
								colLoop = 8;
								while (itr.hasNext()) {
									colName = (String) itr.next();
									insertMap.put(colName, strArray[colLoop++]);
								}

								commonCodeService.insert(sqlMapId, insertMap);
							}
						}

					}

					// close fileReader and BufferedReader
					br.close();
					fr.close();
				}

				fl = null;
				// get next file name to read
				fileNameDate = DateFormatUtil.getDayByAdjustValue(
						maxStrtTm.substring(0, 8), ++cntNextFile);

				// transfer value to search max start time
				if (acStrtTM != null) {
					maxStrtTm = acStrtTM;
				}
				compareLength = maxAcStrtTM.length();

			}

			// insert Process log
			if (compareCheck) {

				processLogMap = new HashMap(); // inserted process Log

				/*
				 * // For traffic.processLog.insert
				 * processLogMap.put("trafficType", trafficType);
				 * processLogMap.put("table_name", table_name);
				 * processLogMap.put("acStrtTM", maxAcStrtTM);
				 * 
				 * commonCodeService.insert("traffic.processLog.insert",
				 * processLogMap);
				 */

				// For traffic.processLogByMap.insert
				processLogMap.put("strtTM", strtTM);
				processLogMap.put("endTM", endTM);
				processLogMap.put("acStrtTM", acStrtTM);
				processLogMap.put("acEndTM", acEndTM);
				processLogMap.put("trafficType", trafficType);
				processLogMap.put("sucessYN", "Y");

				commonCodeService.insert("traffic.processLogByMap.insert",
						processLogMap);

			}

		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (br != null)
					br.close();
				if (fr != null)
					fr.close();
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
	}

	@Override
	public void workMacListToFile(String file_name, String trafficType) {
		// Remote FTP
		FTPClient ftpClient = null;
		Map processLogMap = null; // inserted process Log

		FileWriter fw = null;
		try {

			// query ID by insert
			String sqlMapMaxId = "traffic.processLogForMac.select.max";

			// get Max Parameter by trafficType
			Map resultMap = (Map) commonCodeService.selectByObject(sqlMapMaxId,
					trafficType);

			// get inserted Max data from DB Process log
			String maxStrtTm = (String) resultMap.get("STRT_TM");
			String maxAcStrtTM = (String) resultMap.get("AC_STRT_TM");

			String currentDate = DateFormatUtil.getDateFormat("yyyyMMddHHmm");

			// query ID by select
			String sqlMapId = "traffic.assetMacaddressList.select";

			Map<String, String> requestMap = new HashMap();
			requestMap.put("maxStrtTm", maxStrtTm);
			requestMap.put("currentDate", currentDate);
			// get Max Parameter by trafficType
			List resultUserList = (List) commonCodeService.selectList(sqlMapId,
					requestMap);

			// full file name
			String fileFullName = null;

			// Default file path and part of file name
			String partOfFileName = networkFileOutputPath + file_name + "_";

			// get date of filename
			String fileNameDate = null;

			// initial variables
			Iterator itr = resultUserList.iterator(); // loop column name list
			Map insertMap = new HashMap(); // insert data
			String Macaddress = null;
			String DelYN = null; // Y:

			if (resultUserList != null && resultUserList.size() > 0) {
				fileNameDate = maxStrtTm.substring(0, 12);

				fileFullName = partOfFileName + fileNameDate;

				File file = new File(fileFullName);

				// if file doesnt exists, then create it
				if (!file.exists()) {
					file.createNewFile();
				}

				fw = new FileWriter(file.getAbsoluteFile());
				BufferedWriter bw = new BufferedWriter(fw);
				while (itr.hasNext()) {
					insertMap = (Map) itr.next();

					Macaddress = (String) insertMap.get("ITEM_01");
					DelYN = (String) insertMap.get("DEL_YN");

					bw.write(DelYN + " " + Macaddress + "\n");
				}
				bw.close();
				fw.close();

				ftpClient = new FTPClient();
				ftpClient.connect(remoteFTPServer, remoteFTPPort);
				ftpClient.login(remoteFTPUser, remoteFTPpassword);
				ftpClient.enterLocalPassiveMode();

				ftpClient.setFileType(FTP.BINARY_FILE_TYPE);

				// APPROACH #1: uploads first file using an InputStream
				File localFile = new File(fileFullName);
				InputStream inputStream = new FileInputStream(localFile);

				// Remote FTP fulled file name
				String RemoteFullFile = remoteFTPFilePath + file_name + "_"
						+ fileNameDate;

				boolean done = ftpClient.storeFile(RemoteFullFile, inputStream);
				inputStream.close();

				String sucessYN = null;
				if (done) {
					sucessYN = "Y";
				} else {
					sucessYN = "N";
				}

				// For traffic.processLogByMap.insert
				processLogMap = new HashMap();

				processLogMap.put("strtTM", currentDate);
				processLogMap.put("endTM", currentDate);
				processLogMap.put("acStrtTM", maxAcStrtTM);
				processLogMap.put("acEndTM", maxStrtTm);
				processLogMap.put("trafficType", trafficType);
				processLogMap.put("sucessYN", sucessYN);

				commonCodeService.insert("traffic.processLogByMap.insert",
						processLogMap);
			}

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ftpClient != null) {
					if (ftpClient.isConnected()) {
						ftpClient.logout();
						ftpClient.disconnect();
					}
				}
				if (fw != null)
					fw.close();
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
	
	}

	@Override
	public void work(String folder, String table_name, String trafficType,
			List columnNameList) {
		// TODO Auto-generated method stub
		
	}



}
