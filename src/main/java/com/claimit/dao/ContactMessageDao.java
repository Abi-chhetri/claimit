package com.claimit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import com.claimit.model.ContactMessage;
import com.claimit.utils.DataBase_Config;

public class ContactMessageDao {

	private final String insertMessage = "INSERT INTO CONTACT_MESSAGES (User_ID, Email, Message) VALUES (?, ?, ?)";
	private final String retrieveAllMessages = "SELECT * FROM CONTACT_MESSAGES ORDER BY Submitted_At DESC";
	private final String updateReadStatus = "UPDATE CONTACT_MESSAGES SET Is_Read=? WHERE Contact_Message_ID= ?";

	public boolean insertContactMessage(ContactMessage msg) {
		try {
			Connection con = DataBase_Config.getConection();
			PreparedStatement ps = con.prepareStatement(insertMessage);

			if(msg.getUserId()==null) {
				ps.setNull(1, Types.INTEGER);
			}else {
				ps.setInt(1, msg.getUserId());
			}
			ps.setString(2, msg.getEmail());
			ps.setString(3, msg.getMessage());

			boolean res = ps.executeUpdate() > 0;
			ps.close();
			con.close();

			return res;
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		}
	}
	
    public List<ContactMessage> fetchAllMessages() {
        List<ContactMessage> list = new ArrayList<>();
        try {
            Connection con = DataBase_Config.getConection();
            PreparedStatement ps = con.prepareStatement(retrieveAllMessages);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ContactMessage msg = new ContactMessage();
                msg.setContactMessageId(rs.getInt("Contact_Message_ID"));
                msg.setUserId(rs.getInt("User_ID"));
                msg.setEmail(rs.getString("Email"));
                msg.setMessage(rs.getString("Message"));
                msg.setSubmittedAt(rs.getTimestamp("Submitted_At"));
                msg.setIsRead(rs.getBoolean("Is_Read"));
                list.add(msg);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public boolean changeReadStatus(int contactMessageId) {
    	try {
    		Connection con= DataBase_Config.getConection();
    		PreparedStatement ps= con.prepareStatement(updateReadStatus);
    		
    		ps.setInt(1, 1);
    		ps.setInt(2, contactMessageId);
    		
    		boolean res=ps.execute();
    		
    		ps.close();
    		con.close();
    		return res;
    	}catch (SQLException | ClassNotFoundException e) {
    		e.getStackTrace();
    		return false;
		}
    }

}
