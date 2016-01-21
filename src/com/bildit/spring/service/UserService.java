package com.bildit.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bildit.spring.dao.User;
import com.bildit.spring.dao.UserDao;

@Service
public class UserService {
	
	private UserDao userDao;
	
	@Autowired
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	public void addUser(User user) {
		userDao.addUser(user);
	}
	
	public List<User> getAllUsers() {
		return userDao.getUsers();
	}
	
	public User getUser(String username) {
		return userDao.getUser(username);
	}
	
	public void deleteUser(User user) {
		userDao.delete(user);
	}
	
	public void updateUser(User user) {
		userDao.updateUser(user);
	}
	
	/**
	@Secured({"ROLE_ADMIN", "ROLE_USER"})
	public void addUser(User user) {
		userDao.addUser(user);
	}
	
	@Secured("ROLE_ADMIN")
	public List<User> getAllUsers() {
		return userDao.getUsers();
	}
	
	@Secured("ROLE_ADMIN")
	public User getUser(String username) {
		return userDao.getUser(username);
	}
	
	@Secured("ROLE_ADMIN")
	public void deleteUser(User user) {
		userDao.delete(user);
	}
	@Secured("ROLE_ADMIN")
	public void updateUser(User user) {
		userDao.updateUser(user);
	}
	*/
	public boolean isUserExists(String username) {
		return userDao.isUserExists(username);
	}
	
}
