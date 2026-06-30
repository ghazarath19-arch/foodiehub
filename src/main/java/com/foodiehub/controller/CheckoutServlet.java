package com.foodiehub.controller;

import java.io.IOException;

import com.foodiehub.dao.OrderDAO;
import com.foodiehub.dao.OrderItemDAO;
import com.foodiehub.daoimpl.OrderDAOImpl;
import com.foodiehub.daoimpl.OrderItemDAOImpl;
import com.foodiehub.model.Cart;
import com.foodiehub.model.CartItem;
import com.foodiehub.model.Order;
import com.foodiehub.model.OrderItem;
import com.foodiehub.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    private OrderDAO orderDAO;
    private OrderItemDAO orderItemDAO;

    @Override
    public void init() throws ServletException {

        orderDAO = new OrderDAOImpl();
        orderItemDAO = new OrderItemDAOImpl();

    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Cart cart = (Cart) session.getAttribute("cart");

        User user = (User) session.getAttribute("loggedUser");

        if (cart == null || cart.isEmpty()) {

            response.sendRedirect("cart");
            return;

        }
        if (user == null) {

            response.sendRedirect("login.jsp");
            return;

        }

        String address = request.getParameter("address");
        String paymentMode = request.getParameter("paymentMode");

        int restaurantId = 0;

        if (!cart.getItems().isEmpty()) {

            restaurantId = cart.getItems().iterator().next().getRestaurantId();

        }

        Order order = new Order();

        order.setUserId(user.getUserId());

        order.setRestaurantId(restaurantId);

        order.setTotalAmount(cart.getTotalPrice());

        order.setStatus("PLACED");

        order.setPaymentMode(paymentMode);

        order.setDeliveryAddress(address);

        int orderId = orderDAO.addOrder(order);
        if (orderId > 0) {

            for (CartItem cartItem : cart.getItems()) {

                OrderItem orderItem = new OrderItem();

                orderItem.setOrderId(orderId);

                orderItem.setMenuId(cartItem.getMenuId());

                orderItem.setQuantity(cartItem.getQuantity());

                orderItem.setPrice(cartItem.getPrice());

                orderItemDAO.addOrderItem(orderItem);

            }

            cart.clearCart();

            session.setAttribute("cart", cart);

            response.sendRedirect("orderHistory");

        } else {

            response.sendRedirect("checkout.jsp");

        }

    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("checkout.jsp")
                .forward(request, response);

    }

}