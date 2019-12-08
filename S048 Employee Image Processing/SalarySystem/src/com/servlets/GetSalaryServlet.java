package com.servlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.crypto.Data;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.database.DatabaseConnection;
import com.sendmail.EmailAttachmentSender; 

/**
 * Servlet implementation class GetSalaryServlet
 */
@WebServlet("/GetSalaryServlet")
public class GetSalaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetSalaryServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	String month="";
	String year="";
	DatabaseConnection db = new DatabaseConnection();
 	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
 		HttpSession s=request.getSession();
		JSONArray ja = new JSONArray();
		  month = request.getParameter("month");
		  year = request.getParameter("year");
		  s.setAttribute("month", month);
		  
		  int wastedMinutes = 0;
		  s.setAttribute("year", year);
		  ResultSet rs2=db.selectQuery("select * from salary where month='"+month+"' and year='"+year+"'");
		 
		int workdays = Integer.parseInt(request.getParameter("workdays"));
		int totalWorkingHours = workdays * 8;
		System.out.println("total working hours    "+totalWorkingHours);
		int actualWorkHours = 0;
		
		int actualWorkMinutes = 0;
		
		int oneHourSal = 0;
		
		float oneHourSalFloat = 0;
		
		int oneMinuteSalary = 0;
		
		int grossSal = 0;
		
		float wastedHoursToSend = 0;
		
		int wastedHours = 0;
		double actualSalary = 0;
		String email = "";
		String name = "";
		
		ResultSet rs1 = null;
 		try {
			 if(!rs2.next()){
					ResultSet rs = db
							.selectQuery("select eid,name,email,salary from employee");
			while (rs.next()) {
				email = rs.getString("email");
				name = rs.getString("name"); 
				int eid = rs.getInt("eid");
				System.out.println("eid :: " + eid);
				actualSalary = rs.getDouble("salary");
				
				System.out.println("actual slar "+actualSalary);
				oneHourSal = (int) (actualSalary / totalWorkingHours);
				
				oneHourSalFloat = oneHourSal;
				
				 rs1 = db
						.selectQuery("select wasted_minutes from wasted_hours_per_month where eid='"
								+ eid
								+ "' and month='"
								+ month
								+ "' and year='" + year + "'");
				if (rs1.next()) {
					System.out.println("in if");
					
						wastedHours = Math.round(Float.parseFloat(rs1
								.getString("wasted_minutes").toString()) / 60);
					
					
					System.out.println("wasted minutes : "+rs1
							.getString("wasted_minutes"));
					
					wastedMinutes = (int) Math.ceil(Float.parseFloat(rs1
							.getString("wasted_minutes")));
					
					wastedHoursToSend = Math.round(Float.parseFloat(rs1
							.getString("wasted_minutes").toString()) / 60);
					
						System.out.println("wastedHours :: " + wastedHours);
						
						System.out.println("totalWorkingHours : "+totalWorkingHours);
						
						float grossSalFloat = 0;
						
						if(wastedMinutes > 1)
						{
							
							actualWorkMinutes = totalWorkingHours * 60 - wastedMinutes;
							
							
							System.out.println("*************************************");
							
							System.out.println("New Actual Working minutes : "+actualWorkMinutes);
							
							
							System.out.println("oneHourSal : "+oneHourSal);
							
							System.out.println("wastedMinutes : "+wastedMinutes);
							
							System.out.println("*************************************");
							
							grossSalFloat = Float.parseFloat(Integer.toString(actualWorkMinutes)) * (oneHourSalFloat / 60);
							
							grossSal = (int)grossSalFloat;
							
							System.out.println("grossSal : "+grossSal);
							actualWorkHours = totalWorkingHours - wastedHours;
							System.out.println("actual work jrs "+actualWorkHours);
						
						}
						else
						{
							
							actualWorkHours = totalWorkingHours;
							
							grossSal = actualWorkHours * oneHourSal;
							System.out.println("actual work jrs "+actualWorkHours);
						
							
							
							
						}
						
					
					  int y= db.updateQuery(
					  "insert into salary(eid,month,year,actual_salary,total_working_days,total_working_hours,actual_working_hours,gross_salary) values("
					  +
					  eid+",'"+month+"','"+year+"','"+actualSalary+"','"+workdays
					  +
					  "','"+totalWorkingHours+"','"+actualWorkHours+"','"+grossSal
					  +"')"); if(y==1){
					  System.out.println("salary calculation done"); }
					 
				} else {
					System.out.println("in else");
					wastedHours = 0;
					actualWorkHours=totalWorkingHours;
					System.out.println("wastedHours :: " + wastedHours);
					//actualWorkHours = totalWorkingHours - wastedHours;
					grossSal = (int) actualSalary;
					 
					  int y= db.updateQuery(
					  "insert into salary(eid,month,year,actual_salary,total_working_days,total_working_hours,actual_working_hours,gross_salary) values("
					  +
					  eid+",'"+month+"','"+year+"','"+actualSalary+"','"+workdays
					  +
					  "','"+totalWorkingHours+"','"+actualWorkHours+"','"+grossSal
					  +"')"); 
					  if(y==1){
					  System.out.println("salary calculation done"); }
					  else{
					  System.out.println("error fail"); }
					 
				}
				JSONObject jo = new JSONObject();
				jo.put("eid", eid);
				jo.put("month", month);
				jo.put("year", year);
				jo.put("workdays", workdays);
				jo.put("wastedHours", wastedHours);
				jo.put("totalWorkingHours", totalWorkingHours);
				jo.put("actualWorkHours", actualWorkHours);
				jo.put("actualSal", actualSalary);
				jo.put("grossSal", grossSal);
				ja.put(jo);

				String ss = "<h3>Hello</h3>"+name+"<br><h3>MONTHLY WORK DETAIL</h3> <hr>";
				ss += "month : " + month + "<br>" + "year : " + year + "<br>"
						+ "workdays : " + workdays + "<br>" + "wastedHours : "
						+ wastedHours + "<br>" + "totalWorkingHours : "
						+ totalWorkingHours + "<br>" + "actualWorkHours : "
						+ actualWorkHours + "<br>" + "actualSal : "
						+ actualSalary + "<br>" + "grossSal : " + grossSal;
				EmailAttachmentSender.sendEmailWithAttachments(email, ss);
			}
 		 }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		finally
		{
			
			if(rs2 != null)
				try {
					rs2.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			if(rs1 != null)
				try {
					rs1.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			//db.closeConnection();
			
		}

		response.setContentType("application/json");
		response.getWriter().print(ja.toString());

	}
		

}