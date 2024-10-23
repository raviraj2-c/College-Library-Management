<% 
    // Check if user is logged in
    if (session.getAttribute("isLoggedIn") == null || !(Boolean)session.getAttribute("isLoggedIn")) {
        response.sendRedirect("login.jsp");  
        return;
    }
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="conn.entity.Add_book"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="conn.DB.DBConnect"%>
<%@page import="conn.DAO.AddbookDAOiml"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <title>All Books</title>
    
    <%@include file="all_connection/Allcss.jsp"%>
    <link rel="stylesheet" href="css/index.css"> 
    <link rel="stylesheet" href="css/Book_all.css">
    <link rel="stylesheet" href="css/Available_Book.css"> 
    
   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">

    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />

    <style>
       
        .container {
            max-width: 100%;
            padding: 20px;
        }
    </style>
</head>
<body style="background-color: #f8f9fa;"> 
    <%@include file="all_connection/navber.jsp"%>

    <% 
        
        String searchQuery = request.getParameter("searchQuery");

        
        if (searchQuery != null) {
            searchQuery = searchQuery.toLowerCase();  
        } else {
            searchQuery = "";  
        }
    %>

    <div class="container p-5 my-5 bg-white rounded shadow">
        <h2 class="text-center text-decoration-underline mb-4">All Books</h2>

       
        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Book ID</th>
                        <th scope="col">Book Name</th>
                        <th scope="col">Author</th>
                        <th scope="col">Category</th>
                        <th scope="col">Delete</th>
                        <th scope="col">Edit</th>
                    </tr>
                </thead>
                <tbody>

                <%
                    AddbookDAOiml dao = new AddbookDAOiml(DBConnect.getConn());
                    List<Add_book> list = dao.getAllbook();

                    for (Add_book b : list) {
                       
                        boolean isMatch = !searchQuery.isEmpty() && (
                            b.getBook_Name().toLowerCase().contains(searchQuery) ||
                            b.getAuther().toLowerCase().contains(searchQuery) ||
                            b.getCategory().toLowerCase().contains(searchQuery) ||
                            b.getBook_id().toLowerCase().contains(searchQuery) 
                        );
                %>

                    <tr style="background-color: <%= isMatch ? "#d4edda" : "white" %>">
                        <th><%= b.getId() %></th>
                        <td><%= b.getBook_id() %></td>
                        <td><%= b.getBook_Name() %></td>
                        <td><%= b.getAuther() %></td>
                        <td><%= b.getCategory() %></td>
                        <td><a href="delete?Id=<%= b.getId() %>" class="btn btn-sm btn-danger">Delete</a></td>
                        <td><a href="Edit_Book.jsp?id=<%= b.getId() %>" class="btn btn-sm btn-primary">Edit</a></td>
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
