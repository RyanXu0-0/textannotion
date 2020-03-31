package com.annotation.util;

import com.annotation.model.entity.*;
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

            if(pairingContentList.size()<1){

            }else{
                for(int j=0;j<pairingContentList.size();j++){
                    row = sheet.createRow(rowIndex);//创建一行
                    Map<String,Object> pairingContent=pairingContentList.get(j);

                    cell0 = row.createCell(0);
                    cell0.setCellValue(obj.getDocName());;
                    cell0.setCellStyle(cellStyle);

                    cell1 = row.createCell(1);
                    cell1.setCellValue(obj.getParaIndex());
                    cell1.setCellStyle(cellStyle);

                    cell2 = row.createCell(2);
                    cell2.setCellValue(String.valueOf(pairingContent.get("a_litemcontent")));
                    cell2.setCellStyle(cellStyle);

                    cell3 = row.createCell(3);
                    cell3.setCellValue(String.valueOf(pairingContent.get("b_litemcontent")));
                    cell3.setCellStyle(cellStyle);

                    rowIndex=rowIndex+1;


                }
                CellRangeAddress region = new CellRangeAddress(firstRow, rowIndex-1, 0, 0);
                sheet.addMergedRegion(region);
                CellRangeAddress region2 = new CellRangeAddress(firstRow, rowIndex-1, 1, 1);
                sheet.addMergedRegion(region2);
//                CellRangeAddress region3 = new CellRangeAddress(firstRow, rowIndex-1, 2, 2);
//                sheet.addMergedRegion(region3);

            }

        }


        sheet.setColumnWidth(2, 60 * 256);  //设置列宽，20个字符宽
        sheet.setColumnWidth(3, 60 * 256);  //设置列宽，20个字符宽
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

        sheet.setDefaultColumnWidth(100*256);
        sheet.setDefaultRowHeight((short)(30*20));

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
        //cellStyle.setWrapText(true);
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
                    cell2.setCellValue(String.valueOf(sortingContent.get("itemId")));
                    cell2.setCellStyle(cellStyle);

                    cell3 = row.createCell(3);
                    cell3.setCellValue(String.valueOf(sortingContent.get("preIndex")));
                    cell3.setCellStyle(cellStyle);

                    cell4 = row.createCell(4);
                    cell4.setCellValue(String.valueOf(sortingContent.get("itemContent")));
                    cell4.setCellStyle(cellStyle);

                    cell5 = row.createCell(5);
                    cell5.setCellValue(String.valueOf(sortingContent.get("newIndex")));
                    cell5.setCellStyle(cellStyle);

                    rowIndex=rowIndex+1;

                }
                CellRangeAddress region = new CellRangeAddress(firstRow, rowIndex-1, 0, 0);
                sheet.addMergedRegion(region);
                CellRangeAddress region2 = new CellRangeAddress(firstRow, rowIndex-1, 1, 1);
                sheet.addMergedRegion(region2);
                CellRangeAddress region3 = new CellRangeAddress(firstRow, rowIndex-1, 2, 2);
                sheet.addMergedRegion(region3);
//                CellRangeAddress region4 = new CellRangeAddress(firstRow, rowIndex-1, 3, 3);
//                sheet.addMergedRegion(region4);

            }


        }

        sheet.setColumnWidth(4, 60 * 256);  //设置列宽，20个字符宽
        return wb;
    }


    public HSSFWorkbook getRelationExcel(String sheetName, String []title, List<RelationData> relationDataList, HSSFWorkbook wb){

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

        sheet.setDefaultColumnWidth(100*256);
        sheet.setDefaultRowHeight((short)(30*20));

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
        //cellStyle.setWrapText(true);
        short align1=1;//左对齐
        short align2=1;//居中
        cellStyle.setAlignment(align1);//水平样式
        cellStyle.setVerticalAlignment(align2);//垂直样式

        //创建内容
        int rowIndex=1;

        for (int i = 0; i < relationDataList.size(); i++) {

            RelationData obj = relationDataList.get(i);
            int firstRow=rowIndex;
            List<Map<String,Object>> relationContentList=obj.getRelationContent();
            List<Map<String,Object>> relationLabel = obj.getRelationLabel();
            row = sheet.createRow(rowIndex);//创建一行

            HSSFCell cell0 = null;
            HSSFCell cell1 = null;
            HSSFCell cell2 = null;
            HSSFCell cell3 = null;
            HSSFCell cell4 = null;
            HSSFCell cell5 = null;



            for(int j=0;j<relationLabel.size();j++){
                row = sheet.createRow(rowIndex);//创建一行
                Map<String,Object> relationContent=relationLabel.get(j);
                Map<String,Object> item1Content = relationContentList.get(0);
                Map<String,Object> item2Content = relationContentList.get(1);

                cell0 = row.createCell(0);
                cell0.setCellValue(obj.getDocName());;
                cell0.setCellStyle(cellStyle);

                cell1 = row.createCell(1);
                cell1.setCellValue(obj.getInstanceIndex());
                cell1.setCellStyle(cellStyle);


                cell2 = row.createCell(2);
                cell2.setCellValue(String.valueOf(item1Content.get("itemContent")));
                cell2.setCellStyle(cellStyle);

                cell3 = row.createCell(3);
                cell3.setCellValue(String.valueOf(item2Content.get("itemContent")));
                cell3.setCellStyle(cellStyle);

                cell4 = row.createCell(4);
                cell4.setCellValue(String.valueOf(relationContent.get("labeltype")));
                cell4.setCellStyle(cellStyle);

                cell5 = row.createCell(5);
                cell5.setCellValue(String.valueOf(relationContent.get("label")));
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




        sheet.setColumnWidth(4, 60 * 256);  //设置列宽，20个字符宽
        return wb;
    }

    public HSSFWorkbook getExtractionExcel(String sheetName, String []title, List<ExtractionData> extrationDataList, HSSFWorkbook wb){

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

        sheet.setDefaultColumnWidth(100*256);
        sheet.setDefaultRowHeight((short)(30*20));

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
        //cellStyle.setWrapText(true);
        short align1=1;//左对齐
        short align2=1;//居中
        cellStyle.setAlignment(align1);//水平样式
        cellStyle.setVerticalAlignment(align2);//垂直样式

        //创建内容
        int rowIndex=1;

        for (int i = 0; i < extrationDataList.size(); i++) {

            ExtractionData obj = extrationDataList.get(i);
            int firstRow=rowIndex;
            List<Map<String,Object>> entityContentList=obj.getEntityList();
            List<Map<String,Object>> relationContentList=obj.getRelationList();
            row = sheet.createRow(rowIndex);//创建一行

            HSSFCell cell0 = null;
            HSSFCell cell1 = null;
            HSSFCell cell2 = null;
            HSSFCell cell3 = null;
            HSSFCell cell4 = null;
            HSSFCell cell5 = null;
            HSSFCell cell6 = null;
            HSSFCell cell7 = null;
            HSSFCell cell8 = null;

// 写入实体信息

            for(int j=0;j<entityContentList.size();j++){
                row = sheet.createRow(rowIndex);//创建一行
                Map<String,Object> entityContent=entityContentList.get(j);

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
                //E代表实体
                cell3.setCellValue("E");
                cell3.setCellStyle(cellStyle);

                cell4 = row.createCell(4);
                cell4.setCellValue(String.valueOf(entityContent.get("entityId")));
                cell4.setCellStyle(cellStyle);

                cell5 = row.createCell(5);
                cell5.setCellValue(String.valueOf(entityContent.get("entityLabel")));
                cell5.setCellStyle(cellStyle);

                cell6 = row.createCell(6);
                cell6.setCellValue(String.valueOf(entityContent.get("startIndex")));
                cell6.setCellStyle(cellStyle);

                cell7 = row.createCell(7);
                cell7.setCellValue(String.valueOf(entityContent.get("endIndex")));
                cell7.setCellStyle(cellStyle);

                cell8 = row.createCell(8);
                cell8.setCellValue(String.valueOf(entityContent.get("entity")));
                cell8.setCellStyle(cellStyle);
                rowIndex=rowIndex+1;
            }

            //写入关系
            for(int j=0;j<relationContentList.size();j++){
                row = sheet.createRow(rowIndex);//创建一行
                Map<String,Object> relationContent=relationContentList.get(j);

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
                //R代表是关系
                cell3.setCellValue("R");
                cell3.setCellStyle(cellStyle);

                cell4 = row.createCell(4);
                cell4.setCellValue(String.valueOf(relationContent.get("relationLabel")));
                cell4.setCellStyle(cellStyle);

                cell5 = row.createCell(5);
                cell5.setCellValue(String.valueOf(relationContent.get("headEntity")));
                cell5.setCellStyle(cellStyle);

                cell6 = row.createCell(6);
                cell6.setCellValue(String.valueOf(relationContent.get("tailEntity")));
                cell6.setCellStyle(cellStyle);
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
        return wb;
    }

}
