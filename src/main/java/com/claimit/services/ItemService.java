package com.claimit.services;

import java.util.ArrayList;
import java.util.List;

import com.claimit.dao.ItemDao;
import com.claimit.model.Item;

public class ItemService {

	private ItemDao itemDao = new ItemDao();
	
	public Integer getTotalItemReport() {
		Integer count= itemDao.findItemReportCount();
		return count == null ? 0: count;
	}
	
	public Integer getUserReportCount(int userId) {
		return itemDao.findUserReportCount(userId);
	}
	
	public Item getItemById(int itemId) {
		Item item= itemDao.findItemById(itemId);
		if(item == null) {
			item = new Item();
		}
		return item;
	}
	
	public List<Item> getAllItems(){
	    List<Item> items = itemDao.fetchAllItems();
	    if(items == null ) {
	    	items = new ArrayList<>();
	    }
	    return items;
	}
	
	public int insertItem(Item Item) {
		return itemDao.createItem(Item);
	}
	
}
