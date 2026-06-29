package com.foodiehub.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.foodiehub.dao.RestaurantDAO;
import com.foodiehub.model.Restaurant;
import com.foodiehub.util.DbConnection;

public class RestaurantDAOImpl implements RestaurantDAO {

    private Connection connection;

    public RestaurantDAOImpl() {
        connection = DbConnection.getConnection();
    }

    @Override
    public List<Restaurant> getAllRestaurants() {

        List<Restaurant> restaurantList = new ArrayList<>();

        String sql = "SELECT * FROM restaurants";

        try {

            PreparedStatement ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Restaurant restaurant = new Restaurant();

                restaurant.setRestaurantId(rs.getInt("restaurant_id"));
                restaurant.setRestaurantName(rs.getString("restaurant_name"));
                restaurant.setCuisineType(rs.getString("cuisine_type"));
                restaurant.setAddress(rs.getString("address"));
                restaurant.setRating(rs.getDouble("rating"));
                restaurant.setDeliveryTime(rs.getInt("delivery_time"));
                restaurant.setImageUrl(rs.getString("image_url"));
                restaurant.setActive(rs.getBoolean("is_active"));
                restaurant.setPhoneNumber(rs.getString("phone_number"));
                restaurant.setOpeningTime(rs.getString("opening_time"));
                restaurant.setClosingTime(rs.getString("closing_time"));

                restaurantList.add(restaurant);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return restaurantList;
    }

    @Override
    public Restaurant getRestaurantById(int restaurantId) {

        String sql = "SELECT * FROM restaurants WHERE restaurant_id=?";

        try {

            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, restaurantId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                Restaurant restaurant = new Restaurant();

                restaurant.setRestaurantId(rs.getInt("restaurant_id"));
                restaurant.setRestaurantName(rs.getString("restaurant_name"));
                restaurant.setCuisineType(rs.getString("cuisine_type"));
                restaurant.setAddress(rs.getString("address"));
                restaurant.setRating(rs.getDouble("rating"));
                restaurant.setDeliveryTime(rs.getInt("delivery_time"));
                restaurant.setImageUrl(rs.getString("image_url"));
                restaurant.setActive(rs.getBoolean("is_active"));
                restaurant.setPhoneNumber(rs.getString("phone_number"));
                restaurant.setOpeningTime(rs.getString("opening_time"));
                restaurant.setClosingTime(rs.getString("closing_time"));

                return restaurant;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public boolean addRestaurant(Restaurant restaurant) {

        String sql = "INSERT INTO restaurants(restaurant_name,cuisine_type,address,rating,delivery_time,image_url,is_active,phone_number,opening_time,closing_time) VALUES(?,?,?,?,?,?,?,?,?,?)";

        try {

            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, restaurant.getRestaurantName());
            ps.setString(2, restaurant.getCuisineType());
            ps.setString(3, restaurant.getAddress());
            ps.setDouble(4, restaurant.getRating());
            ps.setInt(5, restaurant.getDeliveryTime());
            ps.setString(6, restaurant.getImageUrl());
            ps.setBoolean(7, restaurant.isActive());
            ps.setString(8, restaurant.getPhoneNumber());
            ps.setString(9, restaurant.getOpeningTime());
            ps.setString(10, restaurant.getClosingTime());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean updateRestaurant(Restaurant restaurant) {

        String sql = "UPDATE restaurants SET restaurant_name=?, cuisine_type=?, address=?, rating=?, delivery_time=?, image_url=?, is_active=?, phone_number=?, opening_time=?, closing_time=? WHERE restaurant_id=?";

        try {

            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, restaurant.getRestaurantName());
            ps.setString(2, restaurant.getCuisineType());
            ps.setString(3, restaurant.getAddress());
            ps.setDouble(4, restaurant.getRating());
            ps.setInt(5, restaurant.getDeliveryTime());
            ps.setString(6, restaurant.getImageUrl());
            ps.setBoolean(7, restaurant.isActive());
            ps.setString(8, restaurant.getPhoneNumber());
            ps.setString(9, restaurant.getOpeningTime());
            ps.setString(10, restaurant.getClosingTime());
            ps.setInt(11, restaurant.getRestaurantId());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean deleteRestaurant(int restaurantId) {

        String sql = "DELETE FROM restaurants WHERE restaurant_id=?";

        try {

            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, restaurantId);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
}