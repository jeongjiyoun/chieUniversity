package com.university.chie.util;

import java.net.URI;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//얼굴 인식 API 로직 Class
@Repository
public class CongnitiveService {


	@Autowired
	PictureUpload pu;

	// API 이용 키
	public static final String subscriptionKey = "3ef52f52cf7840239764456a3f10973d";
	// API 지역 키
	public static final String uriBase = "https://australiaeast.api.cognitive.microsoft.com/face/v1.0/";
	// http 서버를 가동하고 ngrok으로 외부에서 접속 가능하게 하는 기능을  node에서 작동, 변환된 주소를 기입한다.
	private static final String ngrokAddress = "http://6e99d914.ngrok.io";	
	// 생성자
	public CongnitiveService() {
	}
	
	public String getFaceId(String pictureUri) {
		HttpClient httpclient = HttpClients.createDefault();
		String result = "";
		try {
			URIBuilder builder = new URIBuilder(uriBase+"detect?returnFaceId=true");
			// 요청할 파라미터 설정. FaceId만 반환되도록.
			builder.setParameter("returnFaceId", "true");

			// REST API 호출용
			URI uri = builder.build();
			HttpPost request = new HttpPost(uri);

			//반환받을 객체는 json
			request.setHeader("Content-Type", "application/json");
			// Ocp-Apim-Subscription-Key에는 Key값을 넣어준다.
			request.setHeader("Ocp-Apim-Subscription-Key", subscriptionKey);

			// 그림 링크를 Json객체로 변환
			String url = "{\"url\":\"" + pictureUri + "\"}";

			StringEntity reqEntity = new StringEntity(url);
			request.setEntity(reqEntity);
			HttpResponse response = httpclient.execute(request);
			HttpEntity entity = response.getEntity();

			if (entity != null) {

				String jsonString = EntityUtils.toString(entity).trim();
				if (jsonString.charAt(0) == '[') {
					JSONArray jsonArray = new JSONArray(jsonString);
					result = jsonArray.toString(2);
				} else if (jsonString.charAt(0) == '{') {
					JSONObject jsonObject = new JSONObject(jsonString);
					result = jsonObject.toString(2);

				} else {
					result = jsonString;
				}
			}
		}
		catch (Exception e) {
			// 에러 메시지 발생시
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	public String makeIDURL(String loginId) {
		String pictureUri = ngrokAddress + "FTP/Face/origin/" + loginId + ".jpg";
		String imgUri1 = getFaceId(pictureUri);
		return imgUri1;
	}

	public String getIdUrl(String loginId) {
		String pictureUri = ngrokAddress + "FTP/Face/origin/" + loginId + ".jpg";
		return pictureUri;
	}
	
	public String makeCaptureURL(String strImg, String loginId) throws Throwable{
		String fullpath = pu.pictureUpload(strImg,loginId);
		String pictureUri = ngrokAddress + "FTP/Face/" + fullpath;
		String imgUri2 = getFaceId(pictureUri);
		return imgUri2;
	}
	
	public String CaptureURL(String strImg, String certificateName) throws Throwable{
		String fullpath = pu.pictureUpload(strImg,certificateName);
		String pictureUri = ngrokAddress + "FTP/Face/" + fullpath;
		return pictureUri;
	}

	public boolean checkIdentify(String imgUri1, String imgUri2) {
		boolean result = stream(imgUri1,imgUri2);
		return result;
	}
	
	// 주요 스트림 : 사진 uri를 두개 받아, 두 얼굴의 일치도를 측정한다.
	public boolean stream(String imgUri1, String imgUri2) {
		// 각각 얼굴 FaceId 반환
		String imgId1 = getFaceId(imgUri1);
		String imgId2 = getFaceId(imgUri2);

		return checkStream(imgId1, imgId2);
	}
	
	
	// 본인 일치여부 반환
	public boolean checkStream(String imgId1, String imgId2) {
		String temp1 = cutString(imgId1);
		String temp2 = cutString(imgId2);		
		String text = congnitive(temp1, temp2);
		System.out.println(text);
		String temp3 = text.split(":")[1];
		String temp4 = temp3.substring(0, 4);
		System.out.println(temp4);
		if (temp4.equals("true")) {
			return true;
		} else {
			return false;
		}
	}

	// FaceId 두개를 받아 두 얼굴이 일치하는지 분석하고 돌려준다.
	public String congnitive(String faceId1, String faceId2) {
		HttpClient httpclient = HttpClients.createDefault();
		String result = null;
		try {
			URIBuilder builder = new URIBuilder(uriBase+"verify");

			URI uri = builder.build();
			HttpPost request = new HttpPost(uri);
			request.setHeader("Content-Type", "application/json");
			request.setHeader("Ocp-Apim-Subscription-Key", subscriptionKey);

			String url = "{\r\n" + "    \"faceId1\": \"" + faceId1 + "\",\r\n" + "    \"faceId2\": \"" + faceId2 + "\"\r\n"
					+ "}";

			StringEntity reqEntity = new StringEntity(url);
			request.setEntity(reqEntity);
			HttpResponse response = httpclient.execute(request);
			HttpEntity entity = response.getEntity();

			if (entity != null) {
				result = EntityUtils.toString(entity);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	// faceId 결과값을 자르는 메서드
	public String cutString(String imgId) {
		String temp1 = imgId.split(":")[6];
		String result = temp1.substring(2, 38);
		return result;
	}
}
