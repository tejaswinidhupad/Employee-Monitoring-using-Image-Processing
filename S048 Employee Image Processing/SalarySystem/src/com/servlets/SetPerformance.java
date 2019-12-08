package com.servlets;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.database.DatabaseConnection;

/**
 * Servlet implementation class SetPerformance
 */
@WebServlet("/SetPerformance")
public class SetPerformance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SetPerformance() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 DatabaseConnection db=new DatabaseConnection();
	   		ResultSet rs=db.selectQuery("SELECT * FROM salary_system.employee");
	  		JSONArray ja=new JSONArray();
	  		try {
				while(rs.next())
				{
					JSONObject jo=new JSONObject();
					jo.put("eid",rs.getString("eid"));
					jo.put("name",rs.getString("name"));
					jo.put("position",rs.getString("position"));
					jo.put("rank",rs.getString("rank"));
					ja.put(jo);
				}
				response.setContentType("application/json");
				response.getWriter().print(ja.toString());
				System.out.println(ja.toString());
	  		} catch (Exception e1) {
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
				
				
				db.closeConnection();
				
				
			}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
			response.setContentType("application/json");
			response.getWriter().print(jo.toString());
			System.out.println(jo.toString());
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		
		db.closeConnection();

	}

}
