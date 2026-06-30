package com.foodiehub.dao;

import java.util.List;
import com.foodiehub.model.Restaurant;

public interface RestaurantDAO {

    int insertRestaurant(Restaurant restaurant);
    int getRestaurantCount();

    Restaurant getRestaurant(int restaurantId);

    List<Restaurant> getAllRestaurants();

    int updateRestaurant(Restaurant restaurant);

    int deleteRestaurant(int restaurantId);
}