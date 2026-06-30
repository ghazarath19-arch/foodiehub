package com.foodiehub.controller;

import java.io.IOException;
import java.util.List;

import com.foodiehub.dao.UserDAO;
import com.foodiehub.daoimpl.UserDAOImpl;
import com.foodiehub.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminUsers")
public class AdminUserServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {

        userDAO = new UserDAOImpl();

    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null) {

            response.sendRedirect("adminLogin.jsp");
            return;

        }

        User admin = (User) session.getAttribute("loggedAdmin");

        if (admin == null) {

            response.sendRedirect("adminLogin.jsp");
            return;

        }

        String action = request.getParameter("action");

        if (action == null) {

            action = "list";

        }

        switch (action) {

            case "list":

                List<User> userList = userDAO.getAllUsers();

                request.setAttribute("userList", userList);

                request.getRequestDispatcher("adminUsers.jsp")
                        .forward(request, response);

                break;

            case "delete":

                int userId = Integer.parseInt(
                        request.getParameter("userId"));

                userDAO.deleteUser(userId);

                response.sendRedirect("adminUsers");

                break;

            default:

                response.sendRedirect("adminUsers");

                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);

    }
}