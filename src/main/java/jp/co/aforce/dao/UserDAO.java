package jp.co.aforce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jp.co.aforce.beans.UserBeans;

public class UserDAO extends DAO {
	public UserBeans search(String memberId, String password) 
	throws Exception{
		UserBeans user = null;
		
		Connection con=getConnection();
		
		PreparedStatement st;
		st=con.prepareStatement(
				"select * from users WHERE MEMBER_ID = ? AND PASSWORD = ?");
		st.setString(1, memberId);
		st.setString(2, password);
		ResultSet rs=st.executeQuery();
		
		if(rs.next()) {
			user=new UserBeans();
			user.setmemberId(rs.getString("MEMBER_ID"));
			user.setpassword(rs.getString("PASSWORD"));
			user.setlastName(rs.getString("LAST_NAME"));
			user.setfirstName(rs.getString("FIRST_NAME"));
			user.setaddress(rs.getString("ADDRESS"));
			user.setmailAddress(rs.getString("MAIL_ADDRESS"));
		}
		
	
	st.close();
	con.close();
	return user;
	
	}

}
