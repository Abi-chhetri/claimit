package com.claimit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.claimit.enums.ReportStatus;
import com.claimit.utils.DataBase_Config;

public class ItemReportDao {
	private final String totalCountQuery = "select count(*) from ITEM_REPORTS";
	private final String createItemReportQuery = "INSERT INTO Item_Reports (Item_ID, User_ID, Reason, Status) VALUES (?, ?, ?, ?)";


	public String createItemReport(int itemId, int userId, String reason ) {
		try {
			Connection con = DataBase_Config.getConection();
			PreparedStatement ps = con.prepareStatement(createItemReportQuery);

			ps.setInt(1, itemId);
			ps.setInt(2, userId);
			ps.setString(3, reason.trim());
			ps.setString(4, ReportStatus.PENDING.name());
			ps.executeUpdate();
			return "Action will be taken shortly. Thank you for your concern.";
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return "Something went wrong";
		}
	}
	
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
    
    public Integer findItemReportCount() {
    	return executeCount(totalCountQuery);
    }
	

}
