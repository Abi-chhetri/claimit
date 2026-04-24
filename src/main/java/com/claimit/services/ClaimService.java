package com.claimit.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.claimit.dao.ClaimsDao;
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
}
