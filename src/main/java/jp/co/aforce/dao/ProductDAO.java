package jp.co.aforce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import jp.co.aforce.beans.ProductBeans;

public class ProductDAO extends DAO{
	
	//商品追加
	public int insertProduct(ProductBeans product) throws Exception{
		Connection con = getConnection();
		String sql = "INSERT INTO products (PRODUCT_NAME, PRICE, CATEGORY, SPEC, STOCK, image_url) VALUES (?, ?, ?, ?, ?, ?)";
		PreparedStatement st = con.prepareStatement(sql);
			
			st.setString (1, product.getProductName());
			st.setInt(2, product.getPrice());
			st.setString(3, product.getCategory());
			st.setString(4, product.getSpec());
			st.setInt(5, product.getStock());
			st.setString(6, product.getImageUrl());
			
			int line = st.executeUpdate();
			
			st.close();
			con.close();
		
			return line;
			
	}

}
