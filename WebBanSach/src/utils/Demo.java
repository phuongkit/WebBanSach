package utils;

import java.util.ArrayList;

import DAO.BookDAO;
import Model.Book;

public class Demo {
	   public static void main(String[] args) {
		   ArrayList<Book> books = BookDAO.getAllBookOrderBySales();
		   for(Book book : books) {
			   System.out.println("id:"+book.getId()+"-sales:"+BookDAO.getSalesByBookNotExpired(book.getId()));
		   }
	   }
}
