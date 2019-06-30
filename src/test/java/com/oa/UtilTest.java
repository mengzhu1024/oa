package com.oa;

import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.xssf.usermodel.*;
import org.junit.Test;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;

/**
 * @author jiguang.qi
 * Created on 2018/8/18
 * Description
 */
public class UtilTest {

	@Test
	public void poi() throws Exception  {
		InputStream sourceStream = new FileInputStream("D:/source.xlsx");
		XSSFWorkbook sourceBook = new XSSFWorkbook(sourceStream);
		XSSFSheet sourceSheet = sourceBook.getSheetAt(0);

//		InputStream resultStream = new FileInputStream("D:/result.xlsx");
//		XSSFWorkbook resultWorkbook = new XSSFWorkbook(resultStream);
		XSSFSheet resultSheet = sourceBook.getSheetAt(1);

		XSSFCellStyle cellStyle2 = sourceBook.createCellStyle();
		cellStyle2.setDataFormat(HSSFDataFormat.getBuiltinFormat("0.00"));
		XSSFCellStyle cellStyle = sourceBook.createCellStyle();
		XSSFDataFormat format = sourceBook.createDataFormat();
		cellStyle.setDataFormat(format.getFormat("#,#0.0000"));

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");

		for(int i = 0; i < 738; i ++) {
			XSSFRow sourceRow = sourceSheet.getRow(i + 1);
			for(int j = 1; j <= 9; j ++) {
				XSSFRow targetRow = resultSheet.createRow(i * 9 + j);
				targetRow.createCell(0).setCellValue(i + 1);
				if (j == 1) {
					for (int k = 0; k < 5; k ++) {
						try {
							if(k == 2) {
								String str = simpleDateFormat.format(sourceRow.getCell(k).getDateCellValue());
								targetRow.createCell(k + 1).setCellValue(str);
							}else {
								String str = sourceRow.getCell(k).getStringCellValue();
								targetRow.createCell(k + 1).setCellValue(str);
							}
						}catch (Exception e) {
							System.out.println(i + " " + j + " " + k);
						}
					}
				}
				for(int k = 0; k < 16; k ++) {
					if(k == 6) {
						String d = sourceRow.getCell(4 + 9 * k + j).getStringCellValue();
						targetRow.createCell(6 + k).setCellValue(d);
						targetRow.getCell(6 + k).setCellStyle(cellStyle);
					}else {
						Double d = sourceRow.getCell(4 + 9 * k + j).getNumericCellValue();
						if(d > 0 || d < 0) {
							targetRow.createCell(6 + k).setCellValue(d);
							targetRow.getCell(6 + k).setCellStyle(cellStyle);
						}
					}
				}
			}
		}
		FileOutputStream excelFileOutPutStream = new FileOutputStream("D:/source.xlsx");
		sourceBook.write(excelFileOutPutStream);
	}
}
