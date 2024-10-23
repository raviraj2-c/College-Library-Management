<% 
   
    if (session.getAttribute("isLoggedIn") == null || !(Boolean)session.getAttribute("isLoggedIn")) {
        response.sendRedirect("login.jsp"); 
        return;
    }
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Management</title>

    <%@include file="all_connection/Allcss.jsp"%>
    <link rel="stylesheet" href="css/index.css"> 
    <link rel="stylesheet" href="css/All_book_issue.css">
    <link rel="stylesheet" href="css/Book_all.css">
    

    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    
    <link rel="stylesheet" href="path/to/css/index.css"> 
</head>
<body style="background-color: #f8f9fa;">
    <%@include file="all_connection/navber.jsp"%>

    <div class="container my-5">
        <h2 class="text-center text-decoration-underline mb-4">Library Management</h2>
        <div class="row text-center">

            <div class="col-md-6 mb-4">
                <a href="Available_Book.jsp" class="text-decoration-none">
                    <div class="card shadow-sm" style="border-radius: 10px;">
                        <div class="card-body">
                            <i class="fa-solid fa-book-open fa-4x text-danger mb-3"></i>
                            <h4 class="card-title">Available Books</h4>
                            <p class="card-text">Check out all the available books in the library.</p>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-6 mb-4">
                <a href="Book_management.jsp" class="text-decoration-none">
                    <div class="card shadow-sm" style="border-radius: 10px;">
                        <div class="card-body">
                            <i class="fa-solid fa-plus-square fa-4x text-success mb-3"></i>
                            <h4 class="card-title">Add Book</h4>
                            <p class="card-text">Manage the library by adding new books.</p>
                        </div>
                    </div>
                </a>
            </div>

        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
