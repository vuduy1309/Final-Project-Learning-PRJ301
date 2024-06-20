/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Product;

/**
 *
 * @author vanmi
 */
public class ProductDAO extends DBContext {

    public ArrayList<Product> getAll() {
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<Product> products = new ArrayList<>();
        String sql = "select * from [products]";
        try {
            stm = connection.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = rs.getString("ID");
                String name = rs.getString("name");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                Date releaseDate = rs.getDate("releaseDate");
                String describe = rs.getString("describe");
                String image = rs.getString("image");
                int cid = rs.getInt("cid");

                //Ở đây chưa thể tạo đối tượng product và add vào list vì:
                // Đối tượng product cần có bên trong 1 đối tượng Category mà ở đây
                // mình mới chỉ lấy được cid từ csdl
                //-> Ở bên CategoryDAO cần code thêm 1 hàm có khả năng từ cid lấy ra được 1 đối tượng category
                Category category = (new CategoryDAO()).getOne(cid);

                Product p = new Product(id, name, quantity, price, releaseDate, describe, image, category);
                products.add(p);
            }
            return products;

        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Product getOne(String pid) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        Product product = null;
        String sql = "select * from [products] where ID = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, pid);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = rs.getString("ID");
                String name = rs.getString("name");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                Date releaseDate = rs.getDate("releaseDate");
                String describe = rs.getString("describe");
                String image = rs.getString("image");
                int cid = rs.getInt("cid");

                //Ở đây chưa thể tạo đối tượng product và add vào list vì:
                // Đối tượng product cần có bên tỏng 1 đối tượng Category mà ở đây
                // mình mới chỉ lấy được cid từ csdl
                //-> Ở bên CategoryDAO cần code thêm 1 hàm có khả năng từ cid lấy ra được 1 đối tượng category
                Category category = (new CategoryDAO()).getOne(cid);

                product = new Product(id, name, quantity, price, releaseDate, describe, image, category);
                return product;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Product> getProductsByCategory(int cid) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<Product> products = new ArrayList<>();
        String sql = "select * from [products] where cid = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = rs.getString("ID");
                String name = rs.getString("name");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                Date releaseDate = rs.getDate("releaseDate");
                String describe = rs.getString("describe");
                String image = rs.getString("image");
                int catId = rs.getInt("cid");

                Category category = (new CategoryDAO()).getOne(catId);

                Product product = new Product(id, name, quantity, price, releaseDate, describe, image, category);
                products.add(product);
            }
            return products;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Product> getProductsByKeywords(String keywords) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<Product> products = new ArrayList<>();
        String sql = "select * from [products] where name LIKE ? ";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + keywords + "%");
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = rs.getString("ID");
                String name = rs.getString("name");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                Date releaseDate = rs.getDate("releaseDate");
                String describe = rs.getString("describe");
                String image = rs.getString("image");
                int catId = rs.getInt("cid");

                Category category = (new CategoryDAO()).getOne(catId);

                Product product = new Product(id, name, quantity, price, releaseDate, describe, image, category);
                products.add(product);
            }
            return products;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Product> sortProductsByPrice(String type) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<Product> products = new ArrayList<>();
        String sql = "select * from [products] order by price " + type;
        try {
            stm = connection.prepareStatement(sql);
//            stm.setString(1, type);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = rs.getString("ID");
                String name = rs.getString("name");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                Date releaseDate = rs.getDate("releaseDate");
                String describe = rs.getString("describe");
                String image = rs.getString("image");
                int catId = rs.getInt("cid");

                Category category = (new CategoryDAO()).getOne(catId);

                Product product = new Product(id, name, quantity, price, releaseDate, describe, image, category);
                products.add(product);
            }
            return products;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Product> getProductsByPriceRange(double start, double end) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<Product> products = new ArrayList<>();
        String sql = "select * from [products]"
                + "\n where ? < price and price < ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setDouble(1, start);
            stm.setDouble(2, end);
            rs = stm.executeQuery();
            while (rs.next()) {
                String id = rs.getString("ID");
                String name = rs.getString("name");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                Date releaseDate = rs.getDate("releaseDate");
                String describe = rs.getString("describe");
                String image = rs.getString("image");
                int catId = rs.getInt("cid");

                Category category = (new CategoryDAO()).getOne(catId);

                Product product = new Product(id, name, quantity, price, releaseDate, describe, image, category);
                products.add(product);
            }
            return products;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int insert(Product product) {
        PreparedStatement stm = null;
        int result = -1;
        String sql = "INSERT INTO [dbo].[products]\n"
                + "           ([ID]\n"
                + "           ,[name]\n"
                + "           ,[quantity]\n"
                + "           ,[price]\n"
                + "           ,[releaseDate]\n"
                + "           ,[describe]\n"
                + "           ,[image]\n"
                + "           ,[cid])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, product.getId());
            stm.setString(2, product.getName());
            stm.setInt(3, product.getQuantity());
            stm.setDouble(4, product.getPrice());
            stm.setDate(5, product.getReleaseDate());
            stm.setString(6, product.getDescribe());
            stm.setString(7, product.getImage());
            stm.setInt(8, product.getCategory().getId());

            result = stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public int update(Product product) {
        PreparedStatement stm = null;
        int result = -1;
        String sql = "UPDATE [dbo].[products]\n"
                + "   SET [ID] = ?\n"
                + "      ,[name] = ?\n"
                + "      ,[quantity] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[releaseDate] = ?\n"
                + "      ,[describe] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[cid] = ?\n"
                + " WHERE [ID] = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, product.getId());
            stm.setString(2, product.getName());
            stm.setInt(3, product.getQuantity());
            stm.setDouble(4, product.getPrice());
            stm.setDate(5, product.getReleaseDate());
            stm.setString(6, product.getDescribe());
            stm.setString(7, product.getImage());
            stm.setInt(8, product.getCategory().getId());
            stm.setString(9, product.getId());

            result = stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public int delete(String pid) {
        PreparedStatement stm = null;
        int result = -1;
        String sql = "DELETE FROM [dbo].[products]\n"
                + "      WHERE ID = ?";
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, pid);
            result = stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    public static void main(String[] args) {
//        ArrayList<Product> products = (new ProductDAO()).getAll();
//
//        for (Product product : products) {
//            System.out.println(product);
//        }
//
//        Product pro = (new ProductDAO()).getOne("ip2");
//        System.out.println(pro);
//        System.out.println("Category name: " + pro.getCategory().getName());
    }
}
