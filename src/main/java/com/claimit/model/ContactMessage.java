package com.claimit.model;

import java.sql.Timestamp;

public class ContactMessage {

    private int contactMessageId;
    private int userId;
    private String fullName;
    private String email;
    private String subject;
    private String message;
    private Timestamp submittedAt;
    private boolean isRead;

    // Noargs constructor
    public ContactMessage() {
    }

    // Parameterized constructor
    public ContactMessage(int contactMessageId, int userId, String fullName,
                          String email, String subject, String message,
                          Timestamp submittedAt, boolean isRead) {
        this.contactMessageId = contactMessageId;
        this.userId = userId;
        this.fullName = fullName;
        this.email = email;
        this.subject = subject;
        this.message = message;
        this.submittedAt = submittedAt;
        this.isRead = isRead;
    }

    // Getters and Setters

    public int getContactMessageId() {
        return contactMessageId;
    }

    public void setContactMessageId(int contactMessageId) {
        this.contactMessageId = contactMessageId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
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

    public boolean isRead() {
        return isRead;
    }

    public void setRead(boolean read) {
        isRead = read;
    }
}