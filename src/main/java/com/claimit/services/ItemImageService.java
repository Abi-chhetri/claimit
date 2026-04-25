package com.claimit.services;

import java.util.ArrayList;
import java.util.List;

import com.claimit.dao.ItemImageDao;
import com.claimit.model.ItemImage;

public class ItemImageService {
	private ItemImageDao itemImageDao=new ItemImageDao();
	
	public boolean insertImages(int itemId, List<String> imagePaths) {
		return itemImageDao.saveImages(itemId, imagePaths);
	}
	
	public List<ItemImage> getImagesByItemId(int itemId){
		List<ItemImage> images=itemImageDao.getImagesByItemId(itemId);
		if(images==null) {
			return new ArrayList<>();
		}
		return images;
	}
}
