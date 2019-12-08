package com.servlets;

import java.io.IOException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.DatabaseConnection;
import com.sendmail.EmailAttachmentSender;
import com.util.Password;

 
/**
 * Servlet implementation class AddEmployee
 */
@WebServlet("/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddEmployeeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String name=null;
		// TODO Auto-generated method stub
			DatabaseConnection db=new DatabaseConnection();

		String position=null,email=null,address=null,doj=null,contact=null,password=null,flag=null;
		Double salary=0.0;
		HttpSession session=request.getSession();
		name=request.getParameter("name");
		position=request.getParameter("position");
		email=request.getParameter("email");
		address=request.getParameter("address");
		doj=request.getParameter("doj");
		contact=request.getParameter("contact");
 		password=Password.password(email);
		salary=Double.parseDouble(request.getParameter("salary"));
		java.sql.Date dojn = null;
		SimpleDateFormat format = new SimpleDateFormat("dd-mm-yyyy");
	     java.util.Date parsed;
		try {
			parsed = format.parse(doj);
			 dojn = new java.sql.Date(parsed.getTime());   
			 
 			 
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	
 		System.out.println("email:: "+email);
		String msg="Username : "+email+"  And Password : "+password;
		ResultSet rs=db.selectQuery("select * from employee where email='"+email+"'");
		try {
			if(rs.next()){
				flag="This user already exist";
			}
			else{
				int i=db.updateQuery("insert into employee(name,email,password,address,doj,contact,position,salary) values('"+name+"','"+email+"','"+password+"','"+address+"','"+dojn+"','"+contact+"','"+position+"','"+salary+"')");
				if(i==1){
					System.out.println("Added");
					flag="Employee added successfully";
					EmailAttachmentSender.sendEmailWithAttachments(email, msg);
				}
				else{
					flag="Some thing wrong,please try again";
				}
			}
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
			
			db.closeConnection();
			
			
		}
		
		session.setAttribute("flag",flag);
		response.sendRedirect("addEmployee.jsp");
	}

}
