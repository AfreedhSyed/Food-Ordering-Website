package com.quickbite.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/quickbite?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "Afreedhsyed123";

    public static Connection getConnection() {
        try {
            System.out.println("⚙️ Loading JDBC Driver...");
            Class.forName("com.mysql.cj.jdbc.Driver");

            System.out.println("🔌 Connecting to Database...");
            Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);

            System.out.println("✅ Connection established!");
            return connection;
        } catch (SQLException e) {
        	System.out.println("❌ Failed to connect: " + e.getMessage());
        	e.printStackTrace();
        	return null;
        } catch (ClassNotFoundException e) {
        	System.out.println("❌ Failed to connect: " + e.getMessage());
        	e.printStackTrace();
        	return null;
        }
    }
}
