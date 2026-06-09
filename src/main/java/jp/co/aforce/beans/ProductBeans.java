package jp.co.aforce.beans;

import java.io.Serializable;

public class ProductBeans implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int productId;
	private String productName;
	private int price;
	private String category;
	private String spec;
	private int stock;
	private String imageUrl;
	
	public ProductBeans() {}
	
	public int getProductId() { return productId; }
	public void setProductId(int productId) { this.productId = productId; }
	
	public String getProductName() { return productName; }
	public void setProductName(String productName) { this.productName = productName; }
	
	public int getPrice() { return price; }
	public void setPrice(int price) { this.price = price; }
	
	public String getCategory() { return category; }
	public void setCategory(String category) { this.category = category; }
	
	public String getSpec() { return spec; }
	public void setSpec(String spec) { this.spec = spec; }
	
	public int getStock() { return stock; }
	public void setStock(int stock) { this.stock = stock; }
	
	public String getImageUrl() { return imageUrl; }
	public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }



}
