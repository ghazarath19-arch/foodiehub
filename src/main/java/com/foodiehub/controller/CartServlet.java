package com.foodiehub.controller;

import java.io.IOException;

import com.foodiehub.dao.MenuDAO;
import com.foodiehub.daoimpl.MenuDAOImpl;
import com.foodiehub.model.Cart;
import com.foodiehub.model.CartItem;
import com.foodiehub.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private MenuDAO menuDAO;

    @Override
    public void init() throws ServletException {
        menuDAO = new MenuDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        String action = request.getParameter("action");

        if (action == null) {
            request.getRequestDispatcher("cart.jsp")
                    .forward(request, response);
            return;
        }
        if ("add".equals(action)) {

            int menuId = Integer.parseInt(request.getParameter("menuId"));

            Menu menu = menuDAO.getMenuById(menuId);

            if (menu != null) {

                CartItem item = new CartItem(
                        menu.getMenuId(),
                        menu.getRestaurantId(),
                        menu.getItemName(),
                        menu.getPrice(),
                        1,
                        menu.getImageUrl()
                );

                cart.addItem(item);
            }

            session.setAttribute("cart", cart);

            response.sendRedirect("cart");

        }
        else if ("remove".equals(action)) {

            int menuId = Integer.parseInt(request.getParameter("menuId"));

            cart.removeItem(menuId);

            session.setAttribute("cart", cart);

            response.sendRedirect("cart");

        }
        else if ("update".equals(action)) {

            int menuId = Integer.parseInt(request.getParameter("menuId"));

            int quantity = Integer.parseInt(request.getParameter("quantity"));

            cart.updateItem(menuId, quantity);

            session.setAttribute("cart", cart);

            response.sendRedirect("cart");

        }
        else {

            request.getRequestDispatcher("cart.jsp")
                    .forward(request, response);

        }

    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }

}