package com.foodiehub.controller;

import java.io.IOException;
import java.util.List;

import com.foodiehub.dao.MenuDAO;
import com.foodiehub.daoimpl.MenuDAOImpl;
import com.foodiehub.model.Menu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {

    private MenuDAO menuDAO;

    @Override
    public void init() throws ServletException {
        menuDAO = new MenuDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("restaurantId");

        if (id == null || id.isEmpty()) {
            response.sendRedirect("restaurants");
            return;
        }

        int restaurantId = Integer.parseInt(id);

        List<Menu> menuList = menuDAO.getMenusByRestaurantId(restaurantId);

        request.setAttribute("menuList", menuList);
        request.setAttribute("restaurantId", restaurantId);

        RequestDispatcher rd = request.getRequestDispatcher("menu.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}