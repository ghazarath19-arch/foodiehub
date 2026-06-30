package com.foodiehub.dao;

import java.util.List;
import com.foodiehub.model.Menu;

public interface MenuDAO {

    // Add Menu Item
    int addMenu(Menu menu);

    // Update Menu Item
    int updateMenu(Menu menu);
    int getMenuCount();

    // Delete Menu Item
    int deleteMenu(int menuId);

    // Get Menu Item by Id
    Menu getMenuById(int menuId);

    // Get All Menu Items
    List<Menu> getAllMenus();

    // Get Menu Items by Restaurant Id
    List<Menu> getMenusByRestaurantId(int restaurantId);
}