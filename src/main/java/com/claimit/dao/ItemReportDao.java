package com.claimit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.claimit.utils.DataBase_Config;

public class ItemReportDao {
	private final String totalCountQuery = "select count(*) from claims";
	private final String userReportCountQuery = "select count(*) from item_reports where User_ID = ?";
	
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
    
    public Integer findUserReportCount(int userId) {
        try {
            Connection con = DataBase_Config.getConection();
            PreparedStatement ps = con.prepareStatement(userReportCountQuery);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                rs.close();
                ps.close();
                con.close();
                return count;
            }
            rs.close();
            ps.close();
            con.close();
            return 0;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }
}
