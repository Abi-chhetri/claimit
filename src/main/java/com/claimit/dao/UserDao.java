package com.claimit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import com.claimit.model.User;
import com.claimit.utils.DataBase_Config;

public class UserDao {
	private String insertQuery = "insert into users (Full_Name, Email, Phone_Number, Password, "
			+ "Profile_Photo, Status, Created_At, Updated_At, Approved_By, Approve_Status, Approved_At) "
			+ "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
	
	private String selectUserByIdQuery= "SELECT * FROM USERS WHERE User_ID = ?";
	private String selectUserByEmailQuery= "SELECT * FROM USERS WHERE Email = ?";
	
	public String createUser(User user) {
		try {
			Connection con=DataBase_Config.getConection();
			PreparedStatement ps= con.prepareStatement(insertQuery);
			ps.setString(1, user.getFullName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPhoneNumber());
			ps.setString(4, user.getPassword());
			ps.setString(5, user.getProfilePhoto());
			ps.setString(6, user.getStatus());
			ps.setTimestamp(7, user.getCreatedAt());
			ps.setTimestamp(8, user.getUpdatedAt());
			if (user.getApprovedBy() != null) {
				ps.setInt(9, user.getApprovedBy());
			}
			else {
		    ps.setNull(9, Types.INTEGER);
		    }
			ps.setString(10, user.getApproveStatus());
			if(user.getApprovedAt() != null) {
				ps.setTimestamp(11, user.getApprovedAt());
			}
			else {
				ps.setNull(11, Types.INTEGER);
			}
			int result = ps.executeUpdate();

			ps.close();
			con.close();
			
			if (result > 0) {
			    return "Registration pending review. We'll update you shortly.";
			} else {
			    return "Registration Failed . Something went wrong.";
			}
		}
		catch(SQLException se) {
			se.printStackTrace(); 
		    return "Database Error";
		}
		catch(ClassNotFoundException cne) {
			cne.printStackTrace(); 
		    return "Driver Error";
		}
		
	}
	
	public User findUserById(String userId) {
		try {
			Connection con= DataBase_Config.getConection();
			PreparedStatement ps = con.prepareStatement(selectUserByIdQuery);
			ps.setString(1, userId);
			ResultSet rs=ps.executeQuery();
			User user = new User();
			if (rs.next()) {
	            user.setUserId(rs.getInt("User_ID"));
	            user.setFullName(rs.getString("Full_Name"));
	            user.setEmail(rs.getString("Email"));
	            user.setPhoneNumber(rs.getString("Phone_Number"));
	            user.setPassword(rs.getString("Password"));
	            user.setProfilePhoto(rs.getString("Profile_Photo"));
	            user.setStatus(rs.getString("Status"));
	            user.setCreatedAt(rs.getTimestamp("Created_At"));
	            user.setUpdatedAt(rs.getTimestamp("Updated_At"));
	            user.setApprovedBy(rs.getObject("Approved_By", Integer.class));
	            user.setApproveStatus(rs.getString("Approve_Status"));
	            user.setApprovedAt(rs.getTimestamp("Approved_At"));
	        }
			rs.close();
			ps.close();
			con.close();
			return user;
		}
		catch(SQLException | ClassNotFoundException se) {
			se.printStackTrace(); 
		    return null;
		}
	}
	
	
	public User findUserByEmail(String email) {
		try {
			Connection con= DataBase_Config.getConection();
			PreparedStatement ps = con.prepareStatement(selectUserByEmailQuery);
			ps.setString(1, email);
			ResultSet rs=ps.executeQuery();
			User user = new User();
			if (rs.next()) {
	            user.setUserId(rs.getInt("User_ID"));
	            user.setFullName(rs.getString("Full_Name"));
	            user.setEmail(rs.getString("Email"));
	            user.setPhoneNumber(rs.getString("Phone_Number"));
	            user.setPassword(rs.getString("Password"));
	            user.setProfilePhoto(rs.getString("Profile_Photo"));
	            user.setStatus(rs.getString("Status"));
	            user.setCreatedAt(rs.getTimestamp("Created_At"));
	            user.setUpdatedAt(rs.getTimestamp("Updated_At"));
	            user.setApprovedBy(rs.getObject("Approved_By", Integer.class));
	            user.setApproveStatus(rs.getString("Approve_Status"));
	            user.setApprovedAt(rs.getTimestamp("Approved_At"));
	        }
			rs.close();
			ps.close();
			con.close();
			return user;
		}
		catch(SQLException | ClassNotFoundException se) {
			se.printStackTrace(); 
		    return null;
		}
	}
}
