package jp.co.aforce.beans;

public class UserBeans implements java.io.Serializable{
	
	private String memberId;
	private String password;
	private String lastName;
	private String firstName;
	private String address;
	private String mailAddress;
	private int role;
	private String registDate; 
	private String updateDate;
	
	public UserBeans() {}
	
	public UserBeans(String memberId, String password, String lastName, String firstName, String address, String mailAddress, int role, String registDate, String updateDate) {
		this.memberId = memberId;
		this.password = password;
		this.lastName = lastName;
		this.firstName = firstName;
		this.address = address;
		this.mailAddress = mailAddress;
		this.role = role;
		this.registDate = registDate;
		this.updateDate = updateDate;
	}
	
	public String getmemberId() {
		return memberId;
	}
	public void setmemberId(String memberId) {
		this.memberId = memberId;
	}
	
	
	public String getpassword() {
		return password;
	}
	public void setpassword(String password) {
		this.password = password;
	}
	
	
	public String getlastName() {
		return lastName;
	}
	public void setlastName(String lastName) {
		this.lastName = lastName;
	}
	
	
	public String getfirstName() {
		return firstName;
	}
	public void setfirstName(String firstName) {
		this.firstName = firstName;
	}
	
	
	public String getaddress() {
		return address;
	}
	public void setaddress(String address) {
		this.address = address;
	}
	
	
	public String getmailAddress() {
		return mailAddress;
	}
	public void setmailAddress(String mailAddress) {
		this.mailAddress = mailAddress;
	}
	
	
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	
	
	public String getregistDate() {
		return registDate;
	}
	public void setregistDate(String registDate) {
		this.registDate = registDate;
	}
	
	
	public String getupdateDate() {
		return updateDate;
	}
	public void setupdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	

}
