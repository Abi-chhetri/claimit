package com.claimit.model;

import java.sql.Timestamp;

public class User {

	private Integer userId; 
	private String fullName; 
	private String email; 
	private String phoneNumber; 
	private String password; 
	private String profilePhoto; 
	private String status; 
	private Timestamp createdAt; 
	private Timestamp updatedAt; 
	private Integer approvedBy; 
	private String approveStatus; 
	private Timestamp approvedAt; 

	// Constructors
	public User() {
	}
	
	// Timestamp for createdAt,updatedAt and userId will be given by sql automatically rest of other setting their values
	public User(String fullName, String email, String phoneNumber, String password, String profilePhoto, String status,
			Integer approvedBy, String approveStatus, Timestamp approvedAt) {
		this.fullName = fullName;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.password = password;
		this.profilePhoto = profilePhoto;
		this.status = status;
		this.approvedBy = approvedBy;
		this.approveStatus = approveStatus;
		this.approvedAt = approvedAt;
	}

	// Getters and Setters
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
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

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getProfilePhoto() {
		return profilePhoto;
	}

	public void setProfilePhoto(String profilePhoto) {
		this.profilePhoto = profilePhoto;
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

	public Timestamp getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Timestamp updatedAt) {
		this.updatedAt = updatedAt;
	}

	public Integer getApprovedBy() {
		return approvedBy;
	}

	public void setApprovedBy(Integer approvedBy) {
		this.approvedBy = approvedBy;
	}

	public String getApproveStatus() {
		return approveStatus;
	}
	public void setApproveStatus(String approveStatus) {
		this.approveStatus = approveStatus;
	}

	public Timestamp getApprovedAt() {
		return approvedAt;
	}

	public void setApprovedAt(Timestamp approvedAt) {
		this.approvedAt = approvedAt;
	}

	@Override
	public String toString() {
		return "User{" + "userId=" + userId + ", fullName='" + fullName + '\'' + ", email='" + email + '\''
				+ ", phoneNumber='" + phoneNumber + '\'' + ", password='" + password + '\'' + ", profilePhoto='"
				+ profilePhoto + '\'' + ", status='" + status + '\'' + ", createdAt=" + createdAt + ", updatedAt="
				+ updatedAt + ", approvedBy=" + approvedBy + ", approveStatus='" + approveStatus + '\''
				+ ", approvedAt=" + approvedAt + '}';
	}
}
