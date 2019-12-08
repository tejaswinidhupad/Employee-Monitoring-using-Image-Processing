package com.util;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class demo {

	
	public static void main(String[] args) throws SQLException {
	String time1 = "00:10:05";
    	
    	String time2="01:00:59";
    	
    	SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
    	timeFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
try{
    	Date date1 = timeFormat.parse(time1);
    	Date date2 = timeFormat.parse(time2);

    	long sum = date1.getTime() + date2.getTime();

    	String date3 = timeFormat.format(new Date(sum));
    	System.out.println("The sum is "+date3);
    	
    	
    	String h=date3;
    	String[] h1=h.split(":");
    	 
    	float hour=Integer.parseInt(h1[0]);
    	float minute=Integer.parseInt(h1[1]);
    	float second=Integer.parseInt(h1[2]);
    	 
    	        float temp;
    	        temp = second/60+ (minute ) + ( hour*60);
    	 
    	        System.out.println("secondsss  ::   "+temp);
 
    //s.setAttribute("tt",date3);
	}
catch(Exception e){}
}}
