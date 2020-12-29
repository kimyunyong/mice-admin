package com.mice.common.collection;

public class Custom {
	public static boolean contains_list(java.lang.Object list, Object o){
		try
		{
			return ((java.util.List)list).contains(o);
		}catch(Exception ex){
			return false;
		}
	}
}
