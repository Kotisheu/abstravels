package utils;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Flights;

public class FlightsUtils {
	
	public static List<Flights> queryAllFlights(Connection conn) throws SQLException {
		String sql = "SELECT * FROM ABSTravellings.Flight;";

		PreparedStatement pstm = conn.prepareStatement(sql);

		ResultSet rs = pstm.executeQuery();

		List<Flights> list = new ArrayList<Flights>();

		while (rs.next()) {
			String airlineID = rs.getString("AirlineID");
			int flightNo = rs.getInt("FlightNo");
			int noOfSeats = rs.getInt("NoOfSeats");
			String daysOp = rs.getString("DaysOperating");
			int minStay = rs.getInt("MinLengthOfStay");
			int maxStay = rs.getInt("MaxLengthOfStay");

			Flights flight = new Flights();
			flight.setAirlineID(airlineID);
			flight.setFlightNo(flightNo);
			flight.setNoOfSeats(noOfSeats);
			flight.setDaysOp(daysOp);
			flight.setMinStay(minStay);
			flight.setMaxStay(maxStay);
			list.add(flight);

		}

		return list;
	}

}
