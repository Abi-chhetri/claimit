package com.claimit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.claimit.model.Item;
import com.claimit.utils.DataBase_Config;

public class ItemDao {
	private final String selectItemById = "SELECT * FROM ITEMS WHERE Item_ID = ?";
	private final String selectItem = "SELECT Item_ID, User_ID, Type, Title, Category, Description, Location, Lost_Found_Date,"
			+ " Status, Rejection_Reason, Expires_At, Created_At, Updated_At FROM ITEMS";
	private final String createItem = "insert into ITEMS (User_ID, Type, Title, Category, Description, Location, Lost_Found_Date, Status) values (?, ?, ?, ?, ?, ?, ?, ?)";
	private final String userReportCountQuery = "select count(*) from ITEMS where User_ID = ?";
	private final String updateItemType= "UPDATE ITEMS SET Type= ? where Item_ID= ?";
	
	public Item findItemById(int itemId) {
		Item item = null;
		try {
			Connection con = DataBase_Config.getConection();
			PreparedStatement ps = con.prepareStatement(selectItemById);
			ps.setInt(1, itemId);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				item = new Item();

				item.setItemId(rs.getInt("Item_ID"));
				item.setUserId(rs.getInt("User_ID"));
				item.setType(rs.getString("Type"));
				item.setTitle(rs.getString("Title"));
				item.setCategory(rs.getString("Category"));
				item.setDescription(rs.getString("Description"));
				item.setLocation(rs.getString("Location"));
				item.setLostFoundDate(rs.getDate("Lost_Found_Date"));
				item.setStatus(rs.getString("Status"));
				item.setRejectionReason(rs.getString("Rejection_Reason"));
				item.setExpiresAt(rs.getTimestamp("Expires_At"));
				item.setCreatedAt(rs.getTimestamp("Created_At"));
				item.setUpdatedAt(rs.getTimestamp("Updated_At"));
			}
			
			ps.close();
			rs.close();
			con.close();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return item;
	}
	
	public List<Item> fetchAllItems() {
		List<Item> items=new ArrayList<>();
		try {
			Connection con = DataBase_Config.getConection();
			Statement st= con.createStatement();
			ResultSet rs= st.executeQuery(selectItem);
			
			while (rs.next()) {

			    Item item = new Item();

			    item.setItemId(rs.getInt("Item_ID"));
			    item.setUserId(rs.getInt("User_ID"));
			    item.setType(rs.getString("Type"));
			    item.setTitle(rs.getString("Title"));
			    item.setCategory(rs.getString("Category"));
			    item.setDescription(rs.getString("Description"));
			    item.setLocation(rs.getString("Location"));
			    item.setLostFoundDate(rs.getDate("Lost_Found_Date"));
			    item.setStatus(rs.getString("Status"));
			    item.setRejectionReason(rs.getString("Rejection_Reason"));
			    item.setExpiresAt(rs.getTimestamp("Expires_At"));
			    item.setCreatedAt(rs.getTimestamp("Created_At"));
			    item.setUpdatedAt(rs.getTimestamp("Updated_At"));

			    items.add(item);
			}
			
	        rs.close();
	        st.close();
	        con.close();
	        return items;
			
		} catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
		}
	}
	
	public int createItem(Item item) {
	    try{
	    	Connection con = DataBase_Config.getConection();
	        PreparedStatement ps = con.prepareStatement(createItem, Statement.RETURN_GENERATED_KEYS);
	        ps.setInt(1, item.getUserId());
	        ps.setString(2, item.getType());
	        ps.setString(3, item.getTitle());
	        ps.setString(4, item.getCategory());
	        ps.setString(5, item.getDescription());
	        ps.setString(6, item.getLocation());
	        ps.setDate(7, item.getLostFoundDate());
	        ps.setString(8, item.getStatus());

	        ps.executeUpdate();

	        // retrieve the auto-generated Item_ID after insert
	        ResultSet rs = ps.getGeneratedKeys();
	        if (rs.next()) {
	            return rs.getInt(1);
	        }
	        rs.close();
	        ps.close();
	        con.close();

	    } catch (ClassNotFoundException | SQLException e) {
	        e.printStackTrace();
	    }

	    return -1; // insert failed
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
    
    public void changeItemtype(String type, int itemId) {
    	try {
    		Connection con= DataBase_Config.getConection();
    		PreparedStatement ps= con.prepareStatement(updateItemType);
    		ps.setString(1, type);
    		ps.setInt(2, itemId);
    		ps.executeUpdate();
    		
    		ps.close();
    		con.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
