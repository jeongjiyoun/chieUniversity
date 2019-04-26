package com.university.chie.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.stereotype.Service;

@Service
public class CalendarDay {
	
	public String getDateDay(String date) throws ParseException {
	     
	    String day = "" ;
	    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/mm/yyyy") ;
	    Date nDate = dateFormat.parse(date);
	     
	    Calendar cal = Calendar.getInstance() ;
	    cal.setTime(nDate);
	     
	    int dayNum = cal.get(Calendar.DAY_OF_WEEK) ;
	    switch(dayNum){
	        case 1:
	            day = "土";
	            break ;
	        case 2:
	            day = "日";
	            break ;
	        case 3:
	            day = "月";
	            break ;
	        case 4:
	            day = "月";
	            break ;
	        case 5:
	            day = "水";
	            break ;
	        case 6:
	            day = "木";
	            break ;
	        case 7:
	            day = "金";
	            break ;
	             
	    }
	     
	    return day ;
	}

}
