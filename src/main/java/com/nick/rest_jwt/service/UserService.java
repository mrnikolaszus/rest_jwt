package com.nick.rest_jwt.service;

import com.nick.rest_jwt.model.User;

import java.util.List;

public interface UserService {
    User register(User user);

    List<User> getAll();

    User findByUsername(String username);

    User findById(Long Id);

    void delete(Long id);
}
