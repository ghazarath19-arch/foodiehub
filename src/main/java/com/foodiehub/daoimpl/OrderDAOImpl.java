package com.foodiehub.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.foodiehub.dao.OrderDAO;
import com.foodiehub.model.Order;
import com.foodiehub.util.DbConnection;

public class OrderDAOImpl implements OrderDAO {

    private Connection con;
    private final String GET_ORDER_COUNT =
            "SELECT COUNT(*) FROM orders";

    public OrderDAOImpl() {

        con = DbConnection.getConnection();

    }

    private final String INSERT =
            "INSERT INTO orders(user_id,restaurant_id,total_amount,status,payment_mode,delivery_address) VALUES(?,?,?,?,?,?)";

    private final String GET_BY_ID =
            "SELECT * FROM orders WHERE order_id=?";

    private final String GET_BY_USER =
            "SELECT * FROM orders WHERE user_id=? ORDER BY order_date DESC";

    private final String UPDATE_STATUS =
            "UPDATE orders SET status=? WHERE order_id=?";

    private final String DELETE =
            "DELETE FROM orders WHERE order_id=?";
    @Override
    public int addOrder(Order order) {

        int orderId = 0;

        try {

            PreparedStatement ps = con.prepareStatement(
                    INSERT,
                    Statement.RETURN_GENERATED_KEYS);

            ps.setInt(1, order.getUserId());
            ps.setInt(2, order.getRestaurantId());
            ps.setDouble(3, order.getTotalAmount());
            ps.setString(4, order.getStatus());
            ps.setString(5, order.getPaymentMode());
            ps.setString(6, order.getDeliveryAddress());

            int rows = ps.executeUpdate();

            if (rows > 0) {

                ResultSet rs = ps.getGeneratedKeys();

                if (rs.next()) {

                    orderId = rs.getInt(1);

                }
            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return orderId;
    }
    @Override
    public Order getOrderById(int orderId) {

        Order order = null;

        try {

            PreparedStatement ps = con.prepareStatement(GET_BY_ID);

            ps.setInt(1, orderId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                order = new Order(
                        rs.getInt("order_id"),
                        rs.getInt("user_id"),
                        rs.getInt("restaurant_id"),
                        rs.getDouble("total_amount"),
                        rs.getString("status"),
                        rs.getString("payment_mode"),
                        rs.getString("delivery_address"),
                        rs.getTimestamp("order_date")
                );

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return order;
    }

    @Override
    public List<Order> getOrdersByUser(int userId) {

        List<Order> orderList = new ArrayList<>();

        try {

            PreparedStatement ps = con.prepareStatement(GET_BY_USER);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Order order = new Order(
                        rs.getInt("order_id"),
                        rs.getInt("user_id"),
                        rs.getInt("restaurant_id"),
                        rs.getDouble("total_amount"),
                        rs.getString("status"),
                        rs.getString("payment_mode"),
                        rs.getString("delivery_address"),
                        rs.getTimestamp("order_date")
                );

                orderList.add(order);

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return orderList;
    }
    @Override
    public boolean updateOrderStatus(int orderId, String status) {

        try {

            PreparedStatement ps = con.prepareStatement(UPDATE_STATUS);

            ps.setString(1, status);
            ps.setInt(2, orderId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();

        }

        return false;
    }

    @Override
    public boolean deleteOrder(int orderId) {

        try {

            PreparedStatement ps = con.prepareStatement(DELETE);

            ps.setInt(1, orderId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();

        }

        return false;
    }
    @Override
    public int getOrderCount() {

        int count = 0;

        try {

            PreparedStatement ps = con.prepareStatement(GET_ORDER_COUNT);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                count = rs.getInt(1);

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return count;

    }
    private final String GET_ALL_ORDERS =
            "SELECT * FROM orders ORDER BY order_id DESC";

    @Override
    public List<Order> getAllOrders() {

        List<Order> orderList = new ArrayList<>();

        try {

            PreparedStatement ps = con.prepareStatement(GET_ALL_ORDERS);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Order order = new Order();

                order.setOrderId(rs.getInt("order_id"));
                order.setUserId(rs.getInt("user_id"));
                order.setRestaurantId(rs.getInt("restaurant_id"));
                order.setTotalAmount(rs.getDouble("total_amount"));
                order.setStatus(rs.getString("status"));
                order.setPaymentMode(rs.getString("payment_mode"));
                order.setDeliveryAddress(rs.getString("delivery_address"));
                order.setOrderDate(rs.getTimestamp("order_date"));

                orderList.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orderList;
    }
}