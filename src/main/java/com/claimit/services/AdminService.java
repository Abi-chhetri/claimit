package com.claimit.services;

import java.util.ArrayList;
import java.util.List;

import com.claimit.dao.AdminDao;
import com.claimit.model.Admin;
import com.claimit.utils.HashPasswordUtil;

public class AdminService {
	
	private AdminDao adminDao=new AdminDao();

	public Admin getAdminByID(String adminId) {
		if (!adminId.isEmpty() && adminId !=null) {
			return adminDao.findAdminById(adminId);
		}
		return null;
	}
	
	public Admin getAdminByEmail(String email) {
		if (!email.isEmpty() && email !=null) {
			Admin admin = adminDao.findAdminByEmail(email);
			if(admin != null) {
				return admin;
			}
		}
		return null;
	}
	
	public boolean approveUser(int userId, int adminId) {
	    return adminDao.acceptUser(userId, adminId);
	}

	public boolean updateUserRegistrationStatusOnly(int userId, String status) {
	    return adminDao.changeUserRegistrationStatusOnly(userId, status);
	}
	
	public String insertModerator(Admin admin) {
		String password = HashPasswordUtil.encryptPassword(admin.getPassword());
		admin.setPassword(password);
		boolean result= adminDao.createModerator(admin);
		
		if(result != false) {
			return "Successfully created new moderator "+admin.getFullName();
		}
		return "Failed to create moderator";
	}
	
	public List<Admin> getAllModerators(){
		return adminDao.fetchAllModerators() == null ? new ArrayList<>(): adminDao.fetchAllModerators()  ;
	}
	
	public boolean updateModStatusById(String action, int adminId) {
		return adminDao.changeStatusByModId(action, adminId);
	}
}
