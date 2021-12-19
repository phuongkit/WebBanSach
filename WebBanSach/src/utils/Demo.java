package utils;

import java.math.BigDecimal;
import java.util.ArrayList;

import DAO.AccountDAO;
import DAO.BookDAO;
import DAO.OrderDAO;
import Model.Account;
import Model.Book;

public class Demo {
	   public static void main(String[] args) {
		   BigDecimal total = OrderDAO.getTotalMoneyByOrder(1);
		   System.out.print(total.toString());
	   }
}
