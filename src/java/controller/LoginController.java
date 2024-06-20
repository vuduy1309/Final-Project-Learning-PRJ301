/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.User;

/**
 *
 * @author vanmi
 */
public class LoginController extends HttpServlet {

    private final String LOGIN_URL = "login.jsp";
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect(LOGIN_URL);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        
        User userLogin = (new UserDAO()).login(username, password);
        
        if (userLogin == null) {
            req.setAttribute("loginFail", "Username or Password is incorrect");
            req.getRequestDispatcher(LOGIN_URL).forward(req, resp);
        } else {
            session.setAttribute("user", userLogin);
            resp.sendRedirect("main");
        }
    }

}
