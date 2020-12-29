package com.mice.crm.service;

import java.util.ArrayList;
import java.util.List;

public class EventOrganizerVO extends Event{
	
	private List<Organizer> organizerList;
	
	public List<Organizer> getOrganizerList(){
		if(organizerList == null)
			organizerList = new ArrayList<Organizer>();
		
		return organizerList;
	}
	
	public void setOrganizerList(List<Organizer> list){
		organizerList = list;
	}
	
}
