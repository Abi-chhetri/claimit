package com.claimit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.claimit.enums.ReportStatus;
import com.claimit.model.ItemReport;
import com.claimit.utils.DataBase_Config;

public class ItemReportDao {
	private final String totalCountQuery = "select count(*) from ITEM_REPORTS";
	private final String createItemReportQuery = "INSERT INTO ITEM_REPORTS (Item_ID, User_ID, Reason, Status) VALUES (?, ?, ?, ?)";
	private final String updateStatusQuery = "UPDATE ITEM_REPORTS SET Status=? WHERE Item_ID=?";
	private final String getAllItemReportWithName = "SELECT ir.Item_Report_ID, ir.Item_ID, ir.User_ID, i.Title AS item_name, im.Image_Path AS item_image,"
		    + " u.Full_Name AS user_name, ir.Reason, ir.Status, ir.Created_At FROM ITEM_REPORTS ir "
		    + "JOIN ITEMS i ON ir.Item_ID = i.Item_ID "
		    + "JOIN USERS u ON ir.User_ID = u.User_ID "
		    + "JOIN ITEM_IMAGES im ON ir.Item_ID = im.Item_ID";

	public String createItemReport(int itemId, int userId, String reason) {
		try {
			Connection con = DataBase_Config.getConection();
			PreparedStatement ps = con.prepareStatement(createItemReportQuery);

			ps.setInt(1, itemId);
			ps.setInt(2, userId);
			ps.setString(3, reason.trim());
			ps.setString(4, ReportStatus.PENDING.name());
			ps.executeUpdate();
			ps.close();
			con.close();
			return "Action will be taken shortly. Thank you for your concern.";
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return "Something went wrong";
		}
	}

	public boolean changeItemStatusByItemId(String status, int itemId) {
		try {
			Connection con = DataBase_Config.getConection();
			PreparedStatement ps = con.prepareStatement(updateStatusQuery);

			ps.setString(1, status);
			ps.setInt(2, itemId);
			boolean row = ps.executeUpdate() > 0;
			ps.close();
			con.close();
			return row;
		} catch (ClassNotFoundException | SQLException e) {
			return false;
		}
	}

	public List<ItemReport> fetchAllItemReport() {
	    List<ItemReport> list = new ArrayList<>();
	    try {
	        Connection con = DataBase_Config.getConection();
	        PreparedStatement ps = con.prepareStatement(getAllItemReportWithName);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            ItemReport ir = new ItemReport();
	            ir.setItemReportId(rs.getInt("Item_Report_ID"));
	            ir.setItemId(rs.getInt("Item_ID"));
	            ir.setUserId(rs.getInt("User_ID"));
	            ir.setItemName(rs.getString("item_name"));     
	            ir.setUserName(rs.getString("user_name"));     
	            ir.setReason(rs.getString("Reason"));
	            ir.setStatus(rs.getString("Status"));
	            ir.setCreatedAt(rs.getTimestamp("Created_At"));
	            ir.setItemImage(rs.getString("item_image"));
	            list.add(ir);
	        }
	        rs.close();
	        ps.close();
	        con.close();
	    } catch (ClassNotFoundException | SQLException e) {
	        e.printStackTrace();
	        return new ArrayList<>();
	    }
	    return list;
	}

	private Integer executeCount(String countQuery) {
		try {
			Connection con = DataBase_Config.getConection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(countQuery);
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
