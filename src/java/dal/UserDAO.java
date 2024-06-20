/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.User;

/**
 *
 * @author vanmi
 */
public class UserDAO extends DBContext {

    
     public User login(String usernameInput, String passwordInput) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        User user = null;
        String sql = "select * from [users] where username = ? and password = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, usernameInput);
            stm.setString(2, passwordInput);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String fullname = rs.getString("fullname");
                
                user = new User(id, username, password, fullname);
            }
            return user;

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
     
     public static void main(String[] args) {
        User u = (new UserDAO()).login("admin", "admin");
        
         System.out.println(u);
    }
}
