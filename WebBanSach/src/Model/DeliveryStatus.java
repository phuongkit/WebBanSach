package Model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the DeliveryStatus database table.
 * 
 */
@Entity
@NamedQuery(name="DeliveryStatus.findAll", query="SELECT d FROM DeliveryStatus d")
public class DeliveryStatus implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	private String name;

	//bi-directional many-to-one association to Order
	@OneToMany(mappedBy="deliveryStatus")
	private List<Order> orders;

	public DeliveryStatus() {
	}

	public long getId() {
		return this.id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Order> getOrders() {
		return this.orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public Order addOrder(Order order) {
		getOrders().add(order);
		order.setDeliveryStatus(this);

		return order;
	}

	public Order removeOrder(Order order) {
		getOrders().remove(order);
		order.setDeliveryStatus(null);

		return order;
	}

}