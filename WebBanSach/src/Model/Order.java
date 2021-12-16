package Model;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;


/**
 * The persistent class for the Orders database table.
 * 
 */
@Entity
@Table(name="Orders")
@NamedQuery(name="Order.findAll", query="SELECT o FROM Order o")
public class Order implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	@Column(name="created_at")
	private Timestamp createdAt;

	@Column(name="delivery_address")
	private String deliveryAddress;

	@Column(name="delivery_fullname")
	private String deliveryFullname;

	@Column(name="delivery_phone")
	private String deliveryPhone;

	//bi-directional many-to-one association to Order_Cart
	@OneToMany(mappedBy="order")
	private List<Order_Cart> orderCarts;

	//bi-directional many-to-one association to Account
	@ManyToOne
	private Account account;

	//bi-directional many-to-one association to DeliveryStatus
	@ManyToOne
	@JoinColumn(name="deliverystatus_id")
	private DeliveryStatus deliveryStatus;

	//bi-directional many-to-one association to Payment
	@ManyToOne
	private Payment payment;

	//bi-directional many-to-one association to ShippingMethod
	@ManyToOne
	@JoinColumn(name="shippingmethod_id")
	private ShippingMethod shippingMethod;

	public Order() {
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

	public String getDeliveryAddress() {
		return this.deliveryAddress;
	}

	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}

	public String getDeliveryFullname() {
		return this.deliveryFullname;
	}

	public void setDeliveryFullname(String deliveryFullname) {
		this.deliveryFullname = deliveryFullname;
	}

	public String getDeliveryPhone() {
		return this.deliveryPhone;
	}

	public void setDeliveryPhone(String deliveryPhone) {
		this.deliveryPhone = deliveryPhone;
	}

	public List<Order_Cart> getOrderCarts() {
		return this.orderCarts;
	}

	public void setOrderCarts(List<Order_Cart> orderCarts) {
		this.orderCarts = orderCarts;
	}

	public Order_Cart addOrderCart(Order_Cart orderCart) {
		getOrderCarts().add(orderCart);
		orderCart.setOrder(this);

		return orderCart;
	}

	public Order_Cart removeOrderCart(Order_Cart orderCart) {
		getOrderCarts().remove(orderCart);
		orderCart.setOrder(null);

		return orderCart;
	}

	public Account getAccount() {
		return this.account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public DeliveryStatus getDeliveryStatus() {
		return this.deliveryStatus;
	}

	public void setDeliveryStatus(DeliveryStatus deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}

	public Payment getPayment() {
		return this.payment;
	}

	public void setPayment(Payment payment) {
		this.payment = payment;
	}

	public ShippingMethod getShippingMethod() {
		return this.shippingMethod;
	}

	public void setShippingMethod(ShippingMethod shippingMethod) {
		this.shippingMethod = shippingMethod;
	}

}