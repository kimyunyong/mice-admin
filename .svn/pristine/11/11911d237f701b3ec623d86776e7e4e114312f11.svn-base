package com.mice.common.image;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;

import net.coobird.thumbnailator.Thumbnails;


public class Thumbnail {
	public static String generateThumbnail(String path, String file_name, String file_ext, int width, int height) throws Exception{
		
		try
		{
			//썸네일 가로사이즈
			int thumbnail_width = width;
			//썸네일 세로사이즈
			int thumbnail_height = height;
			//원본이미지파일의 경로+파일명
			File origin_file_name = new File(path + file_name + "." +  file_ext);
			//생성할 썸네일파일의 경로+썸네일파일명
			File thumb_file_name = new File(path + file_name + "." + width + "." + height + ".thumb." + file_ext );
			BufferedImage buffer_original_image = ImageIO.read(origin_file_name);
			BufferedImage buffer_thumbnail_image = new BufferedImage(thumbnail_width, thumbnail_height, BufferedImage.TYPE_3BYTE_BGR);
			Graphics2D graphic = buffer_thumbnail_image.createGraphics();
			graphic.drawImage(buffer_original_image, 0, 0, thumbnail_width, thumbnail_height, null);
			ImageIO.write(buffer_thumbnail_image, file_ext, thumb_file_name);
		}catch(Exception ex){
			//썸네일 가로사이즈
			//copy(path + file_name + "." +  file_ext, path + file_name + "." + width + "." + height + ".thumb." + file_ext);
			try
			{
				createThumbnail(path + file_name + "." +  file_ext, path + file_name + "." + width + "." + height + ".thumb." + file_ext, width, height);
			}catch(Exception exx){
				copy(path + file_name + "." +  file_ext, path + file_name + "." + width + "." + height + ".thumb." + file_ext);
			}
		}
		return file_name + "." +  width + "." + height + ".thumb";
	}
	
	private static void createThumbnail(String originalPath, String thumbnailPath, int width, int height) throws Exception{
		Thumbnails.of(new File(originalPath))
        .size(width, height)
        .toFile(new File(thumbnailPath));
	}
	
	private static void copy(String source, String target) {
		  //복사 대상이 되는 파일 생성 
		  File sourceFile = new File( source );
		   
		  //스트림 선언 
		  FileInputStream inputStream = null;
		  FileOutputStream outputStream = null;
		   
		  try {
		   //스트림 생성
		   inputStream = new FileInputStream(sourceFile);
		   outputStream = new FileOutputStream(target);
		    
		   int bytesRead = 0;
		   //인풋스트림을 아웃픗스트림에 쓰기
		   byte[] buffer = new byte[1024];   
		   while ((bytesRead = inputStream.read(buffer, 0, 1024)) != -1) {
		    outputStream.write(buffer, 0, bytesRead);
		   }
		    
		  } catch (Exception e) {
		   e.printStackTrace();
		  }finally{
		   //자원 해제
		   try{
		    outputStream.close();
		   }catch(IOException ioe){}
		   try{
		    inputStream.close();
		   }catch(IOException ioe){}
		  }
	  }

}
