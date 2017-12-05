package beans;

import java.sql.Date;

public class Leg {
	private int resrNo;
	private String AirlineId;
	private int flightNo;
	private int LegNo;
	private String arrAirportID;
	private String depAirportID;
	private Date depTime;
	private Date arrTime;
	
	public Leg (){
		
	}

	public int getResrNo() {
		return resrNo;
	}

	public void setResrNo(int resrNo) {
		this.resrNo = resrNo;
	}

	public String getAirlineId() {
		return AirlineId;
	}

	public void setAirlineId(String airlineId) {
		AirlineId = airlineId;
	}

	public int getFlightNo() {
		return flightNo;
	}

	public void setFlightNo(int flightNo) {
		this.flightNo = flightNo;
	}

	public int getLegNo() {
		return LegNo;
	}

	public void setLegNo(int legNo) {
		LegNo = legNo;
	}

	public String getArrAirportID() {
		return arrAirportID;
	}

	public void setArrAirportID(String arrAirportID) {
		this.arrAirportID = arrAirportID;
	}

	public String getDepAirportID() {
		return depAirportID;
	}

	public void setDepAirportID(String depAirportID) {
		this.depAirportID = depAirportID;
	}

	public Date getDepTime() {
		return depTime;
	}

	public void setDepTime(Date depTime) {
		this.depTime = depTime;
	}

	public Date getArrTime() {
		return arrTime;
	}

	public void setArrTime(Date arrTime) {
		this.arrTime = arrTime;
	}
	
	
}
