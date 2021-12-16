package Model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the BookGrenre database table.
 * 
 */
@Entity
@NamedQuery(name="BookGrenre.findAll", query="SELECT b FROM BookGrenre b")
public class BookGrenre implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	private String name;

	//bi-directional many-to-one association to Book
	@OneToMany(mappedBy="bookGrenre")
	private List<Book> books;

	//bi-directional many-to-one association to BookCategory
	@ManyToOne
	@JoinColumn(name="bookcategory_id")
	private BookCategory bookCategory;

	public BookGrenre() {
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

	public List<Book> getBooks() {
		return this.books;
	}

	public void setBooks(List<Book> books) {
		this.books = books;
	}

	public Book addBook(Book book) {
		getBooks().add(book);
		book.setBookGrenre(this);

		return book;
	}

	public Book removeBook(Book book) {
		getBooks().remove(book);
		book.setBookGrenre(null);

		return book;
	}

	public BookCategory getBookCategory() {
		return this.bookCategory;
	}

	public void setBookCategory(BookCategory bookCategory) {
		this.bookCategory = bookCategory;
	}

}