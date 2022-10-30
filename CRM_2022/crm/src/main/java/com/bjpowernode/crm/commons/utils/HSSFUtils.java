package com.bjpowernode.crm.commons.utils;

import org.apache.poi.hssf.usermodel.HSSFCell;

public class HSSFUtils {
    public static String getCellValueForStr(HSSFCell cell){
        if(cell.getCellType() == HSSFCell.CELL_TYPE_STRING){
            return cell.getStringCellValue() + "";
        }else if(cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC){
            return cell.getNumericCellValue() + "";
        }else if(cell.getCellType() == HSSFCell.CELL_TYPE_BOOLEAN){
            return cell.getBooleanCellValue() + "";
        }else if (cell.getCellType() == HSSFCell.CELL_TYPE_FORMULA){
            return cell.getCellFormula() + "";
        }else {
            return "";
        }
    }
}
