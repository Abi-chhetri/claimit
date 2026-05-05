package com.claimit.services;

import java.util.List;

import com.claimit.dao.AdminLogDao;
import com.claimit.model.AdminLog;

public class AdminLogService {
	private AdminLogDao adminLogDao=new AdminLogDao();
	
	public boolean createAdminLog(int adminId, String actionType, String targetType, String targetId) {
		AdminLog adminLog=new AdminLog();
		adminLog.setAdminId(adminId);
		adminLog.setActionType(actionType);
		adminLog.setTargetType(targetType);
		adminLog.setTargetId(targetId);
		return adminLogDao.insertLog(adminLog);
	}
	
	public List<AdminLog> getAllAdminLogs(){
		return adminLogDao.fetchAllLogs();
	}
	

}
