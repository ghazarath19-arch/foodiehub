package com.foodiehub.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.foodiehub.dao.MenuDAO;
import com.foodiehub.model.Menu;
import com.foodiehub.util.DbConnection;

public class MenuDAOImpl implements MenuDAO {

    private Connection con;
    private final String GET_MENU_COUNT =
            "SELECT COUNT(*) FROM menu";

    public MenuDAOImpl() {
        con = DbConnection.getConnection();
    }

    private final String INSERT =
            "INSERT INTO menu (restaurant_id,item_name,description,price,rating,image_url,is_available,category) VALUES (?,?,?,?,?,?,?,?)";

    private final String UPDATE =
            "UPDATE menu SET restaurant_id=?,item_name=?,description=?,price=?,rating=?,image_url=?,is_available=?,category=? WHERE menu_id=?";

    private final String DELETE =
            "DELETE FROM menu WHERE menu_id=?";

    private final String GET_BY_ID =
            "SELECT * FROM menu WHERE menu_id=?";

    private final String GET_ALL =
            "SELECT * FROM menu";

    private final String GET_BY_RESTAURANT =
            "SELECT * FROM menu WHERE restaurant_id=?";
    @Override
    public int addMenu(Menu menu) {

        try {

            PreparedStatement ps = con.prepareStatement(INSERT);

            ps.setInt(1, menu.getRestaurantId());
            ps.setString(2, menu.getItemName());
            ps.setString(3, menu.getDescription());
            ps.setDouble(4, menu.getPrice());
            ps.setDouble(5, menu.getRating());
            ps.setString(6, menu.getImageUrl());
            ps.setBoolean(7, menu.isAvailable());
            ps.setString(8, menu.getCategory());

            return ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }
    @Override
    public int updateMenu(Menu menu) {

        try {

            PreparedStatement ps = con.prepareStatement(UPDATE);

            ps.setInt(1, menu.getRestaurantId());
            ps.setString(2, menu.getItemName());
            ps.setString(3, menu.getDescription());
            ps.setDouble(4, menu.getPrice());
            ps.setDouble(5, menu.getRating());
            ps.setString(6, menu.getImageUrl());
            ps.setBoolean(7, menu.isAvailable());
            ps.setString(8, menu.getCategory());
            ps.setInt(9, menu.getMenuId());

            return ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    @Override
    public int deleteMenu(int menuId) {

        try {

            PreparedStatement ps = con.prepareStatement(DELETE);
            ps.setInt(1, menuId);

            return ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }
    @Override
    public Menu getMenuById(int menuId) {

        Menu menu = null;

        try {

            PreparedStatement ps = con.prepareStatement(GET_BY_ID);
            ps.setInt(1, menuId);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                menu = new Menu(
                        rs.getInt("menu_id"),
                        rs.getInt("restaurant_id"),
                        rs.getString("item_name"),
                        rs.getString("description"),
                        rs.getDouble("price"),
                        rs.getDouble("rating"),
                        rs.getString("image_url"),
                        rs.getBoolean("is_available"),
                        rs.getString("category")
                );
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return menu;
    }

    @Override
    public List<Menu> getAllMenus() {

        List<Menu> menuList = new ArrayList<>();

        try {

            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(GET_ALL);

            while(rs.next()) {

                Menu menu = new Menu(
                        rs.getInt("menu_id"),
                        rs.getInt("restaurant_id"),
                        rs.getString("item_name"),
                        rs.getString("description"),
                        rs.getDouble("price"),
                        rs.getDouble("rating"),
                        rs.getString("image_url"),
                        rs.getBoolean("is_available"),
                        rs.getString("category")
                );

                menuList.add(menu);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return menuList;
    }

    @Override
    public List<Menu> getMenusByRestaurantId(int restaurantId) {

        List<Menu> menuList = new ArrayList<>();

        try {

            PreparedStatement ps = con.prepareStatement(GET_BY_RESTAURANT);

            ps.setInt(1, restaurantId);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Menu menu = new Menu(
                        rs.getInt("menu_id"),
                        rs.getInt("restaurant_id"),
                        rs.getString("item_name"),
                        rs.getString("description"),
                        rs.getDouble("price"),
                        rs.getDouble("rating"),
                        rs.getString("image_url"),
                        rs.getBoolean("is_available"),
                        rs.getString("category")
                );

                menuList.add(menu);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return menuList;
    }
    @Override
    public int getMenuCount() {

        int count = 0;

        try {

            PreparedStatement ps = con.prepareStatement(GET_MENU_COUNT);

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
