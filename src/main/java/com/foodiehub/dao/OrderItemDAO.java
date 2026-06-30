package com.foodiehub.dao;

import java.util.List;

import com.foodiehub.model.OrderItem;

public interface OrderItemDAO {

    // Add a single order item
    int addOrderItem(OrderItem orderItem);

    // Get all items of an order
    List<OrderItem> getOrderItemsByOrderId(int orderId);

    // Delete all items of an order
    boolean deleteOrderItems(int orderId);
}