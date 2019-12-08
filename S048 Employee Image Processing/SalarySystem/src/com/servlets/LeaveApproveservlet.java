package com.servlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.print.DocFlavor.STRING;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import com.database.DatabaseConnection;
import com.sendmail.EmailAttachmentSender;

/**
 * Servlet implementation class LeaveApproveservlet
 */
@WebServlet("/LeaveApproveservlet")
public class LeaveApproveservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LeaveApproveservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	String email="";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int id=Integer.parseInt(request.getParameter("lid"));
		
		int leaveRes = Integer.parseInt(request.getParameter("leaveRes"));
		String date=request.getParameter("date");
		String eid=request.getParameter("eid");
		String type=request.getParameter("type");
		System.out.println("type :: "+type);
 		String strDate[]=date.split("/");
		System.out.println(strDate[0]);
		System.out.println(strDate[1]);
		System.out.println(strDate[2]);
		System.out.println(id+"  "+leaveRes);
		String status="";
		DatabaseConnection db=new DatabaseConnection();
		
		ResultSet rs=db.selectQuery("select email from employee where eid='"+eid+"'");
		try {
			if(rs.next())
			email=rs.getString("email");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		finally
		{
			
			if(rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
		}
		
		if(leaveRes==1){
		db.updateQuery("update leave_request set status='Approved' where id='"+id+"'");
		if(type.equals("Paid"))
		{
		System.out.println("in type paid");
		}
		else
		{
			System.out.println("in type unpaid");
			int flag=0;
			System.out.println("0987654987654");
			ResultSet rs2=db.selectQuery("select * from wasted_hours_per_month where eid='"+eid+"' and month='"+strDate[0]+"' and year='"+strDate[2]+"'");
			try {
				while(rs2.next())
				{
					int a=db.updateQuery("update wasted_hours_per_month set wasted_minutes=wasted_minutes+"+480+" where month='"+strDate[0]+"' and year='"+strDate[2]+"' and eid='"+eid+"'");
					     System.out.println(a); 
					     flag=1;
						
				}
				
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(flag==0)
			{
				
					int ii = db.updateQuery("insert into  wasted_hours_per_month(eid,month,year,wasted_minutes) values(  '"
									+ eid
									+ "','"
									+ strDate[0]
									+ "' ,'"
									+ strDate[2] + "','" + 480 + "' )");
				
			}
			
			
			
			
			
		}
 		status="approved";
		System.out.println("status :: "+status);
		}
		else if(leaveRes==0){
			db.updateQuery("update leave_request set status='Disapproved' where id='"+id+"'");
			status="Disapproved";
			System.out.println("status :: "+status);
		}
		
		String msg="Your leave for "+date+" is "+status;
		JSONObject json=new JSONObject();
		try {
			EmailAttachmentSender.sendEmailWithAttachments(email, msg);
 			json.put("Result",status);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		db.closeConnection();
		
		response.setContentType("application/json");
		response.getWriter().print(json.toString());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("in post ");
		int id=Integer.parseInt(request.getParameter("lid"));
		int leaveRes = Integer.parseInt(request.getParameter("leaveRes"));
		String date=request.getParameter("date");
		String eid=request.getParameter("eid");
		int wh=Integer.parseInt(request.getParameter("wh"));
		String strDate[]=date.split("/");
		System.out.println(strDate[0]);
		System.out.println(strDate[1]);
		System.out.println(strDate[2]);
		System.out.println(id+"  "+leaveRes);
		System.out.println("time ============="+wh);
		DatabaseConnection db=new DatabaseConnection();
		String status="";
		
		ResultSet rs=db.selectQuery("select email from employee where eid='"+eid+"'");
		try {
			if(rs.next())
			email=rs.getString("email");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		finally
		{
			
			if(rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			
			
			
			
		}
		
		if(leaveRes==1){
		db.updateQuery("update off_desk_request set status='Approved' where id='"+id+"'");
		int flag=0;
		ResultSet rs2=db.selectQuery("select * from wasted_hours_per_month where eid='"+eid+"' and month='"+strDate[0]+"' and year='"+strDate[2]+"'");
		try {
			while(rs2.next())
			{
				int a=db.updateQuery("update wasted_hours_per_month set wasted_minutes=wasted_minutes+"+(wh*60)+" where month='"+strDate[0]+"' and year='"+strDate[2]+"' and eid='"+eid+"'");
				     System.out.println(a); 
				     flag=1;
					
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(flag==0)
		{
			
				int ii = db.updateQuery("insert into  wasted_hours_per_month(eid,month,year,wasted_minutes) values(  '"
								+ eid
								+ "','"
								+ strDate[0]
								+ "' ,'"
								+ strDate[2] + "','" + (wh*60) + "' )");
			
		}
				
		status="approved";
		}
		else if(leaveRes==0){
			db.updateQuery("update off_desk_request set status='Disapproved' where id='"+id+"'");
			status="Disapproved";
	}
		String msg="Your leave for :"+date+" is :"+status;

		JSONObject json=new JSONObject();
		try {
			EmailAttachmentSender.sendEmailWithAttachments(email, msg);
 			json.put("Result",status);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		db.closeConnection();
		
		response.setContentType("application/json");
		response.getWriter().print(json.toString());

}
}