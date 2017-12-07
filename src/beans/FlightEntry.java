package beans;

import java.sql.Date;
import java.sql.Time;

public class FlightEntry {// i think this is a combo of legs and flights but p:
Flight flight;// includes airlineid/daysoftheweek.flightno/totalseats
int legNo;
int noSeats;
Date day; //datetime
Date aday;// if arrive different day this is next day after day
public Date getAday() {
	return aday;
}

public int getLegNo() {
	return legNo;
}

public void setLegNo(int legNo) {
	this.legNo = legNo;
}

public void setAday(Date aday) {
	this.aday = aday;
}

Time depTime;
Time arrTime;
//Time time;
Double price;
String depAirport;
String arrAirport;

public Time getDepTime() {
	return depTime;
}

public void setDepTime(Time depTime) {
	this.depTime = depTime;
}

public Time getArrTime() {
	return arrTime;
}

public void setArrTime(Time arrTime) {
	this.arrTime = arrTime;
}

public String getDepAirport() {
	return depAirport;
}

public void setDepAirport(String depAirport) {
	this.depAirport = depAirport;
}

public String getArrAirport() {
	return arrAirport;
}

public void setArrAirport(String arrAirport) {
	this.arrAirport = arrAirport;
}

public FlightEntry() {
	
}

public Flight getFlight() {
	return flight;
}

public void setFlight(Flight flight) {
	this.flight = flight;
}

public int getNoSeats() {
	return noSeats;
}

public void setNoSeats(int noSeats) {
	this.noSeats = noSeats;
}

public Date getDay() {
	return day;
}

public void setDay(Date day) {
	this.day = day;
}

public Double getPrice() {
	return price;
}

public void setPrice(Double price) {
	this.price = price;
}


}
