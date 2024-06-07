package com.example.demo.model;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

@Embeddable
public class CartProductKey implements Serializable {
	
	@Column(name = "cart_id")
	Integer cartId;
	@Column(name = "product_id")
	Integer productId;
	public CartProductKey(Integer cartId, Integer productId) {
		super();
		this.cartId = cartId;
		this.productId = productId;
	}
	
	public CartProductKey() {
		super();
	}

}
