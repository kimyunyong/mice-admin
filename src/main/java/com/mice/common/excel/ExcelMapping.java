package com.mice.common.excel;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import jxl.Sheet;
import jxl.Workbook;

import com.mice.crm.service.CRMService;
import com.mice.crm.service.CustomerVO;
import com.mice.crm.service.EventVO;
import com.mice.crm.service.OrganizerVO;

public class ExcelMapping {
	private CRMService service;
	private String userId;

	public ExcelMapping(CRMService service, String userId) {
		this.service = service;
		this.userId = userId;
	}

	public void excelFileUpload(File file, String type) {
		try {
			if (type.equals("customer")) {
				List<CustomerVO> list = null;
				list = readCustomerFile(file);
				// DB insert
				for (int i = 0; i < list.size(); i++) {
					service.insertCustomer(list.get(i));
				}
			}else if(type.equals("organizer")){
				List<OrganizerVO> list = null;
				list = readOrganizerFile(file);
				// DB insert
				for (int i = 0; i < list.size(); i++) {
					service.insertOrganizer(list.get(i));
				}
			}else if(type.equals("event")){
				List<EventVO> list = null;
				list = readEventFile(file);
				// DB insert
				for (int i = 0; i < list.size(); i++) {
					service.insertEvent(list.get(i));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (file != null && file.exists()) {
				file.delete();
			}
		}
	}

	private List<CustomerVO> readCustomerFile(File file) throws Exception {

		List<CustomerVO> list = new ArrayList<CustomerVO>();
		CustomerVO customer = null;
		Workbook workbook = null;
		Sheet sheet = null;
		
			workbook = Workbook.getWorkbook(file);
			if (workbook != null) {
				sheet = workbook.getSheet(0);
				if (sheet != null) {
					int rowindex = 1;
					int columnindex = 0;
					int rows = sheet.getRows();
					int columns = sheet.getColumns();
					String cellValue = "";
					for (int nRow = rowindex; nRow < rows; nRow++) {
						customer = new CustomerVO();
						for (int nColumn = columnindex; nColumn < columns - 1;) {
												
							customer.setName_ko(sheet.getCell(nColumn++, nRow).getContents());
							customer.setName_en(sheet.getCell(nColumn++, nRow).getContents());
							customer.setPosition(sheet.getCell(nColumn++, nRow).getContents());
							customer.setSosoc_excel(sheet.getCell(nColumn++, nRow).getContents());
							customer.setDepartment(sheet.getCell(nColumn++, nRow).getContents());
							customer.setTel_no(sheet.getCell(nColumn++, nRow).getContents());
							customer.setPhone_no(sheet.getCell(nColumn++, nRow).getContents());
							customer.setEmail(sheet.getCell(nColumn++, nRow).getContents());
							customer.setFax_no(sheet.getCell(nColumn++, nRow).getContents());
							customer.setZip_code(sheet.getCell(nColumn++, nRow).getContents());
							customer.setAddress_ko(sheet.getCell(nColumn++, nRow).getContents());
							customer.setAddress_en(sheet.getCell(nColumn++, nRow).getContents());	
							customer.setManager_id(sheet.getCell(nColumn++, nRow).getContents());
							customer.setNewsletter(sheet.getCell(nColumn++, nRow).getContents());
							customer.setCountry(sheet.getCell(nColumn++, nRow).getContents());
							customer.setEtc(sheet.getCell(nColumn++, nRow).getContents());
							customer.setReg_id(userId);
						}
						list.add(customer);
					}
				}
			}
			customer = null;
			workbook = null;
			sheet = null;
		
		return list;
	}

	private List<OrganizerVO> readOrganizerFile(File file) throws IOException {
		com.mice.crm.service.CodeVO vo = new com.mice.crm.service.CodeVO();
		vo.setSearchType("주최자구분");
		List<com.mice.crm.service.CodeVO> organizer_type_list = service.listCode(vo);
		List<OrganizerVO> list = new ArrayList<OrganizerVO>();
		OrganizerVO organizer = null;
		Workbook workbook = null;
		Sheet sheet = null;
		try {
			workbook = Workbook.getWorkbook(file);
			if (workbook != null) {
				sheet = workbook.getSheet(0);
				if (sheet != null) {
					int rowindex = 1;
					int columnindex = 0;
					int rows = sheet.getRows();
					int columns = sheet.getColumns();
					String cellValue = "";
					for (int nRow = rowindex; nRow < rows; nRow++) {
						organizer = new OrganizerVO();
						for (int nColumn = columnindex; nColumn < columns - 1;) {
							
							organizer.setOrg_kind(sheet.getCell(nColumn++, nRow).getContents());
							organizer.setManager_event(sheet.getCell(nColumn++, nRow).getContents());
							organizer.setCrm_event_idx(sheet.getCell(nColumn++, nRow).getContents());
							organizer.setEvent_cate_biz1(sheet.getCell(nColumn++, nRow).getContents());
							organizer.setEvent_cate_biz2(sheet.getCell(nColumn++, nRow).getContents());
							organizer.setEvent_cate_biz3(sheet.getCell(nColumn++, nRow).getContents());

							organizer.setName_ko(sheet.getCell(nColumn++, nRow).getContents());
							organizer.setName_en(sheet.getCell(nColumn++, nRow).getContents());
							organizer.setName_etc(sheet.getCell(nColumn++, nRow).getContents());
							
							cellValue = sheet.getCell(nColumn++, nRow).getContents();
							for(int i=0;i<organizer_type_list.size();i++){
								if(organizer_type_list.get(i).getValue().equals(cellValue.toString()))
									organizer.setType_idx(organizer_type_list.get(i).getIdx());
							}
							organizer.setNational(sheet.getCell(nColumn++, nRow).getContents());
							organizer.setZip_code(sheet.getCell(nColumn++, nRow).getContents());
							organizer.setAddress_ko(sheet.getCell(nColumn++, nRow).getContents());
							organizer.setAddress_en(sheet.getCell(nColumn++, nRow).getContents());

							organizer.setCeo_name(sheet.getCell(nColumn++, nRow).getContents());
							organizer.setCeo_phone(sheet.getCell(nColumn++, nRow).getContents());
							organizer.setBiz_man(sheet.getCell(nColumn++, nRow).getContents());
							organizer.setBiz_man_phone(sheet.getCell(nColumn++, nRow).getContents());
							organizer.setBiz_man_email(sheet.getCell(nColumn++, nRow).getContents());
							
							organizer.setTel_no(sheet.getCell(nColumn++, nRow).getContents());
							organizer.setFax(sheet.getCell(nColumn++, nRow).getContents());
							organizer.setEmail(sheet.getCell(nColumn++, nRow).getContents());
							organizer.setHomepage(sheet.getCell(nColumn++, nRow).getContents());
							organizer.setManager_id(sheet.getCell(nColumn++, nRow).getContents());
							organizer.setComment(sheet.getCell(nColumn++, nRow).getContents());
							
							organizer.setOrg_import(sheet.getCell(nColumn++, nRow).getContents());
							organizer.setOrg_grade(sheet.getCell(nColumn++, nRow).getContents());
							organizer.setOrg_step(sheet.getCell(nColumn++, nRow).getContents());
							organizer.setOrg_exhi_history(sheet.getCell(nColumn++, nRow).getContents());
							organizer.setOrg_exhi_path(sheet.getCell(nColumn++, nRow).getContents());
							
							organizer.setReg_id(userId);
							
						}
						list.add(organizer);
					}
				}
			}
			organizer = null;
			workbook = null;
			sheet = null;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	private List<EventVO> readEventFile(File file) throws Exception {
		com.mice.crm.service.CodeVO vo = new com.mice.crm.service.CodeVO();
		vo.setSearchType("주최자구분");
		List<com.mice.crm.service.CodeVO> organizer_type_list = service.listCode(vo);
		vo.setSearchType("추진현황");
		List<com.mice.crm.service.CodeVO> implemnents_status_list = service.listCode(vo);
		vo.setSearchType("장소");
		List<com.mice.crm.service.CodeVO> place_idx_list = service.listCode(vo);
		vo.setSearchType("행사구분");
		List<com.mice.crm.service.CodeVO> event_division_list = service.listCode(vo);
		vo.setSearchType("행사유형구분");
		List<com.mice.crm.service.CodeVO> event_type_list = service.listCode(vo);
		vo.setSearchType("행사성격");
		List<com.mice.crm.service.CodeVO> event_scale_list = service.listCode(vo);


		List<EventVO> list = new ArrayList<EventVO>();
		EventVO event = null;
		Workbook workbook = null;
		Sheet sheet = null;
			workbook = Workbook.getWorkbook(file);
			if (workbook != null) {
				sheet = workbook.getSheet(0);
				if (sheet != null) {
					int rowindex = 1;
					int columnindex = 0;
					int rows = sheet.getRows();
					int columns = sheet.getColumns();
					String cellValue = "";
					for (int nRow = rowindex; nRow < rows; nRow++) {
						event = new EventVO();
						for (int nColumn = columnindex; nColumn < columns - 1;) {
							cellValue = sheet.getCell(nColumn++, nRow).getContents();


							for(int i=0;i<implemnents_status_list.size();i++){
								if(implemnents_status_list.get(i).getValue().equals(cellValue.toString()))
									event.setImplementation_status(String.valueOf(implemnents_status_list.get(i).getIdx()));
							}
							event.setConfirm_date(sheet.getCell(nColumn++, nRow).getContents());
							event.setName_ko(sheet.getCell(nColumn++, nRow).getContents());	
							event.setName_en(sheet.getCell(nColumn++, nRow).getContents());
							event.setName_etc(sheet.getCell(nColumn++, nRow).getContents());
							
							
							cellValue = sheet.getCell(nColumn++, nRow).getContents();
							for(int i=0;i<place_idx_list.size();i++){
								if(place_idx_list.get(i).getValue().equals(cellValue.toString()))
									event.setPlace_idx(String.valueOf(place_idx_list.get(i).getIdx()));
							}
							//event.setRent_st_date(dateFormat(sheet.getCell(nColumn++, nRow).getContents()));
							//event.setRent_ed_date(dateFormat(sheet.getCell(nColumn++, nRow).getContents()));
							//event.setEvent_st_date(dateFormat(sheet.getCell(nColumn++, nRow).getContents()));
							//event.setEvent_ed_date(dateFormat(sheet.getCell(nColumn++, nRow).getContents()));
							event.setRent_st_date(sheet.getCell(nColumn++, nRow).getContents());
							event.setRent_ed_date(sheet.getCell(nColumn++, nRow).getContents());
							event.setEvent_st_date(sheet.getCell(nColumn++, nRow).getContents());
							event.setEvent_ed_date(sheet.getCell(nColumn++, nRow).getContents());
							
							cellValue = sheet.getCell(nColumn++, nRow).getContents();
							for(int i=0;i<event_division_list.size();i++){
								if(event_division_list.get(i).getValue().equals(cellValue.toString()))
									event.setEvent_division_idx(event_division_list.get(i).getIdx());
							}
							
							cellValue = sheet.getCell(nColumn++, nRow).getContents();
							for(int i=0;i<event_type_list.size();i++){
								if(event_type_list.get(i).getValue().equals(cellValue.toString()))
									event.setEvent_type_idx(event_type_list.get(i).getIdx());
							}
							
							cellValue = sheet.getCell(nColumn++, nRow).getContents();
							for(int i=0;i<event_scale_list.size();i++){
								if(event_scale_list.get(i).getValue().equals(cellValue.toString()))
									event.setEvent_scale_idx(event_scale_list.get(i).getIdx());
							}
							
							event.setJoin_personal_cnt(Integer.parseInt(sheet.getCell(nColumn++, nRow).getContents()));
							event.setJoin_foreigner_cnt(Integer.parseInt(sheet.getCell(nColumn++, nRow).getContents()));
							event.setJoin_nationals_cnt(Integer.parseInt(sheet.getCell(nColumn++, nRow).getContents()));
							event.setBooth_cnt(Integer.parseInt(sheet.getCell(nColumn++, nRow).getContents()));
							event.setExhibition_scale(Integer.parseInt(sheet.getCell(nColumn++, nRow).getContents()));
							event.setParticipating_states_cnt(Integer.parseInt(sheet.getCell(nColumn++, nRow).getContents()));
							event.setOrganizers_3(sheet.getCell(nColumn++, nRow).getContents());
							event.setView_yn(sheet.getCell(nColumn++, nRow).getContents());
							event.setHomepage(sheet.getCell(nColumn++, nRow).getContents());
							
							//event.setEstimate_date(dateFormat(sheet.getCell(nColumn++, nRow).getContents()));
							event.setEstimate_date(sheet.getCell(nColumn++, nRow).getContents());
							event.setEstimate_cost(Integer.parseInt(sheet.getCell(nColumn++, nRow).getContents()));
							event.setSales_cost(Integer.parseInt(sheet.getCell(nColumn++, nRow).getContents()));
							event.setTotal_cost(Integer.parseInt(sheet.getCell(nColumn++, nRow).getContents()));
							event.setRent_cost(Integer.parseInt(sheet.getCell(nColumn++, nRow).getContents()));
							event.setFood_cost(Integer.parseInt(sheet.getCell(nColumn++, nRow).getContents()));
							event.setAv_rental_cost(Integer.parseInt(sheet.getCell(nColumn++, nRow).getContents()));
							event.setManager_cost(Integer.parseInt(sheet.getCell(nColumn++, nRow).getContents()));
							event.setTotal_grant_cost(Integer.parseInt(sheet.getCell(nColumn++, nRow).getContents()));
							event.setHeld_grant_cost(Integer.parseInt(sheet.getCell(nColumn++, nRow).getContents()));
							
							event.setAttract_grant_cost(Integer.parseInt(sheet.getCell(nColumn++, nRow).getContents()));
							event.setSales_grant_cost(Integer.parseInt(sheet.getCell(nColumn++, nRow).getContents()));
							event.setEtc_comment(sheet.getCell(nColumn++, nRow).getContents());
							event.setPartners_comment(sheet.getCell(nColumn++, nRow).getContents());
							event.setReg_id(userId);


						}
						list.add(event);
					}
				}
			}
			event = null;
			workbook = null;
			sheet = null;
		
		return list;
	}
	
	public String dateFormat(String date){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(date);
		/*String newDate=null;
		String[] spl;
		if(date.length()!= 10){
			spl = date.split(". ");
			newDate="20";
			newDate+=(spl[0]);
			for(int i=1;i<spl.length;i++){
			if(spl[i].length()==1){
				newDate+=("-0"+spl[i]);
			}else{
				newDate+=("-"+spl[i]);
			}
			}
		}else{
			return date;
		}
		return newDate;*/
	}
}
