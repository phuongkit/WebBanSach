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
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	private String name;

	//bi-directional many-to-one association to BookGrenre
	@OneToMany(mappedBy="bookCategory")
	private List<BookGrenre> bookGrenres;

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

	public List<BookGrenre> getBookGrenres() {
		return this.bookGrenres;
	}

	public void setBookGrenres(List<BookGrenre> bookGrenres) {
		this.bookGrenres = bookGrenres;
	}

	public BookGrenre addBookGrenre(BookGrenre bookGrenre) {
		getBookGrenres().add(bookGrenre);
		bookGrenre.setBookCategory(this);

		return bookGrenre;
	}

	public BookGrenre removeBookGrenre(BookGrenre bookGrenre) {
		getBookGrenres().remove(bookGrenre);
		bookGrenre.setBookCategory(null);

		return bookGrenre;
	}

}