package com.claimit.services;

import com.claimit.dao.ItemReportDao;

public class ItemReportService {
	private ItemReportDao itemReportDao=new ItemReportDao();
	
	public String insertItemReport(int itemId, int userId, String reason ) {
		return itemReportDao.createItemReport(itemId, userId, reason);
	}
	
	public Integer getTotalItemReport() {
		Integer count= itemReportDao.findItemReportCount();
		return count == null ? 0: count;
	}
}
