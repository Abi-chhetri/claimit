package com.claimit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.claimit.enums.ClaimStatus;
import com.claimit.model.Claim;
import com.claimit.utils.DataBase_Config;

public class ClaimsDao {

    // queries to count claims by status
	private final String pendingCountQuery  = "SELECT COUNT(*) FROM claims WHERE Claim_Status = '" + ClaimStatus.PENDING.name()  + "'";
	private final String approvedCountQuery = "SELECT COUNT(*) FROM claims WHERE Claim_Status = '" + ClaimStatus.APPROVED.name() + "'";
	private final String totalCountQuery = "select count(*) from CLAIMS";
	private final String selectAll = "select c.*, i.Title, i.Category, u.Full_Name, u.Email from claims c join items i on "
			+ "c.Item_ID = i.Item_ID join users u on c.User_ID = u.User_ID";
	private final String userClaimStatsQuery = "SELECT "
		    + "COUNT(*) AS total, "
		    + "COUNT(CASE WHEN Claim_Status = '" + ClaimStatus.PENDING.name()  + "' THEN 1 END) AS pending, "
		    + "COUNT(CASE WHEN Claim_Status = '" + ClaimStatus.APPROVED.name() + "' THEN 1 END) AS approved, "
		    + "COUNT(CASE WHEN Claim_Status = '" + ClaimStatus.REJECTED.name() + "' THEN 1 END) AS rejected "
		    + "FROM claims WHERE User_ID = ?";
	private final String insertClaimQuery = "INSERT INTO claims (Item_ID, User_ID, Proof_Image, Claim_Status, Created_At, Ownership_Description) "
	        + "VALUES (?, ?, ?, '" + ClaimStatus.PENDING.name() + "', NOW(), ?)";
   private final String selectClaimByIdQuery = "SELECT * FROM claims WHERE Claim_ID = ?";
   private final String updateClaimStatusQuery =  "UPDATE claims SET Claim_Status = ?, Admin_Notes = ?, Approved_By = ?, Approved_At = NOW() WHERE Claim_ID = ?";
   private final String selectClaimsByUserIdQuery = "SELECT c.*, i.Title, i.Category "
		    + "FROM claims c "
		    + "JOIN items i ON c.Item_ID = i.Item_ID "
		    + "WHERE c.User_ID = ?";
   
   
	public List<Claim> fetchAllClaims() {
	    try {
	        Connection con = DataBase_Config.getConection();
	        Statement st = con.createStatement();
	        ResultSet rs = st.executeQuery(selectAll);
	        List<Claim> claims = new ArrayList<>();
	        while (rs.next()) {
	            Claim claim = new Claim();
	            claim.setClaimId(rs.getInt("Claim_ID"));
	            claim.setItemId(rs.getInt("Item_ID"));
	            claim.setUserId(rs.getInt("User_ID"));
	            claim.setProofImage(rs.getString("Proof_Image"));
	            claim.setClaimStatus(rs.getString("Claim_Status"));
	            claim.setAdminNotes(rs.getString("Admin_Notes"));
	            claim.setCreatedAt(rs.getTimestamp("Created_At"));
	            claim.setOwnershipDescription(rs.getString("Ownership_Description"));
	            claim.setApprovedBy(rs.getObject("Approved_By", Integer.class));
	            claim.setApprovedAt(rs.getTimestamp("Approved_At"));
	            claim.setItemTitle(rs.getString("Title"));
	            claim.setItemCategory(rs.getString("Category"));
	            claim.setClaimedByName(rs.getString("Full_Name"));
	            claim.setClaimedByEmail(rs.getString("Email"));
	            claims.add(claim);
	        }
	        rs.close();
	        st.close();
	        con.close();
	        return claims;
	    } catch (SQLException | ClassNotFoundException se) {
	        se.printStackTrace();
	        return null;
	    }
	}
	
	
    /**
     * Executes a count query and returns the result as an Integer.
     * Returns null if an exception occurs.
     */
	
    private Integer executeCount(String query) {
        try {
            Connection con = DataBase_Config.getConection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            if (rs.next()) {
                int count = rs.getInt(1);
                rs.close();
                st.close();
                con.close();
                return count;
            }
            rs.close();
            st.close();
            con.close();
            return 0;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Calculates percentage of a count out of total.
     * Returns 0.0 if total is zero or either value is null.
     */
    private Double calculatePercentage(Integer count, Integer total) {
        if (count == null || total == null || total == 0) return 0.0;
        return Math.round((count * 100.0 / total) * 10.0) / 10.0;
    }

   // Returns a HashMap where key = pending claims count, value = percentage of total.
    public HashMap<Integer, Double> fetchPendingClaims() {
        Integer pending = executeCount(pendingCountQuery);
        Integer total = executeCount(totalCountQuery);
        Double percentage = calculatePercentage(pending, total);
        HashMap<Integer, Double> result = new HashMap<>();
        result.put(pending != null ? pending : 0, percentage);
        return result;
    }


     //Returns a HashMap where key = approved claims count, value = percentage of total.
    public HashMap<Integer, Double> fetchApprovedClaims() {
        Integer approved = executeCount(approvedCountQuery);
        Integer total = executeCount(totalCountQuery);
        Double percentage = calculatePercentage(approved, total);
        HashMap<Integer, Double> result = new HashMap<>();
        result.put(approved != null ? approved : 0, percentage);
        return result;
    }
    
    public Integer findTotalItemsCount() {
    	return executeCount(totalCountQuery);
    }

	public Map<String, Integer> fetchUserClaimStats(int userId) {
		try {
			Connection con = DataBase_Config.getConection();
			PreparedStatement ps = con.prepareStatement(userClaimStatsQuery);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			Map<String, Integer> stats = new HashMap<>();
			if (rs.next()) {
			    stats.put("total",    rs.getInt("total"));
			    stats.put("pending",  rs.getInt("pending"));
			    stats.put("approved", rs.getInt("approved"));
			    stats.put("rejected", rs.getInt("rejected"));
			}
			rs.close();
			ps.close();
			con.close();
			return stats;
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public boolean createClaim(int itemId, int userId, String proofImage, String ownershipDescription) {
	    try {
	        Connection con = DataBase_Config.getConection();
	        PreparedStatement ps = con.prepareStatement(insertClaimQuery);
	        ps.setInt(1, itemId);
	        ps.setInt(2, userId);
	        ps.setString(3, proofImage);
	        ps.setString(4, ownershipDescription);
	        int rows = ps.executeUpdate();
	        ps.close();
	        con.close();
	        return rows > 0;
	    } catch (SQLException | ClassNotFoundException e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
	public Claim fetchClaimById(int claimId) {
	    try {
	        Connection con = DataBase_Config.getConection();
	        PreparedStatement ps = con.prepareStatement(selectClaimByIdQuery);
	        ps.setInt(1, claimId);

	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            Claim claim = new Claim();

	            claim.setClaimId(rs.getInt("Claim_ID"));
	            claim.setItemId(rs.getInt("Item_ID"));
	            claim.setUserId(rs.getInt("User_ID"));
	            claim.setProofImage(rs.getString("Proof_Image"));
	            claim.setClaimStatus(rs.getString("Claim_Status"));
	            claim.setAdminNotes(rs.getString("Admin_Notes"));
	            claim.setCreatedAt(rs.getTimestamp("Created_At"));
	            claim.setOwnershipDescription(rs.getString("Ownership_Description"));
	            claim.setApprovedBy(rs.getObject("Approved_By", Integer.class));
	            claim.setApprovedAt(rs.getTimestamp("Approved_At"));

	            rs.close();
	            ps.close();
	            con.close();

	            return claim;
	        }

	        rs.close();
	        ps.close();
	        con.close();

	        return null;

	    } catch (SQLException | ClassNotFoundException e) {
	        e.printStackTrace();
	        return null;
	    }
	}
	
	public boolean updateClaimStatus(int claimId, String status, String adminNotes, int approvedBy) {
	    try {
	        Connection con = DataBase_Config.getConection();
	        PreparedStatement ps = con.prepareStatement(updateClaimStatusQuery);
	        ps.setString(1, status.toUpperCase());
	        ps.setString(2, adminNotes);
	        ps.setInt(3, approvedBy);
	        ps.setInt(4, claimId);
	        int rows = ps.executeUpdate();
	        ps.close();
	        con.close();
	        return rows > 0;
	    } catch (SQLException | ClassNotFoundException e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
	
	
	public List<Claim> fetchClaimsByUserId(int userId) {
	    try {
	        Connection con = DataBase_Config.getConection();
	        PreparedStatement ps = con.prepareStatement(selectClaimsByUserIdQuery);
	        ps.setInt(1, userId);
	        ResultSet rs = ps.executeQuery();
	        List<Claim> claims = new ArrayList<>();
	        while (rs.next()) {
	            Claim claim = new Claim();
	            claim.setClaimId(rs.getInt("Claim_ID"));
	            claim.setItemId(rs.getInt("Item_ID"));
	            claim.setUserId(rs.getInt("User_ID"));
	            claim.setProofImage(rs.getString("Proof_Image"));
	            claim.setClaimStatus(rs.getString("Claim_Status"));
	            claim.setAdminNotes(rs.getString("Admin_Notes"));
	            claim.setCreatedAt(rs.getTimestamp("Created_At"));
	            claim.setOwnershipDescription(rs.getString("Ownership_Description"));
	            claim.setApprovedBy(rs.getObject("Approved_By", Integer.class));
	            claim.setApprovedAt(rs.getTimestamp("Approved_At"));
	            claim.setItemTitle(rs.getString("Title"));
	            claim.setItemCategory(rs.getString("Category"));
	            claims.add(claim);
	        }
	        rs.close();
	        ps.close();
	        con.close();
	        return claims;
	    } catch (SQLException | ClassNotFoundException e) {
	        e.printStackTrace();
	        return null;
	    }
	}
}