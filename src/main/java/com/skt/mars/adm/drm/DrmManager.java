/**
 * (주)오픈잇 | http://www.openit.co.kr
 * Copyright (c)2006-2013, openit Inc.
 * All rights reserved.
 */
package com.skt.mars.adm.drm;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * 내용 입력
 * 
 * @author <a href="mailto:support@openit.co.kr">(주)오픈잇 | openit Inc.</a>
 * @version
 * @since
 * @created 2013. 2. 22.
 */
public class DrmManager {

    protected final Log logger = LogFactory.getLog(getClass());

    static final long OFFSET = 0;

    static final boolean SKIP = false;

    //    static final File SRC_FILE = new File("http://150.3.7.99:8080/abc/resources/video/aaa.mp4");
    //    static final File DCF_FILE = new File("http://150.3.7.99:8080/abc/resources/video/Test.dcf");

    //    static final File SRC_FILE = new File("D:/video/mpeg4.mp4");
    //    static final File DCF_FILE = new File("D:/video/test/mpeg4.dcf");
    //    static final File SRC_FILE = new File(fileRoot + "/video/T6_MATH.mp4");
    //    static final File DCF_FILE = new File("C:/Tomcat 6.0/webapps/app_admin/resources/video/test/T6_MATH.dcf");
    //    static final long SRC_FILE_LENGTH = SRC_FILE.length();
    //    static final String DCF_FILE_PATH = "C:/Tomcat 6.0/webapps/app_admin/resources/video/test/T6_MATH.dcf";
/*
    public static String drmdownload(Map fileMap) throws DrmCreateDrmPackagerFailedException {

        String filePath = (String)fileMap.get("filePath");
        String fileName = (String)fileMap.get("fileName");

        File SRC_FILE = new File("D:/storage" + filePath + fileName);

        String[] splitFileName = fileName.split("\\.");

        File DCF_FILE = new File("D:/storage" + filePath + "test/" + splitFileName[0] + ".dcf");

        int SRC_FILE_LENGTH = (int)SRC_FILE.length();

        String DCF_FILE_PATH = "D:/storage" + filePath + "test/" + splitFileName[0] + ".dcf";

        DcfInfo dcfInfo = null;

        long time = System.currentTimeMillis();

        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(time);
        cal.add(Calendar.DATE, 7);

        SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMddHHmmss");
        String date = dayTime.format(cal.getTime());
        date = date + "Z+09";

        //        String clientId = "1234567890bbbbbbbbb"; //userID+MAC_addr : userID-7 / MAC-12
        String clientId = (String)fileMap.get("userID") + (String)fileMap.get("macAddr");
        String clientIdType = "UID";
        //        String expiryDate = "20151231235959Z+09"; //현재시간 + 7일
        String expiryDate = date; //현재시간 + 7일
        String contentUri = "cid:hoppintest@hoppin.com";
        String mimeType = "video/mp4";
        String rightsIssuer = "http://ris.skplanet.co.kr/ri.asp";
        //        String contentName = "레 미제라블"; //content_name
        String contentName = (String)fileMap.get("contentName");
        String contentDescription = ""; //
        String contentVendor = "SK플래닛"; //
        String iconUri = "http://icon.skplanet.co.kr/icon.asp";
        String metaMenuValue = "mp4";

        long contentPlainLength = SRC_FILE_LENGTH;

        Map metaInfoSet = new HashMap();
        metaInfoSet.put("RawFileSize", String.valueOf(SRC_FILE_LENGTH)); // 필수 메타 정보

        dcfInfo = null;
        try {
            dcfInfo = new DcfInfo(clientId,
                                  clientIdType,
                                  expiryDate,
                                  contentUri,
                                  mimeType,
                                  rightsIssuer,
                                  contentName,
                                  contentDescription,
                                  contentVendor,
                                  iconUri,
                                  metaMenuValue,
                                  metaInfoSet,
                                  contentPlainLength);
        } catch (DrmInvalidParameterException e) {
            e.printStackTrace();

        }

        InputStream srcInputStream = null;
        {
            try {
                int data = 0;
                srcInputStream = new RandomFileInputStream(SRC_FILE);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        OutputStream dcfOutPutStream = null;
        {
            try {
                dcfOutPutStream = new FileOutputStream(DCF_FILE);
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            }
        }

        DrmPackagerFactory.createDrmPackager(dcfInfo, srcInputStream, OFFSET);

        DrmPackager drmPackager = null;
        {
            try {
                if (SKIP) {
                    drmPackager = DrmPackagerFactory.createDrmPackagerToSkip(dcfInfo, srcInputStream, OFFSET);
                } else {
                    drmPackager = DrmPackagerFactory.createDrmPackager(dcfInfo, srcInputStream, OFFSET);
                }
            } catch (DrmCreateDrmPackagerFailedException e) {
                e.printStackTrace();
            }
        }

        {
            try {
                // Read DCF header length
                int headerLength;
                {
                    try {
                        headerLength = drmPackager.getDcfHeaderLength();
                    } catch (DrmGetDcfHeaderLengthFailedException e) {
                        e.printStackTrace();
                    }
                }

                // Read 방법-(1)
                // Read DCF data
                {
                    int bufferLength = 64 * 1024;
                    byte[] buffer = new byte[bufferLength];
                    int readLength;

                    while (true) {
                        try {
                            readLength = drmPackager.readDcf(buffer, 0, bufferLength);

                            if (readLength > 0) {
                                dcfOutPutStream.write(buffer, 0, readLength);
                                continue;
                            } else {
                                break; // 완료
                            }
                        } catch (DrmReadDcfBodyFailedException e) {
                            break;
                        }
                    }
                }

            } catch (IOException e) {
                e.printStackTrace();
            }

            try {
                srcInputStream.close();
                dcfOutPutStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }

            drmPackager.release();
        }

        return DCF_FILE_PATH;
    }
*/    
}
