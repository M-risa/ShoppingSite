package jp.co.aforce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import jp.co.aforce.beans.CartItemBeans;
import jp.co.aforce.beans.HistoryItemBeans;
import jp.co.aforce.beans.OrderBeans;
import jp.co.aforce.beans.ProductBeans;

public class OrderDAO extends DAO {

	public int insertOrder(String memberId, int totalPrice, List<CartItemBeans> cart) throws Exception{
		Connection con = getConnection();
		PreparedStatement stOrder = null;
		PreparedStatement stDetail = null;
		PreparedStatement stStock = null;
		PreparedStatement stCheckStock = null;
		
		try {
			con.setAutoCommit(false);
			
			String sqlOrder = "INSERT INTO orders (MEMBER_ID, TOTAL_PRICE) VALUES (?, ?)";
			stOrder = con.prepareStatement(sqlOrder, Statement.RETURN_GENERATED_KEYS);
			stOrder.setString(1, memberId);
			stOrder.setInt(2, totalPrice);
			stOrder.executeUpdate();
			
			int orderId = 0;
			ResultSet rs = stOrder.getGeneratedKeys();
			if(rs.next()) {
				orderId = rs.getInt(1);
			}
			
			String sqlCheckStock = "SELECT STOCK FROM products WHERE PRODUCT_ID = ?";
			String sqlDetail = "INSERT INTO order_details(ORDER_ID, PRODUCT_ID, QUAUNTITY) VALUES(?, ?, ?)";
			String sqlStock = "UPDATE products SET STOCK = STOCK - ? WHERE PRODUCT_ID = ?";
			
			stCheckStock = con.prepareStatement(sqlCheckStock);
			stDetail = con.prepareStatement(sqlDetail);
			stStock = con.prepareStatement(sqlStock);
			
			for(CartItemBeans item : cart){
				ProductBeans product = item.getProduct();
				int quantity = item.getCount();
				
				stCheckStock.setInt(1, product.getProductId());
				ResultSet rsStock = stCheckStock.executeQuery();
				
				if(rsStock.next()) {
					int currentStock = rsStock.getInt("STOCK");
					
					if(currentStock < quantity) {
						rsStock.close();
						con.rollback();
						System.out.println("❌ 在庫不足エラー: 商品ID " + product.getProductId() + " の在庫が足りません。");
						return 0;
					}
				}
				rsStock.close();
				
				stDetail.setInt(1, orderId);
				stDetail.setInt(2, product.getProductId());
				stDetail.setInt(3, quantity);
				stDetail.executeUpdate();
				
				stStock.setInt(1, quantity);
				stStock.setInt(2, product.getProductId());
				stStock.executeUpdate();
				
			}
			
			con.commit();
			return orderId;
			
		} catch(Exception e) {
			if(con != null) {
				con.rollback();
			}
			e.printStackTrace();
			return 0;
		} finally {
			if(stOrder != null)stOrder.close();
			if(stDetail != null)stDetail.close();
			if(stStock != null)stStock.close();
			if(con != null) {
				con.setAutoCommit(true);
				con.close();
			}
		}
	}

	//購入履歴を取得
	public List<OrderBeans> getOrderHistory(String memberId) throws Exception{
		List<OrderBeans> historyList = new java.util.ArrayList<>();
		Connection con = getConnection();
		
		String sqlOrders = "SELECT * FROM orders WHERE MEMBER_ID = ? ORDER BY ORDER_DATE DESC";
		PreparedStatement stOrders = con.prepareStatement(sqlOrders);
		stOrders.setString(1, memberId);
		ResultSet rsOrders = stOrders.executeQuery();
		
		while (rsOrders.next()) {
			OrderBeans order = new OrderBeans();
			order.setOrderId(rsOrders.getInt("ORDER_ID"));
			order.setTotalPrice(rsOrders.getInt("TOTAL_PRICE"));
			order.setOrderDate(rsOrders.getString("ORDER_DATE"));
			
			// その注文に紐づく「商品の詳細（order_details）」と「商品名や価格（products）」を結合して取得
			List<HistoryItemBeans> itemList = new java.util.ArrayList<>();
			String sqlDetails = "SELECT d.PRODUCT_ID, d.QUAUNTITY, p.PRODUCT_NAME, p.PRICE, p.SPEC, p.IMAGE_URL " +
                    "FROM order_details d " +
                    "JOIN products p ON d.PRODUCT_ID = p.PRODUCT_ID " +
                    "WHERE d.ORDER_ID = ?";
			
			PreparedStatement stDetails = con.prepareStatement(sqlDetails);
			stDetails.setInt(1, order.getOrderId());
			ResultSet rsDetails = stDetails.executeQuery();
			
			while(rsDetails.next()) {
				HistoryItemBeans item = new HistoryItemBeans();
				item.setProductId(rsDetails.getInt("PRODUCT_ID"));
				item.setQuantity(rsDetails.getInt("QUAUNTITY"));
				item.setProductName(rsDetails.getString("PRODUCT_NAME"));
				item.setPrice(rsDetails.getInt("PRICE"));
				item.setSpec(rsDetails.getString("SPEC"));
				item.setImageUrl(rsDetails.getString("IMAGE_URL"));
				
				itemList.add(item);
			}
			rsDetails.close();
			stDetails.close();
			
			// 注文オブジェクトに商品リストを詰め込んで、全体の履歴リストに追加
			order.setItems(itemList);
			historyList.add(order);
		}
		rsOrders.close();
		stOrders.close();
		con.close();
		
		return historyList;
	}

}
