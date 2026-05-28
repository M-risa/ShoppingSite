package jp.co.aforce.dao;

import java.sql.Connection;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DAO {
	static DataSource ds;
	
	public Connection getConnection() throws Exception{
		if(ds==null) {
			InitialContext ic=new InitialContext();
			ds=(DataSource)ic.lookup("jdbc:mysql://localhost:3306/shoppingsite_muraishi");
		}
		
		return ds.getConnection();
	}

}
