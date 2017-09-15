package com.qianqiulin.ssmDemo.view;

import com.qianqiulin.ssmDemo.pojo.Complaint;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

public class ExcelView extends AbstractExcelView {
    @Override
    protected void buildExcelDocument(Map<String, Object> map, HSSFWorkbook hssfWorkbook, HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {

        List<Complaint> list = (List<Complaint>) map.get("infoList");
        if(list != null && list.size() != 0){
            int len = list.size();
            Sheet sheet = hssfWorkbook.createSheet();
            Row row = sheet.createRow(0);
            Cell cell = row.createCell(0,Cell.CELL_TYPE_STRING);
            cell.setCellValue("营业部");
            cell = row.createCell(1,Cell.CELL_TYPE_STRING);
            cell.setCellValue("地名点");
            cell = row.createCell(2,Cell.CELL_TYPE_STRING);
            cell.setCellValue("经度");
            cell = row.createCell(3,Cell.CELL_TYPE_STRING);
            cell.setCellValue("纬度");
            cell = row.createCell(4,Cell.CELL_TYPE_STRING);
            cell.setCellValue("覆盖用户数");
            cell = row.createCell(5,Cell.CELL_TYPE_STRING);
            cell.setCellValue("目前固话数");
            cell = row.createCell(6,Cell.CELL_TYPE_STRING);
            cell.setCellValue("附近铁塔情况");
            cell = row.createCell(7,Cell.CELL_TYPE_STRING);
            cell.setCellValue("拟定解决方案");
            cell = row.createCell(8,Cell.CELL_TYPE_STRING);
            cell.setCellValue("日期");
            cell = row.createCell(9,Cell.CELL_TYPE_STRING);
            cell.setCellValue("处理最终结果");


            for(int i=0 ;i<len;i++){
                row = sheet.createRow(i+1);
                cell = row.createCell(0,Cell.CELL_TYPE_STRING);
                cell.setCellValue(list.get(i).getYingyebu());
                cell = row.createCell(1,Cell.CELL_TYPE_STRING);
                cell.setCellValue(list.get(i).getDidian());
                cell = row.createCell(2,Cell.CELL_TYPE_STRING);
                cell.setCellValue(list.get(i).getJingdu());
                cell = row.createCell(3,Cell.CELL_TYPE_STRING);
                cell.setCellValue(list.get(i).getWeidu());
                cell = row.createCell(4,Cell.CELL_TYPE_STRING);
                cell.setCellValue(list.get(i).getFugaiyonghushu());
                cell = row.createCell(5,Cell.CELL_TYPE_STRING);
                cell.setCellValue(list.get(i).getGudingdianhuashu());
                cell = row.createCell(5,Cell.CELL_TYPE_STRING);
                cell.setCellValue(list.get(i).getTietaqingkuang());
                cell = row.createCell(7,Cell.CELL_TYPE_STRING);
                cell.setCellValue(list.get(i).getJiejuefangan());
                cell = row.createCell(8,Cell.CELL_TYPE_STRING);
                cell.setCellValue(list.get(i).getDate());
                cell = row.createCell(9,Cell.CELL_TYPE_STRING);
                cell.setCellValue(list.get(i).getJiejuefangan());
            }
        }

        httpServletResponse.setContentType("application/vnd.ms-excel");
        httpServletResponse.setCharacterEncoding("utf-8");
        String filename = URLEncoder.encode("file.xls","utf-8");
        httpServletResponse.setHeader("Content-disposition","attachment;filename=" +filename);
        OutputStream outputStream = httpServletResponse.getOutputStream();
        hssfWorkbook.write(outputStream);
        outputStream.flush();
        outputStream.close();
    }
}
