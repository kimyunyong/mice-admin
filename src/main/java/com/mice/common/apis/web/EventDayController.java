package com.mice.common.apis.web;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.sym.cal.service.EgovCalRestdeManageService;
import egovframework.com.sym.cal.service.Restde;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Controller
public class EventDayController {

	private String USE_YEAR = "2016";
	private HttpURLConnection connector;
	
	@Resource(name = "RestdeManageService")
    private EgovCalRestdeManageService calService;

	@Resource(name="egovRestDeIdGnrService")
	private EgovIdGnrService idgenService;
	
	@RequestMapping("/com/api/eventday/{type}/{year}/list.do")
	@ResponseBody
	public String getEventDayList(@PathVariable String type, @PathVariable String year ) throws Exception{
		
		String res = connect("https://apis.sktelecom.com/v1/eventday/days?month=&day=&type=" + type + "&year=" + year);
		return "<script>alert('Complete');location.href='/';</script>";
	}
	
	
	 private String connect(String url) throws Exception{
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		if(!user.getId().equals("jongil.byeon"))
			throw new Exception();
        HttpClient httpclient = new DefaultHttpClient();
        HttpGet httpget = new HttpGet(url); 
        HttpResponse response;
        String returnString = null;
        httpget.setHeader("TDCProjectKey", "3a9da5f2-e6f6-4147-bb54-f53cf9da75e3");
        httpget.setHeader("referer", "https://developers.sktelecom.com/projects/project_16400054/services/EventDay/Analytics/");
        httpget.setHeader("Date", "Fri, 22 Jul 2016 10:59:19 GMT");
        httpget.setHeader("Accept", "application/json");
	        try {
	            response = httpclient.execute(httpget);

	            if(response.getStatusLine().getStatusCode() == 200){
	                HttpEntity entity = response.getEntity();
	                if (entity != null) {
	                    InputStream instream = entity.getContent();
	                    JSONObject myAwway = JSONObject.fromObject(convertStreamToString(instream));
	                    JSONArray results = myAwway.getJSONArray("results");

	                    for (int i = 0; i < results.size(); i++) {
	                        Restde cal = new Restde();
	                        cal.setRestdeDe(results.getJSONObject(i).getString("year") + "-" + results.getJSONObject(i).getString("month") + "-" + results.getJSONObject(i).getString("day"));
	                        cal.setRestdeNm(results.getJSONObject(i).getString("name"));
	                        cal.setRestdeDc(".");
	                        cal.setFrstRegisterId(user.getId());
	                        cal.setRestdeSeCode("01");
	                        cal.setRestdeNo(idgenService.getNextIntegerId()%1000000);
	                        calService.insertRestde(cal);
	                    }

	                    instream.close();
	                }
	            }
	            else {
	                returnString = "Unable to load page - " + response.getStatusLine();
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

	 

	    private static String convertStreamToString(InputStream is) {
	        BufferedReader reader = new BufferedReader(new InputStreamReader(is));
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


