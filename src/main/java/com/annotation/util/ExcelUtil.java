package com.annotation.util;

import com.annotation.model.entity.ClassifyData;
import com.annotation.model.entity.PairingData;
import com.annotation.model.entity.SortingData;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * Created by twinkleStar on 2019/4/16.
 */
@Component
public class ExcelUtil {

    public HSSFWorkbook getPairingExcel(String sheetName, String []title, List<PairingData> pairingDataList, HSSFWorkbook wb){

        // 第一步，创建一个HSSFWorkbook，对应一个Excel文件
        if(wb == null){
            wb = new HSSFWorkbook();
        }

        // 第二步，在workbook中添加一个sheet,对应Excel文件中的sheet
        HSSFSheet sheet = wb.createSheet(sheetName);


        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制
        HSSFRow row = sheet.createRow(0);

        // 第四步，创建单元格，并设置值表头 设置表头居中
        HSSFCellStyle style = wb.createCellStyle();
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式


        //声明列对象
        HSSFCell cell = null;

        //创建标题
        for(int i=0;i<title.length;i++){
            cell = row.createCell(i);
            cell.setCellValue(title[i]);
            cell.setCellStyle(style);
        }


        //设置单元格样式
        HSSFCellStyle cellStyle=wb.createCellStyle();
        cellStyle.setWrapText(true);
        short align1=1;//左对齐
        short align2=1;//居中
        cellStyle.setAlignment(align1);//水平样式
        cellStyle.setVerticalAlignment(align2);//垂直样式


        //创建内容
        int rowIndex=1;
        for (int i = 0; i < pairingDataList.size(); i++) {

            PairingData obj = pairingDataList.get(i);
            List<Map<String,Object>> pairingContentList=obj.getPairingContent();

            int firstRow=rowIndex;
            HSSFCell cell0 = null;
            HSSFCell cell1 = null;
            HSSFCell cell2 = null;
            HSSFCell cell3 = null;
            HSSFCell cell4 = null;

            if(pairingContentList.size()<1){

            }else{
                for(int j=0;j<pairingContentList.size();j++){
                    row = sheet.createRow(rowIndex);//创建一行
                    Map<String,Object> pairingContent=pairingContentList.get(j);

                    cell0 = row.createCell(0);
                    cell0.setCellValue(obj.getUserName());;
                    cell0.setCellStyle(cellStyle);

                    cell1 = row.createCell(1);
                    cell1.setCellValue(obj.getDocName());
                    cell1.setCellStyle(cellStyle);

                    cell2 = row.createCell(2);
                    cell2.setCellValue(obj.getParaIndex());
                    cell2.setCellStyle(cellStyle);

                    cell3 = row.createCell(3);
                    cell3.setCellValue(String.valueOf(pairingContent.get("a_litemcontent")));
                    cell3.setCellStyle(cellStyle);

                    cell4 = row.createCell(4);
                    cell4.setCellValue(String.valueOf(pairingContent.get("b_litemcontent")));
                    cell4.setCellStyle(cellStyle);
                    //row.createCell(4).setCellValue(String.valueOf(pairingContent.get("b_litemcontent")));

                    rowIndex=rowIndex+1;


                }
                CellRangeAddress region = new CellRangeAddress(firstRow, rowIndex-1, 0, 0);
                sheet.addMergedRegion(region);
                CellRangeAddress region2 = new CellRangeAddress(firstRow, rowIndex-1, 1, 1);
                sheet.addMergedRegion(region2);
                CellRangeAddress region3 = new CellRangeAddress(firstRow, rowIndex-1, 2, 2);
                sheet.addMergedRegion(region3);

            }

        }


        sheet.setColumnWidth(3, 60 * 256);  //设置列宽，20个字符宽
        sheet.setColumnWidth(4, 60 * 256);  //设置列宽，20个字符宽
        return wb;
    }


    //文本分类类型数据导出
    public HSSFWorkbook getClassifyExcel(String sheetName, String []title, List<ClassifyData> classifyDataList, HSSFWorkbook wb){

        // 第一步，创建一个HSSFWorkbook，对应一个Excel文件
        if(wb == null){
            wb = new HSSFWorkbook();
        }

        // 第二步，在workbook中添加一个sheet,对应Excel文件中的sheet
        HSSFSheet sheet = wb.createSheet(sheetName);


        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制
        HSSFRow row = sheet.createRow(0);

        // 第四步，创建单元格，并设置值表头 设置表头居中
        HSSFCellStyle style = wb.createCellStyle();
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式


        //声明列对象
        HSSFCell cell = null;

        //创建标题
        for(int i=0;i<title.length;i++){
            cell = row.createCell(i);
            cell.setCellValue(title[i]);
            cell.setCellStyle(style);
        }


        //设置单元格样式
        HSSFCellStyle cellStyle=wb.createCellStyle();
        cellStyle.setWrapText(true);
        short align1=1;//左对齐
        short align2=1;//居中
        cellStyle.setAlignment(align1);//水平样式
        cellStyle.setVerticalAlignment(align2);//垂直样式

        //创建内容
        int rowIndex=1;
        for (int i = 0; i < classifyDataList.size(); i++) {

            ClassifyData obj = classifyDataList.get(i);
            List<Map<String,Object>> classifyContentList=obj.getClassifyContent();

            int firstRow=rowIndex;
            HSSFCell cell0 = null;
            HSSFCell cell1 = null;
            HSSFCell cell2 = null;
            HSSFCell cell3 = null;
            HSSFCell cell4 = null;
            for(int j=0;j<classifyContentList.size();j++){
                row = sheet.createRow(rowIndex);//创建一行
                Map<String,Object> classifyContent=classifyContentList.get(j);

                cell0 = row.createCell(0);
                cell0.setCellValue(obj.getDocName());;
                cell0.setCellStyle(cellStyle);

                cell1 = row.createCell(1);
                cell1.setCellValue(obj.getParaIndex());
                cell1.setCellStyle(cellStyle);

                cell2 = row.createCell(2);
                cell2.setCellValue(obj.getParaContent());
                cell2.setCellStyle(cellStyle);

                cell3 = row.createCell(3);
                cell3.setCellValue(String.valueOf(classifyContent.get("labelName")));
                cell3.setCellStyle(cellStyle);

                cell4 = row.createCell(4);
                cell4.setCellValue(String.valueOf(classifyContent.get("labelNum")));
                cell4.setCellStyle(cellStyle);
                //row.createCell(4).setCellValue(String.valueOf(pairingContent.get("b_litemcontent")));
                rowIndex=rowIndex+1;

            }
            CellRangeAddress region = new CellRangeAddress(firstRow, rowIndex-1, 0, 0);
            sheet.addMergedRegion(region);
            CellRangeAddress region2 = new CellRangeAddress(firstRow, rowIndex-1, 1, 1);
            sheet.addMergedRegion(region2);
            CellRangeAddress region3 = new CellRangeAddress(firstRow, rowIndex-1, 2, 2);
            sheet.addMergedRegion(region3);

        }


        sheet.setColumnWidth(2, 60 * 256);  //设置列宽，20个字符宽
        //sheet.setColumnWidth(4, 60 * 256);  //设置列宽，20个字符宽
        return wb;
    }


    public HSSFWorkbook getSortingExcel(String sheetName, String []title, List<SortingData> sortingDataList, HSSFWorkbook wb){

        // 第一步，创建一个HSSFWorkbook，对应一个Excel文件
        if(wb == null){
            wb = new HSSFWorkbook();
        }

        // 第二步，在workbook中添加一个sheet,对应Excel文件中的sheet
        HSSFSheet sheet = wb.createSheet(sheetName);

        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制
        HSSFRow row = sheet.createRow(0);

        // 第四步，创建单元格，并设置值表头 设置表头居中
        HSSFCellStyle style = wb.createCellStyle();
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式


        //声明列对象
        HSSFCell cell = null;

        //创建标题
        for(int i=0;i<title.length;i++){
            cell = row.createCell(i);
            cell.setCellValue(title[i]);
            cell.setCellStyle(style);
        }


        //设置单元格样式
        HSSFCellStyle cellStyle=wb.createCellStyle();
        cellStyle.setWrapText(true);
        short align1=1;//左对齐
        short align2=1;//居中
        cellStyle.setAlignment(align1);//水平样式
        cellStyle.setVerticalAlignment(align2);//垂直样式

        //创建内容
        int rowIndex=1;


        for (int i = 0; i < sortingDataList.size(); i++) {

            SortingData obj = sortingDataList.get(i);
            int firstRow=rowIndex;
            List<Map<String,Object>> sortingContentList=obj.getSortingContent();
            row = sheet.createRow(rowIndex);//创建一行

            HSSFCell cell0 = null;
            HSSFCell cell1 = null;
            HSSFCell cell2 = null;
            HSSFCell cell3 = null;
            HSSFCell cell4 = null;
            HSSFCell cell5 = null;


            if(sortingContentList.size()<1){

            }else{
                for(int j=0;j<sortingContentList.size();j++){
                    row = sheet.createRow(rowIndex);//创建一行
                    Map<String,Object> sortingContent=sortingContentList.get(j);

                    cell0 = row.createCell(0);
                    cell0.setCellValue(obj.getDocName());;
                    cell0.setCellStyle(cellStyle);

                    cell1 = row.createCell(1);
                    cell1.setCellValue(obj.getInstanceIndex());
                    cell1.setCellStyle(cellStyle);

                    cell2 = row.createCell(2);
                    cell2.setCellValue(obj.getItemContent());
                    cell2.setCellStyle(cellStyle);

                    cell3 = row.createCell(3);
                    cell3.setCellValue(obj.getPreIndex());
                    cell3.setCellStyle(cellStyle);

                    cell4 = row.createCell(4);
                    cell4.setCellValue(String.valueOf(sortingContent.get("newIndex")));
                    cell4.setCellStyle(cellStyle);

                    cell5 = row.createCell(5);
                    cell5.setCellValue(String.valueOf(sortingContent.get("newNum")));
                    cell5.setCellStyle(cellStyle);

                    rowIndex=rowIndex+1;

                }
                CellRangeAddress region = new CellRangeAddress(firstRow, rowIndex-1, 0, 0);
                sheet.addMergedRegion(region);
                CellRangeAddress region2 = new CellRangeAddress(firstRow, rowIndex-1, 1, 1);
                sheet.addMergedRegion(region2);
                CellRangeAddress region3 = new CellRangeAddress(firstRow, rowIndex-1, 2, 2);
                sheet.addMergedRegion(region3);
                CellRangeAddress region4 = new CellRangeAddress(firstRow, rowIndex-1, 3, 3);
                sheet.addMergedRegion(region4);

            }



        }


        sheet.setColumnWidth(2, 60 * 256);  //设置列宽，20个字符宽
        //sheet.setColumnWidth(4, 60 * 256);  //设置列宽，20个字符宽
        return wb;
    }



}
