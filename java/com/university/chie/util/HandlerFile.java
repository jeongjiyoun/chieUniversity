package com.university.chie.util;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class HandlerFile {
	
	private MultipartHttpServletRequest multipartRequest;
	private String filePath;
	private ArrayList<HashMap<String, String>> fileNames;
	private String org_Name;
	private HttpServletResponse resp;
	private byte[] fileByte;
	
	// upload
	public HandlerFile(MultipartHttpServletRequest multipartRequest, String filePath) {
		this.multipartRequest = multipartRequest;
		this.filePath = filePath;
		fileNames = new ArrayList<HashMap<String, String>>();
	}
	// down
	public HandlerFile(HttpServletResponse resp, String filePath, String name, String org_Name) {
		this.resp = resp;
		this.filePath = filePath + "/" + name;
		this.org_Name = org_Name;
	}
	// delete
	public HandlerFile(String filePath, String name) {
		this.filePath = filePath + "/" + name;
	}	
	
	// upload
	public ArrayList<HashMap<String, String>> getUploadFileName() {
		upload();
		return fileNames;
	}
	// down
	public byte[] getDownloadFileByte() {
		download();
		return fileByte;
	}
	// delete
	public void deleteFileExecute() {
		File file = new File(filePath);
		if(file.exists()) {
			file.delete();
		}
	}
	
	// 
	private void upload() {
		Iterator<String> itr = multipartRequest.getFileNames();
		
		StringBuffer sb = null;
		while (itr.hasNext()) { //
			MultipartFile mpf = multipartRequest.getFile(itr.next());
			HashMap<String,String> filesN = new HashMap<String,String>();
			sb = new StringBuffer();
			String org_Name = mpf.getOriginalFilename(); //
			String name = sb.append(new SimpleDateFormat("yyyyMMddhhmmss").format(System.currentTimeMillis()))
									.append(UUID.randomUUID().toString())
									.append(org_Name.substring(org_Name.lastIndexOf("."))).toString();
			String fileFullPath = filePath + "/" + name; //
			try {
				//
				mpf.transferTo(new File(fileFullPath));
				filesN.put("org_Name", org_Name);
				filesN.put("name", name);
				fileNames.add(filesN);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	// down
	private void download() {
		try {
			fileByte = FileUtils.readFileToByteArray(new File(filePath));
			resp.setContentType("application/octet-stream");
			resp.setContentLength(fileByte.length);

			resp.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(org_Name, "UTF-8") + "\";");
			resp.setHeader("Content-Transfer-Encoding", "binary");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}