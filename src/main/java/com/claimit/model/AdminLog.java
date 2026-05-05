package com.claimit.model;


public class AdminLog {

    private int adminLogId;
    private int adminId;
    private String actionType;
    private String targetType;
    private String targetId;
    private String notes;
    
    //for join query
    private String fullName;

    // No args constructor
    public AdminLog() {
    }

    // Parameterized constructor
    public AdminLog(int adminLogId, int adminId, String actionType,
                    String targetType, String targetId, String notes) {
        this.adminLogId = adminLogId;
        this.adminId = adminId;
        this.actionType = actionType;
        this.targetType = targetType;
        this.targetId = targetId;
        this.notes = notes;
    }

    // Getters and Setters

    public int getAdminLogId() {
        return adminLogId;
    }

    public void setAdminLogId(int adminLogId) {
        this.adminLogId = adminLogId;
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public String getActionType() {
        return actionType;
    }

    public void setActionType(String actionType) {
        this.actionType = actionType;
    }

    public String getTargetType() {
        return targetType;
    }

    public void setTargetType(String targetType) {
        this.targetType = targetType;
    }

    public String getTargetId() {
        return targetId;
    }

    public void setTargetId(String targetId) {
        this.targetId = targetId;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }
    
    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
}