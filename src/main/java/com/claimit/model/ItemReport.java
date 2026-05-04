package com.claimit.model;

import java.sql.Timestamp;

public class ItemReport {

	private int itemReportId;
	private int itemId;
	private int userId;
	private String reason;
	private String status;
	private Timestamp createdAt;

	// for join query
	private String itemName;
	private String userName;
	private String itemImage;

	// Noargs Constructors
	public ItemReport() {
	}

	// parameterized Constructor
	public ItemReport(int itemReportId, int itemId, int userId, String reason, String status, Timestamp createdAt) {
		this.itemReportId = itemReportId;
		this.itemId = itemId;
		this.userId = userId;
		this.reason = reason;
		this.status = status;
		this.createdAt = createdAt;
	}

	// Getters and Setters
	public int getItemReportId() {
		return itemReportId;
	}

	public void setItemReportId(int itemReportId) {
		this.itemReportId = itemReportId;
	}

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

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getItemImage() {
		return itemImage;
	}

	public void setItemImage(String itemImage) {
		this.itemImage = itemImage;
	}
}