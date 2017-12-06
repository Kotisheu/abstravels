package beans;

import java.sql.Date;

public class Employee extends Person {
	int SSN;
	boolean manager;
	Date startDate;
	float hourlyRate;
	
	public Employee (){
		
	}

	public int getSSN() {
		return SSN;
	}

	public void setSSN(int sSN) {
		SSN = sSN;
	}

	public boolean isManager() {
		return manager;
	}

	//special case
	public void setManager(int isManager) {
		if (isManager == 1) {
			this.manager = true;
		}
		else {
			this.manager = false;
		}
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public float getHourlyRate() {
		return hourlyRate;
	}

	public void setHourlyRate(float hourlyRate) {
		this.hourlyRate = hourlyRate;
	}

}
