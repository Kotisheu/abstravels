package utils;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Flights;
import beans.Reservation;

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

	public static List<Reservation> queryRevByFlight (Connection conn, String flightNo, String airlineId) throws SQLException {
		String sql = "SELECT DISTINCT(R.ResrNo), I.AirlineID, I.FlightNo, R.ResrNo, R.TotalFare, R.BookingFee "
				+ "FROM  ABSTravellings.Reservation R, ABSTravellings.Includes I, ABSTravellings.Airline A "
				+ "WHERE I.FlightNo = " + flightNo + " AND R.ResrNo = I.ResrNo AND I.AirlineID=A.ID AND A.ID = '" + airlineId + "';";

		PreparedStatement pstm = conn.prepareStatement(sql);

		ResultSet rs = pstm.executeQuery();

		List<Reservation> list = new ArrayList<Reservation>();

		while (rs.next()) {
			String rairlineID = rs.getString("AirlineID");
			int rflightNo = rs.getInt("FlightNo");
			int resrNo = rs.getInt("ResrNo");
			float totalFare = rs.getFloat("TotalFare");
			float bookingFee = rs.getFloat("BookingFee");
			
			Reservation reservation = new Reservation ();
			reservation.setAirlineId(rairlineID);
			reservation.setFlightNo(rflightNo);
			reservation.setReservationNumber(resrNo);
			reservation.setTotalFare(totalFare);
			reservation.setBookingFee(bookingFee);
			
			list.add(reservation);

		}

		return list;
	}
	
}
