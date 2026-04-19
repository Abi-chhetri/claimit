package com.claimit.services;

import com.claimit.dao.ItemReportDao;

public class ItemReportServices {

	private ItemReportDao itemReportDao = new ItemReportDao();
	
	public Integer getTotalItemReport() {
		Integer count= itemReportDao.findItemReportCount();
		return count == null ? 0: count;
	}
	
	
	public Integer getUserReportCount(int userId) {
		return itemReportDao.findUserReportCount(userId);
	}
	
}
