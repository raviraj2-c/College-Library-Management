<% 
    // Check if user is logged in
    if (session.getAttribute("isLoggedIn") == null || !(Boolean)session.getAttribute("isLoggedIn")) {
        response.sendRedirect("login.jsp");  // If not logged in, redirect to login page
        return;
    }
%>

<%@page import="conn.entity.Add_book"%>
<%@page import="conn.DB.DBConnect"%>
<%@page import="conn.DAO.AddbookDAOiml"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- Responsive design -->
    <title>Issue Book</title>
    <script>
        function fetchUserData() {
            var userId = document.getElementById("user").value;

            if (userId) {
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "getUserData?userId=" + userId, true);
                xhr.onreadystatechange = function() {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        var userData = JSON.parse(xhr.responseText);
                        if (userData) {
                            // Populate fields with user data
                            document.getElementById("userName").value = userData.name;
                            document.getElementById("userDepartment").value = userData.department;
                            document.getElementById("userAddres").value = userData.addres;
                            document.getElementById("userPhone").value = userData.phone_number;
                            document.getElementById("userCollege_id").value = userData.College_id;
                        } else {
                            alert("User not found!");
                        }
                    }
                };
                xhr.send();
            } else {
                alert("Please enter a User ID.");
            }
        }
    </script>
    
     <%@include file="all_connection/Allcss.jsp"%> <!-- Include your CSS file -->
     <!-- Replace with the actual path to index.css -->
    <link rel="stylesheet" href="css/All_book_issue.css">
    <link rel="stylesheet" href="css/Book_all.css">
    <link rel="stylesheet" href="css/Available_Book.css">
    <link rel="stylesheet" href="css/Book_management.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"> <!-- Bootstrap CSS -->
     <link rel="stylesheet" href="css/Issue.css">
    
</head>
<body>
    <%@include file="all_connection/navber.jsp"%>
    
    

    <div class="container p-5 my-5">
    
    <%
    String idParam = request.getParameter("id");

    if (idParam != null && !idParam.isEmpty()) {
        try {
            int id = Integer.parseInt(idParam); // Convert the 'id' to an integer
            AddbookDAOiml dao = new AddbookDAOiml(DBConnect.getConn()); // Initialize DAO
            Add_book b = dao.getBookById(id); // Fetch book details using the ID

            if (b != null) {
    %>
    
        <form action="Issue" method="post">
            <h2 class="text-center text-decoration-underline">Issue Book</h2>
            <input type="hidden" name="Id" value="<%=b.getId()%>">
            <div class="my-5">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputEmail4">Book Name</label> 
                        <input type="text" name="Book_Name" class="form-control" id="inputEmail4" value="<%=b.getBook_Name()%>" readonly>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputPassword4">Author Name</label> 
                        <input type="text" name="Auther" class="form-control" id="inputPassword4" value="<%=b.getAuther()%>" readonly>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputCategory">Category</label> 
                        <input type="text" name="Category" class="form-control" id="inputCategory" value="<%=b.getCategory()%>" readonly>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputBookId">Book ID</label> 
                        <input type="number" name="Book_id" class="form-control" id="inputBookId" value="<%=b.getBook_id()%>" readonly>
                    </div>

                    <div class="form-group col-md-6 my-3">
                        <label for="user">User ID:</label> 
                        <input type="text" id="user" class="form-control" name="userId" required>
                    </div>
                    <div class="form-group col-md-6 my-3">
                        <button type="button" class="btn btn-primary" onclick="fetchUserData()">Fetch User Data</button>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="userName">User Name:</label> 
                        <input type="text" id="userName" class="form-control" name="Name" readonly>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="userDepartment">Department:</label> 
                        <input type="text" id="userDepartment" class="form-control" name="Department" readonly>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="userAddres">Address:</label> 
                        <input type="text" id="userAddres" class="form-control" name="Address" readonly>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="userPhone">Phone Number:</label> 
                        <input type="text" id="userPhone" class="form-control" name="Phone_number" readonly>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="userCollege_id">College ID:</label> 
                        <input type="text" id="userCollege_id" class="form-control" name="College_id" readonly>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="dateOfIssue">Date of Issue:</label> 
                        <input type="date" class="form-control" name="Date" id="dateOfIssue" required>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Issue Book</button>
            </div>
        </form>

    <%
            } else {
                // Handle case where book details are not found
                %>
                <div class="alert alert-danger" role="alert">
                    No book found with the specified ID.
                </div>
    <%
            }
        } catch (NumberFormatException e) {
            // Handle invalid ID format
    %>
            <div class="alert alert-danger" role="alert">
                Invalid book ID format.
            </div>
    <%
        }
    } else {
        // Handle missing ID parameter
    %>
        <div class="alert alert-danger" role="alert">
            Book ID is missing.
        </div>
    <%
    }
    %>

    

    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
