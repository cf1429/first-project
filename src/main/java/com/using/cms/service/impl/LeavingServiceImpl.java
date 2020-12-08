package com.using.cms.service.impl;

import com.github.pagehelper.PageHelper;
import com.using.cms.bean.Leaving;
import com.using.cms.dao.LeavingDao;
import com.using.cms.service.LeavingService;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.thymeleaf.util.StringUtils;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;

@Service
@Transactional
public class LeavingServiceImpl implements LeavingService {

    @Autowired
    private LeavingDao leavingDao;

    @Override
    public List<Leaving> selectAll(Map<String,Object> param) {
        if(null != param.get("pageNum") && !StringUtils.isEmpty(param.get("pageNum").toString()) &&
                null!=param.get("pageSize") && !StringUtils.isEmpty(param.get("pageSize").toString())){
            PageHelper.startPage(Integer.parseInt(param.get("pageNum").toString()), Integer.parseInt(param.get("pageSize").toString()));
        }
        return leavingDao.selectAll();
    }

    @Override
    public int insert(Leaving leaving) {
        return leavingDao.insert(leaving);
    }

    @Override
    public byte[] exportLeaving(HttpServletResponse response) throws IOException {
        List<Leaving> leavings = leavingDao.selectAll();
        List<Map<String, Object>> excelList = new ArrayList<>();
        for (Leaving leaving : leavings) {
            Map<String, Object> excelMap = new LinkedHashMap<>();
            excelMap.put("姓名", leaving.getName());
            excelMap.put("手机号", leaving.getPhone());
            excelMap.put("留言内容", leaving.getContent());
            excelList.add(excelMap);
        }
        List<String> list = new ArrayList<>();
        Map<String,Object> map = excelList.get(0);
        for (String key : map.keySet()) {
            list.add(key);
        }
       HSSFWorkbook workbook = new HSSFWorkbook();// 创建一个Excel文件
        Sheet sheet = workbook.createSheet("留言");

        //补充表头
        //设置表头的数据格式为文本居中 加粗
        CellStyle titleStyle =workbook.createCellStyle();
        DataFormat format = workbook.createDataFormat();
        titleStyle.setDataFormat(format.getFormat("@"));
        //titleStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        Font font = workbook.createFont();
        font.setBold(true);
        titleStyle.setFont(font);
        Row row = sheet.createRow(0);
        Map<String,Integer> titleMap =  new HashMap<>();
        for(int i=0;i<list.size();i++){
            Cell cell=row.createCell(i);
            cell.setCellValue(list.get(i));
            cell.setCellStyle(titleStyle);
            // 根据标题计算宽度
            int v = 2;
            if(i == 0) v = 4;
            sheet.setColumnWidth(i, list.get(i).getBytes().length * v * 256);
            titleMap.put(cell.getStringCellValue(), i);
        }

        //填充数据
        //设置内容的数据格式为文本居中
        CellStyle cellStyle = workbook.createCellStyle();
        cellStyle.setDataFormat(format.getFormat("@"));
        //cellStyle.setAlignment(HorizontalAlignment.CENTER);
        //cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        for(int i=0;i<excelList.size();i++) {
            Map<String,Object> dataMap = excelList.get(i);
            Row data_row = sheet.createRow(i+1);
            for (Map.Entry<String, Object> entry : dataMap.entrySet()) {
                Cell cell = data_row.createCell(titleMap.get(entry.getKey()));
                if(entry.getValue() != null)
                    cell.setCellValue(entry.getValue().toString());
                else
                    cell.setCellValue("");
//				sheet.autoSizeColumn(titleMap.get(entry.getKey()));
                //titleStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
                cell.setCellStyle(cellStyle);
            }
        }

        byte [] bookByteAry = null;
        //临时缓冲区
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        //创建临时文件
        workbook.write(out);
        bookByteAry = out.toByteArray();
        workbook.close();
        return bookByteAry;
    }

    private BufferedOutputStream getBufferedOutputStream(String fileName, HttpServletResponse response) throws Exception {
        response.setContentType("application/x-msdownload");
        response.setHeader("Content-Disposition", "attachment;filename="
                + new String(fileName.getBytes("gb2312"), "ISO8859-1"));
        return new BufferedOutputStream(response.getOutputStream());
    }
}
