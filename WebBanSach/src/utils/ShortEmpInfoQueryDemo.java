package utils;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;
import java.util.function.Supplier;

import DAO.AuthorDAO;
import DAO.BookDAO;
import DAO.BookGrenreDAO;
import DAO.SupplierDAO;
import Model.Author;
import Model.Book;
import Model.BookGrenre;

public class ShortEmpInfoQueryDemo {
 
   public static void main(String[] args) {
 
	   Book book = new Book();
		Date nowDate = new Date();
		Timestamp timestamp = new Timestamp(nowDate.getTime());
		
		BookGrenre bookGrenre = BookGrenreDAO.getBookGrenreByID(1);
		Author author = AuthorDAO.getAuthorByID(1);
		Model.Supplier supplier = SupplierDAO.getSupplierByID(2);
		
		
		book.setName("God Of HighSchool");
		book.setDescription("Hay");
		book.setCreatedAt(timestamp);
		book.setPurchasePrice(new BigDecimal(50000));
		book.setQuantityAvailable(new BigDecimal(20));
		book.setQuantitySold(new BigDecimal(10));
		book.setSalePrice(new BigDecimal(5000));
		book.setAuthor(author);
		book.setBookGrenre(bookGrenre);
		book.setSupplier(supplier);
		BookDAO.insertBook(book);
   }
    
}