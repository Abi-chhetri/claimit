<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="form-container">
	<form action="${pageContext.request.contextPath}/AdminForm" method="POST">
		<c:if test="${not empty msg }"><span class="error-msg">${msg}</span></c:if>
	
	    <div class="form-group">
	        <label>Full Name</label>
	        <input type="text" name="fullName" value="${enteredFullName}">
	    </div>
	
	    <div class="form-group">
	        <label>Email</label>
	        <input type="email" name="email" value="${enteredEmail}">
	    </div>
	
	    <div class="form-group">
	        <label>Password</label>
	        <input type="password" name="password">
	    </div>
	    
	    <div class="form-group">
	        <label>Confirm Password</label>
	        <input type="password" name="confirm-password">
	    </div>
	
	    <div class="form-group">
	        <label>Status</label>
			<select name="status">
			    <option value="ACTIVE" ${selectedStatus == 'ACTIVE' ? 'selected' : ''}>ACTIVE</option>
			    <option value="INACTIVE" ${selectedStatus == 'INACTIVE' ? 'selected' : ''}>INACTIVE</option>
			</select>
	    </div>
	    
	    <button class="form-btn" type="submit">
	        Create Admin
	    </button>
	
	</form>
</div>