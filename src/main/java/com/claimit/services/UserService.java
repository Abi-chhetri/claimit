package com.claimit.services;

import java.util.List;

import com.claimit.dao.UserDao;
import com.claimit.model.User;
import com.claimit.utils.HashPasswordUtil;

public class UserService {
	
	private UserDao userDao=new UserDao();
	
	public boolean updatePersonalInfo(User user) {
	    return userDao.updatePersonalInfo(user);
	}
	
	public String insertUser(User user) {
		String password = HashPasswordUtil.encryptPassword(user.getPassword());
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
//			System.out.print("If block returned user");
			User user = userDao.findUserByEmail(email);
			if(user != null) {
				return user;
			}
		}
		return null;
	}
	
	public List<User> getAllUser(){
		return userDao.fetchAll();
	}
	
	public Integer getUserCount() {
		return userDao.findUserCount();
	}
	
	public boolean updateUserStatusOnly(int id,String status) {
		return userDao.changeUserStatusOnly(id, status);
	}
}
