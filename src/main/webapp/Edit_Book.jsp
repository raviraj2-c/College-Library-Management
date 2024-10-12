 
<%@page import="conn.entity.Add_book"%>
<%@page import="conn.DAO.AddbookDAOiml"%>
<%@page import="conn.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@include file="all_connection/Allcss.jsp"%>
</head>
<body style="background-color: black;">
	<%@include file="all_connection/navbersearch.jsp"%>

	<div class="caontainer">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Books</h4>
						
						
						
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						  AddbookDAOiml dao = new AddbookDAOiml(DBConnect.getConn());
						   Add_book b = dao.getBookById(id);
						%>
						
						
						
						<form action="editbooks" method="Post" class="p-5">
						<input type="hidden" name="Id" value="<%=b.getId() %>">
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputEmail4">Name</label> <input type="text"
						name="Book_Name" class="form-control" id="inputEmail4"
						value="<%=b.getBook_Name() %>">
				</div>
				<div class="form-group col-md-6">
					<label for="inputPassword4">Auther Name</label> <input type="text"
						name="Auther" class="form-control" id="inputPassword4"
						value="<%=b.getAuther()%>">
				</div>
				<div class="form-group col-md-6">
					<label for="inputPassword4">Category</label> <input
						type="text" name="Category" class="form-control"
						id="inputPassword4"value="<%=b.getCategory() %>">
				</div>
				<div class="form-group col-md-6">
					<label for="inputPassword4">Book Id</label> <input type="number"
						name="Book_id" class="form-control" id="inputPassword4"
						value="<%=b.getBook_id() %>">
				</div>
			</div>
			

			<div class="form-group">
				
			</div>
			<button type="submit" class="btn btn-primary">Sign in</button>
		</form>
					</div>
				</div>
			</div>
		</div>
	</div>



</body>
</html>