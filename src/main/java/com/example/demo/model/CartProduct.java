package com.example.demo.model;

import jakarta.persistence.AttributeOverride;
import jakarta.persistence.Column;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "cart_has_products")
public class CartProduct {

	@EmbeddedId
	CartProductKey cartProductKey;
	
	@ManyToOne
	@MapsId("cartId")
    @JoinColumn(name = "cart_id")
	Cart cart;
	
	@ManyToOne
	@MapsId("productId")
    @JoinColumn(name = "product_id")
	Product product;
	
	@JoinColumn(name = "quantity")
	Integer quantity;

	public CartProduct(CartProductKey cartProductKey, Cart cart, Product product, Integer quantity) {
		super();
		this.cartProductKey = cartProductKey;
		this.cart = cart;
		this.product = product;
		this.quantity = quantity;
	}
	
	public CartProduct() {
		super();
	}
	public CartProductKey getCartProductKey() {
		return cartProductKey;
	}
	public void setCartProductKey(CartProductKey cartProductKey) {
		this.cartProductKey = cartProductKey;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
	
}
