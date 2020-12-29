package com.mice.crm.web;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import egovframework.com.cmm.web.EgovComIndexController;

import com.mice.crm.service.CRMService;
import com.mice.crm.service.CustomerVO;


@Service("RemeberAppController") //쿼트 스케줄러 실행때 주석해제
//@Controller //쿼트 스케줄러 실행때 주석처리해야함.
public class RemeberAppController {
	

	private static final Logger LOGGER = LoggerFactory.getLogger(EgovComIndexController.class);

	
	@Resource(name = "CRMService")
	CRMService service;

	
	/* 리멤버 비 로그인 처리  */
	//@RequestMapping("/EgovTop.do")
	//쿼트 스케줄러 연동기 클래스 타입은 void 로 변경, return 값 업애기
	public void rememberAPI() throws Exception{

		//날짜 구하기
		Calendar c1 = new GregorianCalendar();
		c1.add(Calendar.HOUR, -24); // 오늘날짜로부터 -24시간 전
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 날짜 포맷 
		SimpleDateFormat sdf2 = new SimpleDateFormat("HH"); // 날짜 포맷 
		String dd = sdf.format(c1.getTime()); // String으로 저장	
		String hh = sdf2.format(c1.getTime()); // String으로 저장	

		//String url = "https://open-api-teambook.rememberapp.co.kr/stacks.json?page=3&per=10&start_at=2017-04-01T00:00:00.000+09:00&end_at=2017-10-02T00:00:00.000+09:00";
		String url = "https://open-api-teambook.rememberapp.co.kr/stacks.json?page=1&per=100&start_at="+dd+"T"+hh+":00:00.000+09:00";
		String res = rememberList(url);

//		SimpleDateFormat  formatter02 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//		SimpleDateFormat  formatter03 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		String todate02 =  formatter02.format(new Date());
//		String todate03 =  formatter03.format(new Date());
//System.out.println("_______111time_000="+todate02);
//System.out.println("_______111time_222="+todate03);
//System.out.println("_______d_111="+dd);
//System.out.println("_______url_111="+url);
		
		//return "redirect:/Main.do";
		
	}	
	
	 
	/* 리멤버 로그인후 처리  */	
	@RequestMapping("/remember.do")
	@ResponseBody
	public String rememberAPILogin() throws Exception{

		//날짜 구하기
		Calendar c1 = new GregorianCalendar();
		c1.add(Calendar.DATE, -1); // 오늘날짜로부터 -1
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 날짜 포맷 
		String d = sdf.format(c1.getTime()); // String으로 저장	

		//String url = "https://open-api-teambook.rememberapp.co.kr/stacks.json?page=3&per=10&start_at=2017-04-01T00:00:00.000+09:00&end_at=2017-10-02T00:00:00.000+09:00";
		String url = "https://open-api-teambook.rememberapp.co.kr/stacks.json?page=1&per=100&start_at="+d+"T00:00:00.000+09:00";
		String res = rememberList(url);
		
//		SimpleDateFormat  formatter02 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//		String todate02 =  formatter02.format(new Date());
//System.out.println("_______222time_000="+todate02);
//System.out.println("_______d_222="+d);
//System.out.println("_______url_222="+url);
		
		return "<script>alert('Complete');location.href='/';</script>";
		
	}	
	
	
	//리멤버 처리
	private String rememberList(String url) throws Exception{
		
		//LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		//vo.setReg_id(user.getId());
		
		HttpClient httpclient = new DefaultHttpClient();
		String returnString = null;
		
		HttpGet httpget = new HttpGet(url); 
		httpget.addHeader("API-CLIENT-ID", "d8819a3155dd1df8ddb540cd342116d8");
		httpget.addHeader("API-CLIENT-SECRET", "f9581f71198a2f296bf8ccbde26b0c96");
		httpget.addHeader("Cache-Control", "no-cache");
		
		try {
	        	HttpResponse response_str = httpclient.execute(httpget);
	        	
				if( response_str.getStatusLine().getStatusCode() == 200){
                    
	                HttpEntity entity = response_str.getEntity();
	                
	                if (entity != null) {

	                	InputStream instream = entity.getContent();
	                    JSONObject jObject = JSONObject.fromObject(convertStreamToString(instream));
	                    JSONArray results = jObject.getJSONArray("stacks");
	                    
	                    CustomerVO vo = new  CustomerVO();
	                    
		                //메타 정보 받아오기
		                vo.setPage_url(url);
		                vo.setPage(jObject.getJSONObject("metainfo").getInt("page"));
		                vo.setPer(jObject.getJSONObject("metainfo").getInt("per"));
		                vo.setTotal_count(jObject.getJSONObject("metainfo").getInt("total_count"));
		                vo.setTotal_page(jObject.getJSONObject("metainfo").getInt("total_pages"));
		                
		                //리멤버 정보 등록
		                service.insertRememberInfo(vo);
		                
		                for (int i = 0; i <results.size(); i++) { 
/* 
		                	System.out.println("___________1111__id="+results.getJSONObject(i).getString("id"));
		                	System.out.println("___________1111__trashed_at="+results.getJSONObject(i).getString("trashed_at"));
		                	System.out.println("___________1111__deleted_at="+results.getJSONObject(i).getString("deleted_at"));
		                	System.out.println("___________1111__team="+results.getJSONObject(i).getString("team"));
		                	System.out.println("___________1111__book="+results.getJSONObject(i).getString("book"));
		                	System.out.println("___________1111__main_card="+results.getJSONObject(i).getString("main_card"));
		                	
		                	System.out.println("___________2222__name="+results.getJSONObject(i).getJSONObject("main_card").getString("id") );
		                	System.out.println("___________2222__name="+results.getJSONObject(i).getJSONObject("main_card").getString("name") );
		                	System.out.println("___________2222__company="+results.getJSONObject(i).getJSONObject("main_card").getString("company") );
		                	System.out.println("___________2222__department="+results.getJSONObject(i).getJSONObject("main_card").getString("department") );
		                	System.out.println("___________2222__position="+results.getJSONObject(i).getJSONObject("main_card").getString("position") );
		                	System.out.println("___________2222__email="+results.getJSONObject(i).getJSONObject("main_card").getString("email") );
		                	
		                	System.out.println("___________2222__tel="+results.getJSONObject(i).getJSONObject("main_card").getJSONObject("tel").getString("national_number") );
		                	System.out.println("___________2222__fax="+results.getJSONObject(i).getJSONObject("main_card").getJSONObject("fax").getString("national_number") );
		                	System.out.println("___________2222__address="+results.getJSONObject(i).getJSONObject("main_card").getJSONObject("address").getString("default") );
		                	System.out.println("___________2222__image_url="+results.getJSONObject(i).getJSONObject("main_card").getJSONObject("image_url").getString("front") );
		                	System.out.println("___________2222__user_id="+results.getJSONObject(i).getJSONObject("main_card").getJSONObject("user").getString("id") );
		                	System.out.println("___________2222__user_email="+results.getJSONObject(i).getJSONObject("main_card").getJSONObject("user").getString("email") );
		                	System.out.println("___________2222__created_at="+results.getJSONObject(i).getJSONObject("main_card").getString("created_at") );
		                	System.out.println("___________2222__mobile="+results.getJSONObject(i).getJSONObject("main_card").getJSONObject("mobile").getString("national_number") );
*/	

		                	// 기본값 받아오기
		            		vo.setRemember_id( results.getJSONObject(i).getString("id") );
		            		vo.setRemember_created_at( results.getJSONObject(i).getString("created_at") );
		            		vo.setRemember_main_card_id( results.getJSONObject(i).getJSONObject("main_card").getString("id") );
		            		vo.setRemember_main_card_created_at( results.getJSONObject(i).getJSONObject("main_card").getString("created_at") );
		            		vo.setRemember_main_card_user_id( results.getJSONObject(i).getJSONObject("main_card").getJSONObject("user").getString("id") );
		            		vo.setRemember_main_card_user_email( results.getJSONObject(i).getJSONObject("main_card").getJSONObject("user").getString("email") );		            		
		                	
		                	vo.setName_ko( results.getJSONObject(i).getJSONObject("main_card").getString("name") );
		            		vo.setSosoc_excel( results.getJSONObject(i).getJSONObject("main_card").getString("company") );
		            		vo.setDepartment( results.getJSONObject(i).getJSONObject("main_card").getString("department") );
		            		vo.setPosition( results.getJSONObject(i).getJSONObject("main_card").getString("position") );
		            		vo.setEmail( results.getJSONObject(i).getJSONObject("main_card").getString("email") );
		            		
		            		vo.setTel_no( phoneNumberHyphenAdd(results.getJSONObject(i).getJSONObject("main_card").getJSONObject("tel").getString("national_number")) ); //전화번호 하이폰 처리
		            		vo.setFax_no( phoneNumberHyphenAdd(results.getJSONObject(i).getJSONObject("main_card").getJSONObject("fax").getString("national_number")) ); //전화번호 하이폰 처리
		            		
		            		vo.setAddress_ko( results.getJSONObject(i).getJSONObject("main_card").getJSONObject("address").getString("default") );
		                	vo.setSearchMng( results.getJSONObject(i).getJSONObject("main_card").getJSONObject("user").getString("email") );	//담당자 이메일	 
		                	
		            		vo.setPhone_no( phoneNumberHyphenAdd(results.getJSONObject(i).getJSONObject("main_card").getJSONObject("mobile").getString("national_number")) ); //전화번호 하이폰 처리
		                	
		                	//vo.setName_en( results.getJSONObject(i).getJSONObject("main_card").getString("name") );
		            		vo.setNewsletter("Y");
		            		vo.setCountry("내국인");
	
		            		//리멤버 명함정보  등록 및 수정
		            		String manager_id = service.selectCustomerManager_id(vo);
		            		vo.setManager_id( manager_id );
		            		int idx = service.selectCustomerCheck(vo);
		            		
		            		vo.setIdx(idx);
		            		if(idx == 0 ){ //중복체크
			            		service.insertCustomer(vo);  //신규이면 등록
		            		}else{
			            		service.updateCustomerRemember(vo); //기존자료이면 수정
		            		}
		            		//System.out.println("_______________getTel_no="+vo.getTel_no());
		            		//System.out.println("_______________getFax_no="+vo.getFax_no());
		            		//System.out.println("_______________setPhone_no="+vo.getPhone_no());
		            		
	            		
		                }
		                instream.close();
		                
	           }
	                
	                
	        }
	        else {
	            returnString = "Unable to load page - " + response_str.getStatusLine();
	        }
	    }
	    catch (IOException  ex) {
	        returnString = "Connection failed; " + ex.getMessage();
	    }
	    catch (JSONException ex){
	        returnString = "JSON failed; " + ex.getMessage();
	    }
	    return returnString;
	}



	public static String phoneNumberHyphenAdd(String num) {

	    String formatNum = "";
	   // if (StringUtils.NVL(num).equals("")) return formatNum;
		if (num.equals("") || num.isEmpty() ) return formatNum;
	    num = num.replaceAll("-","");

	    if (num.length() == 11) {
	        //if (mask.equals("Y")) {
	        //    formatNum = num.replaceAll("(\\d{3})(\\d{3,4})(\\d{4})", "$1-****-$3");
	        //}else{
	            formatNum = num.replaceAll("(\\d{3})(\\d{3,4})(\\d{4})", "$1-$2-$3");
	        //}
	    }else if(num.length()==8){
	        formatNum = num.replaceAll("(\\d{4})(\\d{4})", "$1-$2");
	    }else{
	        if(num.indexOf("02")==0){
	            //if(mask.equals("Y")){
	            //    formatNum = num.replaceAll("(\\d{2})(\\d{3,4})(\\d{4})", "$1-****-$3");
	            //}else{
	                formatNum = num.replaceAll("(\\d{2})(\\d{3,4})(\\d{4})", "$1-$2-$3");
	            //}
	        }else{
	            //if(mask.equals("Y")){
	            //    formatNum = num.replaceAll("(\\d{3})(\\d{3,4})(\\d{4})", "$1-****-$3");
	            //}else{
	                formatNum = num.replaceAll("(\\d{3})(\\d{3,4})(\\d{4})", "$1-$2-$3");
	            //}
	        }
	    }
	    return formatNum;
	}


	
	//전화번호 하이픈
	public static String makePhoneNumber(String phoneNumber) {

		   String regEx = "(\\d{3})(\\d{3,4})(\\d{4})";
		   if(!Pattern.matches(regEx, phoneNumber)) return null;
		   return phoneNumber.replaceAll(regEx, "$1-$2-$3");

	}

		
		
		
	
	private static String convertStreamToString(InputStream is) throws Exception { //UnsupportedEncodingException
		
		BufferedReader reader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
		StringBuilder sb = new StringBuilder();
		String line = null;
		try {
		    while ((line = reader.readLine()) != null) {
		        sb.append(line + "\n");
		        
		    }
		} catch (IOException e) {
		    e.printStackTrace();
		} finally {
		    try {
		        is.close();
		    } catch (IOException e) {
		        e.printStackTrace();
		    }
		}
		return sb.toString();
		
	}	
	
	
	
}

