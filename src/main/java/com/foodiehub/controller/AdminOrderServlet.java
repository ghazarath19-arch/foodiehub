package com.foodiehub.controller;

import java.io.IOException;
import java.util.List;

import com.foodiehub.dao.OrderDAO;
import com.foodiehub.daoimpl.OrderDAOImpl;
import com.foodiehub.model.Order;
import com.foodiehub.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminOrders")
public class AdminOrderServlet extends HttpServlet {

    private OrderDAO orderDAO;

    @Override
    public void init() throws ServletException {

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

        String action = request.getParameter("action");

        if (action == null) {

            action = "list";

        }
        switch (action) {

            case "list":

                List<Order> orderList = orderDAO.getAllOrders();

                request.setAttribute("orderList", orderList);

                request.getRequestDispatcher("adminOrders.jsp")
                        .forward(request, response);

                break;

            case "update":

                int orderId = Integer.parseInt(
                        request.getParameter("orderId"));

                String status = request.getParameter("status");

                orderDAO.updateOrderStatus(orderId, status);

                response.sendRedirect("adminOrders");

                break;

            default:

                response.sendRedirect("adminOrders");

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