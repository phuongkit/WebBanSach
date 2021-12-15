package Model;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;


/**
 * The persistent class for the Order_Carts database table.
 * 
 */
@Entity
@Table(name="Order_Carts")
@NamedQuery(name="Order_Cart.findAll", query="SELECT o FROM Order_Cart o")
public class Order_Cart implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	private BigDecimal quantity;

	//bi-directional many-to-one association to Cart
	@ManyToOne
	private Cart cart;

	//bi-directional many-to-one association to Order
	@ManyToOne
	private Order order;

	public Order_Cart() {
	}

	public long getId() {
		return this.id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public BigDecimal getQuantity() {
		return this.quantity;
	}

	public void setQuantity(BigDecimal quantity) {
		this.quantity = quantity;
	}

	public Cart getCart() {
		return this.cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public Order getOrder() {
		return this.order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

}