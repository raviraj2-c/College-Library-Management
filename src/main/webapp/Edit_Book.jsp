<% 
    
    if (session.getAttribute("isLoggedIn") == null || !(Boolean)session.getAttribute("isLoggedIn")) {
        response.sendRedirect("login.jsp"); 
        return;
    }
%>

<%@page import="conn.entity.Add_book"%>
<%@page import="conn.DAO.AddbookDAOiml"%>
<%@page import="conn.DB.DBConnect"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Book</title>
    
    <%@include file="all_connection/Allcss.jsp"%> 
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/All_book_issue.css">
    <link rel="stylesheet" href="css/Book_all.css">
    <link rel="stylesheet" href="css/Available_Book.css">
    <link rel="stylesheet" href="css/Edit_Book.css">
    
   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
   
</head>
<body>
    <%@include file="all_connection/navber.jsp"%>

    <div class="container my-5">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <h4 class="text-center mb-4"><i class="fas fa-edit"></i> Edit Book</h4>
                        
                        <%
                        int id = Integer.parseInt(request.getParameter("id"));
                        AddbookDAOiml dao = new AddbookDAOiml(DBConnect.getConn());
                        Add_book b = dao.getBookById(id);
                        %>

                        <form action="editbooks" method="post">
                            <input type="hidden" name="Id" value="<%=b.getId() %>">
                            
                            <div class="mb-3">
                                <label for="bookName" class="form-label">Book Name</label>
                                <input type="text" name="Book_Name" class="form-control" id="bookName" value="<%=b.getBook_Name() %>" required>
                            </div>
                            <div class="mb-3">
                                <label for="authorName" class="form-label">Author Name</label>
                                <input type="text" name="Auther" class="form-control" id="authorName" value="<%=b.getAuther()%>" required>
                            </div>
                            <div class="mb-3">
                                <label for="category" class="form-label">Category</label>
                                <input type="text" name="Category" class="form-control" id="category" value="<%=b.getCategory() %>" required>
                            </div>
                            <div class="mb-3">
                                <label for="bookId" class="form-label">Book ID</label>
                                <input type="number" name="Book_id" class="form-control" id="bookId" value="<%=b.getBook_id() %>" required>
                            </div>

                            <button type="submit" class="btn btn-primary btn-lg w-100">Update Book</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
