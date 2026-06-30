package com.foodiehub.controller;

import java.io.IOException;
import java.util.List;

import com.foodiehub.dao.MenuDAO;
import com.foodiehub.dao.RestaurantDAO;
import com.foodiehub.daoimpl.MenuDAOImpl;
import com.foodiehub.daoimpl.RestaurantDAOImpl;
import com.foodiehub.model.Menu;
import com.foodiehub.model.Restaurant;
import com.foodiehub.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminMenu")
public class AdminMenuServelt extends HttpServlet {

    private MenuDAO menuDAO;
    private RestaurantDAO restaurantDAO;

    @Override
    public void init() throws ServletException {

        menuDAO = new MenuDAOImpl();
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

                List<Menu> menuList = menuDAO.getAllMenus();

                request.setAttribute("menuList", menuList);

                request.getRequestDispatcher("adminMenu.jsp")
                        .forward(request, response);

                break;

            case "delete":

                int menuId = Integer.parseInt(
                        request.getParameter("menuId"));

                menuDAO.deleteMenu(menuId);

                response.sendRedirect("adminMenu");

                break;

            case "add":

                List<Restaurant> restaurantList =
                        restaurantDAO.getAllRestaurants();

                request.setAttribute("restaurantList", restaurantList);

                request.getRequestDispatcher("addMenu.jsp")
                        .forward(request, response);

                break;

            case "edit":

                menuId = Integer.parseInt(
                        request.getParameter("menuId"));

                Menu menu = menuDAO.getMenuById(menuId);

                restaurantList = restaurantDAO.getAllRestaurants();

                request.setAttribute("menu", menu);

                request.setAttribute("restaurantList", restaurantList);

                request.getRequestDispatcher("editMenu.jsp")
                        .forward(request, response);

                break;

            default:

                response.sendRedirect("adminMenu");

                break;

        }

    }
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String menuId = request.getParameter("menuId");

        int restaurantId = Integer.parseInt(
                request.getParameter("restaurantId"));

        String itemName = request.getParameter("itemName");

        String description = request.getParameter("description");

        double price = Double.parseDouble(
                request.getParameter("price"));

        String category = request.getParameter("category");

        String imageUrl = request.getParameter("imageUrl");

        boolean available = Boolean.parseBoolean(
                request.getParameter("available"));

        Menu menu = new Menu();

        menu.setRestaurantId(restaurantId);
        menu.setItemName(itemName);
        menu.setDescription(description);
        menu.setPrice(price);
        menu.setCategory(category);
        menu.setImageUrl(imageUrl);
        menu.setAvailable(available);

        if (menuId == null || menuId.isEmpty()) {

            menuDAO.addMenu(menu);

        } else {

            menu.setMenuId(Integer.parseInt(menuId));

            menuDAO.updateMenu(menu);

        }

        response.sendRedirect("adminMenu");

    }

}