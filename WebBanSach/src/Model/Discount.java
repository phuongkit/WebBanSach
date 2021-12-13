package Model;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;


/**
 * The persistent class for the Discount database table.
 * 
 */
@Entity
@NamedQuery(name="Discount.findAll", query="SELECT d FROM Discount d")
public class Discount implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private long id;

	@Column(name="created_at")
	private Timestamp createdAt;

	@Column(name="expired_at")
	private Timestamp expiredAt;

	private String name;

	@Column(name="percent_sale")
	private double percentSale;

	//bi-directional many-to-many association to Book
	@ManyToMany
	@JoinTable(
		name="book_discounts"
		, joinColumns={
			@JoinColumn(name="discount_id")
			}
		, inverseJoinColumns={
			@JoinColumn(name="book_id")
			}
		)
	private List<Book> books;

	public Discount() {
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

	public Timestamp getExpiredAt() {
		return this.expiredAt;
	}

	public void setExpiredAt(Timestamp expiredAt) {
		this.expiredAt = expiredAt;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPercentSale() {
		return this.percentSale;
	}

	public void setPercentSale(double percentSale) {
		this.percentSale = percentSale;
	}

	public List<Book> getBooks() {
		return this.books;
	}

	public void setBooks(List<Book> books) {
		this.books = books;
	}

}