package beans;

import java.sql.Date;

public class Employee extends Person{
int SSN;
boolean isManager;
Date startDate;
int hourlyRate;
public int getSSN() {
	return SSN;
}
public void setSSN(int sSN) {
	SSN = sSN;
}
public boolean isManager() {
	return isManager;
}
public void setManager(boolean isManager) {
	this.isManager = isManager;
}
public Date getStartDate() {
	return startDate;
}
public void setStartDate(Date startDate) {
	this.startDate = startDate;
}
public int getHourlyRate() {
	return hourlyRate;
}
public void setHourlyRate(int hourlyRate) {
	this.hourlyRate = hourlyRate;
}

}
