package com.servlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.DatabaseConnection;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");
       
		System.out.println(username+"  ::  "+password);
		DatabaseConnection db = new DatabaseConnection();
		HttpSession s = request.getSession();
		
	
		ResultSet rs = db.selectQuery("select * from employee  where email='"
				+ username + "' and password='"+password+"'");
		
		try {
			if (rs.next()) {
				s.setAttribute("username", username);
				s.setAttribute("eid", rs.getInt("eid"));
				
				response.sendRedirect("home.jsp");

			}
			else if(username.equals("admin") && password.equals("admin")){
				
				s.setAttribute("username", "admin");
				s.setAttribute("password", "admin");
				
				response.sendRedirect("addEmployee.jsp");
			}
			else {
				s.setAttribute("status", "Invalid Login Credentials");
				response.sendRedirect("Login.jsp");

			}
		} catch (SQLException e) {
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

	}

}
