package com.techblog.repositories;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
    private ConnectionProvider() {}

    public static Connection getConnection() {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        String url = "jdbc:mysql://127.0.0.1:3306/techblog";
        String username = "ajaykdbadmin";
        String password = "Derebail@1234";
        try{
            Connection conn = DriverManager.getConnection(url, username, password);
            if (conn.isClosed()) {
                System.out.println("Connection is closed");
            } else {
                System.out.println("Connection created");
            }
            return conn;
        } catch(SQLException e){
            throw new RuntimeException(e);
        }
    }
}
