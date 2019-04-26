package com.university.chie.util;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.imageio.ImageIO;

import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Service;

@Service
public class PictureUpload {

	public String pictureUpload(String strImg, String loginId) {
		
		try {
			  String uploadpath="D:\\FTP\\Face\\";

			  String fullpath="";

			  String[] strParts=strImg.split(",");

			  String rstStrImg=strParts[1];  //,로 구분하여 뒷 부분 이미지 데이터를 임시저장

			  SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_hhmmss"); 

			  String filenm=sdf.format(new Date()).toString()+loginId+".png";

			  BufferedImage image=null;

			  byte[] byteImg;

			  byteImg = Base64.decodeBase64(rstStrImg);
			  //아파치 common을 이용해 사진을 디코딩한다.

			  ByteArrayInputStream bis= new ByteArrayInputStream(byteImg);

			  image= ImageIO.read(bis);   //BufferedImage형식으로 변환후 저장

			  bis.close();

			  fullpath=uploadpath+filenm;

			  File folderObj= new File(uploadpath);

			  if( !folderObj.isDirectory() ) folderObj.mkdir();

			  File outputFile= new File(fullpath);  //파일객체 생성

			  if( outputFile.exists() ) outputFile.delete();

			  ImageIO.write(image, "png", outputFile); //서버에 파일로 저장	  
			  
			  return filenm;
		} catch (Exception e) {
			return null;
		}


	}
}
