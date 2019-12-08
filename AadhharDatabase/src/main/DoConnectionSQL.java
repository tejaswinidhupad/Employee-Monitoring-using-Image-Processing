package main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DoConnectionSQL 
{
	public static Connection getConnection() throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/aviation","root","root");
		
		return con;
	}
	
	/*public static void main(String args[]) throws ClassNotFoundException, SQLException 
	{
		Connection con=getConnection();
	}*/
}

