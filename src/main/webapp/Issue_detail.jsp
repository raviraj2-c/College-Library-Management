<%@page import="conn.entity.Issue_book"%>
<%@page import="conn.DB.DBConnect"%>
<%@page import="conn.DAO.IssueDAOiml"%>
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
	<%@include file="all_connection/navber.jsp"%>



	<div class="container p-5 my-5" style="background-color: white;">

		<h2 class="text-center text-decoration-underline my-3">Issue
			Detail</h2>


		<%
		String idParam = request.getParameter("id");

		if (idParam != null && !idParam.isEmpty()) {
			try {
				int id = Integer.parseInt(idParam); // Convert the 'id' to an integer

				IssueDAOiml dao = new IssueDAOiml(DBConnect.getConn()); // Initialize DAO
				Issue_book bookDetails = dao.getAllIssueId(id); // Fetch issue details using the ID

				if (bookDetails != null) {
			// Display the issue details if found
		%>

		<div class="row">
			<div class="col-md-6">
				<h2 class="text-center text-decoration-underline my-3">Book
					Details</h2>
				<input type="hidden" name="Id" value="<%=bookDetails.getId()%>">
				<label for="Book_id">Book Id:</label> <input type="text"
					id="Book_id" value="<%=bookDetails.getBook_id()%>"
					class="form-control" name="Book_id" readonly> <label
					for="Book_Name">Book Name:</label> <input type="text"
					id="Book_Name" value="<%=bookDetails.getBook_Name()%>"
					class="form-control" name="Book_Name" readonly> <label
					for="Auther">Auther Name:</label> <input type="text" id="Auther"
					value="<%=bookDetails.getAuther()%>" class="form-control"
					name="Auther" readonly> <label for="Category">Category:</label>
				<input type="text" id="Category"
					value="<%=bookDetails.getCategory()%>" class="form-control"
					name="Category" readonly>


			</div>

			<div class="col-md-6">


				<h2 class="text-center text-decoration-underline my-3">Student
					Details</h2>

				<div class="row">

					<div class="col-md-6">
						<label for="Name">Student Name:</label> <input type="text"
							id="Name" value="<%=bookDetails.getName()%>" class="form-control"
							name="Name" readonly>
					</div>
					<div class="col-md-4 mx-5">
						<label for="Department">Department:</label> <input type="text"
							id="Department" value="<%=bookDetails.getDepartment()%>"
							class="form-control" name="Department" readonly>
					</div>

					<div class="col-md-12">
						<label for="Addres">Addres:</label> <input type="text" id="Addres"
							value="<%=bookDetails.getAddres()%>" class="form-control"
							name="Addres" readonly>
					</div>

					<div class="col-md-6">
						<label for="College_id">College Id:</label> <input type="text"
							id="College_id" value="<%=bookDetails.getCollege_id()%>"
							class="form-control" name="College_id" readonly>
					</div>

					<div class="col-md-6">
						<label for="Phone_number()">Phone Number:</label> <input
							type="text" id="Phone_number()"
							value="<%=bookDetails.getPhone_number()%>" class="form-control"
							name="Phone_number()" readonly>
					</div>

					<form action="calculateFine" method="post">
						<div class="row">
							<input type="hidden" name="id" value="<%=id%>">
							<div class="col-md-6">
								<label for="College_id">Date:</label> <input type="text"
									id="issueDate" name="issueDate"
									value="<%=bookDetails.getDate()%>" class="form-control my-2"
									readonly>

							</div>
							<div class="col-md-5 my-5">
								<button type="submit" class="btn btn-sm btn-primary">Fine</button>
							</div>
						</div>
					</form>
				</div>
			</div>

			<div class="col-md-6">

				<!-- Display results -->
				<%
				String errorMsg = (String) request.getAttribute("errorMsg");
				String resultMessage = (String) request.getAttribute("resultMessage");

				if (errorMsg != null) {
				%>
				<p style="color: red;"><%=errorMsg%></p>
				<%
				} else if (resultMessage != null) {
				%>
				<h3>Fine Calculation Result</h3>
				<p class="fine"><%=resultMessage%></p>
				<%
				}
				%>

			</div>

		</div>

		<a href="return?Id=<%=bookDetails.getId()%>" type="submit"
			class="btn btn-sm btn-primary">Return</a>

	</div>




	<%
	} else {
	// If no issue details are found for the given ID
	%>
	<p>No issue details found for the given ID.</p>
	<%
	}
	} catch (NumberFormatException e) {
	// Handle the exception if the 'id' is not a valid integer
	%>
	<p>Invalid issue ID provided. Please enter a valid ID.</p>
	<%
	}
	} else {
	// Handle the case where 'id' is missing
	%>
	<p>Issue ID is missing. Please provide a valid ID.</p>
	<%
	}
	%>








</body>
</html>