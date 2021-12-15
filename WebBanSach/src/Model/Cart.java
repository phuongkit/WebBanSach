package Model;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;


/**
 * The persistent class for the Cart database table.
 * 
 */
@Entity
@NamedQuery(name="Cart.findAll", query="SELECT c FROM Cart c")
public class Cart implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	@Column(name="created_at")
	private Timestamp createdAt;

	private BigDecimal quantity;

	//bi-directional many-to-one association to Account
	@ManyToOne
	private Account account;

	//bi-directional many-to-one association to Book
	@ManyToOne
	private Book book;

	//bi-directional many-to-one association to Order_Cart
	@OneToMany(mappedBy="cart")
	private List<Order_Cart> orderCarts;

	public Cart() {
	}

	public long getId() {
		return this.id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Timestamp getCreatedAt() {
		return this.createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public BigDecimal getQuantity() {
		return this.quantity;
	}

	public void setQuantity(BigDecimal quantity) {
		this.quantity = quantity;
	}

	public Account getAccount() {
		return this.account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public Book getBook() {
		return this.book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public List<Order_Cart> getOrderCarts() {
		return this.orderCarts;
	}

	public void setOrderCarts(List<Order_Cart> orderCarts) {
		this.orderCarts = orderCarts;
	}

	public Order_Cart addOrderCart(Order_Cart orderCart) {
		getOrderCarts().add(orderCart);
		orderCart.setCart(this);

		return orderCart;
	}

	public Order_Cart removeOrderCart(Order_Cart orderCart) {
		getOrderCarts().remove(orderCart);
		orderCart.setCart(null);

		return orderCart;
	}

}