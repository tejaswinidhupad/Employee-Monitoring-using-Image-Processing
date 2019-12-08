package com.servlets;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.DatabaseConnection;

/**
 * Servlet implementation class addLeaveRequestServlet
 */
@WebServlet("/addLeaveRequestServlet")
public class addLeaveRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addLeaveRequestServlet() {
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
		// TODO Auto-generated method stub
		
		HttpSession s=request.getSession();
		int eid=Integer.parseInt(s.getAttribute("eid")+"");
		DatabaseConnection db=new DatabaseConnection();
  		String date=request.getParameter("date");
  		String reason=request.getParameter("reason");
  		String type=request.getParameter("type");	
  		System.out.println(date);
  		s.setAttribute("status","Request Added");
  		db.updateQuery("insert into leave_request(eid,date,reason,type) values('"+eid+"','"+date+"','"+reason+"','"+type+"')");
		
  		db.closeConnection();
  		
  		response.sendRedirect("addLeaveRequest.jsp");
 	}

}
