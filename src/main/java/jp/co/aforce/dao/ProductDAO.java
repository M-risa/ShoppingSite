package jp.co.aforce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jp.co.aforce.beans.ProductBeans;

public class ProductDAO extends DAO {

	//商品追加
	public int insertProduct(ProductBeans product) throws Exception {
		Connection con = getConnection();
		String sql = "INSERT INTO products (PRODUCT_NAME, PRICE, CATEGORY, SPEC, STOCK, image_url) VALUES (?, ?, ?, ?, ?, ?)";
		PreparedStatement st = con.prepareStatement(sql);

		st.setString(1, product.getProductName());
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

	//会員情報を取得する
	public java.util.List<ProductBeans> selectAll() throws Exception{
		java.util.List<ProductBeans> list = new java.util.ArrayList<>();
		Connection con=getConnection();
		String sql = "SELECT * FROM products ORDER BY PRODUCT_ID ASC";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			ProductBeans product = new ProductBeans();
			product.setProductId(rs.getInt("PRODUCT_ID"));
			product.setProductName(rs.getString("PRODUCT_NAME"));
			product.setPrice(rs.getInt("PRICE"));
			product.setCategory(rs.getString("CATEGORY"));
			product.setSpec(rs.getString("SPEC"));
			product.setStock(rs.getInt("STOCK"));
			product.setImageUrl(rs.getString("image_url"));
			
			list.add(product);
		}
		
		st.close();
	    con.close();
	    
	    return list;

	}
}
