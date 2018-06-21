package com.skt.mars.adm.cm;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.MethodParameter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.support.WebArgumentResolver;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.skt.mars.adm.cm.ut.FileUtils;
import com.skt.mars.adm.lg.CustomUser;

/**
 * Controller 클래스가 로드되기 전 파라미터 값에 따른 파일 업로드를 수행하기 위한 클래스이다.
 */
public class MapFileUploadResolver implements WebArgumentResolver {

    /*
     * get propertice from systemConfig.properties from ibatis-context.xml by util:properties
     */
    @Value("#{commonProperty['attach.file.path.root']}")
    private String attachFilePathRoot;

    @Value("#{commonProperty['attach.file.path.commerce']}")
    private String attachFilePathCommerce;
    
    @Value("#{commonProperty['attach.file.size.default']}")
    private int attachFileSizeDefault;

    @Value("#{commonProperty['attach.file.path.default']}")
    private String attachFilePathDefault;

    @Value("#{commonProperty['attach.file.size.learning']}")
    private int attachFileSizeLearning;

    @Value("#{commonProperty['attach.file.path.learning']}")
    private String attachFilePathLearning;

    @Value("#{commonProperty['attach.file.size.commerceGuide']}")
    private int attachFileSizeCommerceGuide;

    @Value("#{commonProperty['attach.file.path.commerceGuide']}")
    private String attachFilePathCommerceGuide;

    @Value("#{commonProperty['attach.file.size.commerceTemplateEng']}")
    private int attachFileSizeCommerceTemplateEng;

    @Value("#{commonProperty['attach.file.path.commerceTemplateEng']}")
    private String attachFilePathCommerceTemplateEng;

    @Value("#{commonProperty['attach.file.size.commerceTemplateMal']}")
    private int attachFileSizeCommerceTemplateMal;

    @Value("#{commonProperty['attach.file.path.commerceTemplateMal']}")
    private String attachFilePathCommerceTemplateMal;

    @Override
    public Object resolveArgument(MethodParameter methodParameter, NativeWebRequest webRequest) throws Exception {

        Class<?> clazz = methodParameter.getParameterType();
        String paramName = methodParameter.getParameterName();
        MultipartHttpServletRequest multipartRequest = null;
        Map<String, String> fileMap = null;
        List fileList = new ArrayList();

        if (clazz.equals(Map.class) && paramName.equals("requestFileMap")) {
            Map<String, Object> requestMap = new HashMap<String, Object>();

            HttpServletRequest request = (HttpServletRequest)webRequest.getNativeRequest();

            if (request.getContentType().contains("multipart/form-data")) {
                multipartRequest = (MultipartHttpServletRequest)webRequest.getNativeRequest();
            }

            Enumeration<?> enumeration = multipartRequest.getParameterNames();

            while (enumeration.hasMoreElements()) {
                String key = (String)enumeration.nextElement();
                String[] values = request.getParameterValues(key);
                if (values != null) {
                    requestMap.put(key, (values.length > 1) ? values : values[0]);
                }
            }

            String kindOfWork = (String)requestMap.get("kindOfWork");

            int attachFileSize = 0;
            String filePath = null;

            String filePathRoot = attachFilePathRoot;
            String filePathSub = null;
            // file location in File Server
            if ("learning".equals(kindOfWork)) {
                attachFileSize = attachFileSizeLearning;
                filePathSub = attachFilePathLearning;
            } else if ("commerceGuide".equals(kindOfWork)) {
                attachFileSize = attachFileSizeCommerceGuide;
                filePathSub = attachFilePathCommerceGuide;
            } else if ("commerceTemplateEng".equals(kindOfWork)) {
            	filePathRoot = attachFilePathCommerce;
                attachFileSize = attachFileSizeCommerceTemplateEng;
                filePathSub = attachFilePathCommerceTemplateEng;
            } else if ("commerceTemplateMal".equals(kindOfWork)) {
            	filePathRoot = attachFilePathCommerce;
                attachFileSize = attachFileSizeCommerceTemplateMal;
                filePathSub = attachFilePathCommerceTemplateMal;
            } else {
                attachFileSize = attachFileSizeDefault;
                filePathSub = attachFilePathDefault;
            }
            filePath = filePathRoot + filePathSub;

            MultipartFile multiFile = null;

            Iterator<String> multiFileList = multipartRequest.getFileNames();

            while (multiFileList.hasNext()) {
                fileMap = new HashMap();

                String fileName = multiFileList.next();

                multiFile = multipartRequest.getFile(fileName);

                // limit file size
                if (multiFile.getSize() > attachFileSize) {
                    fileMap.put("error", "Attachment file exceeds capacity. (Max: "+ attachFileSize/128 + "MB)");
                    request.setAttribute("error", "Attachment file exceeds capacity. (Max: "+ attachFileSize/128 + "MB)");
                    return UNRESOLVED;
                }

                // original filename (ex. neopets.jpg)
                String originalFileName = multiFile.getOriginalFilename().trim();

                if (originalFileName == "" || originalFileName.isEmpty()) {
                    continue;
                }

                // convert original filename with FileUtils.java to virtual filename to upload in ftp
                String multiFileName = null;

                if("commerceGuide".equals(kindOfWork) || "commerceTemplateEng".equals(kindOfWork) || "commerceTemplateMal".equals(kindOfWork)){
                    multiFileName = originalFileName;
                } else {
                	// physical name + original file extension
//                    multiFileName = FileUtils.getNewFileName(originalFileName)  + originalFileName.substring(originalFileName.lastIndexOf('.'),originalFileName.length()) ;
                    multiFileName = FileUtils.getNewFileName(originalFileName);
                }

                // file 저장경로 + fileName
                String attachFileName = filePath + multiFileName;

                // file size (ex. 1KByte -> 1048)  
                String fileSize = multiFile.getSize() + "";

                // get ContentType (ex. jpg(original file type) -> images/JPEG ...)
                String fileContentType = multiFile.getContentType();

                try {
                    // file 저장위치에 이동  
                    multiFile.transferTo(new File(attachFileName));
                    fileMap.put("originalFileName", originalFileName);
                    fileMap.put("attachFileName", multiFileName);
                    fileMap.put("fileContentType", fileContentType);
                    fileMap.put("fileSize", fileSize);
                    fileMap.put("physicalFileDirectory", filePathSub);
                    fileMap.put("fileType", fileName); //멀티업로드시, 파일 구분을위한 tagName (ex.VOD자산등록)

                    fileList.add(fileMap);

                } catch (Exception e) {
                    File file = new File(attachFileName);
                    file.delete();
                    e.printStackTrace();
                }
            }
            requestMap.put("fileList", fileList);

            // set Session information
    		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    		
    		if(auth != null){
    		
    			if(auth.getPrincipal() != null && !"anonymousUser".equals(auth.getPrincipal())){
        			String userID = null;

    				CustomUser customUser = (CustomUser) auth.getPrincipal();

    				userID = customUser.getUserID();
    			
    	    		requestMap.put("frstRgstUserID", userID); //get logged in username
    	    		requestMap.put("latCrctUserID", userID); //get logged in username

    			}
    		}

    		// check to search word
    		/*
    		if(!"Y".equals(requestMap.get("searchCheck"))){
    			requestMap.put("serTxt", null);
    		}
			*/
            return requestMap;
        }
        
        return UNRESOLVED;
    }
}
