package com.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import com.database.DatabaseConnection;

/**
 * Servlet implementation class test
 */
@WebServlet("/test")
public class test extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public test() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("in setrank servlet post");
		String eid=request.getParameter("empId");
		String rank=request.getParameter("rating");
		
		System.out.println("eid :: "+eid);  
		System.out.println("rank :: "+rank);
		DatabaseConnection db=new DatabaseConnection();
		int i=db.updateQuery("update employee set rank='"+rank+"' where eid='"+eid+"'");
		JSONObject jo=new JSONObject();



		{
		try {
			if(i==1)
			jo.put("status","Set");
			else 
				jo.put("status","database error");
		 
			
			db.closeConnection();
			response.setContentType("application/json");
			response.getWriter().print(jo.toString());
			System.out.println(jo.toString());
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
