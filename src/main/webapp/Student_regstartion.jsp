<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Registration</title>
<%@include file="all_connection/Allcss.jsp"%>
</head>
<body style="background-color: black;">
	<%@include file="all_connection/navber.jsp"%>

	<div class="container, px-4, py-4, and bg-white p-5">

		<h2 class="text-center text-decoration-underline">Student
			Registration</h2>
		<form action="add_student" method="Post" class="p-5">
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputEmail4">Name</label> <input type="text"
						name="Name" class="form-control" id="inputEmail4"
						placeholder="Student Name">
				</div>
				<div class="form-group col-md-6">
					<label for="inputPassword4">Department</label> <input type="text"
						name="Department" class="form-control" id="inputPassword4"
						placeholder="Name Of Department">
				</div>
				<div class="form-group col-md-6">
					<label for="inputPassword4">Phone Number</label> <input
						type="number" name="Phone_number" class="form-control"
						id="inputPassword4" placeholder="Phone Number">
				</div>
				<div class="form-group col-md-6">
					<label for="inputPassword4">College Id</label> <input type="number"
						name="College_id" class="form-control" id="inputPassword4"
						placeholder="College Id">
				</div>
			</div>
			<div class="form-group">
				<label for="inputAddress">Address</label> <input type="text"
					name="Address" class="form-control" id="inputAddress"
					placeholder="1234 Main St">
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