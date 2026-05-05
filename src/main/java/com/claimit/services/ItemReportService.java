package com.claimit.services;

import java.util.List;

import com.claimit.dao.ItemReportDao;
import com.claimit.enums.ReportStatus;
import com.claimit.model.ItemReport;

public class ItemReportService {
	private ItemReportDao itemReportDao=new ItemReportDao();
	
	public String insertItemReport(int itemId, int userId, String reason ) {
		return itemReportDao.createItemReport(itemId, userId, reason);
	}
	
	public Integer getTotalItemReport() {
		Integer count= itemReportDao.findItemReportCount();
		return count == null ? 0: count;
	}
	
	public boolean updateItemStatusByItemId(String status, int itemId) {
		return itemReportDao.changeItemStatusByItemId(status, itemId);
	}
	
	public List<ItemReport> getAllItemReport(){
		return itemReportDao.fetchAllItemReport();
	}
	
	public int getTotalPendingReportCount() {
		int count=0;
		List<ItemReport> itemReports= getAllItemReport();
		for(ItemReport eItem: itemReports) {
			if(eItem.getStatus().equals(ReportStatus.PENDING.name())) {
				count++;
			}
		}
		return count;
	}
}
