package com.claimit.services;

import com.claimit.dao.UserDao;
import com.claimit.model.User;
import com.claimit.utils.HashPasswordUtil;

public class UserService {
	private HashPasswordUtil hash=new HashPasswordUtil();
	private UserDao userDao=new UserDao();
	
	public void insertUser(User user) {
		String password = hash.encryptPassword(user.getPassword());
		user.setPassword(password);
		userDao.createUser(user);
	}
	
}
