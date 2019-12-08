package com.servlets;

import java.awt.Window;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.DatabaseConnection;


@WebServlet("/LogoutServlet")

public class LogoutServlet extends HttpServlet
{  
	
	/**
	 * This class method is called for Log Out of user
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)   // This class method is called for Log Out of user
                            throws ServletException, IOException 
    {  
    	 
    	response.setContentType("text/html");  
    	
    	HttpSession session1 = request.getSession(false);
    	
    	String val = request.getParameter("val");
    	
    	int eid = Integer.parseInt(session1.getAttribute("eid").toString());
    	System.out.println("eid :: "+eid);
    	java.sql.Date dt1 = new java.sql.Date(System.currentTimeMillis());
	 	String date = dt1.toString();
	 	
	 	System.out.println("Date is: "+date);
	 	
	 	String[] tokensVal = date.split("-");
	 	
	 	
		
    	
    	String query = "insert into wasted_hours(eid,date,month,year,waste_hours) values("+eid+",'"+tokensVal[2]+"','"+tokensVal[1]+"','"+tokensVal[0]+"','"+val+"')";
    	
    	DatabaseConnection db = new DatabaseConnection();
    	
    	//int inserted = db.updateQuery(query);
    	
        //System.out.println("Wasted Hours is: "+inserted);
        
    	
    	
    	db.closeConnection();
    	
        if(session1!=null)
        {
          
           session1.invalidate();
           response.sendRedirect("Login.jsp");
        }
        
        
        
       
       
       
     
       
          
        //out.print("You are successfully logged out!");  
       // RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/UserLogin.jsp");
		//dispatcher.forward(request, response);
          
    }  
}