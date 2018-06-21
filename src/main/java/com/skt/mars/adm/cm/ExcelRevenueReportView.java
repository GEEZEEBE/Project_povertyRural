package com.skt.mars.adm.cm;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.view.document.AbstractExcelView;

/*
 * @org.springframework.web.servlet.view.document.AbstractExcelView
 * 
 * @ parameter
 * Have to name map parameter 'revenueMap*'
 * Have to put in Map parameter 'excelFileName'
 * 
 */
@Service(value = "excelRevenueReportView")
public class ExcelRevenueReportView extends AbstractExcelView {

	private void ExcelRevenueReportView(){
        // default Constructor
		
	}
	
	@Override
	protected void buildExcelDocument(Map model, HSSFWorkbook workbook,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String fontName = "Arial" ;
		
        // set title font style and cell style
        HSSFFont titleFontStyle = workbook.createFont();
        titleFontStyle.setBoldweight(Font.BOLDWEIGHT_BOLD);
        titleFontStyle.setFontHeight((short)300);
        titleFontStyle.setFontName(fontName);

        HSSFCellStyle titleStyle = workbook.createCellStyle();
        titleStyle.setAlignment(CellStyle.ALIGN_CENTER);
        titleStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);

//        titleStyle.setBorderTop(CellStyle.BORDER_MEDIUM);
//        titleStyle.setBorderBottom(CellStyle.BORDER_MEDIUM);
//        titleStyle.setBorderRight(CellStyle.BORDER_MEDIUM);
        titleStyle.setFont(titleFontStyle);

        // set empty Line font style of empty Line
        HSSFFont emptyLineFontStyle = workbook.createFont();
        emptyLineFontStyle.setFontName(fontName);
        emptyLineFontStyle.setFontHeight((short)50);
        emptyLineFontStyle.setColor(HSSFColor.WHITE.index);

        HSSFCellStyle emptyLineStyle = workbook.createCellStyle();
        emptyLineStyle.setAlignment(CellStyle.ALIGN_CENTER);
        emptyLineStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
        
        emptyLineStyle.setFont(emptyLineFontStyle);

        // set Unit, Search Condition, download date Text font style and cell style
        HSSFFont dateFontStyle = workbook.createFont();
//        dateFontStyle.setBoldweight(Font.BOLDWEIGHT_NORMAL);
        dateFontStyle.setFontHeight((short)200);
        dateFontStyle.setFontName(fontName);

        HSSFCellStyle dateStyle = workbook.createCellStyle();
        dateStyle.setAlignment(CellStyle.ALIGN_LEFT);
        dateStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
//        dateStyle.setFillForegroundColor(IndexedColors.AQUA.getIndex());
//        dateStyle.setFillPattern(CellStyle.SOLID_FOREGROUND );
        dateStyle.setFont(dateFontStyle);

        // set Unit, Search Condition, download date Value font style and cell style
        HSSFCellStyle conditionStyle = workbook.createCellStyle();
        conditionStyle.setAlignment(CellStyle.ALIGN_LEFT);
        conditionStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
        conditionStyle.setFont(dateFontStyle);

        // set sub title font style of table and cell style
        HSSFFont subTitleFontStyle = workbook.createFont();
        subTitleFontStyle.setFontName(fontName);
//        subTitleFontStyle.setBoldweight(Font.BOLDWEIGHT_BOLD);
        subTitleFontStyle.setFontHeight((short)250);
//        subTitleFontStyle.setColor(HSSFColor.WHITE.index);

        HSSFCellStyle subTitleStyle = workbook.createCellStyle();
        subTitleStyle.setAlignment(CellStyle.ALIGN_CENTER);
        subTitleStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
        subTitleStyle.setFillForegroundColor(IndexedColors.AQUA.getIndex());
        subTitleStyle.setFillPattern(CellStyle.SOLID_FOREGROUND );
        subTitleStyle.setFont(subTitleFontStyle);

        // set normal font style of Data
        HSSFFont nomalFont = workbook.createFont();
        nomalFont.setBoldweight(Font.BOLDWEIGHT_NORMAL);
        nomalFont.setFontName(fontName);

        HSSFCellStyle normalStyle = workbook.createCellStyle();
//        normalStyle.setAlignment(CellStyle.ALIGN_RIGHT);
        normalStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);

//        normalStyle.setBorderTop(CellStyle.BORDER_THIN);
//        normalStyle.setBorderBottom(CellStyle.BORDER_THIN);
//        normalStyle.setBorderRight(CellStyle.BORDER_THIN);
        normalStyle.setFont(nomalFont);

        // date
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
        String exportDate = format.format(calendar.getTime());

        // get parameter reveneMap from ModelAndView
		Map<String, Object> revenueMap = null;

		HSSFSheet sheet = null;
		List titleNameList = null; // Title Name List
		
		// create row of Title
		HSSFRow row = null;
		List dataList = null; // Data List

		Map<String, String> dataMap = null;
		
		List columnNameList = null; // Column Name List
		
		Iterator itr = null;
		
		int cellNum = 0;
		int rowNum = 0;
		
		 // sub Title List information
		int subTitleRowCnt = 0 ;
		int subTitleColCnt = 0 ;
		
		// compare Count to move next Line
		int compareCnt = 0;

		String sheetName = null;
        String displyUnit = null; // displyUnit	- 
        String searchCondition = null; // search Condition	- 
		String colName = null;

        HSSFCell hssfCell = null;

		for (int i=0; i< model.size()-1; i++) {
	
			// get Excel information
			revenueMap = (Map<String, Object>) model.get("revenueMap"+i);
			
			// create a wordsheet
			sheetName = (String) revenueMap.get("sheetName");
			sheet = workbook.createSheet(sheetName);
	
			/*
			 * 	set subTitle column
			 */
			titleNameList = new ArrayList(); // Title Name List
			titleNameList = (List) revenueMap.get("titleNameList");
	
			cellNum = 0;
			rowNum = 0;
			subTitleRowCnt = (revenueMap.get("subTitleRowCnt") == null) ? 1 : (Integer) revenueMap.get("subTitleRowCnt");
			subTitleColCnt = (revenueMap.get("subTitleColCnt") == null) ? titleNameList.size()-1 : (Integer) revenueMap.get("subTitleColCnt")-1;
		
			// create row of Title
			// cell Merge
			row = sheet.createRow(rowNum);
			
			hssfCell = row.createCell(0) ;
			hssfCell.setCellStyle(titleStyle) ;
			hssfCell.setCellValue(sheetName) ;

			sheet.addMergedRegion(new CellRangeAddress(rowNum, rowNum, (short)0, (short)subTitleColCnt) );

			rowNum++;
			
			// create row of empty line
			row = sheet.createRow(rowNum);
			
			hssfCell = row.createCell(0) ;
			hssfCell.setCellStyle(emptyLineStyle) ;
			
			sheet.addMergedRegion(new CellRangeAddress(rowNum, rowNum, (short)0, (short)subTitleColCnt) );

			rowNum++;

			// create row of search Unit
			row = sheet.createRow(rowNum);
			
            displyUnit = (String) revenueMap.get("displyUnit"); // 	- 

            hssfCell = row.createCell(0) ;
			hssfCell.setCellStyle(dateStyle) ;
			hssfCell.setCellValue("Unit") ;
			hssfCell = row.createCell(1) ;
			hssfCell.setCellStyle(conditionStyle) ;
			hssfCell.setCellValue(" : "+displyUnit) ;
			
			sheet.addMergedRegion(new CellRangeAddress(rowNum, rowNum, (short)1, (short)subTitleColCnt) );

			rowNum++;

			// create row of search Condition
			row = sheet.createRow(rowNum);
			
            searchCondition =  (String) revenueMap.get("searchCondition"); // search Condition	- 

            hssfCell = row.createCell(0) ;
			hssfCell.setCellStyle(dateStyle) ;
			hssfCell.setCellValue("Search Condition") ;
			hssfCell = row.createCell(1) ;
			hssfCell.setCellStyle(conditionStyle) ;
			hssfCell.setCellValue(" : "+searchCondition) ;
			
			sheet.addMergedRegion(new CellRangeAddress(rowNum, rowNum, (short)1, (short)subTitleColCnt) );

			rowNum++;

			// create row of date
			row = sheet.createRow(rowNum);
			
            hssfCell = row.createCell(0) ;
			hssfCell.setCellStyle(dateStyle) ;
			hssfCell.setCellValue("Download Date") ;
			hssfCell = row.createCell(1) ;
			hssfCell.setCellStyle(conditionStyle) ;
			hssfCell.setCellValue(" : "+exportDate) ;
//			row.createCell(0).setCellValue(exportDate) ;
			
			sheet.addMergedRegion(new CellRangeAddress(rowNum, rowNum, (short)1, (short)subTitleColCnt) );

			rowNum++;
			
			// create row of empty line
			row = sheet.createRow(rowNum);
			
			hssfCell = row.createCell(0) ;
			hssfCell.setCellStyle(emptyLineStyle) ;
			
			sheet.addMergedRegion(new CellRangeAddress(rowNum, rowNum, (short)0, (short)subTitleColCnt) );

			rowNum++;

			// create row of subTitle
			itr = null;
			itr = titleNameList.iterator();
	
			colName = null;
			int mergeCnt = 0;
			int checkMergeCnt = 0;
			int mergeCellNum = 0 ;
			
			// Loop as far as row count
			for(int loopCnt=1; loopCnt<=subTitleRowCnt; loopCnt++){
				
				// Create Row
				row = sheet.createRow(rowNum);
				
				cellNum = 0;
				compareCnt = 0;
				mergeCellNum = 0 ;
				// set cell of sub Title
				while (itr.hasNext()) {
					colName = (String) itr.next();

					// check Integer or String
					if(isInteger(colName)){
						// Merge cell as Integer
						checkMergeCnt = ((Integer.parseInt(colName) > 500) ? Integer.parseInt(colName) - 500 : Integer.parseInt(colName) ) - 1  ;
						mergeCnt = Integer.parseInt(colName) - 1  ;
						
						if(checkMergeCnt > 0){	// in case Not Merge cell
							
							if(mergeCnt > 500){
								// Merge Column
								mergeCnt = mergeCnt - 500;
								sheet.addMergedRegion(new CellRangeAddress(rowNum-1, rowNum+mergeCnt-1, (short)cellNum, (short)cellNum) );						
								
							} else {
								// Merge Row
								sheet.addMergedRegion(new CellRangeAddress(rowNum, rowNum, (short)cellNum-1, (short)cellNum+mergeCnt-1) );						
							}
						}
					} else {
						// Fill cell out as String
						hssfCell = row.createCell(cellNum) ;
						hssfCell.setCellStyle(subTitleStyle) ;
						hssfCell.setCellValue(colName) ;	
					}
					
					// check to move Next row
					if(compareCnt >= subTitleColCnt){
						break;	// next row
					}
					compareCnt++ ;
					cellNum++;
				}
				rowNum++;
			}
	
			/*
			 * 	set column by data
			 */
			dataList = new ArrayList(); // Data List
			dataList = (List) revenueMap.get("list");
	
			if(dataList != null){
				itr = dataList.iterator();
			}
	
			dataMap = new HashMap();
	
			columnNameList = new ArrayList(); // Column Name List
			columnNameList = (List) revenueMap.get("columnNameList");
	
			String cellData = null;
			
			// set the row data
			while (itr.hasNext()) {
				dataMap = (Map) itr.next();
				row = sheet.createRow(rowNum++);
	
				// set the cell data
				for (int j = 0; j <= subTitleColCnt; j++) {
					String tempCol = (String) columnNameList.get(j);
					String tempData = String.valueOf(dataMap.get(columnNameList.get(j)));
					
					hssfCell = row.createCell(j) ;
					hssfCell.setCellStyle(normalStyle) ;

					cellData = String.valueOf(dataMap.get(columnNameList.get(j)));
					
					// Change value '0' if null
					if(cellData == "null" || cellData == "NULL"){
						cellData = "0";
					}
					
					hssfCell.setCellValue(cellData);	// cast type
				}
			}
			sheet.setDefaultColumnWidth(15);
			sheet.autoSizeColumn(0);
		}
		// create a excel file
		String filename = (String) model.get("excelFileName");

		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment; filename=\""+filename+".xls\";");

		/*
		 * String userAgent = request.getHeader("User-Agent");
		 * 
		 * if (userAgent.indexOf("MSIE") > -1) { response.setHeader(
		 * "Content-Disposition", "attachment; fileName=\"" +
		 * URLEncoder.encode(filename, "utf-8").replaceAll( "\\+", "%20") +
		 * "\";"); } else { response.setHeader("Content-Disposition",
		 * "attachment; fileName=\"" + new String(filename.getBytes("utf-8"),
		 * "8859_1") + "\";"); }
		 */
	}

	// Determine if a String is an Integer in Java
	private boolean isInteger(String s) {
	    try { 
	        Integer.parseInt(s); 
		    return true;
	    } catch(NumberFormatException e) { 
	        return false; 
	    }
	    // only got here if we didn't return false
	}
	
    private String getValue(Cell cell) {

        String rtnVal = null;

        if (cell != null) {
            switch (cell.getCellType()) {
                case Cell.CELL_TYPE_NUMERIC:
                    rtnVal = "" + Double.valueOf(cell.getNumericCellValue()).intValue();
                    break;
                case Cell.CELL_TYPE_STRING:
                    rtnVal = "" + cell.getStringCellValue();
                    break;
                case Cell.CELL_TYPE_BLANK:
                    rtnVal = "";
                    break;
            }
        }
        return rtnVal;

    }

    /**
     * 시작과 끝 인덱스를 입력받아 rowspan을 수행한다.
     * 
     * @param sheet merge를 수행할 시트
     * @param startIndex 시작 row
     * @param mergeSize 끝 row
     * @param cols 셀 번호
     */
    private void searchMergeCells(HSSFSheet sheet, int startIndex, int mergeSize, short cols) {

        sheet.addMergedRegion(new CellRangeAddress(startIndex, mergeSize, cols, cols));
    }

    /**
     * 해당 년도의 달에 해당하는 마지막 날짜를 구한다.
     * 
     * @param year 해당 년도
     * @param month 해당 월
     * @return
     */

    private int endOfTheMonth(int year, int month) {
        int endDay = 0;

        if (month == 2) {
            // 윤달인 경우
            if (year % 4 == 0 || year % 100 == 0 || year % 400 == 0) {
                endDay = 34;
            } else {
                endDay = 33;
            }
        } else if (month == 4 || month == 6 || month == 9 || month == 11) {
            endDay = 35;
        } else {
            endDay = 36;
        }

        return endDay;

    }
}