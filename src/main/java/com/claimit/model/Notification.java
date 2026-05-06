package com.claimit.model;

import java.sql.Timestamp;

public class Notification {

	private int notificationId;
	private int userId;
	private String type;
	private String message;
	private Timestamp createdAt;

	// Noargs Constructors
	public Notification() {
	}

	// parameterized constructor
	public Notification(int notificationId, int userId, String type, String message, boolean isRead,
			Timestamp createdAt, Timestamp updatedAt) {
		this.notificationId = notificationId;
		this.userId = userId;
		this.type = type;
		this.message = message;
		this.createdAt = createdAt;
	}

	// Getters and Setters

	public int getNotificationId() {
		return notificationId;
	}

	public void setNotificationId(int notificationId) {
		this.notificationId = notificationId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getMessage() {
		return message;
	}
	
	public void setMessage(String message) {
		this.message = message;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
}
