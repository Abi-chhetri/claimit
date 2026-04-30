package com.claimit.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.claimit.dao.ClaimsDao;
import com.claimit.enums.ClaimStatus;
import com.claimit.model.Claim;

public class ClaimService {
	private ClaimsDao claimDao=new ClaimsDao();
	
	public List<Claim> getAllClaims(){
		return claimDao.fetchAllClaims();
	}
	
    public HashMap<Integer, Double> getPendingClaims() {
    	return claimDao.fetchPendingClaims();
	}
	
    public HashMap<Integer, Double> getApprovedClaims() {
    	return claimDao.fetchApprovedClaims();
	}
    
	
    public Map<String,Integer> getUserClaimStat(int userId) {
    	return claimDao.fetchUserClaimStats(userId);
	}
    
    public Integer getTotalItemCount() {
    	return claimDao.findTotalItemsCount();
    }
    
    public String insertClaim(int itemId, int userId, String proofImage, String ownershipDescription ) {
    	return claimDao.createClaim(itemId, userId, proofImage, ownershipDescription) == true ? "We will contact you soon after review of this cliaim.":"Something went wrong.";
    }
    
    public Claim getClaimById(int claimId) {
    	return claimDao.fetchClaimById(claimId);
    }
    
    public boolean updateClaimStatus(int claimId, String pendingAction, String adminNotes, int approvedBy) {
        String status;
        if (pendingAction.equals("approve")) {
            status = ClaimStatus.APPROVED.name();
        } else if (pendingAction.equals("reject")) {
            status = ClaimStatus.REJECTED.name();
        } else {
            status = ClaimStatus.IN_REVIEW.name();
        }
        return claimDao.updateClaimStatus(claimId, status, adminNotes, approvedBy);
    }
}
