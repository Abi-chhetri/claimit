package com.claimit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;

import com.claimit.model.User;
import com.claimit.utils.DataBase_Config;

public class UserDao {
	private String insertQuery = "insert into users (Full_Name, Email, Phone_Number, Password, "
			+ "Profile_Photo, Status, Created_At, Updated_At, Approved_By, Approve_Status, Approved_At) "
			+ "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
	
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
}
