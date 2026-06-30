package com.foodiehub.daoimpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.foodiehub.dao.RestaurantDAO;
import com.foodiehub.model.Restaurant;
import com.foodiehub.util.DbConnection;



public class RestaurantDAOImpl implements RestaurantDAO {
    private final String GET_RESTAURANT_COUNT =
            "SELECT COUNT(*) FROM restaurants";

    private static final String INSERT =
            "INSERT INTO restaurants(restaurant_name,cuisine_type,address,rating,delivery_time,image_url,is_active,phone_number,opening_time,closing_time,cost_for_two,description) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";

    private static final String GET =
            "SELECT * FROM restaurants WHERE restaurant_id=?";

    private static final String GETALL =
            "SELECT * FROM restaurants";

    private static final String UPDATE =
            "UPDATE restaurants SET restaurant_name=?,cuisine_type=?,address=?,rating=?,delivery_time=?,image_url=?,is_active=?,phone_number=?,opening_time=?,closing_time=?,cost_for_two=?,description=? WHERE restaurant_id=?";

    private static final String DELETE =
            "DELETE FROM restaurants WHERE restaurant_id=?";
    Connection con;

    @Override
    public int insertRestaurant(Restaurant restaurant) {

        try(Connection con = DbConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(INSERT)) {

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
            ps.setInt(11, restaurant.getCostForTwo());
            ps.setString(12, restaurant.getDescription());

            return ps.executeUpdate();

        } catch(Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    @Override
    public Restaurant getRestaurant(int restaurantId) {

        Restaurant restaurant = null;

        try(Connection con = DbConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(GET)) {

            ps.setInt(1, restaurantId);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                restaurant = new Restaurant(
                        rs.getInt("restaurant_id"),
                        rs.getString("restaurant_name"),
                        rs.getString("cuisine_type"),
                        rs.getString("address"),
                        rs.getDouble("rating"),
                        rs.getInt("delivery_time"),
                        rs.getString("image_url"),
                        rs.getBoolean("is_active"),
                        rs.getString("phone_number"),
                        rs.getString("opening_time"),
                        rs.getString("closing_time"),
                        rs.getInt("cost_for_two"),
                        rs.getString("description")
                );
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return restaurant;
    }

    @Override
    public List<Restaurant> getAllRestaurants() {

        List<Restaurant> list = new ArrayList<>();

        try(Connection con = DbConnection.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(GETALL)) {

            while(rs.next()) {

                Restaurant restaurant = new Restaurant(
                        rs.getInt("restaurant_id"),
                        rs.getString("restaurant_name"),
                        rs.getString("cuisine_type"),
                        rs.getString("address"),
                        rs.getDouble("rating"),
                        rs.getInt("delivery_time"),
                        rs.getString("image_url"),
                        rs.getBoolean("is_active"),
                        rs.getString("phone_number"),
                        rs.getString("opening_time"),
                        rs.getString("closing_time"),
                        rs.getInt("cost_for_two"),
                        rs.getString("description")
                );

                list.add(restaurant);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public int updateRestaurant(Restaurant restaurant) {

        try(Connection con = DbConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(UPDATE)) {

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
            ps.setInt(11, restaurant.getCostForTwo());
            ps.setString(12, restaurant.getDescription());
            ps.setInt(13, restaurant.getRestaurantId());

            return ps.executeUpdate();

        } catch(Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    @Override
    public int deleteRestaurant(int restaurantId) {

        try(Connection con = DbConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(DELETE)) {

            ps.setInt(1, restaurantId);

            return ps.executeUpdate();

        } catch(Exception e) {
            e.printStackTrace();
        }

        return 0;
    }
    @Override
    public int getRestaurantCount() {

        int count = 0;

        try (Connection con = DbConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(GET_RESTAURANT_COUNT)) {

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                count = rs.getInt(1);

            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return count;
    }
}