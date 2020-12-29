package com.mice.common.excel;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.jxls.common.Context;
import org.jxls.util.JxlsHelper;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.mice.crm.service.EventTotalSearchVO;

import egovframework.com.cmm.service.EgovProperties;
import net.sf.jxls.transformer.XLSTransformer;

public class ExcelExportView extends AbstractExcelView {

	@Override
    protected void buildExcelDocument(Map<String, Object> modal, HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.setHeader("Content-Type", "application/octet-stream");
        response.setHeader("Content-Disposition", "attachment; filename="+URLEncoder.encode(modal.get("filename").toString(), "UTF-8").replaceAll("\\+", "%20"));
        OutputStream os = null;
        InputStream is = null;
        try {
            // 엑셀 템플릿 파일이 존재하는 위치 (classpath 하위)
            //is = new ClassPathResource("/excel.xls").getInputStream();
        	
        	is = new java.io.FileInputStream(request.getSession().getServletContext().getRealPath("/")+(String) modal.get("template_path"));
            os = response.getOutputStream();
            Context context = new Context(modal);
            JxlsHelper.getInstance().processTemplate(is, os, context);
            os.flush();

         
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        } finally {
            if(os != null) try { os.close(); } catch (IOException e) { 
            	System.out.println(e.getMessage());
            }
            if(is != null) try { is.close(); } catch (IOException e) {
            	System.out.println(e.getMessage());
            }
        }
        
        
        
        
        
    }
}

