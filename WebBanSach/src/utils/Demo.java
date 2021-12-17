package utils;

import java.math.BigDecimal;

import DAO.BookDAO;

public class Demo {
	   public static void main(String[] args) {
		   double sales = BookDAO.getSalesByBookNotExpired(1);
		   System.out.print(sales);
	   }
}
