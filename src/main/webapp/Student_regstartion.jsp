<% 
    // Check if user is logged in
    if (session.getAttribute("isLoggedIn") == null || !(Boolean)session.getAttribute("isLoggedIn")) {
        response.sendRedirect("login.jsp");  // If not logged in, redirect to login page
        return;
    }
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- Responsive design -->
    <title>Student Registration</title>
     <%@include file="all_connection/Allcss.jsp"%> <!-- Include your CSS file -->
     <!-- Replace with the actual path to index.css -->
    <link rel="stylesheet" href="css/All_book_issue.css">
   <link rel="stylesheet" href="css/Student_regstartion.css">
    <link rel="stylesheet" href="css/Book_all.css">
    <link rel="stylesheet" href="css/Available_Book.css">
    <link rel="stylesheet" href="css/Book_management.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"> <!-- Bootstrap CSS -->

    
</head>
<body>
    <%@include file="all_connection/navber.jsp"%> <!-- Navigation bar inclusion -->

    <div class="container p-5 my-5">
        <h2 class="text-center text-decoration-underline">Student Registration</h2>

        <form action="add_student" method="Post">
            <div class="row">
                <!-- Student Name -->
                <div class="form-group col-md-6 mb-3">
                    <label for="inputName">Name</label>
                    <input type="text" name="Name" class="form-control" id="inputName" placeholder="Enter Student Name" required>
                </div>
                <!-- Department -->
                <div class="form-group col-md-6 mb-3">
                    <label for="inputDepartment">Department</label>
                    <input type="text" name="Department" class="form-control" id="inputDepartment" placeholder="Enter Department" required>
                </div>
                <!-- Phone Number -->
                <div class="form-group col-md-6 mb-3">
                    <label for="inputPhone">Phone Number</label>
                    <input type="tel" name="Phone_number" class="form-control" id="inputPhone" placeholder="Enter Phone Number" required>
                </div>
                <!-- College ID -->
                <div class="form-group col-md-6 mb-3">
                    <label for="inputCollegeId">College ID</label>
                    <input type="number" name="College_id" class="form-control" id="inputCollegeId" placeholder="Enter College ID" required>
                </div>
            </div>

            <!-- Address -->
            <div class="form-group mb-3">
                <label for="inputAddress">Address</label>
                <input type="text" name="Address" class="form-control" id="inputAddress" placeholder="Enter Address (e.g. 1234 Main St)" required>
            </div>

            <!-- Checkbox -->
            <div class="form-group form-check mb-4">
                <input class="form-check-input" type="checkbox" id="gridCheck" required>
                <label class="form-check-label" for="gridCheck">Check me out</label>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="btn btn-primary w-100">Register</button> <!-- Full-width button -->
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
