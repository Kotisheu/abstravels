package beans;


public class Account {
	private int accountNum;
	private String userName;
	private String pass;
	
	
	public Account() {
		
	}
	
	public Account(int accountNum, String userName, String pass) {
		this.setAccountNum(accountNum);
		this.setUserName(userName);
		this.setPass(pass);
	}
	public Account(String userName, String pass) {
		this.setUserName(userName);
		this.setPass(pass);
	}

	public int getAccountNum() {
		return accountNum;
	}

	public void setAccountNum(int accountNum) {
		this.accountNum = accountNum;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}
	
}
