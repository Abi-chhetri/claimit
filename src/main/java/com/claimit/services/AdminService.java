package com.claimit.services;

import com.claimit.dao.AdminDao;
import com.claimit.model.Admin;

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
	
}
