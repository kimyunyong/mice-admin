package com.mice.crm.web;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.jxls.common.Context;
import org.jxls.util.JxlsHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ibm.icu.text.SimpleDateFormat;
import com.mice.common.encrypt.AESGenerator;
import com.mice.common.excel.ExcelExportViewSearch;
import com.mice.common.excel.ExcelMapping;
import com.mice.crm.service.EventStatusVO;
import com.mice.crm.service.EventThemeVO;
import com.mice.crm.service.EventStatusFacilityVO;
import com.mice.crm.service.EventStatusService;
import com.mice.crm.service.CRMService;
import com.mice.crm.service.CodeVO;
import com.mice.crm.service.CustomerVO;
import com.mice.crm.service.Event;
import com.mice.crm.service.EventAttachFile;
import com.mice.crm.service.EventPlusVO;
import com.mice.crm.service.EventStatusDayVO;
import com.mice.crm.service.EventTotalSearchVO;
import com.mice.crm.service.TotalSearchExcelVO;
import com.mice.crm.service.EventVO;
import com.mice.crm.service.OrganizerVO;
import com.sun.star.util.URL;
import com.mice.crm.service.CRMService;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovBasicLogger;
import egovframework.com.cmm.util.EgovResourceCloseHelper;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.cmm.web.EgovComIndexController;
import egovframework.com.uss.umt.service.EgovUserManageService;
import egovframework.com.uss.umt.service.UserDefaultVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import net.sf.jxls.transformer.XLSTransformer;

 

@Controller
public class EventStatusController {

 
	private static final Logger LOGGER = LoggerFactory
			.getLogger(EgovComIndexController.class);

	@Resource(name = "CRMService")
	CRMService service;

	
	@Resource(name = "EventStatusService")
	EventStatusService evt_service;


	@Resource(name = "propertiesService")
	protected EgovPropertyService propertyService;

	
	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;


	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;

	
	@RequestMapping("/crm/search/sms_send.do")
	public String searchSMSSend(@ModelAttribute EventTotalSearchVO vo,
			Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		model.addAttribute("vo", vo);
		 		
		return "mice/crm/search/sms_send";
		
	}
   


	
	@RequestMapping("/crm/search/sms_msg.do")
	public String searchSMSMsg(@ModelAttribute EventTotalSearchVO vo, @RequestParam String flag,
			Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		Map<String, Object> map;
		//상단검색이면
		if(flag.equals("0")){
			map = evt_service.listEventTopTotalSearchSMS(vo);
		}else{
			map = evt_service.listEventTotalSearchSMS(vo);
		}		
		
		List<EventTotalSearchVO> list = (List<EventTotalSearchVO>) map.get("resultList");

		
		String phone_str = "";
		int i = 0;
		int j = 0;
		for (i = 0; i < list.size(); i++) {
			String phone_no = com.mice.common.encrypt.AESGenerator.decrypt(list.get(i).getPhone_no());
			phone_no.replace("-", "");
			//list.get(i).setPhone_no(phone_no);
			if(!phone_no.equals("")){
				phone_str = phone_str + phone_no+",";
				j += 1;
			}
		}
		int row_no = j;

		vo.setSms_remote_phone(phone_str);
		vo.setSms_remote_num(row_no);
		model.addAttribute("vo", vo);
 
		return "mice/crm/search/sms_msg";
	
		
	}


	
	@RequestMapping("/crm/search/excel_file_down.do")
	public void searchExcelDownload(@RequestParam("idx") int idx, @ModelAttribute EventTotalSearchVO vo,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();

		if (isAuthenticated) {

			vo.setIdx(idx);
			vo.setReg_id(user.getId());

			int totCnt = evt_service.listExcelSearchCount(vo);
			List<EventTotalSearchVO> list = evt_service.selectExcelSearch(vo);
			
			String file_path = "";
			String file_name = "";
			for (int i = 0; i < list.size(); i++) {
				file_path = list.get(i).getFile_path();
				file_name = list.get(i).getFile_name();
			}
			
			File uFile = new File(file_path, file_name);
			long fSize = uFile.length();

			if (fSize > 0) {

				String mimetype = "application/x-msdownload";
				//response.setBufferSize(fSize);	// OutOfMemeory 발생
				response.setContentType(mimetype);
				response.setHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(file_name, "utf-8") + "\"");
				//response.setContentLength(fSize);
			
				/////////////////////////////////////////////////////////////////////////////////////
/*				
				String client = request.getHeader("User-Agent");
		        response.reset() ;
		        response.setContentType("application/octet-stream");
		        response.setHeader("Content-Description", "JSP Generated Data");
		        
	            // IE
	            if(client.indexOf("MSIE") != -1){
	                response.setHeader ("Content-Disposition", "attachment; filename="+new String(file_name.getBytes("KSC5601"),"ISO8859_1"));
	            }else{
	                // 한글 파일명 처리
	                String orgfilename = new String(file_name.getBytes("utf-8"),"iso-8859-1");
	                response.setHeader("Content-Disposition", "attachment; filename=\"" + orgfilename + "\"");
	                response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
	            } 
	            response.setHeader ("Content-Length", ""+uFile.length() );
*/	             
				/////////////////////////////////////////////////////////////////////////////////////						
				
				/*
				 * FileCopyUtils.copy(in, response.getOutputStream());
				 * in.close();
				 * response.getOutputStream().flush();
				 * response.getOutputStream().close();
				 */
				
				BufferedInputStream in = null;
				BufferedOutputStream out = null;

				try {
					in = new BufferedInputStream(new FileInputStream(uFile));
					out = new BufferedOutputStream(response.getOutputStream());

					FileCopyUtils.copy(in, out);
					out.flush();
				} catch (IOException ex) {
					// 다음 Exception 무시 처리
					// Connection reset by peer: socket write error
					EgovBasicLogger.ignore("IO Exception", ex);
				} finally {
					EgovResourceCloseHelper.close(in, out);
				}

			} else {
				response.setContentType("application/x-msdownload");

				PrintWriter printwriter = response.getWriter();
				
				printwriter.println("<html>");
				printwriter.println("<br><br><br><h2>Could not get file name:<br>" + file_name + "</h2>");
				printwriter.println("<br><br><br><center><h3><a href='javascript: history.go(-1)'>Back</a></h3></center>");
				printwriter.println("<br><br><br>&copy; webAccess");
				printwriter.println("</html>");
				
				printwriter.flush();
				printwriter.close();
			}
		}
		
		
		
		
	}


	
	

	@RequestMapping("/crm/search/excel_file_delete.do")
	public String searchExcelDeleteAction(@ModelAttribute EventTotalSearchVO vo,
			 ModelMap model) throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		

		vo.setReg_id(user.getId());
		List<EventTotalSearchVO> list = evt_service.selectExcelSearch(vo);

		String phone_str = "";
		int i = 0;
		for (i = 0; i < list.size(); i++) {
			File file = new File(list.get(i).getFile_path()+list.get(i).getFile_name());
			if(file.exists()){
				file.delete();
				System.out.println("___파일삭제성공="+list.get(i).getFile_path()+list.get(i).getFile_name());
			}
			
		}

		evt_service.deleteExcelSearch(vo);
		model.addAttribute("resultMsg", "success.common.delete");
		
		return "redirect:/crm/search/excel_file_list.do";
	}	
	
	
	@RequestMapping("/crm/search/excel_file_list.do")
	public String searchTotalExceList(@ModelAttribute EventTotalSearchVO vo,
			ModelMap model) throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		
		
		vo.setReg_id(user.getId());
		vo.setRecordCountPerPage(10);
		int totCnt2 = evt_service.listExcelSearchCount(vo);
		
		//페이지 나누기
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getPageIndex());

		paginationInfo.setRecordCountPerPage(vo.getRecordCountPerPage());
		paginationInfo.setPageSize(vo.getPageSize());  
		paginationInfo.setTotalRecordCount(totCnt2);
		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setLastIndex(paginationInfo.getLastRecordIndex());
		

		Map<String, Object> map = evt_service.listExcelSearch(vo);
		
		model.addAttribute("resultList", map.get("resultList"));
		model.addAttribute("resultListCnt", map.get("resultListCount"));
		model.addAttribute("vo", vo);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "mice/crm/search/excel_file_list";
	}
	
	
	
	
	
	
		
	
	
	@RequestMapping(value = "/crm/search/excel_download2.do", method = RequestMethod.POST)
	public View searchListExcel2(@ModelAttribute EventTotalSearchVO vo, @RequestParam String flag,
			Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		Map<String, Object> map;
		//상단검색이면
		if(flag.equals("0")){ 
			map = evt_service.listEventTopTotalSearchExcel(vo);
		}else{
			map = evt_service.listEventTotalSearchExcel(vo);
		}
		List<EventTotalSearchVO> list = (List<EventTotalSearchVO>) map.get("resultList");

		
		int j = 0;
		for (int i = 0; i < list.size(); i++) {
			
			//엑셀번호
			String excel_kind = list.get(i).getExcel_kind();
			String excel_num = "";
			
			if(excel_kind.equals("U")){
				j = j+1;
				excel_num = Integer.toString(j);
				list.get(i).setExcel_num(excel_num); 
			}
			
			Class klass = Class.forName("com.mice.crm.service.EventTotalSearchVO");
			setFieldValue(klass, "excel_num", i, list, list.get(i).getExcel_num() );
			setFieldValue(klass, "name_ko", i, list, list.get(i).getName_ko());
			setFieldValue(klass, "position", i, list, list.get(i).getPosition());
			setFieldValue(klass, "tel_no", i, list, list.get(i).getTel_no());
			setFieldValue(klass, "phone_no", i, list, list.get(i).getPhone_no());
			setFieldValue(klass, "email", i, list, list.get(i).getEmail());
			setFieldValue(klass, "address_ko", i, list, list.get(i).getAddress_ko());
			setFieldValue(klass, "etc", i, list, list.get(i).getEtc());
			setFieldValue(klass, "reg_name", i, list, list.get(i).getReg_name());
			setFieldValue(klass, "country", i, list, list.get(i).getCountry());
			setFieldValue(klass, "address_ko", i, list, list.get(i).getAddress_ko());
			setFieldValue(klass, "etc", i, list, list.get(i).getEtc());
			setFieldValue(klass, "sosoc_excel", i, list, list.get(i).getSosoc_excel());
			setFieldValue(klass, "department", i, list, list.get(i).getDepartment());
			
			setFieldValue(klass, "oraganizer_name", i, list, list.get(i).getOraganizer_name());
			setFieldValue(klass, "org_address_ko", i, list, list.get(i).getOrg_address_ko());
			setFieldValue(klass, "org_address_ko_full", i, list, list.get(i).getOrg_address_ko_full());
			setFieldValue(klass, "event_name", i, list, list.get(i).getEvent_name());
			setFieldValue(klass, "event_st_date", i, list, list.get(i).getEvent_st_date());
			setFieldValue(klass, "event_ed_date", i, list, list.get(i).getEvent_ed_date());
			setFieldValue(klass, "event_staff_name", i, list, list.get(i).getEvent_staff_name());
			setFieldValue(klass, "org_type_name", i, list, list.get(i).getOrg_type_name());
			setFieldValue(klass, "event_theme_name", i, list, list.get(i).getEvent_theme_name());
			setFieldValue(klass, "newsletter", i, list, list.get(i).getNewsletter());
		}
		int search_cnt = j;

		
		java.util.Date date = new java.util.Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd_HHmmss");
		String excel_file_path = EgovProperties.getProperty("Globals.fileStorePath") +"excel/";
		String excel_file_name = "통합검색_" + user.getId()+"_"+ vo.getSearchExcel()+"_"+ sdf.format(date) + ".xls";
		String excel_file_path_full = excel_file_path+(String) excel_file_name;

		// 엑셀 다운로드
		model.addAttribute("resultList", list);
		model.addAttribute("filename", excel_file_name);
		model.addAttribute("template_path", "/excel_template/totalsearch_template.xls");


		
		
		//엑셀파일  tbl_totalsearch_excel_file_info - DB에 저장
		Enumeration params = request.getParameterNames();
		String search_params = "";
		while(params.hasMoreElements()){
			String names = (String)params.nextElement();
			search_params += names + "=" + request.getParameter(names);
		}
		
		File file = new File(excel_file_path_full);
		int size = (int) file.length();
		
		vo.setSearch_cnt(search_cnt);
		vo.setSearch_params(search_params);
		vo.setSearch_title(vo.getSearch_title());
		vo.setFile_id(excel_file_name);
		vo.setFile_path(excel_file_path);
		vo.setFile_name(excel_file_name);
		vo.setFile_size(size);
		vo.setReg_id(user.getId());
		evt_service.insertExcelSearch(vo);	

	
		// 엑셀을 출력한다.
		return new ExcelExportViewSearch();
		
		
	}
	

	
	
	public void setFieldValue(Class klass, String fieldname, int i,
			List<?> list, String ob) {
		Field field;
		try {
			field = klass.getDeclaredField(fieldname);
			field.setAccessible(true);
			field.set(list.get(i), AESGenerator.decrypt(ob));
		} catch (NoSuchFieldException x) {
			x.printStackTrace();
		} catch (IllegalArgumentException x) {
			x.printStackTrace();
		} catch (IllegalAccessException x) {
			x.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}	

	  
	
	@RequestMapping("/crm/search/list.do")
	public String customerList(@ModelAttribute("EventTotalSearchVO") EventTotalSearchVO vo,
			ModelMap model, @RequestParam String flag) throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		
		
		if(flag.equals("0")){
			int totCnt2 = evt_service.listEventTopTotalSearchCount(vo);

			//페이지 나누기
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(vo.getPageIndex());
			paginationInfo.setRecordCountPerPage(vo.getRecordCountPerPage());
			paginationInfo.setPageSize(vo.getPageSize());
			paginationInfo.setTotalRecordCount(totCnt2);
			vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
			vo.setLastIndex(paginationInfo.getLastRecordIndex());
			
	
			
			Map<String, Object> map = evt_service.listEventTopTotalSearch(vo);
			int totCnt = (int) map.get("resultListCount");
			
			EventThemeVO tvo = new EventThemeVO();
			List<EventThemeVO> listEventTheme = null;
			int cus_idx = 0;
			List<EventTotalSearchVO> tmpEventTotalSearch = (List<EventTotalSearchVO>)map.get("resultList");
			if(tmpEventTotalSearch.size() > 0){
				for(int i=0; i<tmpEventTotalSearch.size(); i++){
					
					cus_idx = tmpEventTotalSearch.get(i).getCus_idx();
		    		
					//기관, 이벤트 내용 가져와서 리스트에 담기
					vo.setSearchCusIdx(cus_idx);
		      		List<EventTotalSearchVO> listSubCont = evt_service.listEventTopTotalSearchSub(vo);
		      		tmpEventTotalSearch.get(i).setEventSubContList(listSubCont);
				}
				map.put("resultList", tmpEventTotalSearch);
			}
			
			
			model.addAttribute("resultList", map.get("resultList"));
			model.addAttribute("resultListCnt", map.get("resultListCount"));
			model.addAttribute("vo", vo);
			model.addAttribute("paginationInfo", paginationInfo);
			

		}else if(flag.equals("1")){
			int totCnt2 = evt_service.listEventTotalSearchCount(vo);

			
			
			//페이지 나누기
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(vo.getPageIndex());
			paginationInfo.setRecordCountPerPage(vo.getRecordCountPerPage());
			paginationInfo.setPageSize(vo.getPageSize());
			paginationInfo.setTotalRecordCount(totCnt2);
			vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
			vo.setLastIndex(paginationInfo.getLastRecordIndex());
			
	
			
			Map<String, Object> map = evt_service.listEventTotalSearch(vo);
			int totCnt = (int) map.get("resultListCount");
			
			EventThemeVO tvo = new EventThemeVO();
			List<EventThemeVO> listEventTheme;
			int cus_idx = 0;
			List<EventTotalSearchVO> tmpEventTotalSearch = (List<EventTotalSearchVO>)map.get("resultList");
			if(tmpEventTotalSearch.size() > 0){
				for(int i=0; i<tmpEventTotalSearch.size(); i++){
					
					cus_idx = tmpEventTotalSearch.get(i).getCus_idx();
		    		
					//기관, 이벤트 내용 가져와서 리스트에 담기
					vo.setSearchCusIdx(cus_idx);
		      		List<EventTotalSearchVO> listSubCont = evt_service.listEventTotalSearchSub(vo);
		      		tmpEventTotalSearch.get(i).setEventSubContList(listSubCont);
				}
				map.put("resultList", tmpEventTotalSearch);
			}
			
			
			model.addAttribute("resultList", map.get("resultList"));
			model.addAttribute("resultListCnt", map.get("resultListCount"));
			model.addAttribute("vo", vo);
			model.addAttribute("paginationInfo", paginationInfo);
			
			
		}
		
		
		model.addAttribute("flag", flag);
		return "mice/crm/search/list";
	}

		

	@RequestMapping("/crm/event/eventStatus.do")
	public String eventStatusList(@RequestParam(required = false) Map<String, Object> map, @ModelAttribute EventStatusVO vo,  EventStatusFacilityVO facVo, 
			EventStatusDayVO dayVo, ModelMap model) throws Exception {
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		

    	String yyyymmdd = "";
		String str_date = "";
		String today = "";
		
		java.util.Date dDate = new java.util.Date();
   		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Calendar cal = Calendar.getInstance() ;

		
		if(map.containsKey("searchToday")){
    		today = map.get("searchToday").toString().replace("-", "");
     		dDate = sdf.parse(today); //2017-11-02
    		cal.setTime(dDate);
   		
    	}else{
    		today = sdf.format(dDate);
    	}
	
		int dayweek;
		int monthweek;
		//String sToday = sdf.format(dDate);	//2017-11-01
		dayweek = cal.get(Calendar.DAY_OF_WEEK);
		monthweek = cal.get(Calendar.WEEK_OF_MONTH);
   		//vo.setYyyymmdd(today);
		
  		vo.setDayweek(dayweek);
		vo.setMonthweek(monthweek);
		vo.setSearchToday(today);
		
		cal.add(Calendar.DATE, -7);
		dDate = cal.getTime();
		vo.setSearchPreDay(sdf.format(dDate));

		cal.add(Calendar.DATE, 14);
		dDate = cal.getTime();
		vo.setSearchNextDay(sdf.format(dDate));
		
	
		
/////////////////////////////////////////////////////////		
		
		String year = "";
    	String month = "";
    	String day = "";

    	if(map.containsKey("searchYear")){
    		year = map.get("searchYear").toString();
    		vo.setSearchYear(year);
    	}
    	if(map.containsKey("searchMonth")){
    		month = map.get("searchMonth").toString();
    		vo.setSearchMonth(month);
    	}
    	if(map.containsKey("searchDay")){
    		day = map.get("searchDay").toString();
    		vo.setSearchMonth(day);
    	}   	
    	if(month.length() == 1){
    		vo.setSearchMonth("0" + month);
    	}
    	if(day.length() == 1){
    		vo.setSearchMonth("0" + day);
    	}  	
    	if(map.containsKey("searchMonth") && map.get("searchMonth").equals("0")){
    		vo.setSearchYear(Integer.toString((Integer.parseInt(year) -1)));
    		vo.setSearchMonth("12");
    	}
    	if(map.containsKey("searchMonth") && map.get("searchMonth").equals("13")){
    		vo.setSearchYear(Integer.toString((Integer.parseInt(year) +1)));
    		vo.setSearchMonth("01");
    	}
    	

    	
		
		//long lCurTime = dDate.getTime();
		//dDate = new java.util.Date(lCurTime+(1000*60*60*24*-7));  //2017-10-25
		//String sYesterDay = sdf.format(dDate);      
	     
		//dDate = new java.util.Date(lCurTime+(1000*60*60*24*+7)); //2017-11-08
		//String sTomorrow = sdf.format(dDate);       


		//SimpleDateFormat week = new SimpleDateFormat("W"); //(1~5)
		
	/*
		System.out.println("============================>"+week.format(dDate));		
		System.out.println("============================>날짜---"+sToday);
		System.out.println("============================>현재 몇째주---"+weekNum);
		System.out.println("============================>현재 몇번째 요일-------"+dayNum);
		System.out.println("============================>지난주---"+sYesterDay);
		System.out.println("============================>다음주---"+sTomorrow);
		System.out.println("============================>다음주week---"+week);
	*/
	 	


    	
    	
       	List<EventStatusVO> listStatusCalendarWeek = evt_service.listStatusCalendarWeek(vo);
      	List<EventStatusFacilityVO> listStatusFacility = evt_service.listStatusFacility(facVo);
      	List<String> mGroupList = new ArrayList<String>();
      	
      	int fac_idx;
      	String fac_name;
      	String fac_ymd;
      	
		System.out.println("===========================listStatusCalendarWeek=>"+listStatusCalendarWeek);
		System.out.println("===========================listStatusFacility11111=>"+listStatusFacility);

    	for(int i=0; i< listStatusFacility.size(); i++ ){
 			
    		//for(int k=0; i<ListStatusDay.size(); k++){
      		//	mChildList.add(ListStatusDay.get(k).getRent_time_am());
			//}
     		fac_idx = listStatusFacility.get(i).getIdx();
      		fac_name = listStatusFacility.get(i).getType_ko();
      		
      		
         	List<String> mChildList = new ArrayList<String>();      	 
         	for(int j=0; j< listStatusCalendarWeek.size(); j++ ){
          		
       			fac_ymd = listStatusCalendarWeek.get(j).getYyyymmdd();

       			dayVo.setFac_idx(fac_idx);
          		dayVo.setYyyymmdd(fac_ymd);         		
          		List<EventStatusDayVO> ListStatusDay = evt_service.listStatusDay(dayVo);
              	
          		//for(int k =0;k < ListStatusDay.size(); k++){
          			mChildList.add( String.valueOf(ListStatusDay.get(0).getRent_time_am()) );
          			mChildList.add( String.valueOf(ListStatusDay.get(0).getRent_time_pm()) );
          			mChildList.add( String.valueOf(ListStatusDay.get(0).getRent_time_night()) );
          		//}
           		
          	}   
     		listStatusFacility.get(i).setDay_arr(mChildList);

      	}
 
   		System.out.println("===========================today-333=>"+today);
   		System.out.println("===========================monthweek-333=>"+monthweek);
  		System.out.println("===========================map.containsKey(searchToday)=>"+map.containsKey("searchToday"));

		
		if(map.containsKey("searchToday")){
    		System.out.println("===========================today-111=>"+today);
    	}else{
       		System.out.println("===========================today-222=>"+today);
    	}
		
   		
     	if(vo.getSearchPlaceIdx() == ""){
    		vo.setSearchPlaceIdx("-1");
    	}
    	model.addAttribute("auth", user.getUserSe());    	
    	model.addAttribute("result", vo);
    	//model.addAttribute("resultList", listStatusCalendar);
       	model.addAttribute("resultWeek", listStatusCalendarWeek);
       	model.addAttribute("resultList", listStatusFacility);
    	   	
    	return "mice/crm/event/eventStatus";

    	
		    	
    	
    }
	
}
