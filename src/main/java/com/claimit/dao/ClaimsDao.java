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

import com.claimit.model.Claim;
import com.claimit.utils.DataBase_Config;

public class ClaimsDao {

    // queries to count claims by status
	private final String pendingCountQuery = "select count(*) from CLAIMS where Claim_Status = 'PENDING'";
	private final String approvedCountQuery = "select count(*) from CLAIMS where Claim_Status = 'APPROVED'";
	private final String totalCountQuery = "select count(*) from CLAIMS";
	private final String selectAll = "select c.*, i.Title, i.Category, u.Full_Name, u.Email from claims c join items i on "
			+ "c.Item_ID = i.Item_ID join users u on c.User_ID = u.User_ID";
    
    private final String userClaimStatsQuery = "select " +
    	    "sum(case when Claim_Status = 'PENDING' then 1 else 0 end) as pending, " +
    	    "sum(case when Claim_Status = 'APPROVED' then 1 else 0 end) as approved, " +
    	    "count(*) as total " +
    	    "from claims where User_ID = ?";

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
				stats.put("pending", rs.getInt("pending"));
				stats.put("approved", rs.getInt("approved"));
				stats.put("total", rs.getInt("total"));
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
}