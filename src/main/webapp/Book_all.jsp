<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="all_connection/Allcss.jsp"%>
<title>Insert title here</title>
</head>
<body style="background-color: black;">
	<%@include file="all_connection/navber.jsp"%>


	<div class="container my-5 ">
		<div class="row p-5">


			<div class="col-md-5 my-5">
				<a href="Available_Book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-book-open fa-3x text-danger"></i><br>
							<h4>Available Book</h4>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-5 my-5">
				<a href="Book_management.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-book-open fa-3x text-danger"></i><br>
							<h4>Add Book</h4>
						</div>
					</div>
				</a>
			</div>


		</div>
	</div>
</body>
</html>