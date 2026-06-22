package jp.co.aforce.beans;

import java.io.Serializable;

public class CartItemBeans implements Serializable {

	private ProductBeans product;
	private int count;

	public CartItemBeans() {
	}

	public CartItemBeans(ProductBeans product, int count) {
		this.product = product;
		this.count = count;

	}

	public ProductBeans getProduct() {
		return product;
	}

	public void setProduct(ProductBeans product) {
		this.product = product;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	public int getSubtotal() {
		return this.product.getPrice() * this.count;
	}
	
	public int getTaxIncludedPrice() {
		return (int)(this.product.getPrice() * 1.10);
	}
	
	public int getTaxIncludedSubtotal() {
		return getTaxIncludedPrice() * this.count;
	}

}
