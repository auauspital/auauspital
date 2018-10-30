package br.ufrrj.auauspital.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {

	public static Connection getConnection() throws ClassNotFoundException {
		try {
			Class.forName("org.postgresql.Driver");
			return DriverManager.getConnection("jdbc:postgresql://localhost/auauspital", "postgres", "postgres");
		}
		catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
}