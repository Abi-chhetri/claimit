package com.claimit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.claimit.enums.AdminRoles;
import com.claimit.model.Admin;
import com.claimit.utils.DataBase_Config;

public class AdminDao {
	private final String selectAdminByEmailQuery = "SELECT * FROM ADMINS WHERE Email = ?";
	private final String selectAdminByIdQuery = "SELECT * FROM ADMINS WHERE Admin_ID = ?";
	private final String approveUserQuery = "UPDATE USERS SET Approve_Status = ?, Approved_By = ?, Approved_At = NOW() WHERE User_ID = ?";
	private final String updateRegistrationStatusOnlyQuery = "UPDATE USERS SET Approve_Status = ? WHERE User_ID = ?";
	private final String createModeratorQuery = "INSERT INTO ADMINS (Full_Name, Email, Role, Password, Status, Created_By) VALUES (?, ?, ?, ?, ?, ?)";
	private final String selectAllModeratorQuert = "SELECT * FROM ADMINS WHERE Role = '" + AdminRoles.MODERATOR.name() + "'";
	private final String updateModStatusByIdQuery = "UPDATE ADMINS SET Status = ? WHERE Admin_ID = ?";

	public Admin findAdminById(String adminId) {
		try {
			Connection con = DataBase_Config.getConnection();
			PreparedStatement ps = con.prepareStatement(selectAdminByIdQuery);
			ps.setInt(1, Integer.parseInt(adminId));
			ResultSet rs = ps.executeQuery();
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
		} catch (SQLException | ClassNotFoundException se) {
			se.printStackTrace();
			return null;
		}
	}

	public Admin findAdminByEmail(String email) {
		try {
			Connection con = DataBase_Config.getConnection();
			PreparedStatement ps = con.prepareStatement(selectAdminByEmailQuery);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
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
		} catch (SQLException | ClassNotFoundException se) {
			se.printStackTrace();
			return null;
		}
	}

	public boolean acceptUser(int userId, int adminId) {
		try {
			Connection con = DataBase_Config.getConnection();
			PreparedStatement ps = con.prepareStatement(approveUserQuery);
			ps.setString(1, "APPROVED");
			ps.setInt(2, adminId);
			ps.setInt(3, userId);
			int rows = ps.executeUpdate();
			ps.close();
			con.close();
			return rows > 0;
		} catch (SQLException | ClassNotFoundException se) {
			se.printStackTrace();
			return false;
		}
	}

	public boolean changeUserRegistrationStatusOnly(int userId, String status) {
		try {
			Connection con = DataBase_Config.getConnection();
			PreparedStatement ps = con.prepareStatement(updateRegistrationStatusOnlyQuery);
			ps.setString(1, status);
			ps.setInt(2, userId);
			int rows = ps.executeUpdate();
			ps.close();
			con.close();
			return rows > 0;
		} catch (SQLException | ClassNotFoundException se) {
			se.printStackTrace();
			return false;
		}
	}

	public boolean createModerator(Admin admin) {
		try {
			Connection con = DataBase_Config.getConnection();
			PreparedStatement ps = con.prepareStatement(createModeratorQuery);
			ps.setString(1, admin.getFullName());
			ps.setString(2, admin.getEmail());
			ps.setString(3, admin.getRole());
			ps.setString(4, admin.getPassword());
			ps.setString(5, admin.getStatus());
			ps.setInt(6, admin.getCreatedBy());

			int row = ps.executeUpdate();
			ps.close();
			con.close();
			return row > 0;

		} catch (SQLException | ClassNotFoundException se) {
			se.printStackTrace();
			return false;
		}
	}
	
	public List<Admin> fetchAllModerators() {
		try {
			Connection con = DataBase_Config.getConnection();
			PreparedStatement ps = con.prepareStatement(selectAllModeratorQuert);
			ResultSet rs = ps.executeQuery();
			List<Admin> admins= new ArrayList<>();
			while (rs.next()) {
				Admin admin = new Admin();
				admin = new Admin();
				admin.setAdminId(rs.getInt("Admin_ID"));
				admin.setFullName(rs.getString("Full_Name"));
				admin.setEmail(rs.getString("Email"));
				admin.setRole(rs.getString("Role"));
				admin.setPassword(rs.getString("Password"));
				admin.setStatus(rs.getString("Status"));
				admin.setCreatedAt(rs.getTimestamp("Created_At"));
				admin.setCreatedBy(rs.getObject("Created_By", Integer.class));
				admins.add(admin);
			}
			rs.close();
			ps.close();
			con.close();
			return admins;
		} catch (SQLException | ClassNotFoundException se) {
			se.printStackTrace();
			return null;
		}
	}
	
	public boolean changeStatusByModId(String action, int adminId) {
		try {
			Connection con = DataBase_Config.getConnection();
			PreparedStatement ps = con.prepareStatement(updateModStatusByIdQuery);
			ps.setString(1, action);
			ps.setInt(2, adminId);
			int rows = ps.executeUpdate();
			ps.close();
			con.close();
			return rows > 0;
		} catch (SQLException | ClassNotFoundException se) {
			se.printStackTrace();
			return false;
		}
	}
	
}
