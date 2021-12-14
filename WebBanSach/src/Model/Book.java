package Model;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;


/**
 * The persistent class for the Book database table.
 * 
 */
@Entity
@NamedQuery(name="Book.findAll", query="SELECT b FROM Book b")
public class Book implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private long id;

	@Column(name="created_at")
	private Timestamp createdAt;

	private String description;

	private String name;

	@Column(name="purchase_price")
	private BigDecimal purchasePrice;

	@Column(name="quantity_available")
	private BigDecimal quantityAvailable;

	@Column(name="quantity_sold")
	private BigDecimal quantitySold;

	@Column(name="sale_price")
	private BigDecimal salePrice;

	//bi-directional many-to-one association to Author
	@ManyToOne
	private Author author;

	//bi-directional many-to-one association to BookGrenre
	@ManyToOne
	@JoinColumn(name="bookgrenre_id")
	private BookGrenre bookGrenre;

	//bi-directional many-to-one association to Supplier
	@ManyToOne
	private Supplier supplier;

	//bi-directional many-to-one association to Cart
	@OneToMany(mappedBy="book")
	private List<Cart> carts;

	//bi-directional many-to-one association to Image
	@OneToMany(mappedBy="book")
	private List<Image> images;

	//bi-directional many-to-many association to Discount
	@ManyToMany(mappedBy="books")
	private List<Discount> discounts;

	public Book() {
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

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public BigDecimal getPurchasePrice() {
		return this.purchasePrice;
	}

	public void setPurchasePrice(BigDecimal purchasePrice) {
		this.purchasePrice = purchasePrice;
	}

	public BigDecimal getQuantityAvailable() {
		return this.quantityAvailable;
	}

	public void setQuantityAvailable(BigDecimal quantityAvailable) {
		this.quantityAvailable = quantityAvailable;
	}

	public BigDecimal getQuantitySold() {
		return this.quantitySold;
	}

	public void setQuantitySold(BigDecimal quantitySold) {
		this.quantitySold = quantitySold;
	}

	public BigDecimal getSalePrice() {
		return this.salePrice;
	}

	public void setSalePrice(BigDecimal salePrice) {
		this.salePrice = salePrice;
	}

	public Author getAuthor() {
		return this.author;
	}

	public void setAuthor(Author author) {
		this.author = author;
	}

	public BookGrenre getBookGrenre() {
		return this.bookGrenre;
	}

	public void setBookGrenre(BookGrenre bookGrenre) {
		this.bookGrenre = bookGrenre;
	}

	public Supplier getSupplier() {
		return this.supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	public List<Cart> getCarts() {
		return this.carts;
	}

	public void setCarts(List<Cart> carts) {
		this.carts = carts;
	}

	public Cart addCart(Cart cart) {
		getCarts().add(cart);
		cart.setBook(this);

		return cart;
	}

	public Cart removeCart(Cart cart) {
		getCarts().remove(cart);
		cart.setBook(null);

		return cart;
	}

	public List<Image> getImages() {
		return this.images;
	}

	public void setImages(List<Image> images) {
		this.images = images;
	}

	public Image addImage(Image image) {
		getImages().add(image);
		image.setBook(this);

		return image;
	}

	public Image removeImage(Image image) {
		getImages().remove(image);
		image.setBook(null);

		return image;
	}

	public List<Discount> getDiscounts() {
		return this.discounts;
	}

	public void setDiscounts(List<Discount> discounts) {
		this.discounts = discounts;
	}

}