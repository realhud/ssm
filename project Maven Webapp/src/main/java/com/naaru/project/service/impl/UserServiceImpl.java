package com.naaru.project.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.naaru.project.dao.UserDao;
import com.naaru.project.model.User;
import com.naaru.project.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService{

	//public List<User> userList = getAllUsers();
	
	@Resource
	private UserDao userDao;
	
	public User login(User user) {
		return userDao.login(user);
	}
	
	public User getUserById(int id) {
		return userDao.getUserById(id);
	}
	
	public List<User> getAllUsers(){
		return userDao.getAllUsers();
	}

    public void addUser(String userName){
    	userDao.addUser(userName);
    }

    public void deleteUser(String userName){
    	userDao.deleteUser(userName);
    }

    public void deleteAll(){
    	userDao.deleteAll();
    }

}
