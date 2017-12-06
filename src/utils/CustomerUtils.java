package utils;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Customer;

public class CustomerUtils {

	public static int updateCustomerInfo(Connection conn, String customerId, String firstName, String lastName, String address,
			String city, String state, String zip, String ccNo, String email, String phone) throws SQLException {
		String sql = "UPDATE ABSTravellings.Person " + "SET FirstName = '" + firstName + "', LastName = '" + lastName
				+ "', Address = '" + address + "', City = '" + city + "', State = '" + state + "', ZipCode = " + zip
					+ " WHERE Person.Id = " + customerId + ";";
		
		System.out.println(sql);
		int rs;
		PreparedStatement pstm = conn.prepareStatement(sql);
		rs = pstm.executeUpdate();
		
		
		String sql2 = "UPDATE ABSTravellings.Customer " + "SET CreditCardNo= '" + ccNo
				+ "', Email = '" + email + "', PhoneNumber = \"" + phone + "\" WHERE Customer.Id= " + customerId + ";";
		
		
		System.out.println(sql2);
		
		pstm = conn.prepareStatement(sql2);
		rs = pstm.executeUpdate();
			
		return rs;
	}

	public static List<Customer> queryAllCustomers(Connection conn) throws SQLException {
		String sql = "SELECT * " + "FROM abstravellings.customer c, abstravellings.person p " + "WHERE c.Id = p.Id;";

		PreparedStatement pstm = conn.prepareStatement(sql);

		ResultSet rs = pstm.executeQuery();

		List<Customer> list = new ArrayList<Customer>();

		while (rs.next()) {
			int id = rs.getInt("Id");
			int accountNo = rs.getInt("AccountNo");
			String creditCardNo = rs.getString("CreditCardNo");
			String email = rs.getString("Email");
			Date creation = rs.getDate("CreationDate");
			int rating = rs.getInt("Rating");
			String phone = rs.getString("PhoneNumber");
			String firstName = rs.getString("FirstName");
			String lastName = rs.getString("LastName");
			String address = rs.getString("Address");
			String city = rs.getString("City");
			String state = rs.getString("State");
			int zip = rs.getInt("ZipCode");

			Customer customer = new Customer();
			customer.setId(id);
			customer.setAccountNo(accountNo);
			customer.setCreationDate(creation);
			customer.setEmail(email);
			customer.setCreationDate(creation);
			customer.setRating(rating);
			customer.setPhoneNum(phone);
			customer.setFirstName(firstName);
			customer.setLastName(lastName);
			customer.setAddress(address);
			customer.setCity(city);
			customer.setState(state);
			customer.setZipcode(zip);
			customer.setRating(rating);
			customer.setCcNo(creditCardNo);
			list.add(customer);

		}

		return list;
	}

}
