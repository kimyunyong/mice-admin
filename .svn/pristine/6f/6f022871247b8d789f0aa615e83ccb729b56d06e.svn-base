package com.mice.common.excel.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import com.mice.common.excel.Employee;
import com.mice.common.excel.ExcelExportView;

class entity {
	private int cnt = 0;
	public int getCnt(){
		return cnt;
	}
	public void setCnt(int cnt){
		this.cnt = cnt;
	}
}
@Controller
public class ExcelController {

	@RequestMapping(value ="/home.do", method = RequestMethod.GET)
    public String dispHomeView(ModelMap model) {
        return "mice/test2";
    }

	@RequestMapping(value = "/excel.do", method = RequestMethod.GET)
    public View viewExcel(Model model) throws ParseException {

        // 임의의 데이터를 만듬.
        List<String> listData = new ArrayList<String>();
        listData.add("홍길동");
        listData.add("나그네");
        listData.add("홍길동");
        listData.add("홍길동");
        listData.add("홍길동");
        listData.add("홍길동");
        listData.add("홍길동");

        // 차트를 만들기 위한 통계자료도 구한다.
        List<Map<String, Object>> listStat = new ArrayList<Map<String, Object>>();

        List<entity> list2Data = new ArrayList<entity>();
        entity en = new entity();
        en.setCnt(1);
        list2Data.add(en);
        en = new entity();
        en.setCnt(2);
        list2Data.add(en);
        en = new entity();
        en.setCnt(3);
        list2Data.add(en);
        en = new entity();
        en.setCnt(4);
        list2Data.add(en);
        en = new entity();
        en.setCnt(5);
        list2Data.add(en);
        
        //class
        List<Employee> employees = new ArrayList<Employee>();
        Employee em;
        
        em = new Employee();
        em.setName("홍길동");
        em.setPayment(10000);
        em.setPosition("팀장");
        employees.add(em);
        
        em = new Employee();
        em.setName("길동");
        em.setPayment(20000);
        em.setPosition("팀장");
        employees.add(em);
        
        // 데이터를 담는 다.
        model.addAttribute("data", listData);
        model.addAttribute("cnt", list2Data);
        model.addAttribute("employees", employees);
        model.addAttribute("bonus", 0.1);
        
        model.addAttribute("filename","excel99.xls");
        model.addAttribute("template_path","C:/Users/si/Desktop/excel_template/param_formulas_template.xls");
        // 엑셀을 출력한다.
        return new ExcelExportView();
    }
	

}
