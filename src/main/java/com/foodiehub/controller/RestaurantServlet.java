package com.foodiehub.controller;

import java.io.IOException;
import java.util.List;

import com.foodiehub.dao.RestaurantDAO;
import com.foodiehub.daoimpl.RestaurantDAOImpl;
import com.foodiehub.model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/restaurants")
public class RestaurantServlet extends HttpServlet {

    private RestaurantDAO restaurantDAO;

    @Override
    public void init() throws ServletException {
        restaurantDAO = new RestaurantDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        List<Restaurant> restaurantList = restaurantDAO.getAllRestaurants();

        request.setAttribute("restaurants", restaurantList);

        RequestDispatcher rd = request.getRequestDispatcher("restaurants.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}