<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Management</title>
<%@include file="all_connection/Allcss.jsp"%>
</head>
<body style="background-color: black;">
	<%@include file="all_connection/navber.jsp"%>
	<div class="container, px-4, py-4, and bg-white p-5">

		<h2 class="text-center text-decoration-underline">Add Books</h2>
		<form action="add_Book" method="Post" class="p-5">
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputEmail4">Name</label> <input type="text"
						name="Book_Name" class="form-control" id="inputEmail4"
						placeholder="Book Name">
				</div>
				<div class="form-group col-md-6">
					<label for="inputPassword4">Auther Name</label> <input type="text"
						name="Auther" class="form-control" id="inputPassword4"
						placeholder="Name Of Auther">
				</div>
				<div class="form-group col-md-6">
					<label for="inputPassword4">Category</label> <input
						type="text" name="Category" class="form-control"
						id="inputPassword4" placeholder="Category">
				</div>
				<div class="form-group col-md-6">
					<label for="inputPassword4">Book Id</label> <input type="number"
						name="Book_id" class="form-control" id="inputPassword4"
						placeholder="Book Id">
				</div>
			</div>
			

			<div class="form-group">
				<div class="form-check">
					<input class="form-check-input" type="checkbox" id="gridCheck">
					<label class="form-check-label" for="gridCheck"> Check me
						out </label>
				</div>
			</div>
			<button type="submit" class="btn btn-primary">Sign in</button>
		</form>
	</div>
</body>
</html>