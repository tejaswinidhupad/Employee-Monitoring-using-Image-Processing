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

import org.json.JSONArray;
import org.json.JSONObject;

import com.database.DatabaseConnection;

/**
 * Servlet implementation class ShowSalary
 */
@WebServlet("/ShowSalary")
public class ShowSalary extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowSalary() {
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
		JSONArray ja=new JSONArray();
		DatabaseConnection db=new DatabaseConnection();
		ResultSet rs=db.selectQuery("select * from salary where month='"+s.getAttribute("month")+"' and year='"+s.getAttribute("year")+"'");
		try {
			while(rs.next()){
				JSONObject jo = new JSONObject();
				jo.put("eid", rs.getInt("eid"));
				jo.put("month", rs.getString("month"));
				jo.put("year", rs.getString("year"));
				jo.put("workdays", rs.getString("total_working_days"));
 				jo.put("totalWorkingHours", rs.getString("total_working_hours"));
				jo.put("actualWorkHours", rs.getString("actual_working_hours"));
				jo.put("actualSal", rs.getString("actual_salary"));
				jo.put("grossSal", rs.getString("gross_salary"));
				ja.put(jo);

 			}
			response.setContentType("application/json");
			response.getWriter().print(ja.toString());

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

}
