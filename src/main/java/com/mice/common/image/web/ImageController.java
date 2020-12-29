package com.mice.common.image.web;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovResourceCloseHelper;

@Controller
public class ImageController {

    @Resource(name = "EgovFileMngService")
    private EgovFileMngService fileService;
    
    
    @RequestMapping("/com/image/image_info.do")
    public void imageInfo(@RequestParam("name") String file_name, @RequestParam("ext") String file_ext,
    		HttpServletResponse response) throws Exception {

		File file = null;
		FileInputStream fis = null;

		BufferedInputStream in = null;
		ByteArrayOutputStream bStream = null;

		try {
			file_name = file_name.replace("../", "");
		    file = new File(EgovProperties.getProperty("Globals.fileStorePath") + file_name + "." + file_ext);
		    fis = new FileInputStream(file);

		    in = new BufferedInputStream(fis);
		    bStream = new ByteArrayOutputStream();

		    int imgByte;
		    while ((imgByte = in.read()) != -1) {
		    	bStream.write(imgByte);
		    }

			String type = "";

			if (file_ext != null && !"".equals(file_ext)) {
			    if ("jpg".equals(file_ext.toLowerCase())) {
				type = "image/jpeg";
			    } else {
			    	type = "image/" + file_ext.toLowerCase();
			    }

			} else {
				
			}

			response.setHeader("Content-Type", type);
			response.setContentLength(bStream.size());

			bStream.writeTo(response.getOutputStream());

			response.getOutputStream().flush();
			response.getOutputStream().close();

		} finally {
			EgovResourceCloseHelper.close(bStream, in, fis);
		}

    }
}
