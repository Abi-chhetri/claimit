package com.claimit.utils;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataBase_Config {

	private static String dbName = "claim_it";
	private static String dbUrl = "jdbc:mysql://localhost:3306/" + dbName;
	private static String userName = "claim_it";
	private static String password = "claimit@890";

	public static Connection getConection() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection(dbUrl, userName, password);
	}

}
