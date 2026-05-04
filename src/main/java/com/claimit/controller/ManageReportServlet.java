package com.claimit.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.claimit.enums.ReportStatus;
import com.claimit.model.ItemReport;
import com.claimit.services.ItemReportService;
import com.claimit.services.ItemService;

/**
 * Servlet implementation class ManageReportServlet
 */
@WebServlet(asyncSupported = true, name = "ManageReport", urlPatterns = { "/ManageReport" })
public class ManageReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final ItemReportService itemReportService=new ItemReportService();
	private final ItemService itemService =new ItemService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filterStatus = request.getParameter("status");
        
        List<ItemReport> itemReports = itemReportService.getAllItemReport();
        
        int pending = 0;
        int resolved = 0;
        for (ItemReport each : itemReports) {
            if (each.getStatus().equals(ReportStatus.PENDING.name())) {
                pending++;
            } else {
                resolved++;
            }
        }
        
        if (filterStatus != null && !filterStatus.trim().isEmpty()) {
            List<ItemReport> filtered = new ArrayList<>();
            for (ItemReport each : itemReports) {
                if (each.getStatus().equals(filterStatus.trim())) {
                    filtered.add(each);
                }
            }
            itemReports = filtered;
        }
        
        request.setAttribute("pending", pending);
        request.setAttribute("resolved", resolved);
        request.setAttribute("itemReports", itemReports);
        request.getRequestDispatcher("/WEB-INF/protected_pages/admins/manage-report.jsp").forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String itemId = request.getParameter("itemId");
		String reason= request.getParameter("reason");
		
		if(itemId != null && !itemId.isEmpty()) {
			itemService.updateItemStatusWithReason(Integer.parseInt(itemId), reason.trim());
			itemReportService.updateItemStatusByItemId(ReportStatus.ACTED.name(),Integer.parseInt(itemId));
		}
		
		response.sendRedirect(request.getContextPath()+"/ManageReport");
	}

}
