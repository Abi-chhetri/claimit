package com.claimit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.claimit.model.Admin;
import com.claimit.utils.DataBase_Config;

public class AdminDao {
	private String selectAdminByEmailQuery= "SELECT * FROM ADMINS WHERE Email = ?";
	private String selectAdminByIdQuery= "SELECT * FROM ADMINS WHERE Admin_ID = ?";
	
	public Admin findAdminById(String userId) {
		try {
			Connection con= DataBase_Config.getConection();
			PreparedStatement ps = con.prepareStatement(selectAdminByIdQuery);
			ps.setInt(1, Integer.parseInt(userId));
			ResultSet rs=ps.executeQuery();
			Admin admin = null;
			if (rs.next()) {
				admin = new Admin();
				admin.setAdminId(rs.getInt("Admin_ID"));
				admin.setFullName(rs.getString("Full_Name"));
				admin.setEmail(rs.getString("Email"));
				admin.setRole(rs.getString("Role"));
				admin.setPassword(rs.getString("Password"));
				admin.setStatus(rs.getString("Status"));
				admin.setCreatedAt(rs.getTimestamp("Created_At"));
				admin.setCreatedBy(rs.getObject("Created_By", Integer.class));
	        }
			rs.close();
			ps.close();
			con.close();
			return admin;
		}
		catch(SQLException | ClassNotFoundException se) {
			se.printStackTrace(); 
		    return null;
		}
	}
	
	public Admin findAdminByEmail(String email) {
		try {
			Connection con= DataBase_Config.getConection();
			PreparedStatement ps = con.prepareStatement(selectAdminByEmailQuery);
			ps.setString(1, email);
			ResultSet rs=ps.executeQuery();
			Admin admin = null;
			if (rs.next()) {
				admin = new Admin();
				admin.setAdminId(rs.getInt("Admin_ID"));
				admin.setFullName(rs.getString("Full_Name"));
				admin.setEmail(rs.getString("Email"));
				admin.setRole(rs.getString("Role"));
				admin.setPassword(rs.getString("Password"));
				admin.setStatus(rs.getString("Status"));
				admin.setCreatedAt(rs.getTimestamp("Created_At"));
				admin.setCreatedBy(rs.getObject("Created_By", Integer.class));
	        }
			rs.close();
			ps.close();
			con.close();
			return admin;
		}
		catch(SQLException | ClassNotFoundException se) {
			se.printStackTrace(); 
		    return null;
		}
	}
}
