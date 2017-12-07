package utils;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import beans.Bids;
import beans.Leg;
import beans.Reservation;

public class ReservationUtils {
	
	public static int cancelReservation (Connection conn, String reservationNumber) throws SQLException {
		String sql2 = "DELETE FROM ABSTravellings.Reservation WHERE ResrNo = " + reservationNumber + ";";
		String sql = "DELETE FROM ABSTravellings.Includes WHERE ResrNo = " + reservationNumber + ";";
		
		PreparedStatement pstm = conn.prepareStatement(sql);

		int rs = pstm.executeUpdate();
		
		pstm = conn.prepareStatement(sql2);
		rs = pstm.executeUpdate();
		
		return rs;
	}

	public static List<Reservation> queryPassengerReservation(Connection conn) throws SQLException {
		String sql = "SELECT r.AccountNo, r.ResrNo, r.ResrDate, r.BookingFee, r.TotalFare, r.RepSSN "
				+ "FROM ABSTravellings.Reservation R, ABSTravellings.Customer C "
				+ "WHERE C.Id= 1  AND R.AccountNo= C.AccountNo " + "GROUP BY R.ResrNo;";

		PreparedStatement pstm = conn.prepareStatement(sql);

		ResultSet rs = pstm.executeQuery();

		List<Reservation> list = new ArrayList<Reservation>();

		while (rs.next()) {
			int resNum = rs.getInt("ResrNo");
			Date resDate = rs.getDate("ResrDate");
			float bookingFee = rs.getFloat("BookingFee");
			float totalFare = rs.getFloat("TotalFare");
			int ssn = rs.getInt("RepSSN");
			int accountNo = rs.getInt("AccountNo");

			Reservation reservation = new Reservation();
			reservation.setReservationNumber(resNum);
			reservation.setReservationDate(resDate);
			reservation.setBookingFee(bookingFee);
			reservation.setTotalFare(totalFare);
			reservation.setSSN(ssn);
			reservation.setAccountNo(accountNo);
			list.add(reservation);
		}

		return list;

	}
	
	public static List<Reservation> queryByCustomer(Connection conn, String firstName, String lastName) throws SQLException {
		
		
		String sql = "SELECT r.ResrNo, r.ResrDate, i.FlightNo, r.BookingFee, r.TotalFare, r.RepSSN, r.AccountNo, p.FirstName, p.LastName "
				+ "FROM abstravellings.reservation r, abstravellings.customer c, abstravellings.person p, abstravellings.includes i "
				+ "WHERE r.AccountNo = c.AccountNo AND c.Id = p.Id AND r.ResrNo = i.ResrNo AND  p.FirstName = \"" + firstName + "\" AND p.LastName = \"" + lastName + "\";";
		
		System.out.println(sql);
		
		PreparedStatement pstm = conn.prepareStatement(sql);

		ResultSet rs = pstm.executeQuery();

		List<Reservation> list = new ArrayList<Reservation>();

		while (rs.next()) {
			int resNum = rs.getInt("ResrNo");
			Date resDate = rs.getDate("ResrDate");
			float bookingFee = rs.getFloat("BookingFee");
			float totalFare = rs.getFloat("TotalFare");
			int ssn = rs.getInt("RepSSN");
			int accountNo = rs.getInt("AccountNo");
			int flightNoInt = rs.getInt("FlightNo");
			String cfirstName = rs.getString("FirstName");
			String clastName = rs.getString("LastName");

			Reservation reservation = new Reservation();
			reservation.setReservationNumber(resNum);
			reservation.setReservationDate(resDate);
			reservation.setBookingFee(bookingFee);
			reservation.setTotalFare(totalFare);
			reservation.setSSN(ssn);
			reservation.setAccountNo(accountNo);
			reservation.setFlightNo(flightNoInt);
			reservation.setFirstName(cfirstName);
			reservation.setLastName(clastName);
			list.add(reservation);
			
			System.out.println(Arrays.toString(list.toArray()));
	
		}

		return list;
	}
	
	public static List<Reservation> queryByFlight(Connection conn, String flightNo) throws SQLException {
		String sql = "SELECT r.ResrNo, r.ResrDate, i.FlightNo, r.BookingFee, r.TotalFare, r.RepSSN, r.AccountNo, p.FirstName, p.LastName "
				+ "FROM abstravellings.reservation r, abstravellings.customer c, abstravellings.person p, abstravellings.includes i "
				+ "WHERE r.AccountNo = c.AccountNo AND c.Id = p.Id AND r.ResrNo = i.ResrNo AND i.FlightNo = " + flightNo + ";";
		
		System.out.println(sql);
		
		PreparedStatement pstm = conn.prepareStatement(sql);

		ResultSet rs = pstm.executeQuery();

		List<Reservation> list = new ArrayList<Reservation>();

		while (rs.next()) {
			int resNum = rs.getInt("ResrNo");
			Date resDate = rs.getDate("ResrDate");
			float bookingFee = rs.getFloat("BookingFee");
			float totalFare = rs.getFloat("TotalFare");
			int ssn = rs.getInt("RepSSN");
			int accountNo = rs.getInt("AccountNo");
			int flightNoInt = rs.getInt("FlightNo");
			String firstName = rs.getString("FirstName");
			String lastName = rs.getString("LastName");

			Reservation reservation = new Reservation();
			reservation.setReservationNumber(resNum);
			reservation.setReservationDate(resDate);
			reservation.setBookingFee(bookingFee);
			reservation.setTotalFare(totalFare);
			reservation.setSSN(ssn);
			reservation.setAccountNo(accountNo);
			reservation.setFlightNo(flightNoInt);
			reservation.setFirstName(firstName);
			reservation.setLastName(lastName);
			list.add(reservation);
			
			System.out.println(Arrays.toString(list.toArray()));
	
		}

		return list;
	}
	
	public static List<Reservation> queryAllReservation(Connection conn) throws SQLException {
		String sql = "SELECT r.ResrNo, r.ResrDate, i.FlightNo, r.BookingFee, r.TotalFare, r.RepSSN, r.AccountNo, p.FirstName, p.LastName "
				+ "FROM abstravellings.reservation r, abstravellings.customer c, abstravellings.person p, abstravellings.includes i "
				+ "WHERE r.AccountNo = c.AccountNo AND c.Id = p.Id AND r.ResrNo = i.ResrNo;";
		
		PreparedStatement pstm = conn.prepareStatement(sql);

		ResultSet rs = pstm.executeQuery();

		List<Reservation> list = new ArrayList<Reservation>();

		while (rs.next()) {
			int resNum = rs.getInt("ResrNo");
			Date resDate = rs.getDate("ResrDate");
			float bookingFee = rs.getFloat("BookingFee");
			float totalFare = rs.getFloat("TotalFare");
			int ssn = rs.getInt("RepSSN");
			int accountNo = rs.getInt("AccountNo");
			int flightNo = rs.getInt("FlightNo");
			String firstName = rs.getString("FirstName");
			String lastName = rs.getString("LastName");

			Reservation reservation = new Reservation();
			reservation.setReservationNumber(resNum);
			reservation.setReservationDate(resDate);
			reservation.setBookingFee(bookingFee);
			reservation.setTotalFare(totalFare);
			reservation.setSSN(ssn);
			reservation.setAccountNo(accountNo);
			reservation.setFlightNo(flightNo);
			reservation.setFirstName(firstName);
			reservation.setLastName(lastName);
			list.add(reservation);
		}

		return list;
	}

	public static List<Reservation> queryCurrentReservation(Connection conn) throws SQLException {
		String sql = "SELECT r.AccountNo, r.ResrNo, r.ResrDate, r.BookingFee, r.TotalFare, r.RepSSN "
				+ "FROM ABSTravellings.Reservation R, ABSTravellings.Customer C, ABSTravellings.Includes I "
				+ "WHERE C.Id=1 AND R.AccountNo= C.AccountNo AND I.ResrNo = R.ResrNo AND I.Date >= now() "
				+ "GROUP BY R.ResrNo;";
		
		PreparedStatement pstm = conn.prepareStatement(sql);

		ResultSet rs = pstm.executeQuery();

		List<Reservation> list = new ArrayList<Reservation>();

		while (rs.next()) {
			int resNum = rs.getInt("ResrNo");
			Date resDate = rs.getDate("ResrDate");
			float bookingFee = rs.getFloat("BookingFee");
			float totalFare = rs.getFloat("TotalFare");
			int ssn = rs.getInt("RepSSN");
			int accountNo = rs.getInt("AccountNo");

			Reservation reservation = new Reservation();
			reservation.setReservationNumber(resNum);
			reservation.setReservationDate(resDate);
			reservation.setBookingFee(bookingFee);
			reservation.setTotalFare(totalFare);
			reservation.setSSN(ssn);
			reservation.setAccountNo(accountNo);
			list.add(reservation);
		}

		return list;
	}


	public static List<Leg> queryTripItinerary(Connection conn, String reservationNum) throws SQLException {
		String sql = "SELECT R.ResrNo,I.AirlineID,I.FlightNo, I.LegNo, I.Date,L.DepAirportID, L.DepTime, L.ArrAirportID, L.ArrTIme "
				+ "FROM ABSTravellings.Reservation R, ABSTravellings.Customer C, ABSTravellings.Includes I, ABSTravellings.Leg L "
				+ "WHERE  R.AccountNo= C.AccountNo AND I.ResrNo = R.ResrNo AND R.ResrNo = " + reservationNum + " AND I.LegNo= L.LegNo;";
		
		PreparedStatement pstm = conn.prepareStatement(sql);

		ResultSet rs = pstm.executeQuery();

		List<Leg> list = new ArrayList<Leg>();

		while (rs.next()) {
			int resrNo = rs.getInt("ResrNo");
			String airlineID = rs.getString("AirlineID");
			int flightNo = rs.getInt("FlightNo");
			int legNo = rs.getInt("LegNo");
			Date resDate = rs.getDate("Date");
			String depAirportID = rs.getString("DepAirportID");
			Date depTime = rs.getDate("DepTime");
			String arrAirportID = rs.getString("ArrAirportID");
			Date arrTime = rs.getDate("ArrTime");

			Leg leg = new Leg();
			leg.setResrNo(resrNo);
			leg.setAirlineId(airlineID);
			leg.setFlightNo(flightNo);
			leg.setArrAirportID(arrAirportID);
			leg.setDepAirportID(depAirportID);
			leg.setDepTime(depTime);
			leg.setArrTime(arrTime);
			list.add(leg);
		}

		return list;
	}

	
	public static List<Bids> queryBidHistory(Connection conn) throws SQLException {
		String sql = "SELECT A.accountNo, A.airlineId, A.flightNo, A.Class, A.date, A.NYOP "
				+ "FROM	ABSTravellings.Auctions A, ABSTravellings.Customer C "
				+ "WHERE C.Id = 2 AND C.AccountNo = A.AccountNo;";

		PreparedStatement pstm = conn.prepareStatement(sql);

		ResultSet rs = pstm.executeQuery();
		List<Bids> list = new ArrayList<Bids>();
		while (rs.next()) {
			int accountNo = rs.getInt("accountNo");
			String airlineID = rs.getString("airlineID");
			int flightNo = rs.getInt("flightNo");
			String flightClass = rs.getString("Class");
			Date date = rs.getDate("date");
			float NYOP = rs.getFloat("NYOP");

			Bids bids = new Bids();
			bids.setAccountNo(accountNo);
			bids.setAirlineID(airlineID);
			bids.setFlightNo(flightNo);
			bids.setFlightClass(flightClass);
			bids.setDate(date);
			bids.setNYOP(NYOP);
			list.add(bids);
		}
		return list;
	}
}
