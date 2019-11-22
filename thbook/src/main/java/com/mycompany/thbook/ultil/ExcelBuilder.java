package com.mycompany.thbook.ultil;

import com.mycompany.thbook.entities.AccountEntity;
import com.mycompany.thbook.entities.OrderDetailEntity;
import com.mycompany.thbook.entities.OrderEntity;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.web.servlet.view.document.AbstractExcelView;

public class ExcelBuilder extends AbstractExcelView {

    @Override
    protected void buildExcelDocument(Map<String, Object> model, HSSFWorkbook hssfw,
            HttpServletRequest hsr, HttpServletResponse hsr1) throws Exception {
        List<OrderEntity> orders = (List<OrderEntity>) model.get("orders");

        HSSFSheet sheet = hssfw.createSheet("Orders");
        CellStyle style = hssfw.createCellStyle();
        Font font = hssfw.createFont();
        font.setFontName("Arial");
        style.setFillForegroundColor(HSSFColor.BLUE.index);
        style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        font.setBold(true);
        font.setColor(HSSFColor.WHITE.index);
        style.setFont(font);
        HSSFRow header = sheet.createRow(0);
        header.createCell(0).setCellValue("ID");
        header.getCell(0).setCellStyle(style);
        header.createCell(1).setCellValue("Order Date");
        header.getCell(1).setCellStyle(style);
        header.createCell(2).setCellValue("Status");
        header.getCell(2).setCellStyle(style);
        header.createCell(3).setCellValue("Username");
        header.getCell(3).setCellStyle(style);
        header.createCell(4).setCellValue("Full name");
        header.getCell(4).setCellStyle(style);
        header.createCell(5).setCellValue("Email");
        header.getCell(5).setCellStyle(style);
        header.createCell(6).setCellValue("Phone");
        header.getCell(6).setCellStyle(style);
        header.createCell(7).setCellValue("Address");
        header.getCell(7).setCellStyle(style);
        header.createCell(8).setCellValue("Product");
        header.getCell(8).setCellStyle(style);
        header.createCell(9).setCellValue("Quantity");
        header.getCell(9).setCellStyle(style);
        header.createCell(10).setCellValue("Price");
        header.getCell(10).setCellStyle(style);
        header.createCell(11).setCellValue("Total Price");
        header.getCell(11).setCellStyle(style);
        header.createCell(12).setCellValue("Total");
        header.getCell(12).setCellStyle(style);

        int row = 1;
        for (OrderEntity order : orders) {
            List<OrderDetailEntity> orderDetails = order.getOrderDetails();
            int rowHigh = row + orderDetails.size() - 1;
            HSSFRow aRow = sheet.createRow(row);
            if (orderDetails.size() > 1) {
                sheet.addMergedRegion(new CellRangeAddress(row, rowHigh, 0, 0));
                sheet.addMergedRegion(new CellRangeAddress(row, rowHigh, 1, 1));
                sheet.addMergedRegion(new CellRangeAddress(row, rowHigh, 2, 2));
                sheet.addMergedRegion(new CellRangeAddress(row, rowHigh, 3, 3));
                sheet.addMergedRegion(new CellRangeAddress(row, rowHigh, 4, 4));
                sheet.addMergedRegion(new CellRangeAddress(row, rowHigh, 5, 5));
                sheet.addMergedRegion(new CellRangeAddress(row, rowHigh, 6, 6));
                sheet.addMergedRegion(new CellRangeAddress(row, rowHigh, 7, 7));
                sheet.addMergedRegion(new CellRangeAddress(row, rowHigh, 12, 12));
            }

            aRow.createCell(0).setCellValue(order.getId());
            aRow.createCell(1).setCellValue(StringUltil.fromDateToUS(order.getOrderDate()));
            aRow.createCell(2).setCellValue(order.getStatus().name());
//           // AccountEntity account = order.();
//            if(account==null){
//                aRow.createCell(3).setCellValue("");
//            }else{
//                aRow.createCell(3).setCellValue(account.getUsername());
//            }
//            aRow.createCell(12).setCellValue(order.getTotalPrice());

            int sRows = row;
            for (OrderDetailEntity od : orderDetails) {
                HSSFRow aRowN = sheet.getRow(sRows);
                if (aRowN == null) {
                    aRowN = sheet.createRow(sRows);
                }

                aRowN.createCell(8).setCellValue(od.getProduct().getName());
                
                aRowN.createCell(9).setCellValue(od.getQuantity());
                aRowN.createCell(10).setCellValue(od.getProduct().getPrice());
                aRowN.createCell(11).setCellValue(od.getTotal());
                sRows++;
            }
            row = rowHigh + 1;
        }
    }
}
