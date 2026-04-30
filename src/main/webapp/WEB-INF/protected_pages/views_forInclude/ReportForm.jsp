<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.claimit.utils.SessionManager" %>
<div class="report-overlay">
    <div class="report-popup">
        <h3>Report This Item</h3>
        <form action="${pageContext.request.contextPath}/Browse" method="POST">
            <input type="hidden" name="itemId" value="<%= request.getParameter("itemId") %>" />
            <div class="form-group">
                <label for="reason">Reason for Reporting</label>
                <textarea name="reason" id="reason"
                    placeholder="Describe why you are reporting this item..."
                    required></textarea>
            </div>
            <div class="popup-buttons">
                <button type="submit" class="submit-report-btn">Submit Report</button>
                <a href="${pageContext.request.contextPath}/Browse" class="cancel-report-btn">Cancel</a>
            </div>
        </form>
    </div>
</div>