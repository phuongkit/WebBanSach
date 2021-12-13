package Model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the ShippingMethod database table.
 * 
 */
@Entity
@NamedQuery(name="ShippingMethod.findAll", query="SELECT s FROM ShippingMethod s")
public class ShippingMethod implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private long id;

	private String name;

	//bi-directional many-to-one association to Order
	@OneToMany(mappedBy="shippingMethod")
	private List<Order> orders;

	public ShippingMethod() {
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
		order.setShippingMethod(this);

		return order;
	}

	public Order removeOrder(Order order) {
		getOrders().remove(order);
		order.setShippingMethod(null);

		return order;
	}

}