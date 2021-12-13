package Model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the BookCategory database table.
 * 
 */
@Entity
@NamedQuery(name="BookCategory.findAll", query="SELECT b FROM BookCategory b")
public class BookCategory implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private long id;

	private String name;

	//bi-directional many-to-one association to Book
	@OneToMany(mappedBy="bookCategory")
	private List<Book> books;

	public BookCategory() {
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
		book.setBookCategory(this);

		return book;
	}

	public Book removeBook(Book book) {
		getBooks().remove(book);
		book.setBookCategory(null);

		return book;
	}

}