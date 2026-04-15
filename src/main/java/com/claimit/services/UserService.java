package com.claimit.services;

import com.claimit.dao.UserDao;
import com.claimit.model.User;
import com.claimit.utils.HashPasswordUtil;

public class UserService {
	private HashPasswordUtil hash=new HashPasswordUtil();
	private UserDao userDao=new UserDao();
	
	public String insertUser(User user) {
		String password = hash.encryptPassword(user.getPassword());
		user.setPassword(password);
		return userDao.createUser(user);
	}
	
	public User getUserByID(String userId) {
		if (!userId.isEmpty() && userId !=null) {
			return userDao.findUserById(userId);
		}
		return null;
	}
	
	public User getUserByEmail(String email) {
		if (!email.isEmpty() && email !=null) {
			System.out.print("If block returned user");
			return userDao.findUserByEmail(email);
		}
		return null;
	}
}
