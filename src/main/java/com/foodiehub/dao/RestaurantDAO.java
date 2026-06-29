package com.foodiehub.dao;

import com.foodiehub.model.Restaurant;

import java.util.List;

public interface RestaurantDAO {
    List<Restaurant> getAllRestaurants();

    Restaurant getRestaurantById(int restaurantId);

    boolean addRestaurant(Restaurant restaurant);

    boolean updateRestaurant(Restaurant restaurant);

    boolean deleteRestaurant(int restaurantId);
}
