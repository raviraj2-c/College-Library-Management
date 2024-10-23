<%
    // Check if user is logged in
    if (session.getAttribute("isLoggedIn") == null || !(Boolean)session.getAttribute("isLoggedIn")) {
        response.sendRedirect("login.jsp");  // If not logged in, redirect to login page
        return;
    }
%>

<%@page import="conn.entity.Add_book"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="conn.DB.DBConnect"%>
<%@page import="conn.DAO.AddbookDAOiml"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- Responsive design -->
    <title>All Books</title>
     <%@include file="all_connection/Allcss.jsp"%> <!-- Include your CSS file -->
    <link rel="stylesheet" href="css/index.css"> <!-- Replace with the actual path to index.css -->
    <link rel="stylesheet" href="css/All_book_issue.css">
    <link rel="stylesheet" href="css/Book_all.css">
    <link rel="stylesheet" href="css/Book_management.css">
    <link rel="stylesheet" href="css/Issue_a_book.css">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
   
</head>
<body>
   <%@include file="all_connection/navber.jsp"%>




<% 
    // Get the search query from the request
    String searchQuery = request.getParameter("searchQuery");

    // If search query is null, set it to an empty string to avoid null checks
    if (searchQuery != null) {
        searchQuery = searchQuery.toLowerCase();  // Convert to lowercase for case-insensitive search
    } else {
        searchQuery = "";  // If null, use an empty string
    }
%>





    <div class="container p-5 my-5">
        <h2 class="text-center text-decoration-underline">All Books</h2>
        
        <table class="table my-3">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Book ID</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author</th>
                    <th scope="col">Category</th>
                    <th scope="col">Available</th>
                </tr>
            </thead>
            <tbody>
               <%
            AddbookDAOiml dao = new AddbookDAOiml(DBConnect.getConn());
            List<Add_book> list = dao.getAllbook();

            for (Add_book b : list) {
                // Check if the search query matches book name, author, or category
                boolean isMatch = !searchQuery.isEmpty() && (
                                  b.getBook_Name().toLowerCase().contains(searchQuery) ||
                                  b.getAuther().toLowerCase().contains(searchQuery) ||
                                  b.getCategory().toLowerCase().contains(searchQuery));
        %>
                <tr style="background-color: <%= isMatch ? "#d4edda" : "white" %>">
                    <th><%=b.getId()%></th>
                    <td><%=b.getBook_id()%></td>
                    <td><%=b.getBook_Name()%></td>
                    <td><%=b.getAuther()%></td>
                    <td><%=b.getCategory()%></td>
                    <td><a href="Issue.jsp?id=<%=b.getId()%>" class="btn btn-sm btn-danger">Issue</a></td>
                </tr>
                <%
                    } // End of for loop
                %>
            </tbody>
        </table>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
