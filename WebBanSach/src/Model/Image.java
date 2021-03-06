package Model;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;


/**
 * The persistent class for the Image database table.
 * 
 */
@Entity
@NamedQuery(name="Image.findAll", query="SELECT i FROM Image i")
public class Image implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	@Column(name="created_at")
	private Timestamp createdAt;

	private String name;

	//bi-directional many-to-one association to Book
	@OneToMany(mappedBy="image")
	private List<Book> books;

	//bi-directional many-to-one association to Book
	@ManyToOne
	private Book book;

	public Image() {
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

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Book> getBooks() {
		return this.books;
	}

	public void setBooks(List<Book> books) {
		this.books = books;
	}

	public Book addBook(Book book) {
		getBooks().add(book);
		book.setImage(this);

		return book;
	}

	public Book removeBook(Book book) {
		getBooks().remove(book);
		book.setImage(null);

		return book;
	}

	public Book getBook() {
		return this.book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

}