package com.foodiehub.dao;

import com.foodiehub.model.User;
import java.util.List;

public interface UserDAO {

    boolean registerUser(User user);

    int getUserCount();

    User loginUser(String email, String password);

    User getUserById(int userId);

    List<User> getAllUsers();

    boolean updateUser(User user);

    boolean deleteUser(int userId);
}