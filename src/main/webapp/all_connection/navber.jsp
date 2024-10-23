<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>College Library Navigation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        .navbar {
            background-color: #000;
            border-bottom: 2px solid #ffd700;
        }

        .navbar-brand {
            font-size: 1.8rem;
            font-weight: 700;
            color: #fff;
            text-transform: uppercase;
            letter-spacing: 3px;
            background: -webkit-linear-gradient(#f5af19, #f12711);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .navbar-nav .nav-link {
            font-size: 1.2rem;
            color: #fff;
            font-weight: 500;
            padding-left: 20px;
            padding-right: 20px;
            text-transform: capitalize;
            transition: all 0.3s ease-in-out;
        }

        .navbar-nav .nav-link:hover {
            color: #ffd700;
            text-shadow: 0px 0px 8px rgba(255, 215, 0, 0.8);
        }

        .navbar-nav .nav-link {
            position: relative;
            padding-bottom: 5px;
        }

        .navbar-nav .nav-link::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            background-color: #ffd700;
            left: 0;
            bottom: 0;
            transition: width 0.3s ease-in-out;
        }

        .navbar-nav .nav-link:hover::after {
            width: 100%;
        }

        /* Active link style */
        .navbar-nav .nav-link.active {
            color: #ffd700;
            border-bottom: 2px solid #ffd700;
        }

        .navbar-toggler {
            border: none;
        }

        .navbar-toggler-icon {
            background-image: url('https://img.icons8.com/ios-filled/50/ffffff/menu.png');
            width: 24px;
            height: 24px;
        }

        .container-fluid {
            max-width: 1300px;
        }

        /* Style for the search bar */
        .search-bar {
            width: 300px;
            margin-left: auto;
        }

        .search-input {
            width: 100%;
            border: none;
            padding: 5px;
            border-radius: 5px;
            outline: none;
        }

        .search-btn {
            background-color: #ffd700;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            color: #000;
        }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">College Library</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                    <!-- Home link with dynamic active class -->
                    <li class="nav-item">
                        <a class="nav-link mx-4 <%= request.getRequestURI().contains("index.jsp") ? "active" : "" %>" aria-current="page" href="index.jsp">Home</a>
                    </li>

                    <!-- Student Registration link -->
                    <li class="nav-item">
                        <a class="nav-link mx-4 <%= request.getRequestURI().contains("Student_regstartion.jsp") ? "active" : "" %>" href="Student_regstartion.jsp">Student Registration</a>
                    </li>

                    <!-- Available Book link -->
                    <li class="nav-item">
                        <a class="nav-link mx-4 <%= request.getRequestURI().contains("Available_Book.jsp") ? "active" : "" %>" href="Available_Book.jsp">Available Books</a>
                    </li>

                    <!-- Add Book link -->
                    <li class="nav-item">
                        <a class="nav-link mx-4 <%= request.getRequestURI().contains("Book_management.jsp") ? "active" : "" %>" href="Book_management.jsp">Add Book</a>
                    </li>

                    <!-- Issue A Book link -->
                    <li class="nav-item">
                        <a class="nav-link mx-4 <%= request.getRequestURI().contains("Issue_a_book.jsp") ? "active" : "" %>" href="Issue_a_book.jsp">Issue A Book</a>
                    </li>

                    <!-- All Book Issue link -->
                    <li class="nav-item">
                        <a class="nav-link mx-4 <%= request.getRequestURI().contains("All_book_issue.jsp") ? "active" : "" %>" href="All_book_issue.jsp">All Book Issues</a>
                    </li>
                </ul>

                <!-- Dynamic Search Bar -->
                <%
                    String currentPage = request.getRequestURI();
                    if (currentPage.contains("Available_Book.jsp") || currentPage.contains("Issue_a_book.jsp") || currentPage.contains("All_book_issue.jsp")) {
                %>
                <form class="d-flex search-bar">
                    <input class="search-input" type="search"name="searchQuery" placeholder="Search..." >
                    <button class="btn search-btn" type="submit">Search</button>
                </form>
                <%
                    }
                %>

            </div>
        </div>
    </nav>

    <!-- Bootstrap JS for the navbar toggler functionality -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
