package com.claimit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.claimit.model.Notification;
import com.claimit.utils.DataBase_Config;

public class NotificationDao {
	
	private final String createNotif = "INSERT INTO NOTIFICATIONS (User_ID, Type, Message) VALUES (?, ?, ?)";
	private final String getNotifByUserIdWithLim = "SELECT * FROM NOTIFICATIONS WHERE User_ID = ? ORDER BY Created_At DESC LIMIT 5";
	private final String getNotifByUserId = "SELECT * FROM NOTIFICATIONS WHERE User_ID = ? ORDER BY Created_At DESC";

	public boolean createNotification(int userId, String type, String message) {
	    try{
	    	Connection con = DataBase_Config.getConnection();
	        PreparedStatement ps = con.prepareStatement(createNotif);
	        ps.setInt(1, userId);
	        ps.setString(2, type);
	        ps.setString(3, message);
	        boolean row= ps.executeUpdate() > 0;
	        
	        ps.close();
	        con.close();
	        return row;

	    } catch (SQLException | ClassNotFoundException e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
	

	public List<Notification> getNotificationsByUserIdWithLim(int userId) {
	    List<Notification> notifications = new ArrayList<>();
	    try {
	        Connection con = DataBase_Config.getConnection();
	        PreparedStatement ps = con.prepareStatement(getNotifByUserIdWithLim);
	        ps.setInt(1, userId);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Notification notification = new Notification();
	            notification.setNotificationId(rs.getInt("Notification_ID"));
	            notification.setUserId(rs.getInt("User_ID"));
	            notification.setType(rs.getString("Type"));
	            notification.setMessage(rs.getString("Message"));
	            notification.setCreatedAt(rs.getTimestamp("Created_At"));
	            notifications.add(notification);
	        }

	        rs.close();
	        ps.close();
	        con.close();

	    } catch (SQLException | ClassNotFoundException e) {
	        e.printStackTrace();
	    }
	    return notifications;
	}
	
	public List<Notification> getNotificationsByUserId(int userId) {
	    List<Notification> notifications = new ArrayList<>();
	    try {
	        Connection con = DataBase_Config.getConnection();
	        PreparedStatement ps = con.prepareStatement(getNotifByUserId);
	        ps.setInt(1, userId);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Notification notification = new Notification();
	            notification.setNotificationId(rs.getInt("Notification_ID"));
	            notification.setUserId(rs.getInt("User_ID"));
	            notification.setType(rs.getString("Type"));
	            notification.setMessage(rs.getString("Message"));
	            notification.setCreatedAt(rs.getTimestamp("Created_At"));
	            notifications.add(notification);
	        }

	        rs.close();
	        ps.close();
	        con.close();

	    } catch (SQLException | ClassNotFoundException e) {
	        e.printStackTrace();
	    }
	    return notifications;
	}
}
