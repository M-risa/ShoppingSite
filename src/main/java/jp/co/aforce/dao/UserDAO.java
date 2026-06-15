package jp.co.aforce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jp.co.aforce.beans.UserBeans;

public class UserDAO extends DAO {
	//ログイン用検索メソッド
	public UserBeans search(String memberId, String password) 
		throws Exception{
		UserBeans user = null;
		
		Connection con=getConnection();
		
		PreparedStatement st;
		st=con.prepareStatement("SELECT * FROM users WHERE (MEMBER_ID = ? OR MAIL_ADDRESS = ?) AND PASSWORD = ?");
		st.setString(1, memberId);
		st.setString(2, memberId);
		st.setString(3, password);
		ResultSet rs=st.executeQuery();
		
		while(rs.next()) {
			user=new UserBeans();
			user.setmemberId(rs.getString("MEMBER_ID"));
			user.setpassword(rs.getString("PASSWORD"));
			user.setlastName(rs.getString("LAST_NAME"));
			user.setfirstName(rs.getString("FIRST_NAME"));
			user.setaddress(rs.getString("ADDRESS"));
			user.setmailAddress(rs.getString("MAIL_ADDRESS"));
			user.setRole(rs.getInt("role"));
			user.setregistDate(rs.getString("REGIST_DATE")); 
		    user.setupdateDate(rs.getString("UPDATE_DATE"));
		}
		
	
	st.close();
	con.close();
	return user;
	
	}
	
	//会員情報登録
	
	//重複チェック
	public boolean exists(String memberId) throws Exception{
		boolean result = false;
		Connection con=getConnection();
		String sql = "SELECT COUNT(*) FROM users WHERE MEMBER_ID = ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, memberId);
		ResultSet rs = st.executeQuery();
		if(rs.next() && rs.getInt(1) > 0) {
			result = true;
		}
		st.close();
		con.close();
		return result;
		
	}
	
	//データ挿入
	public int insert(UserBeans user) throws Exception{
		Connection con=getConnection();
		String sql = "INSERT INTO users (MEMBER_ID, PASSWORD, LAST_NAME, FIRST_NAME, ADDRESS, MAIL_ADDRESS, role, REGIST_DATE, UPDATE_DATE) VALUES(?, ?, ?, ?, ?, ? ,0, NOW(), NOW())";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, user.getmemberId());
		st.setString(2, user.getpassword());
		st.setString(3, user.getlastName());
		st.setString(4, user.getfirstName());
		st.setString(5, user.getaddress());
		st.setString(6, user.getmailAddress());
		
		int line = st.executeUpdate();
		
		st.close();
		con.close();
		
		return line;
		
	}
	
	//削除
	public int delete(String memberId) throws Exception{
		Connection con=getConnection();
		PreparedStatement st = con.prepareStatement("DELETE FROM users WHERE MEMBER_ID = ?");
		st.setString(1, memberId);
		int line = st.executeUpdate();
		
		st.close();
		con.close();
		
		return line;
	}
	
	//更新
	public int update(UserBeans user) throws Exception{
		Connection con=getConnection();
		String sql ="UPDATE users SET LAST_NAME = ?, FIRST_NAME = ?, ADDRESS = ?, MAIL_ADDRESS = ?, UPDATE_DATE = NOW() WHERE MEMBER_ID = ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, user.getlastName());
	    st.setString(2, user.getfirstName());
	    st.setString(3, user.getaddress());
	    st.setString(4, user.getmailAddress());
	    st.setString(5, user.getmemberId());
	    
	    int line = st.executeUpdate();
	    
	    st.close();
	    con.close();
	    
	    return line;
	}
	
	//パスワード変更
	public int updatePassword(String memberId, String newPassword) throws Exception{
		Connection con=getConnection();
		String sql = "UPDATE users SET PASSWORD = ?, UPDATE_DATE = NOW() WHERE MEMBER_ID = ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, newPassword);
		st.setString(2, memberId);
		
int line = st.executeUpdate();
	    
	    st.close();
	    con.close();
	    
	    return line;
	}
	
	//会員情報を取得する
	public java.util.List<UserBeans> selectAll() throws Exception{
		java.util.List<UserBeans> list = new java.util.ArrayList<>();
		Connection con=getConnection();
		String sql = "SELECT * FROM users ORDER BY MEMBER_ID ASC";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			UserBeans user =new UserBeans();
			user.setmemberId(rs.getString("MEMBER_ID"));
			user.setpassword(rs.getString("PASSWORD"));
			user.setlastName(rs.getString("LAST_NAME"));
			user.setfirstName(rs.getString("FIRST_NAME"));
			user.setaddress(rs.getString("ADDRESS"));
			user.setmailAddress(rs.getString("MAIL_ADDRESS"));
			user.setRole(rs.getInt("role"));
		    user.setregistDate(rs.getString("REGIST_DATE"));
		    user.setupdateDate(rs.getString("UPDATE_DATE"));
		    
		    list.add(user);
		}
		
		st.close();
	    con.close();
	    
	    return list;
	}

}
