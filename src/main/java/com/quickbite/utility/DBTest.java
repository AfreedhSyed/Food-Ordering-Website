package com.quickbite.utility;

import java.sql.Connection;

public class DBTest {
    public static void main(String[] args) {
        Connection conn = DBConnection.getConnection();
        if (conn != null) {
            System.out.println("✅ DB connected successfully");
        } else {
            System.out.println("❌ DB connection failed");
        }
    }
}
