/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {

    protected Connection connection;
    private final String DATABASE="Trading2022";
    private final String USERNAME = "sa";
    private final String PASSWORD = "123";
    public DBContext() {
        try {
            // Edit URL , username, password to authenticate with your MS SQL Server
            String url = "jdbc:sqlserver://localhost:1433;databaseName="+DATABASE;

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, USERNAME, PASSWORD);
            System.out.println("Connected, Database: " + DATABASE);
        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println(ex);
        }
    }
    
    public static void main(String[] args) {
        new DBContext();
    }
}
