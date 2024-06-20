/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.sql.Date;
import model.Category;
import model.Product;
import model.User;

/**
 *
 * @author vanmi
 */
public class MainController extends HttpServlet {

    private final String MAIN_URL = "index.jsp";
    private final String ADD_URL = "add-product.jsp";
    private final String UPDATE_URL = "update-product.jsp";
    private final String LOGIN_CONTROLLER = "login";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String service = req.getParameter("service");
        ArrayList<Category> categories = new ArrayList<>();
        ArrayList<Product> products = new ArrayList<>();

        if (service == null) {
            service = "list-all";
        }

        if (service.equals("list-all")) {
            categories = (new CategoryDAO()).getAll();
            products = (new ProductDAO()).getAll();

            req.setAttribute("products", products);
            req.setAttribute("categories", categories);
            req.getRequestDispatcher(MAIN_URL).forward(req, resp);
        }

        if (service.equals("filter-by-category")) {
            int id = Integer.parseInt(req.getParameter("cid"));

            categories = (new CategoryDAO()).getAll();
            req.setAttribute("categories", categories);

            products = (new ProductDAO()).getProductsByCategory(id);
            req.setAttribute("products", products);
            req.getRequestDispatcher(MAIN_URL).forward(req, resp);
        }

        if (service.equals("pre-add")) {
            if ((User) session.getAttribute("user") == null) {
                resp.sendRedirect(LOGIN_CONTROLLER);
            } else {
                categories = (new CategoryDAO()).getAll();
                req.setAttribute("categories", categories);

                req.getRequestDispatcher(ADD_URL).forward(req, resp);
            }
        }

        if (service.equals("add")) {

            String id = req.getParameter("id"), name = req.getParameter("name");

            products = (new ProductDAO()).getAll();
            for (Product p : products) {
                if (p.getId().equals(id)) {
                    req.setAttribute("insertFail", "ID is exist. Please re-enter!");

                    categories = (new CategoryDAO()).getAll();
                    req.setAttribute("categories", categories);
                    req.getRequestDispatcher(ADD_URL).forward(req, resp);
                    return;
                }
            }

            int quantity = Integer.parseInt(req.getParameter("quantity"));
            double price = Double.parseDouble(req.getParameter("price"));
            Date releaseDate = Date.valueOf(req.getParameter("rd"));
            String describe = req.getParameter("describe"), image = req.getParameter("image");
            Category category = (new CategoryDAO()).getOne(Integer.parseInt(req.getParameter("cid")));

            Product newProduct = new Product(id, name, quantity, price, releaseDate, describe, image, category);
            int result = (new ProductDAO()).insert(newProduct);

            if (result >= 1) {
                req.setAttribute("actionOK", "Insert a new product with ID = " + id + " successful");

                categories = (new CategoryDAO()).getAll();
                products = (new ProductDAO()).getAll();

                req.setAttribute("products", products);
                req.setAttribute("categories", categories);
                req.getRequestDispatcher(MAIN_URL).forward(req, resp);
            } else {
                req.setAttribute("insertFail", "Insert fail");

                categories = (new CategoryDAO()).getAll();
                req.setAttribute("categories", categories);
                req.getRequestDispatcher(ADD_URL).forward(req, resp);
            }
        }

        if (service.equals("preUpdate")) {
            if ((User) session.getAttribute("user") == null) {
                resp.sendRedirect(LOGIN_CONTROLLER);
            } else {

                String pid = req.getParameter("pid");

                Product productUpdate = (new ProductDAO()).getOne(pid);

                categories = (new CategoryDAO()).getAll();
                req.setAttribute("categories", categories);

                req.setAttribute("pu", productUpdate);
                req.getRequestDispatcher(UPDATE_URL).forward(req, resp);
            }
        }

        if (service.equals("update")) {

            String id = req.getParameter("id"), name = req.getParameter("name");

            products = (new ProductDAO()).getAll();

            int quantity = Integer.parseInt(req.getParameter("quantity"));
            double price = Double.parseDouble(req.getParameter("price"));
            Date releaseDate = Date.valueOf(req.getParameter("rd"));
            String describe = req.getParameter("describe"), image = req.getParameter("image");
            Category category = (new CategoryDAO()).getOne(Integer.parseInt(req.getParameter("cid")));

            Product updatedProduct = new Product(id, name, quantity, price, releaseDate, describe, image, category);
            int result = (new ProductDAO()).update(updatedProduct);

            if (result >= 1) {
                req.setAttribute("actionOK", "Update a product with ID = " + id + " successful");

                categories = (new CategoryDAO()).getAll();
                products = (new ProductDAO()).getAll();

                req.setAttribute("products", products);
                req.setAttribute("categories", categories);
                req.getRequestDispatcher(MAIN_URL).forward(req, resp);
            }
        }

        if (service.equals("delete")) {
            if ((User) session.getAttribute("user") == null) {
                resp.sendRedirect(LOGIN_CONTROLLER);
            } else {
                String pid = req.getParameter("pid");

                int result = (new ProductDAO()).delete(pid);

                if (result == 1) {
                    req.setAttribute("actionOK", "Delete product with ID = " + pid + " successful");

                    categories = (new CategoryDAO()).getAll();
                    products = (new ProductDAO()).getAll();

                    req.setAttribute("products", products);
                    req.setAttribute("categories", categories);
                    req.getRequestDispatcher(MAIN_URL).forward(req, resp);
                }
            }
        }

        if (service.equals("search")) {
            String keywords = req.getParameter("keywords");
            categories = (new CategoryDAO()).getAll();
            req.setAttribute("categories", categories);
            
            req.setAttribute("keywords", keywords);
            
            products = (new ProductDAO()).getProductsByKeywords(keywords);
            req.setAttribute("products", products);
            
            req.getRequestDispatcher(MAIN_URL).forward(req, resp);
        }

        if (service.equals("sortByPrice")) {
            String type = req.getParameter("type");

            categories = (new CategoryDAO()).getAll();
            req.setAttribute("categories", categories);

            products = (new ProductDAO()).sortProductsByPrice(type);
            req.setAttribute("products", products);

            req.getRequestDispatcher(MAIN_URL).forward(req, resp);
        }

        if (service.equals("filter-by-price")) {
            double start = Double.parseDouble(req.getParameter("start"));
            double end = Double.parseDouble(req.getParameter("end"));

            categories = (new CategoryDAO()).getAll();
            req.setAttribute("categories", categories);

            products = (new ProductDAO()).getProductsByPriceRange(start, end);

            if (products.isEmpty()) {
                req.setAttribute("emptylist", "Không có sản phẩm nào trong khoảng giá này");
            }
            req.setAttribute("products", products);

            req.setAttribute("start", start);
            req.setAttribute("end", end);

            req.getRequestDispatcher(MAIN_URL).forward(req, resp);
        }
    }

}
