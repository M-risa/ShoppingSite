package jp.co.aforce.beans;

import java.io.Serializable;
import java.util.List;

public class OrderBeans implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int orderId;
	private String orderDate;
	private int totalPrice;
	private List<HistoryItemBeans> items;
	
	
	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public List<HistoryItemBeans> getItems() {
		return items;
	}

	public void setItems(List<HistoryItemBeans> items) {
		this.items = items;
	}


}
