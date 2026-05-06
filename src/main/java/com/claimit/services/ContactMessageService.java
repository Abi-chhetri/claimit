package com.claimit.services;

import java.util.List;

import com.claimit.dao.ContactMessageDao;
import com.claimit.model.ContactMessage;
import com.claimit.model.User;

public class ContactMessageService {
	
	private ContactMessageDao contactMessageDao=new ContactMessageDao();
	private UserService userService=new UserService();
	
	public boolean insertContactMessage(Integer userId, String email, String msg) {
		ContactMessage contactMessage= new ContactMessage();
		if(userId == null) {
			contactMessage.setEmail(email);
			contactMessage.setMessage(msg);
			return contactMessageDao.insertContactMessage(contactMessage);
			
		}
		else {
			User user= userService.getUserByID(String.valueOf(userId));
			contactMessage.setUserId(user.getUserId());
			contactMessage.setEmail(user.getEmail());
			contactMessage.setMessage(msg);
			return contactMessageDao.insertContactMessage(contactMessage);
		}
	}
	
	public List<ContactMessage> getAllMessage(){
		return contactMessageDao.fetchAllMessages().reversed();
	}
	
	public boolean updateReadStatusToTrue(int contactMessageId) {
		return contactMessageDao.changeReadStatus(contactMessageId);
	}
}
