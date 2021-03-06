package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import beans.Account;
import beans.Customer;
import beans.Person;
import beans.Product;
import beans.UserAccount;
 
public class DBUtils {
 
    public static Account findUser(Connection conn, //
            String userName, String password) throws SQLException {
 
        String sql = "Select a.UserName, a.Pass from accounts a " //
                + " where a.UserName = ? and a.pass= ?";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, userName);
        pstm.setString(2, password);
        ResultSet rs = pstm.executeQuery();
 
        if (rs.next()) {
            Account user = new Account();
            user.setUserName(userName);
            user.setPass(password);
            return user;
        }
        return null;
    }
    public static String getAccType(Connection conn, String username) throws SQLException{
    	 String sql = "Select c.id from customer c, accounts a " //
                 + " where a.UserName = ? and a.AccountNum = c.accountNo";
    	 String sql2 = "Select e.id , e.isManager from Employee e, accounts a " //
                 + " where a.username = ? and a.AccountNum = e.accountNum";
    	 
    	 //first check if its in customers 
    	 PreparedStatement pstm = conn.prepareStatement(sql);
    	 pstm.setString(1, username);
    	 ResultSet rs = pstm.executeQuery();
    	 if (rs.next()) {
             return "Customer";
         }
    	 
    	 pstm = conn.prepareStatement(sql2);
    	 pstm.setString(1, username); 
    	 rs= pstm.executeQuery();
    	 if (rs.next()) {
    		 //check if its a Manager
    		 if (rs.getInt(2)==0)
             	return "Employee";
    		 else return "Manager";
         }
    	 return null;
    }
 
    public static Account findUser(Connection conn, String userName) throws SQLException {
 
    	System.out.println("lolxd");
        String sql = "Select a.username, a.pass from accounts a "//
                + " where a.username = ? ";
        
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, userName);
        System.out.println("dfdfsdf");
        ResultSet rs = pstm.executeQuery();
        System.out.println("1idkdjf");
        if (rs.next()) {
            String password = rs.getString("Pass");
            Account user = new Account();
            user.setUserName(userName);
            user.setPass(password);
            return user;
        }
        return null;
    }
    public static void register(Connection conn, Account uA,Person p,Customer c) throws SQLException {
        String sql = "Insert into accounts(UserName,Pass) values (?,?)";
        String sql2 = "Insert into person(firstName,LastName,Address,City,State,ZipCode) values (?,?,?,?,?,?)";
        String sql3= "Insert into customer(id,accountNo,email,creationDate,phoneNumber) values (?,?,?,?,?)";
        
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        PreparedStatement pstm2 = conn.prepareStatement(sql2);
        PreparedStatement pstm3 = conn.prepareStatement(sql3);

        pstm.setString(1, uA.getUserName());
        pstm.setString(2, uA.getPass());
        
        pstm2.setString(1, p.getFirstName());
        pstm2.setString(2,p.getLastName());
        pstm2.setString(3,p.getAddress());
        pstm2.setString(4,p.getCity());
        pstm2.setString(5,p.getState());
        pstm2.setInt(6,p.getZipcode());
        
        int accNum=0;
        int personID=0;
        pstm.executeUpdate();
        sql = "Select LAST_INSERT_ID()";
        pstm=conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        if (rs.next()) {
            accNum=rs.getInt("LAST_INSERT_ID()");
        }
        
        
        pstm2.executeUpdate();
        sql = "Select LAST_INSERT_ID()";
        pstm=conn.prepareStatement(sql);
        rs = pstm.executeQuery();
        if (rs.next()) {
            personID=rs.getInt("LAST_INSERT_ID()");
        }
        pstm3.setInt(1, personID);
        pstm3.setInt(2,accNum);
        pstm3.setString(3,c.getEmail());
        pstm3.setDate(4,c.getCreationDate());
        pstm3.setString(5,c.getPhoneNum());
        pstm3.executeUpdate();
        //get the person id and acc num to make a custoemr 
        
        
    }
 
    public static List<Product> queryProduct(Connection conn) throws SQLException {
        String sql = "Select a.Code, a.Name, a.Price from Product a ";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        ResultSet rs = pstm.executeQuery();
        List<Product> list = new ArrayList<Product>();
        while (rs.next()) {
            String code = rs.getString("Code");
            String name = rs.getString("Name");
            float price = rs.getFloat("Price");
            Product product = new Product();
            product.setCode(code);
            product.setName(name);
            product.setPrice(price);
            list.add(product);
        }
        return list;
    }
 
    public static Product findProduct(Connection conn, String code) throws SQLException {
        String sql = "Select a.Code, a.Name, a.Price from Product a where a.Code=?";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, code);
 
        ResultSet rs = pstm.executeQuery();
 
        while (rs.next()) {
            String name = rs.getString("Name");
            float price = rs.getFloat("Price");
            Product product = new Product(code, name, price);
            return product;
        }
        return null;
    }
 
    public static void updateProduct(Connection conn, Product product) throws SQLException {
        String sql = "Update Product set Name =?, Price=? where Code=? ";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        pstm.setString(1, product.getName());
        pstm.setFloat(2, product.getPrice());
        pstm.setString(3, product.getCode());
        pstm.executeUpdate();
    }
 
    public static void insertProduct(Connection conn, Product product) throws SQLException {
        String sql = "Insert into Product(Code, Name,Price) values (?,?,?)";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        pstm.setString(1, product.getCode());
        pstm.setString(2, product.getName());
        pstm.setFloat(3, product.getPrice());
 
        pstm.executeUpdate();
    }
 
    public static void deleteProduct(Connection conn, String code) throws SQLException {
        String sql = "Delete From Product where Code= ?";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        pstm.setString(1, code);
 
        pstm.executeUpdate();
    }
    public static List<String> getTables(Connection conn) throws SQLException {
        String sql = "show tables";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        ResultSet rs = pstm.executeQuery();
        List<String> list = new ArrayList<>();
        while (rs.next()) {
            list.add(rs.getString(1));
        }
        return list;
    }
    public static List<Map<String,Object>> getTable(Connection conn, String name) throws SQLException {
        String sql = "select * from "+name;
 
        PreparedStatement pstm = conn.prepareStatement(sql);
 
        ResultSet rs = pstm.executeQuery();
        ResultSetMetaData metaData=rs.getMetaData();
        int colCount= metaData.getColumnCount();
        List<Map<String,Object>>rows= new ArrayList<>();
        while (rs.next()) {
        	Map<String,Object> columns = new LinkedHashMap<String,Object>();
        	for(int i=1;i<=colCount;i++) {
        		columns.put(metaData.getColumnLabel(i),rs.getObject(i));
        	}
        	rows.add(columns);
            
        }
        return rows;
    }
 
}