package beans;

import java.sql.Date;

public class Reservation {
	private int reservationNumber;
	private Date reservationDate;
	private double bookingFee;
	private float totalFare;
	private int SSN;
	private int accountNo;
	private int flightNo;
	private String firstName;
	private String lastName;
	
	
	public Reservation() {
		
	}
	
	
	public int getFlightNo() {
		return flightNo;
	}


	public void setFlightNo(int flightNo) {
		this.flightNo = flightNo;
	}



	public String getFirstName() {
		return firstName;
	}



	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}



	public String getLastName() {
		return lastName;
	}



	public void setLastName(String lastName) {
		this.lastName = lastName;
	}



	public int getReservationNumber() {
		return reservationNumber;
	}
	public void setReservationNumber(int reservationNumber) {
		this.reservationNumber = reservationNumber;
	}
	public Date getReservationDate() {
		return reservationDate;
	}
	public void setReservationDate(Date reservationDate) {
		this.reservationDate = reservationDate;
	}
	public double getBookingFee() {
		return bookingFee;
	}
	public void setBookingFee(double bookingFee) {
		this.bookingFee = bookingFee;
	}
	public int getSSN() {
		return SSN;
	}
	public void setSSN(int sSN) {
		SSN = sSN;
	}
	public int getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(int accountNo) {
		this.accountNo = accountNo;
	}
	public float getTotalFare() {
		return totalFare;
	}
	public void setTotalFare(float totalFare) {
		this.totalFare = totalFare;
	}
	
	

}
