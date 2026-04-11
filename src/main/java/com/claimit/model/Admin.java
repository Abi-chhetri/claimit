package com.claimit.model;
import java.sql.Timestamp;

public class Admin {

    private int adminId;
    private String fullName;
    private String email;
    private String role;
    private String password;
    private String status;
    private Timestamp createdAt;
    private Integer createdBy; 

    // Noargs constructor
    public Admin() {
    }

    // Parameterized constructor
    public Admin(int adminId, String fullName, String email, String role,
                 String password, String status, Timestamp createdAt, Integer createdBy) {
        this.adminId = adminId;
        this.fullName = fullName;
        this.email = email;
        this.role = role;
        this.password = password;
        this.status = status;
        this.createdAt = createdAt;
        this.createdBy = createdBy;
    }

    // Getters and Setters

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
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

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public Integer getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(Integer createdBy) {
        this.createdBy = createdBy;
    }
}