package com.foodiehub.controller;

import java.io.IOException;

import com.foodiehub.dao.UserDAO;
import com.foodiehub.daoimpl.UserDAOImpl;
import com.foodiehub.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {

        userDAO = new UserDAOImpl();

    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = userDAO.loginUser(email, password);

        if (user != null &&
                user.getRole() != null &&
                user.getRole().equalsIgnoreCase("ADMIN")) {

            HttpSession session = request.getSession();

            session.setAttribute("loggedAdmin", user);

            response.sendRedirect("adminDashboard");

        } else {

            request.setAttribute("errorMessage",
                    "Invalid Admin Email or Password");

            request.getRequestDispatcher("adminLogin.jsp")
                    .forward(request, response);

        }
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect("adminLogin.jsp");

    }
}