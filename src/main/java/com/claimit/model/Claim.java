package com.claimit.model;

import java.sql.Timestamp;

public class Claim {

    private Integer claimId;
    private Integer itemId;
    private Integer userId;
    private String proofImage;
    private String claimStatus;
    private String adminNotes;
    private Timestamp createdAt;
    private String ownershipDescription;
    private Integer approvedBy;
    private Timestamp approvedAt;
    //need to run join query 
    private String itemTitle;
    private String itemCategory;
    private String claimedByName;
    private String claimedByEmail;

    // No-args constructor
    public Claim() {
    }

    // All-args constructor (excluding auto_increment and timestamps handled by DB)
    public Claim(Integer itemId, Integer userId, String proofImage, String claimStatus, String adminNotes,
            String ownershipDescription, Integer approvedBy, Timestamp approvedAt) {
        this.itemId = itemId;
        this.userId = userId;
        this.proofImage = proofImage;
        this.claimStatus = claimStatus;
        this.adminNotes = adminNotes;
        this.ownershipDescription = ownershipDescription;
        this.approvedBy = approvedBy;
        this.approvedAt = approvedAt;
    }

    // Getters and Setters
    public Integer getClaimId() {
        return claimId;
    }

    public void setClaimId(Integer claimId) {
        this.claimId = claimId;
    }

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getProofImage() {
        return proofImage;
    }

    public void setProofImage(String proofImage) {
        this.proofImage = proofImage;
    }

    public String getClaimStatus() {
        return claimStatus;
    }

    public void setClaimStatus(String claimStatus) {
        this.claimStatus = claimStatus;
    }

    public String getAdminNotes() {
        return adminNotes;
    }

    public void setAdminNotes(String adminNotes) {
        this.adminNotes = adminNotes;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public String getOwnershipDescription() {
        return ownershipDescription;
    }

    public void setOwnershipDescription(String ownershipDescription) {
        this.ownershipDescription = ownershipDescription;
    }

    public Integer getApprovedBy() {
        return approvedBy;
    }

    public void setApprovedBy(Integer approvedBy) {
        this.approvedBy = approvedBy;
    }

    public Timestamp getApprovedAt() {
        return approvedAt;
    }

    public void setApprovedAt(Timestamp approvedAt) {
        this.approvedAt = approvedAt;
    }

    public String getItemTitle() {
        return itemTitle;
    }

    public void setItemTitle(String itemTitle) {
        this.itemTitle = itemTitle;
    }
    
    public String getItemCategory() {
        return itemCategory;
    }

    public void setItemCategory(String itemCategory) {
        this.itemCategory = itemCategory;
    }
    
    public String getClaimedByName() {
        return claimedByName;
    }

    public void setClaimedByName(String claimedByName) {
        this.claimedByName = claimedByName;
    }

    public String getClaimedByEmail() {
        return claimedByEmail;
    }

    public void setClaimedByEmail(String claimedByEmail) {
        this.claimedByEmail = claimedByEmail;
    }

    @Override
    public String toString() {
        return "Claim{" + "claimId=" + claimId + ", itemId=" + itemId + ", userId=" + userId + ", proofImage='"
                + proofImage + '\'' + ", claimStatus='" + claimStatus + '\'' + ", adminNotes='" + adminNotes + '\''
                + ", createdAt=" + createdAt + ", ownershipDescription='" + ownershipDescription + '\''
                + ", approvedBy=" + approvedBy + ", approvedAt=" + approvedAt + ", itemTitle='" + itemTitle + '\'' + '}';
    }
}