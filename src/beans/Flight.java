package beans;

import java.util.ArrayList;
import java.util.List;

public class Flight {
String airlineID;
int flightNo;
int noSeats;
String days;

// NOT SURE HOW MIN/MAX LENGTH OF STAY WORKS SO IT IS EXCLUDED FOR NOW
List<Leg> legs = new ArrayList<>();

public Flight() {
	
}
public String getAirlineID() {
	return airlineID;
}
public void setAirlineID(String airlineID) {
	this.airlineID = airlineID;
}
public int getFlightNo() {
	return flightNo;
}
public void setFlightNo(int flightNo) {
	this.flightNo = flightNo;
}
public int getNoSeats() {
	return noSeats;
}
public void setNoSeats(int noSeats) {
	this.noSeats = noSeats;
}
public String getDays() {
	return days;
}
public void setDays(String days) {
	this.days = days;
}
public List<Leg> getLegs() {
	return legs;
}
public void setLegs(List<Leg> legs) {
	this.legs = legs;
}


}
