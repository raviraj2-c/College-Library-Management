<%@page import="conn.entity.Add_book"%>
<%@page import="conn.DB.DBConnect"%>
<%@page import="conn.DAO.AddbookDAOiml"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<%@include file="all_connection/Allcss.jsp"%>
</head>
<body style="background-color: black;">
	<%@include file="all_connection/navber.jsp"%>
	
	<% 
String errorMessage = (String) request.getAttribute("errorMessage");
String message = (String) request.getAttribute("message");
%>

	<div class="container, px-4, py-4, and bg-white p-5">
	
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
			
				
				
				<input type="hidden" name="Id" value="<%=b.getId()%>">
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="inputEmail4">Name</label> <input type="text"
							name="Book_Name" class="form-control" id="inputEmail4"
							value="<%=b.getBook_Name()%>">
					</div>
					<div class="form-group col-md-6">
						<label for="inputPassword4">Auther Name</label> <input type="text"
							name="Auther" class="form-control" id="inputPassword4"
							value="<%=b.getAuther()%>">
					</div>
					<div class="form-group col-md-6">
						<label for="inputPassword4">Category</label> <input type="text"
							name="Category" class="form-control" id="inputPassword4"
							value="<%=b.getCategory()%>">
					</div>
					<div class="form-group col-md-6">
						<label for="inputPassword4">Book Id</label> <input type="number"
							name="Book_id" class="form-control" id="inputPassword4"
							value="<%=b.getBook_id()%>">
					</div>

					<div class="form-group col-md-5 my-3">
						<label for="user">User ID:</label> <input type="text" id="user"
							class="form-control" name="userId" required>


					</div>
					<div class="form-group col-md-3 my-5">
						<button type="button" class="btn btn-primary"
							onclick="fetchUserData()">User Data</button>
					</div>
					<div class="form-group col-md-6">
						<label for="userName">User Name:</label> <input type="text"
							id="userName" class="form-control" name="Name" readonly>
					</div>

					<div class="form-group col-md-6">
						<label for="userDepartment">Department:</label> <input type="text"
							id="userDepartment" class="form-control" name="Department"
							readonly>
					</div>

					<div class="form-group col-md-6">
						<label for="userAddres">Address:</label> <input type="text"
							id="userAddres" class="form-control" name="Address" readonly>
					</div>

					<div class="form-group col-md-6">
						<label for="userPhone">Phone Number:</label> <input type="text"
							id="userPhone" class="form-control" name="Phone_number" readonly>
					</div>
					<div class="form-group col-md-6">
						<label for="userCollege_id">College id:</label> <input type="text"
							id="userCollege_id" class="form-control" name="College_id"  readonly>
					</div>
					<div class="form-group col-md-6">
					<label for="Date">Date Of Issue</label> 
					 <input type="date" class="form-control" name="Date"  id="Test_DatetimeLocal">
					</div>
				</div>
				<button type="submit" class="btn btn-primary">Issue Book</button>

			</div>
			
			

			

</form>


<%
	} else {
	// If no issue details are found for the given ID
	%>
	
	<%
	}
	} catch (NumberFormatException e) {
	// Handle the exception if the 'id' is not a valid integer
	%>
	
	<%
	}
	} else {
	// Handle the case where 'id' is missing
	%>
	
	<%
	}
	%>



<% if (errorMessage != null) { %>
    <p style="color: red;"><%= errorMessage %></p>
    <a href="index.jsp" class="btn btn-primary">Home Page</a>
    
<% } %>

<% if (message != null) { %>
    <p style="color: green;"><%= message %></p>
     <a href="index.jsp" class="btn btn-primary">Home Page</a>
    
<%} %>
	</div>


</body>
</html>
