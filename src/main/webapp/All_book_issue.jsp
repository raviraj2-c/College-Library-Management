<% 
    // Check if user is logged in
    if (session.getAttribute("isLoggedIn") == null || !(Boolean)session.getAttribute("isLoggedIn")) {
        response.sendRedirect("login.jsp"); 
        return;
    }
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="conn.entity.Issue_book"%>
<%@page import="conn.DAO.IssueDAOiml"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="conn.DB.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Book Issues</title>

   
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/All_book_issue.css">
    <%@include file="all_connection/Allcss.jsp"%>
   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    
   
   
   
</head>
<body>

    <%@include file="all_connection/navber.jsp"%> 

    
    <div class="container my-5">
        <h2 class="text-center">All Books Issue</h2>

        <% 
            
            String searchQuery = request.getParameter("searchQuery");

            
            if (searchQuery != null) {
                searchQuery = searchQuery.toLowerCase(); 
            } else {
                searchQuery = "";
            }
        %>

       
        <div class="table-responsive">
           
            <table class="table table-striped table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Book ID</th>
                        <th scope="col">Book Name</th>
                        <th scope="col">Author</th>
                        <th scope="col">Student Name</th>
                        <th scope="col">Department</th>
                        <th scope="col">Phone Number</th>
                        <th scope="col">College ID</th>
                        <th scope="col">View More Detail</th>
                    </tr>
                </thead>
                <tbody>

                <%
                    IssueDAOiml dao = new IssueDAOiml(DBConnect.getConn());
                    List<Issue_book> list = dao.getAllIssue();

                    for (Issue_book b : list) {
                        
                        boolean isMatch = !searchQuery.isEmpty() && (
                            b.getBook_id().toLowerCase().contains(searchQuery) || 
                            b.getBook_Name().toLowerCase().contains(searchQuery) ||
                            b.getAuther().toLowerCase().contains(searchQuery) ||
                            b.getName().toLowerCase().contains(searchQuery) ||
                            b.getCollege_id().toLowerCase().contains(searchQuery)
                        );
                %>

                   
                    <tr style="background-color: <%= isMatch ? "#d4edda" : "white" %>">
                        <th><%= b.getId() %></th>
                        <td><%= b.getBook_id() %></td>
                        <td><%= b.getBook_Name() %></td>
                        <td><%= b.getAuther() %></td>
                        <td><%= b.getName() %></td>
                        <td><%= b.getDepartment() %></td>
                        <td><%= b.getPhone_number() %></td>
                        <td><%= b.getCollege_id() %></td>
                        <td>
                            <a href="Issue_detail.jsp?id=<%= b.getId() %>" class="btn btn-sm btn-primary">
                                Click
                            </a>
                        </td>
                    </tr>

                <%
                    } // End of the for loop
                %>

                </tbody>
            </table>
        </div>
    </div>

   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
