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

	//商品情報を取得する
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
			product.setRegistDate(rs.getString("REGIST_DATE"));
			product.setUpdateDate(rs.getString("UPDATE_DATE"));
			
			list.add(product);
		}
		
		st.close();
	    con.close();
	    
	    return list;

	}
	
	/**
     * @param productId 削除する商品ID
     * @return 削除された行数
     * @throws Exception
     */
	
	//選んだ商品情報を表示
	public ProductBeans searchProductById(int productId) throws Exception{
		Connection con = getConnection();
		PreparedStatement st = null;
		ResultSet rs = null;
		ProductBeans product = null;
		
		try {
			String sql = "SELECT * FROM products WHERE PRODUCT_ID = ?";
			st = con.prepareStatement(sql);
			st.setInt(1, productId);
			rs = st.executeQuery();
			
			if(rs.next()) {
				product = new ProductBeans();
				product.setProductId(rs.getInt("PRODUCT_ID"));
				product.setProductName(rs.getString("PRODUCT_NAME"));
				product.setPrice(rs.getInt("PRICE"));
				product.setCategory(rs.getString("CATEGORY"));
				product.setSpec(rs.getString("SPEC"));
				product.setStock(rs.getInt("STOCK"));
				product.setImageUrl(rs.getString("image_url"));
				product.setRegistDate(rs.getString("REGIST_DATE"));
				product.setUpdateDate(rs.getString("UPDATE_DATE"));
			}
		} finally {
			if(rs != null)rs.close();
			if(st != null) st.close();
			if(con != null) con.close();
		}
		
		return product;
	}
	
	
	//更新
	public int updateProduct(ProductBeans product) throws Exception{
		Connection con = getConnection();
		PreparedStatement st = null;
		int row = 0;
		
		try {
			String sql = "UPDATE products SET PRODUCT_NAME = ?, PRICE = ?, CATEGORY = ?, SPEC = ?, STOCK = ?, image_url = ?, UPDATE_DATE = NOW() WHERE PRODUCT_ID = ?";
			st = con.prepareStatement(sql);
			
			st.setString(1, product.getProductName());
			st.setInt(2, product.getPrice());
			st.setString(3, product.getCategory());
			st.setString(4, product.getSpec());
			st.setInt(5, product.getStock());
			st.setString(6, product.getImageUrl());
			st.setInt(7, product.getProductId());
			
			row = st.executeUpdate();
			
		} finally {
			if(st != null) st.close();
			if(con != null) con.close();
		}
		return row;
	}
		
	
	//削除
	public int deleteProduct(int productId) throws Exception{
		Connection con = getConnection();
		PreparedStatement st = null;
		int row = 0;
		
		try {
			String sql = "DELETE FROM products WHERE PRODUCT_ID = ?";
			st = con.prepareStatement(sql);
			st.setInt(1, productId);
			
			row = st.executeUpdate();
			
		} finally {
			if(st != null) st.close();
			if(con != null) con.close();
		}
		return row;
	}
}
