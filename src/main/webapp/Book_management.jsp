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
    <title>Book Management</title>
    
   <%@include file="all_connection/Allcss.jsp"%>
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/All_book_issue.css">
    <link rel="stylesheet" href="css/Book_all.css">
    <link rel="stylesheet" href="css/Available_Book.css">
    <link rel="stylesheet" href="css/Book_management.css">
    

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    
</head>
<body>
    <%@include file="all_connection/navber.jsp"%>

    <div class="container my-5">
        <h2 class="text-center mb-4"><i class="fas fa-book"></i> Add Books</h2>
        
        <form action="add_Book" method="post">
            <div class="form-row">
                <div class="form-group col-md-6 mb-3">
                    <label for="bookName">Name</label>
                    <input type="text" name="Book_Name" class="form-control" id="bookName" placeholder="Book Name" required>
                </div>
                <div class="form-group col-md-6 mb-3">
                    <label for="authorName">Author Name</label>
                    <input type="text" name="Auther" class="form-control" id="authorName" placeholder="Name of Author" required>
                </div>
                <div class="form-group col-md-6 mb-3">
                    <label for="category">Category</label>
                    <input type="text" name="Category" class="form-control" id="category" placeholder="Category" required>
                </div>
                <div class="form-group col-md-6 mb-3">
                    <label for="bookId">Book ID</label>
                    <input type="number" name="Book_id" class="form-control" id="bookId" placeholder="Book ID" required>
                </div>
            </div>

            <div class="form-group mb-4">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="gridCheck">
                    <label class="form-check-label" for="gridCheck"> Check me out</label>
                </div>
            </div>

            <button type="submit" class="btn btn-primary btn-lg w-100">Add Book</button>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
