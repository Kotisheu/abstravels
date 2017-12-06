package utils;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Employee;

public class EmployeeUtils {
	
	public static int updateEmployeeInfo(Connection conn, String employeeId, String firstName, String lastName, String address,
			String city, String state, String zip, String ssn, String start, String hourly, String manager) throws SQLException {
		String sql = "UPDATE ABSTravellings.Person " + "SET FirstName = '" + firstName + "', LastName = '" + lastName
				+ "', Address = '" + address + "', City = '" + city + "', State = '" + state + "', ZipCode = " + zip
					+ " WHERE Person.Id = " + employeeId + ";";
		
		System.out.println(sql);
		int rs;
		PreparedStatement pstm = conn.prepareStatement(sql);
		rs = pstm.executeUpdate();
		
		int isManager = -1;
		
		if (manager.equals("true")) {
			isManager = 1;
		}
		else if (manager.equals("false")) {
			isManager = 0;
		}
		
		String sql2 = "UPDATE ABSTravellings.employee " + "SET SSN= '" + ssn
				+ "', IsManager = " + isManager + ", StartDate = '" + start + "', HourlyRate = \"" + hourly + "\" WHERE Employee.Id= " + employeeId + ";";
		
		
		System.out.println(sql2);
		
		pstm = conn.prepareStatement(sql2);
		rs = pstm.executeUpdate();
		
		return rs;
	}
	
	public static List<Employee> queryAllEmployee(Connection conn) throws SQLException {
		String sql = "SELECT * FROM abstravellings.employee e, abstravellings.person p WHERE e.Id = p.Id;";

		PreparedStatement pstm = conn.prepareStatement(sql);

		ResultSet rs = pstm.executeQuery();

		List<Employee> list = new ArrayList<Employee>();

		while (rs.next()) {
			int id = rs.getInt("Id");
			int ssN = rs.getInt("SSN");
			int isManager = rs.getInt("IsManager");
			Date start = rs.getDate("StartDate");
			float hourlyRate = rs.getFloat("HourlyRate");
			String firstName = rs.getString("FirstName");
			String lastName = rs.getString("LastName");
			String address = rs.getString("Address");
			String city = rs.getString("City");
			String state = rs.getString("State");
			int zip = rs.getInt("ZipCode");

			Employee employee = new Employee();
			employee.setId(id);
			employee.setSSN(ssN);
			employee.setManager(isManager);
			employee.setStartDate(start);
			employee.setHourlyRate(hourlyRate);
			employee.setFirstName(firstName);
			employee.setLastName(lastName);
			employee.setAddress(address);
			employee.setCity(city);
			employee.setState(state);
			employee.setZipcode(zip);
			list.add(employee);

		}

		return list;
	}

}
