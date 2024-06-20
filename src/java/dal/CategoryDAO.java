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

/**
 *
 * @author vanmi
 */
public class CategoryDAO extends DBContext {

    //Lấy ra tất cả các bản ghi trong bảng Category, sau đó hiển thị chúng lên console
    public ArrayList<Category> getAll() {
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<Category> categories = new ArrayList<>();
        String sql = "select * from [Categories]";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ID");
                String name = rs.getString("name");
                String describe = rs.getString("describe");

                categories.add(new Category(id, name, describe));
            }
            return categories;

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    //Lấy ra category tương ứng dựa theo cid, sau đó hiển thị chúng lên console
    public Category getOne(int cid) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Category category = null;
        String sql = "select * from [Categories] where ID = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ID");
                String name = rs.getString("name");
                String describe = rs.getString("describe");
                category = new Category(id, name, describe);
                return category;
            }

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int insert(Category category) {
        PreparedStatement stm = null;
        int result = -1;
        String sql = "INSERT INTO [dbo].[Categories]\n"
                + "           ([ID]\n"
                + "           ,[name]\n"
                + "           ,[describe])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, category.getId());
            stm.setString(2, category.getName());
            stm.setString(3, category.getDescribe());
            result = stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public int update(Category category) {
        PreparedStatement stm = null;
        int result = -1;
        String sql = "UPDATE [dbo].[Categories]\n"
                + "   SET [ID] = ?\n"
                + "      ,[name] = ?\n"
                + "      ,[describe] = ?\n"
                + " WHERE ID = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, category.getId());
            stm.setString(2, category.getName());
            stm.setString(3, category.getDescribe());
            stm.setInt(4, category.getId());
            result = stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public int delete(int cid) {
        PreparedStatement stm = null;
        int result = -1;
        String sql = "DELETE FROM [dbo].[Categories]\n"
                + "      WHERE ID = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            result = stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public static void main(String[] args) {
//        CategoryDAO categoryDAO = new CategoryDAO();
//        ArrayList<Category> categories = categoryDAO.getAll();
//
//        for (Category category : categories) {
//            System.out.println(category);
//        }

//        Category category = (new CategoryDAO()).getOne(2);
//        System.out.println(category);
//        Category c = new Category(15, "Tét", "test");
//        int result = (new CategoryDAO()).insert(c);
//
//        if (result == 0 || result == -1) {
//            System.out.println("Insert fail! " + c);
//        } else {
//            System.out.println("Insert successful: " + c);
//        }
//        
//        int cid = 15;
//        int result = (new CategoryDAO()).delete(cid);
//
//        if (result == 0 || result == -1) {
//            System.err.println("Delete fail! ID = " + cid);
//        } else {
//            System.out.println("Delete successful! ID = " + cid);
//        }
//        Category c = new Category(5, "abc", "abc");
//        int result = (new CategoryDAO()).update(c);
//
//        if (result == 0 || result == -1) {
//            System.out.println("Update fail! " + c);
//        } else {
//            System.out.println("Update successful: " + c);
//        }

    }
}
