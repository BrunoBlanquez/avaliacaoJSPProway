package com.blog.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
    public static Connection conectar() {
        Connection con = null;
        String url = "jdbc:mysql://localhost/blog";
        String user = "root";
        String password = "xxx";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        try {
            con = DriverManager.getConnection(url, user, password);
        } catch (SQLException e) {
            return con;
        }
        return con;
    }
}
