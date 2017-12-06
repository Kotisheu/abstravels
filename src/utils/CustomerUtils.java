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
	
	public static List<Customer> queryAllCustomers(Connection conn) throws SQLException {
		String sql = "SELECT * FROM abstravellings.customer;";
		
		PreparedStatement pstm = conn.prepareStatement(sql);

		ResultSet rs = pstm.executeQuery();

		List<Customer> list = new ArrayList<Customer>();

		while (rs.next()) {
			int id = rs.getInt("Id");
			int accountNo = rs.getInt("AccountNo");
			String creditCarNo = rs.getString("CreditCardNo");
			String email = rs.getString("Email");
			Date creation = rs.getDate("CreationDate");
			int rating = rs.getInt("Rating");
			String phone = rs.getString("PhoneNumber");
			
			Customer customer = new Customer ();
			customer.setId(id);
			customer.setAccountNo(accountNo);
			customer.setCreationDate(creation);
			customer.setEmail(email);
			customer.setCreationDate(creation);
			customer.setRating(rating);
			customer.setPhoneNum(phone);
			list.add(customer);

		}

		return list;
	}

}
