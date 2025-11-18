<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <!-- ... head content ... -->
</head>
<body>
    <!-- Navigation Bar -->
    <div class="navbar">
        <h2>📚 Student Management System</h2>
        <div class="navbar-right">
            <div class="user-info">
                <span>Welcome, ${sessionScope.fullName}</span>
                <span class="role-badge role-${sessionScope.role}">
                    ${sessionScope.role}
                </span>
            </div>
            <a href="dashboard" class="btn-nav">Dashboard</a>
            <a href="logout" class="btn-logout">Logout</a>
        </div>
    </div>
    
    <div class="container">
        <h1>📚 Student List</h1>
        
        <!-- Add button - Admin only -->
        <c:if test="${sessionScope.role eq 'admin'}">
            <div style="margin: 20px 0;">
                <a href="student?action=new" class="btn-add">➕ Add New Student</a>
            </div>
        </c:if>
        
        <!-- Student Table -->
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Code</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Major</th>
                    <c:if test="${sessionScope.role eq 'admin'}">
                        <th>Actions</th>
                    </c:if>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="student" items="${students}">
                    <tr>
                        <td>${student.id}</td>
                        <td>${student.studentCode}</td>
                        <td>${student.fullName}</td>
                        <td>${student.email}</td>
                        <td>${student.major}</td>
                        
                        <!-- Action buttons - Admin only -->
                        <c:if test="${sessionScope.role eq 'admin'}">
                            <td>
                                <a href="student?action=edit&id=${student.id}" 
                                   class="btn-edit">Edit</a>
                                <a href="student?action=delete&id=${student.id}" 
                                   class="btn-delete"
                                   onclick="return confirm('Delete this student?')">Delete</a>
                            </td>
                        </c:if>
                    </tr>
                </c:forEach>
                
                <c:if test="${empty students}">
                    <tr>
                        <td colspan="6" style="text-align: center;">
                            No students found
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</body>
</html>
