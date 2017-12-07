package utils;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import javax.servlet.RequestDispatcher;

import com.mysql.jdbc.StringUtils;

import beans.Flight;
import beans.FlightEntry;

public class SRUtils {
	//search and reservation dbutils
	  public static List<FlightEntry> oneFlight(Connection conn, String fromList,String toList,String departList,
      		String returnList,String adultsList,String childList,String flexList,String nonstopList) throws SQLException, ParseException {
		  	List<FlightEntry> flights = new ArrayList<>();
		 
		  			List<String> airports = findAirport(conn, fromList);
		  			System.out.println(fromList);
		  			String air = "(-1";
		  			for(String s:airports) {
		  				air+=",\""+s+"\"";
		  			}air+=")";
		  			List<String> airports2 = findAirport(conn, toList);
		  			System.out.println(toList);
		  			String air2 = "(-1";
		  			for(String s:airports2) {
		  				air2+=",\""+s+"\"";
		  			}air2+=");";
		  			
		  			Calendar c= Calendar.getInstance();
		  			//2011-01-05 09:00:00
		  			DateFormat format = new SimpleDateFormat("MM/dd/yyyy", Locale.ENGLISH);
		  			java.util.Date date = null;
		  			int dayOfWeek = -1;
					
						date = format.parse(departList);
						System.out.println(date); 
			  			c.setTime(date);
			  			dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
			  			
			  			if(nonstopList.equals("0")) {// is "on" or "0"
				  			// :( 
				  		 }
				
			  String sql = "Select f.airlineid, f.flightno,l.legNo, l.depAirportId, l.arrAirportId, l.aTime, l.dTime, f.noofseats, f.daysOperating, p.fare from Flight f, Fare p, Leg l "
			  		+ "where p.airlineid = f.airlineid AND p.airlineid=l.airlineid AND p.flightno=l.flightno AND p.flightno = f.flightno AND "
			  		+ "l.depAirportId in "+air+ " AND l.arrAirportId in "+air2 ;
		  		  PreparedStatement pstm = conn.prepareStatement(sql);
			        
			        
			        ResultSet rs = pstm.executeQuery();
			        while (rs.next()) {
			        	// check which flight fly from those places
			        	// then check which of those fly on the day requested
			        	// then add other flights if flex
			        	// check if numseats available? <- need to do reservation check first
			        	FlightEntry fe = new FlightEntry();
			            Flight flight = new Flight();
			            flight.setAirlineID(rs.getString("airlineid"));
			            flight.setFlightNo(rs.getInt("flightno"));
			            flight.setNoSeats(rs.getInt("noofseats"));
			            flight.setDays(rs.getString("daysOperating"));
			          
			            fe.setFlight(flight);
			            fe.setLegNo(rs.getInt("legNo"));
			            fe.setPrice(rs.getDouble("fare"));
			            fe.setDepAirport(rs.getString("depAirportId"));
			            fe.setArrAirport(rs.getString("arrAirportId"));
			            fe.setNoSeats(rs.getInt("noofseats"));
			            
			            java.sql.Date sqlDate = new java.sql.Date(date.getTime());
			            fe.setDay(sqlDate);
			            fe.setAday(sqlDate);
			            fe.setArrTime((Time) rs.getObject("aTime"));
			            fe.setDepTime((Time) rs.getObject("dTime"));
			            if(fe.getArrTime().compareTo(fe.getDepTime())<0) {// if the arrival time is before departure time, it arrives the next day
			            	 
			                 c.add(Calendar.DATE, 1);
			                 java.util.Date aDay = c.getTime();
			            	java.sql.Date sqlADate = new java.sql.Date(aDay.getTime());
			            	fe.setAday(sqlADate);
				            
			            }
			            
			            if(flight.getDays().toCharArray()[dayOfWeek%7]== '1') {
			            	
			            	flights.add(fe);
			            }
			            if(flexList.equals("on")) {
			            	 if(flight.getDays().toCharArray()[(dayOfWeek-1)%7]== '1') {// IF DAY BEFORE
			            		 java.util.Date flexB = format.parse(departList);
									c.setTime(flexB);
									java.util.Date flexBADay = c.getTime();
									java.sql.Date sqlflexBADate = new java.sql.Date(flexBADay.getTime());
									c.add(Calendar.DATE, -1);
					                 java.util.Date flexBDay = c.getTime();
					            	java.sql.Date sqlflexBDate = new java.sql.Date(flexBDay.getTime());
					            	FlightEntry ffe= new FlightEntry();
					            	ffe.setFlight(flight);
						            ffe.setLegNo(rs.getInt("legNo"));
						            ffe.setPrice(rs.getDouble("fare"));
						            ffe.setNoSeats(rs.getInt("noofseats"));
						            ffe.setDepAirport(rs.getString("depAirportId"));
						            ffe.setArrAirport(rs.getString("arrAirportId"));
					            	ffe.setDay(sqlflexBDate);
						            ffe.setAday(sqlflexBADate);
						            ffe.setArrTime((Time) rs.getObject("aTime"));
						            ffe.setDepTime((Time) rs.getObject("dTime"));
					            	flights.add(ffe);
					            }
			            	 if(flight.getDays().toCharArray()[(dayOfWeek+1)%7]== '1') {// IF DAY AFTER
			            		 java.util.Date flexA = format.parse(departList);
									c.setTime(flexA);
									c.add(Calendar.DATE, +1);
					                 java.util.Date flexADay = c.getTime();
					            	java.sql.Date sqlflexADate = new java.sql.Date(flexADay.getTime());
					            	c.add(Calendar.DATE, +1);
					                 java.util.Date flexAADay = c.getTime();
					            	java.sql.Date sqlflexAADate = new java.sql.Date(flexAADay.getTime());
					            	FlightEntry ffe= new FlightEntry();
					            	ffe.setFlight(flight);
						            ffe.setLegNo(rs.getInt("legNo"));
						            ffe.setPrice(rs.getDouble("fare"));
						            ffe.setNoSeats(rs.getInt("noofseats"));
						            ffe.setDepAirport(rs.getString("depAirportId"));
						            ffe.setArrAirport(rs.getString("arrAirportId"));
					            	ffe.setDay(sqlflexADate);
						            ffe.setAday(sqlflexAADate);
						            ffe.setArrTime((Time) rs.getObject("aTime"));
						            ffe.setDepTime((Time) rs.getObject("dTime"));
					         		flights.add(ffe);
					            }
			            }
			           
			        }
			        for(FlightEntry f:flights) {
			        	f.setNoSeats(f.getNoSeats()-seatsTaken(conn,f.getDay(),f.getFlight().getFlightNo(),f.getFlight().getAirlineID()));
			         // decrease by numreservations		        
			        }
			        return flights;
	  }
	  public static List<FlightEntry> findFlights(Connection conn, String radios, String[] fromList,String[] toList,String[] departList,
	      		String[] returnList,String[] adultsList,String[] childList,String[]flexList,String[] nonstopList) throws SQLException, ParseException {
			      if(radios.equals("radio1")) {
			    	  System.out.println(fromList[0]);
			    	  System.out.println(toList[0]);
			    	  System.out.println(departList[0]);
			    	  System.out.println(returnList[0]);
			    	  System.out.println(adultsList[0]);
			    	  System.out.println(childList[0]);
			    	  System.out.println(flexList[0]);
			    	  System.out.println(nonstopList[0]);
			        	return oneFlight(conn,fromList[0],toList[0],departList[0],returnList[0],adultsList[0],childList[0],flexList[0],nonstopList[0]);
				}else if(radios.equals("radio2")) {
					System.out.println("2");
					System.out.println(fromList[0]);
			    	  System.out.println(toList[0]);
			    	  System.out.println(departList[0]);
			    	  System.out.println(returnList[0]);
			    	  System.out.println(adultsList[0]);
			    	  System.out.println(childList[0]);
			    	  System.out.println(flexList[0]);
			    	  System.out.println(nonstopList[0]);
					List<FlightEntry> flights1= oneFlight(conn,fromList[0],toList[0],departList[0],returnList[0],adultsList[0],childList[0],flexList[0],nonstopList[0]);
					List<FlightEntry> flights2= oneFlight(conn,toList[0],fromList[0],returnList[0],departList[0],adultsList[0],childList[0],flexList[0],nonstopList[0]);
					List<FlightEntry> allFlights= new ArrayList<>();
					allFlights.addAll(flights1);
					allFlights.addAll(flights2);
					return allFlights;
				}else if(radios.equals("radio3")) {
					System.out.println("3");
					List<FlightEntry> flights= new ArrayList<>();
					List<FlightEntry> allFlights= new ArrayList<>();
					for( int i=0; i<fromList.length;i++) {
						System.out.println("i:"+i);
						flights= oneFlight(conn,fromList[i],toList[i],departList[i],returnList[i],adultsList[i],childList[i],flexList[i],nonstopList[i]);
						allFlights.addAll(flights);
					}return allFlights;
				}else {
					System.out.println("other");
					return null;
				}
	    }
	  
	  public static List<String> findAirport(Connection conn, String input) throws SQLException {
			  		// check if input directly matches an airportid/ airportname/ airport city
			  			String sql = "Select a.id from airport a where a.id= ? OR a.name= ? OR a.city = ? OR a.country = ?";
			  		  PreparedStatement pstm = conn.prepareStatement(sql);
				        pstm.setString(1, input);
				        pstm.setString(2, input);
				        pstm.setString(3, input);
				        pstm.setString(4, input);
				        
				        List<String> airports = new ArrayList<>();
				        ResultSet rs = pstm.executeQuery();
				        while (rs.next()) {
				            airports.add(rs.getString("id"));
				        }
				        return airports;
		    }

  public static int seatsTaken(Connection conn, Date date, int flightNo, String airlineId) throws SQLException {
	  		/// check number of seats available
	  			String sql = "Select count(distinct(r.SeatNo))as c from reservationpassenger r, includes i  where i.date=?  AND i.flightNo=? AND i.airlineID=? AND r.resrNo=i.resrNo";
	  		  PreparedStatement pstm = conn.prepareStatement(sql);
		        pstm.setDate(1, date);
		        pstm.setInt(2, flightNo);
		        pstm.setString(3, airlineId);
		        ResultSet rs = pstm.executeQuery();
		        rs.next();
		        return rs.getInt("c");
  }	 

//public static List<Map<> findDate(Connection conn, String input) throws SQLException {
//		// check  the days of the week string and do repitiion
//		// check reservations, and if there exists a reservation on a flight for a certain day, decrease the number of seats shown
//			String sql = "Select a.id from airport a where a.id= ? OR a.name= ? OR a.city = ? OR a.country = ?";
//		  PreparedStatement pstm = conn.prepareStatement(sql);
//        pstm.setString(1, input);
//        pstm.setString(2, input);
//        pstm.setString(3, input);
//        pstm.setString(4, input);
//        List<String> airports = new ArrayList<>();
//        ResultSet rs = pstm.executeQuery();
//        while (rs.next()) {
//            airports.add(rs.getString("id"));
//        }
//        return airports;
//}	 
}