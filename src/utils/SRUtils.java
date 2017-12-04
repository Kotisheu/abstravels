package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Flight;

public class SRUtils {
	//search and reservation dbutils
	  public static List<Flight> findFlights(Connection conn, String ah) throws SQLException {
	        String sql = "Select a.Code, a.Name, a.Price from Product a where a.Code=?";
	 
	        PreparedStatement pstm = conn.prepareStatement(sql);
	        //pstm.setString(1, code);
	        List<Flight> flights = new ArrayList<>();
	        ResultSet rs = pstm.executeQuery();
	 
	        while (rs.next()) {
	            
	            return flights;
	        }
	        return null;
	    }
	 
}
