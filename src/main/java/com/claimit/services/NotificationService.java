package com.claimit.services;

import java.util.List;

import com.claimit.dao.NotificationDao;
import com.claimit.model.Notification;

public class NotificationService {

	private NotificationDao notificationDao=new NotificationDao();
	
	public boolean insertNotification(int userId, String type, String message) {
		return notificationDao.createNotification(userId, type, message);
	}
	
	public List<Notification> getNotificationByIdWithLim(int userId){
		return notificationDao.getNotificationsByUserIdWithLim(userId);
	}
	
	public List<Notification> getNotificationById(int userId){
		return notificationDao.getNotificationsByUserId(userId);
	}
}
