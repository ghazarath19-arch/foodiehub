package com.foodiehub.dao;

import java.util.List;

import com.foodiehub.model.Order;

public interface OrderDAO {

    // Insert new order
    int addOrder(Order order);
    int getOrderCount();

    // Get order by ID
    Order getOrderById(int orderId);

    // Get all orders of a user
    List<Order> getOrdersByUser(int userId);
    List<Order> getAllOrders();

    // Update order status
    boolean updateOrderStatus(int orderId, String status);

    // Delete order
    boolean deleteOrder(int orderId);
}