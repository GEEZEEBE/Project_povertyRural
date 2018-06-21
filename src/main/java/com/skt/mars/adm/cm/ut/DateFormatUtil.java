/**
 * 
 */
package com.skt.mars.adm.cm.ut;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.skt.mars.adm.cm.SpringApplicationContext;
import com.skt.mars.adm.cm.iBatisCommonDao;

/**
 * @author sanghunoh
 *
 */
public class DateFormatUtil {
//	@Resource(name = "commonDAO")
//	private CommonDefultDao commonDao;

	public static long getRandomCategoryID() {
		Calendar currentDate = Calendar.getInstance();
		SimpleDateFormat formatter =  new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String dateNow = formatter.format(currentDate.getTime());
		Random randomGenerator = new Random();
		int randomInt = randomGenerator.nextInt(999);
		return Long.valueOf(dateNow)+randomInt;
	}

	/*
	 * create Sequence ID
	 *  
	 */
	public static String getRandomID() {
		Calendar currentDate = Calendar.getInstance();
		SimpleDateFormat formatter =  new SimpleDateFormat("yyyyMMddHHmmssSSSS");
		String dateNow = formatter.format(currentDate.getTime());
		Random randomGenerator = new Random();
		int randomInt = randomGenerator.nextInt(999);
		return String.valueOf(dateNow)+randomInt;
	}

	/*
	 * return current Date by Format
	 * 
	 * ex) in case 'dateFormat'  'yyyyMMddHHmmssSS' -> 20120101235922021
	 *
	 * 
	 */
	public static String getDateFormat(String dateFormat) {
		Calendar currentDate = Calendar.getInstance();
		SimpleDateFormat formatter =  new SimpleDateFormat(dateFormat);
		String dateNow = formatter.format(currentDate.getTime());

		return String.valueOf(dateNow);
	}

	/*
	 * return current Date by Format
	 * 
	 * ex) in case 'dateFormat'  'yyyyMMddHHmmssSS' -> 20120101235922021
	 *
	 * 
	 */
	public static String getDayByAdjustValue(String dateString, int adjustValue) throws ParseException {
	       // Create a date formatter using your format string
        DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");

        // Parse the given date string into a Date object.
        // Note: This can throw a ParseException.
        Date myDate = dateFormat.parse(dateString);

        // Use the Calendar class to subtract one day
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(myDate);
        calendar.add(Calendar.DAY_OF_YEAR, adjustValue);

        // Use the date formatter to produce a formatted date string
        Date previousDate = calendar.getTime();
        String result = dateFormat.format(previousDate);

        return result;
	}
	
	/*
	 * create Sequence User or Manager ID by Rule
	 * 	authority : U - UserID , M : - Manager
	 * 
	 * ex) User - kut0100, Manager - kut0001
	 */
	public static String getSequenceID(String authority) {
		String markString = "kut";
        // get service Bean from ApplicationContext
		SqlMapClient sqlMapClient = (SqlMapClient)SpringApplicationContext.getBean("sqlMapClient");

		iBatisCommonDao ibatisCommonDao = new iBatisCommonDao() ;
		ibatisCommonDao.setSqlMapClient(sqlMapClient);
		
		Map<String, String> requestMap = new HashMap();
		requestMap.put("authority", authority);
		String sequenceID = (String) ibatisCommonDao.selectByCategoryID("user.select.max", requestMap);
		
		int sequenceInt = 0;
		if(sequenceID != null){
			sequenceInt = Integer.parseInt(sequenceID.replaceAll(markString, "")); 
			sequenceInt++;
		}

		DecimalFormat df = new DecimalFormat("0000");
		return markString + df.format(sequenceInt);
	}

	public static Date getCurrentDateTime() {
		Calendar currentDate = Calendar.getInstance();
		return currentDate.getTime();
	}
}
