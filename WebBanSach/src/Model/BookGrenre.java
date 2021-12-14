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
	private long id;

	private String name;

	//bi-directional many-to-one association to Book
	@OneToMany(mappedBy="bookGrenre")
	private List<Book> books;

	//bi-directional many-to-one association to BookGrenre
	@ManyToOne
	@JoinColumn(name="bookcategory_id")
	private BookGrenre bookGrenre;

	//bi-directional many-to-one association to BookGrenre
	@OneToMany(mappedBy="bookGrenre")
	private List<BookGrenre> bookGrenres;

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

	public BookGrenre getBookGrenre() {
		return this.bookGrenre;
	}

	public void setBookGrenre(BookGrenre bookGrenre) {
		this.bookGrenre = bookGrenre;
	}

	public List<BookGrenre> getBookGrenres() {
		return this.bookGrenres;
	}

	public void setBookGrenres(List<BookGrenre> bookGrenres) {
		this.bookGrenres = bookGrenres;
	}

	public BookGrenre addBookGrenre(BookGrenre bookGrenre) {
		getBookGrenres().add(bookGrenre);
		bookGrenre.setBookGrenre(this);

		return bookGrenre;
	}

	public BookGrenre removeBookGrenre(BookGrenre bookGrenre) {
		getBookGrenres().remove(bookGrenre);
		bookGrenre.setBookGrenre(null);

		return bookGrenre;
	}

}