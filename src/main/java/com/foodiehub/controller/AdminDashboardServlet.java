package com.foodiehub.controller;

import java.io.IOException;

import com.foodiehub.dao.MenuDAO;
import com.foodiehub.dao.OrderDAO;
import com.foodiehub.dao.RestaurantDAO;
import com.foodiehub.dao.UserDAO;
import com.foodiehub.daoimpl.MenuDAOImpl;
import com.foodiehub.daoimpl.OrderDAOImpl;
import com.foodiehub.daoimpl.RestaurantDAOImpl;
import com.foodiehub.daoimpl.UserDAOImpl;
import com.foodiehub.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminDashboard")
public class AdminDashboardServlet extends HttpServlet {

    private UserDAO userDAO;
    private RestaurantDAO restaurantDAO;
    private MenuDAO menuDAO;
    private OrderDAO orderDAO;

    @Override
    public void init() throws ServletException {

        userDAO = new UserDAOImpl();
        restaurantDAO = new RestaurantDAOImpl();
        menuDAO = new MenuDAOImpl();
        orderDAO = new OrderDAOImpl();

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

        request.setAttribute("userCount",
                userDAO.getUserCount());

        request.setAttribute("restaurantCount",
                restaurantDAO.getRestaurantCount());

        request.setAttribute("menuCount",
                menuDAO.getMenuCount());

        request.setAttribute("orderCount",
                orderDAO.getOrderCount());

        request.getRequestDispatcher("adminDashboard.jsp")
                .forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);

    }

}