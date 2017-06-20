package com.naaru.project.service;

import java.util.List;

import com.naaru.project.model.User;

public interface UserService {

	public User login(User user);
	
	public User getUserById(int id);
	
	public List<User> getAllUsers();

    public void addUser(String userName);

    public void deleteUser(String userName);

    public void deleteAll();
}
