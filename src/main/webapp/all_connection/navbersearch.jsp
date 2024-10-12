<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">College Library</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active mx-5"
						aria-current="page" href="index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link active mx-2"
						href="Student_regstartion.jsp">Student Registration</a></li>
					<li class="nav-item"><a class="nav-link active mx-2"
						href="Available_Book.jsp" tabindex="-1" aria-disabled="true">Available
							Book</a></li>
					<li class="nav-item"><a class="nav-link active mx-2"
						href="Book_management.jsp" tabindex="-1" aria-disabled="true">Add
							Book</a></li>

					<li class="nav-item"><a class="nav-link active mx-2"
						href="Issue_a_book.jsp" tabindex="-1" aria-disabled="true">Issue
							A Book</a></li>
							
							<li class="nav-item"><a class="nav-link active mx-2"
						href="All_book_issue.jsp" tabindex="-1" aria-disabled="true"> All Book Issue</a></li>
				</ul>
			</div>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
	</nav>
</body>
</html>