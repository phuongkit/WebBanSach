package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnection;
import entities.Sach;

public class DBUtils {
	public static ArrayList<Sach> getAllBook() {
		// TODO Auto-generated method stub
		
		ArrayList<Sach> listBook = new ArrayList<Sach>();
		try {
			Connection conn = DBConnection.initializeDatabase();
			String query = "select * from Sach"; 
			PreparedStatement statement = conn.prepareStatement(query);
			ResultSet resultSet = statement.executeQuery();
			while (resultSet.next()) {
				listBook.add(new Sach(
									resultSet.getString(1),
									resultSet.getString(2),
									resultSet.getString(3),
									resultSet.getString(4),
									resultSet.getString(5),
									resultSet.getString(6),
									resultSet.getFloat(7),
									resultSet.getFloat(8),
									resultSet.getFloat(9),
									resultSet.getFloat(10)));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listBook;
	}
}
