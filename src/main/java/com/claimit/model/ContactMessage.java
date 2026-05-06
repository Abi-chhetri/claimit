package com.claimit.model;

import java.sql.Timestamp;

public class ContactMessage {

	private int contactMessageId;
	private Integer userId;
	private String email;
	private String message;
	private Timestamp submittedAt;
	private boolean isRead;

	public ContactMessage() {
	}

	public ContactMessage(int contactMessageId, Integer userId, String email, String message, Timestamp submittedAt,
			boolean isRead) {
		this.contactMessageId = contactMessageId;
		this.userId = userId;
		this.email = email;
		this.message = message;
		this.submittedAt = submittedAt;
		this.isRead = isRead;
	}

	public int getContactMessageId() {
		return contactMessageId;
	}

	public void setContactMessageId(int contactMessageId) {
		this.contactMessageId = contactMessageId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Timestamp getSubmittedAt() {
		return submittedAt;
	}

	public void setSubmittedAt(Timestamp submittedAt) {
		this.submittedAt = submittedAt;
	}

	public boolean getIsRead() {
		return isRead;
	}

	public void setIsRead(boolean read) {
		isRead = read;
	}
}