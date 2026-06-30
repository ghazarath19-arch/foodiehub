package com.foodiehub.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.foodiehub.dao.OrderItemDAO;
import com.foodiehub.model.OrderItem;
import com.foodiehub.util.DbConnection;

public class OrderItemDAOImpl implements OrderItemDAO {

    private Connection con;

    public OrderItemDAOImpl() {

        con = DbConnection.getConnection();

    }

    private final String INSERT =
            "INSERT INTO order_items(order_id,menu_id,quantity,price) VALUES(?,?,?,?)";

    private final String GET_BY_ORDER =
            "SELECT * FROM order_items WHERE order_id=?";

    private final String DELETE =
            "DELETE FROM order_items WHERE order_id=?";
    @Override
    public int addOrderItem(OrderItem orderItem) {

        try {

            PreparedStatement ps = con.prepareStatement(INSERT);

            ps.setInt(1, orderItem.getOrderId());
            ps.setInt(2, orderItem.getMenuId());
            ps.setInt(3, orderItem.getQuantity());
            ps.setDouble(4, orderItem.getPrice());

            return ps.executeUpdate();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return 0;
    }
    @Override
    public List<OrderItem> getOrderItemsByOrderId(int orderId) {

        List<OrderItem> orderItemList = new ArrayList<>();

        try {

            PreparedStatement ps = con.prepareStatement(GET_BY_ORDER);

            ps.setInt(1, orderId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                OrderItem orderItem = new OrderItem(
                        rs.getInt("order_item_id"),
                        rs.getInt("order_id"),
                        rs.getInt("menu_id"),
                        rs.getInt("quantity"),
                        rs.getDouble("price")
                );

                orderItemList.add(orderItem);

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return orderItemList;
    }

    @Override
    public boolean deleteOrderItems(int orderId) {

        try {

            PreparedStatement ps = con.prepareStatement(DELETE);

            ps.setInt(1, orderId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();

        }

        return false;
    }

}