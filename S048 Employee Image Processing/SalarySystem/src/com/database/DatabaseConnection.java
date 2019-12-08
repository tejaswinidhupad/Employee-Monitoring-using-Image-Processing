package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DatabaseConnection {
	Connection con=null;
	public DatabaseConnection(){
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
		} 
		catch (ClassNotFoundException e)
		{
 			e.printStackTrace();
		}
	    try 
	    {
			con = DriverManager.getConnection("jdbc:mysql://localhost/salary_system?" +
			                                   "user=root&password=123456");
		} 
	    catch (SQLException e) 
		{
 			e.printStackTrace();
		}
 	}
	
	public ResultSet selectQuery(String query)
	{
		try
		{
		       PreparedStatement psSelect = con.prepareStatement(query);
		       System.out.println("select query : "+query);
		       return psSelect.executeQuery();
		       
		}
		
		
		catch(SQLException e)
		{
			System.out.println("Here is exception");
		    e.printStackTrace();
		    
		}
		
		return null;
	
	}
	
	public int updateQuery(String query)
	{System.out.println("query : "+query);
		System.out.println("--------------in update query-------");
		System.out.println(query);
		try
		{
		       PreparedStatement psUpdate = con.prepareStatement(query);
		       return psUpdate.executeUpdate();
		       
		}
		
		
		catch(SQLException e)
		{
		    e.printStackTrace();
		}
		
		return 0;
	}
	
	public void closeConnection()
	{
		try 
		{
		  if(con!=null)
		  {
			
				con.close();
		  } 
		  
		}
		catch (SQLException e) 
		  {
				
				e.printStackTrace();
		  }
	}
	
}
 