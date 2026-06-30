package com.foodiehub.controller;

import java.io.IOException;
import java.util.List;

import com.foodiehub.dao.RestaurantDAO;
import com.foodiehub.daoimpl.RestaurantDAOImpl;
import com.foodiehub.model.Restaurant;
import com.foodiehub.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminRestaurants")
public class AdminRestaurantServlet extends HttpServlet {

    private RestaurantDAO restaurantDAO;

    @Override
    public void init() throws ServletException {

        restaurantDAO = new RestaurantDAOImpl();

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

                List<Restaurant> restaurantList =
                        restaurantDAO.getAllRestaurants();

                request.setAttribute("restaurantList", restaurantList);

                request.getRequestDispatcher("adminRestaurant.jsp")
                        .forward(request, response);

                break;

            case "delete":

                int restaurantId = Integer.parseInt(
                        request.getParameter("restaurantId"));

                restaurantDAO.deleteRestaurant(restaurantId);

                response.sendRedirect("adminRestaurants");

                break;

            case "add":

                request.getRequestDispatcher("addrestaurant.jsp")
                        .forward(request, response);

                break;

            case "edit":

                restaurantId = Integer.parseInt(
                        request.getParameter("restaurantId"));

                Restaurant restaurant =
                        restaurantDAO.getRestaurant(restaurantId);

                request.setAttribute("restaurant", restaurant);

                request.getRequestDispatcher("editRestaurant.jsp")
                        .forward(request, response);

                break;

            default:

                response.sendRedirect("adminRestaurants");

                break;

        }
    }
            @Override
            protected void doPost (HttpServletRequest request,
                    HttpServletResponse response)
            throws ServletException, IOException {

                String restaurantId = request.getParameter("restaurantId");

                String restaurantName = request.getParameter("restaurantName");
                String cuisineType = request.getParameter("cuisineType");
                String address = request.getParameter("address");
                double rating = Double.parseDouble(request.getParameter("rating"));
                int deliveryTime = Integer.parseInt(request.getParameter("deliveryTime"));
                String imageUrl = request.getParameter("imageUrl");
                boolean active = Boolean.parseBoolean(request.getParameter("active"));
                String phoneNumber = request.getParameter("phoneNumber");
                String openingTime = request.getParameter("openingTime");
                String closingTime = request.getParameter("closingTime");

                Restaurant restaurant = new Restaurant();

                restaurant.setRestaurantName(restaurantName);
                restaurant.setCuisineType(cuisineType);
                restaurant.setAddress(address);
                restaurant.setRating(rating);
                restaurant.setDeliveryTime(deliveryTime);
                restaurant.setImageUrl(imageUrl);
                restaurant.setActive(active);
                restaurant.setPhoneNumber(phoneNumber);
                restaurant.setOpeningTime(openingTime);
                restaurant.setClosingTime(closingTime);

                if (restaurantId == null || restaurantId.isEmpty()) {

                    restaurantDAO.insertRestaurant(restaurant);

                } else {

                    restaurant.setRestaurantId(Integer.parseInt(restaurantId));

                    restaurantDAO.updateRestaurant(restaurant);

                }

                response.sendRedirect("adminRestaurants");

            }
        }
