package dbconnectiion;

import java.sql.*;

public class DBcon {

	    public static Connection getConnection() {
	    	 Connection con=null;
	        try {
	           
	                Class.forName("com.mysql.cj.jdbc.Driver");
	                con = DriverManager.getConnection(
	                        "jdbc:mysql://localhost:3306/moviedb",
	                        "root",
	                        "Anitha@2003"
	                );
	            
	        } catch(Exception e){
	            e.printStackTrace();
	        }
	        return con;
	    }
	}


