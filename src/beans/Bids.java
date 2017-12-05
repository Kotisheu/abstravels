package beans;

import java.sql.Date;

public class Bids {
	
	private int accountNo;
	private String airlineID;
	private int flightNo;
	private String flightClass;
	private Date date;
	public int getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(int accountNo) {
		this.accountNo = accountNo;
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

	public String getFlightClass() {
		return flightClass;
	}

	public void setFlightClass(String flightClass) {
		this.flightClass = flightClass;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public float getNYOP() {
		return NYOP;
	}

	public void setNYOP(float nYOP) {
		NYOP = nYOP;
	}

	private float NYOP;
	
	public Bids(){
		
	}

}
