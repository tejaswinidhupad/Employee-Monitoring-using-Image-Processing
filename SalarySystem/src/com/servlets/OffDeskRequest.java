package com.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.DatabaseConnection;

/**
 * Servlet implementation class OffDeskRequest
 */
@WebServlet("/OffDeskRequest")
public class OffDeskRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OffDeskRequest() {
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
		System.out.println("in dopost");
		HttpSession s=request.getSession();
		DatabaseConnection db=new DatabaseConnection();
	    int eid=Integer.parseInt(s.getAttribute("eid")+"");
   		String date=request.getParameter("date");
  		String reason=request.getParameter("reason");
  		String time=request.getParameter("time");	
  		System.out.println(date);
		s.setAttribute("status","Request Added");
  		db.updateQuery("insert into off_desk_request(eid,date,reason,time) values('"+eid+"','"+date+"','"+reason+"','"+time+"')");
		
  		db.closeConnection();
  		
  		response.sendRedirect("addOffDeskRequest.jsp");
	}

}
