package com.mice.crm.service;

import java.util.List;

public class SummaryEventCalculator {

	public long SummaryTotalParticipant(List<EventVO> vo){
		int cal = 0;
		
		for(EventVO col : vo){
			cal += col.getJoin_personal_cnt();
		}
		return cal;
	}
	
	public long SummaryForeigner(List<EventVO> vo){
		int cal = 0;
		
		for(EventVO col : vo){
			cal += col.getJoin_foreigner_cnt();
		}
		return cal;
	}
	
	public long SummaryNational(List<EventVO> vo){
		int cal = 0;
		
		for(EventVO col : vo){
			cal += col.getJoin_foreigner_cnt();
		}
		return cal;
	}
	
	public long SummaryBooth(List<EventVO> vo){
		int cal = 0;
		
		for(EventVO col : vo){
			cal += col.getBooth_cnt();
		}
		return cal;
	}
	
	public long SummaryRentCost(List<EventVO> vo){
		int cal = 0;
		
		for(EventVO col : vo){
			try
			{
			cal += col.getRent_cost();
			}catch(Exception ex){
				
			}
		}
		return cal;
	}
	
	public long SummaryFoodCost(List<EventVO> vo){
		int cal = 0;
		
		for(EventVO col : vo){
			cal += col.getFood_cost();
		}
		return cal;
	}
	
	public long SummaryAVCost(List<EventVO> vo){
		int cal = 0;
		
		for(EventVO col : vo){
			cal += col.getAv_rental_cost();
		}
		return cal;
	}
	
	public long SummaryManageCost(List<EventVO> vo){
		int cal = 0;
		
		for(EventVO col : vo){
			cal += col.getManager_cost();
		}
		return cal;
	}
	
	public long SummaryTotalCost(List<EventVO> vo){
		int cal = 0;
		
		for(EventVO col : vo){
			cal += col.getManager_cost();
		}
		return cal;
	}
	
	public long TotalRentArea(){
		return 7412;
	}
	
	public long TotalInnerRentArea(){
		return 2272;
	}
	
	public long TotalCost(){
		return 18727000;
	}
	
	public long TotalInnerCost(){
		return 3180000;
	}
	public float SummaryArea(List<EventVO> vo, List<CRMCodeExt> vo2){
		float cal = 0;
		
		for(EventVO col : vo){
			int day = 0;
			try
			{
				day = Integer.parseInt(col.getDay());
			}catch(Exception ex){
				
			}
			if(col.getRent_facility_text() != null){
				String[] spl = col.getRent_facility_text().split(",");
				for(int i=0;i<spl.length;i++){
					if(spl[i].equals(""))
						continue;
					for(int j=0;j<vo2.size();j++){
						if(vo2.get(j).getParent_idx() == Integer.parseInt(spl[i])){
							try
							{
								cal += (Integer.parseInt(vo2.get(j).getValue()) * day);
							}catch(Exception ex){
								System.out.println(ex.getMessage());
							}
						}
					}
					
				}
			}
		}
		return cal;
	}
	
	public float SummaryInnerArea(List<EventVO> vo, List<CRMCodeExt> vo2){
		float cal = 0;
		
		for(EventVO col : vo){
			int day = 0;
			try
			{
				day = Integer.parseInt(col.getDay());
			}catch(Exception ex){
				
			}
			if(col.getRent_facility_text() != null){
				String[] spl = col.getRent_facility_text().split(",");
				for(int i=0;i<spl.length;i++){
					if(spl[i].equals(""))
						continue;
					for(int j=0;j<vo2.size();j++){
						if(vo2.get(j).getParent_idx() == Integer.parseInt(spl[i]))
								cal += (Integer.parseInt(vo2.get(j).getValue()) * day);
					}
					
				}
			}
		}
		return cal;
	}
	
	public float SummaryAreaCost(List<EventVO> vo, List<CRMCodeExt> vo2){
		float cal = 0;
		
		for(EventVO col : vo){
			int day = 0;
			try
			{
				day = Integer.parseInt(col.getDay());
			}catch(Exception ex){
				
			}
			if(col.getRent_facility_text() != null){
				String[] spl = col.getRent_facility_text().split(",");
				for(int i=0;i<spl.length;i++){
					if(spl[i].equals(""))
						continue;
					for(int j=0;j<vo2.size();j++){
						if(vo2.get(j).getParent_idx() == Integer.parseInt(spl[i]))
								cal += (Integer.parseInt(vo2.get(j).getValue()) * day);
					}
					
				}
			}
		}
		return cal;
	}
	
}
