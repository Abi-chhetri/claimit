package com.claimit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.claimit.model.User;
import com.claimit.utils.DataBase_Config;

public class UserDao {
	private String insertQuery = "insert into users (Full_Name, Email, Phone_Number, Password, "
			+ "Profile_Photo, Status, Created_At, Updated_At, Approved_By, Approve_Status, Approved_At) "
			+ "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
	
	public String createUser(User user) {
		try {
			Connection con=DataBase_Config.getConection();
			PreparedStatement ps= con.prepareStatement(insertQuery);
			ps.setString(1, user.getFullName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPhoneNumber());
			ps.setString(3, user.getPassword());
			
		}
		catch(SQLException se) {
			
		}
		catch(ClassNotFoundException cne) {
			
		}
		return "";
	}
}
