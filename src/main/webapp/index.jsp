<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Callege Library</title>

<%@include file="all_connection/Allcss.jsp"%>
</head>
<body style="background-color: black;">
	<%@include file="all_connection/navber.jsp"%>
	<div class="container ">
		<div class="row p-5">


			<div class="col-md-5 my-5">
				<a href="Book_all.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-plus-square fa-3x text-primary"></i><br>
							<h4>Book Management</h4>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-5 my-5">
				<a href="Issue_a_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-book-open fa-3x text-danger"></i><br>
							<h4>Issue A Book</h4>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-5 my-5">
				<a href="All_book_issue.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-book-open fa-3x text-danger"></i><br>
							<h4>All Book Issued</h4>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-5 my-5">
				<a href="Student_regstartion.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-bag-shopping fa-3x text-warning"></i> <br>
							<h4>Student Registration</h4>
						</div>
					</div>
				</a>
			</div>
			
			

			<div class="col-md-10 my-5">
				<a data-toggle="modal" data-target="#exampleModalCenter">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-right-from-bracket fa-3x text-primary"></i><br>
							<h4>Logout</h4>
						</div>
					</div>
				</a>
			</div>

		</div>
	</div>
</body>
</html>