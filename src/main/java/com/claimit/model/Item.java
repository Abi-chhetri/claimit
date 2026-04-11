package com.claimit.model;

import java.sql.Timestamp;
import java.sql.Date;

public class Item {

    private int itemId;
    private int userId;
    private String type;
    private String title;
    private String category;
    private String description;
    private String location;
    private Date lostFoundDate;
    private String status;
    private String rejectionReason;
    private Timestamp expiresAt;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    // Noargs Constructors
    public Item() {
    }
    
    
    //Parameterized constructor
    public Item(int itemId, int userId, String type, String title, String category,
                String description, String location, Date lostFoundDate, String status,
                String rejectionReason, Timestamp expiresAt, Timestamp createdAt, Timestamp updatedAt) {
        this.itemId = itemId;
        this.userId = userId;
        this.type = type;
        this.title = title;
        this.category = category;
        this.description = description;
        this.location = location;
        this.lostFoundDate = lostFoundDate;
        this.status = status;
        this.rejectionReason = rejectionReason;
        this.expiresAt = expiresAt;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    // Getters and Setters

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Date getLostFoundDate() {
        return lostFoundDate;
    }

    public void setLostFoundDate(Date lostFoundDate) {
        this.lostFoundDate = lostFoundDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRejectionReason() {
        return rejectionReason;
    }

    public void setRejectionReason(String rejectionReason) {
        this.rejectionReason = rejectionReason;
    }

    public Timestamp getExpiresAt() {
        return expiresAt;
    }

    public void setExpiresAt(Timestamp expiresAt) {
        this.expiresAt = expiresAt;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }
}