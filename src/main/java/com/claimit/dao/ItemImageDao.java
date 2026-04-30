package com.claimit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.claimit.model.ItemImage;
import com.claimit.utils.DataBase_Config;

public class ItemImageDao {
	private final String saveIamgeQuery = "insert into ITEM_IMAGES (Item_ID, Image_Path) values (?, ?)";
    private final String getImageByIdQuery = "select * from ITEM_IMAGES where Item_ID = ?";
    
	 public boolean saveImages(int itemId, List<String> imagePaths) {
	        

	        try {
	        	Connection conn = DataBase_Config.getConection();
	            PreparedStatement ps = conn.prepareStatement(saveIamgeQuery);

	            for (String path : imagePaths) {
	                ps.setInt(1, itemId);
	                ps.setString(2, path);
	                // adds each image as a separate row in the batch
	                ps.addBatch();
	            }

	            ps.executeBatch();
				ps.close();
				conn.close();
	            return true;

	        } catch (ClassNotFoundException | SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
	    }
	 
	 public List<ItemImage> getImagesByItemId(int itemId) {
		    List<ItemImage> images = new ArrayList<>();

		    try {
		    	Connection conn = DataBase_Config.getConection();
		        PreparedStatement ps = conn.prepareStatement(getImageByIdQuery);
		        ps.setInt(1, itemId);
		        ResultSet rs = ps.executeQuery();

		        while (rs.next()) {
		            ItemImage image = new ItemImage();
		            image.setItemImageId(rs.getInt("Item_Image_ID"));
		            image.setItemId(rs.getInt("Item_ID"));
		            image.setImagePath(rs.getString("Image_Path"));
		            images.add(image);
		        }
				ps.close();
				rs.close();
				conn.close();
		    } catch (ClassNotFoundException | SQLException e) {
		        e.printStackTrace();
		    }

		    return images;
		}
}
