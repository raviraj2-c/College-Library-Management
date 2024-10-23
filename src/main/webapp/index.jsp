<% 
    if (session.getAttribute("isLoggedIn") == null || !(Boolean)session.getAttribute("isLoggedIn")) {
        response.sendRedirect("login.jsp");  
        return;
    }
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>College Library - Home</title>

    <%@include file="all_connection/Allcss.jsp"%>
    
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
     
     <link rel="stylesheet" href="css/index.css"> 
     
</head>
<body>
    
    <div class="book floating-book-1"></div>
    <div class="book floating-book-2"></div>
    <div class="book floating-book-3"></div>

<%@include file="all_connection/navber.jsp"%>
	

    <div class="container">
        <h2>Welcome to the College Library, <%= session.getAttribute("username") %>!</h2>
        <div class="row mt-5 justify-content-center">

            
            <div class="col-md-4 mb-5">
                <a href="Book_all.jsp" class="text-decoration-none">
                    <div class="card text-center">
                        <i class="fas fa-book icon-large"></i>
                        <h4 class="mt-3">Book Management</h4>
                    </div>
                </a>
            </div>

           
            <div class="col-md-4 mb-5">
                <a href="Issue_a_book.jsp" class="text-decoration-none">
                    <div class="card text-center">
                        <i class="fas fa-book-open icon-large"></i>
                        <h4 class="mt-3">Issue A Book</h4>
                    </div>
                </a>
            </div>

            
            <div class="col-md-4 mb-5">
                <a href="All_book_issue.jsp" class="text-decoration-none">
                    <div class="card text-center">
                        <i class="fas fa-list icon-large"></i>
                        <h4 class="mt-3">All Books Issued</h4>
                    </div>
                </a>
            </div>

            
            <div class="col-md-4 mb-5">
                <a href="Student_regstartion.jsp" class="text-decoration-none">
                    <div class="card text-center">
                        <i class="fas fa-user-plus icon-large"></i>
                        <h4 class="mt-3">Student Registration</h4>
                    </div>
                </a>
            </div>

           
            <div class="col-md-4 mb-5">
                <a href="LogoutServlet" class="text-decoration-none">
                    <div class="card text-center" style="background-color: #ff5c5c;">
                        <i class="fas fa-sign-out-alt icon-large"></i>
                        <h4 class="mt-3">Logout</h4>
                    </div>
                </a>
            </div>

        </div>
    </div>

     <script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>
</html>
