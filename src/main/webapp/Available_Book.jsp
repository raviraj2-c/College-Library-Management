<%@page import="conn.entity.Add_book"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<%@page import="conn.DB.DBConnect"%>
<%@page import="conn.DAO.AddbookDAOiml"%>
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

	<div class="container p-5 my-5" style="background-color: white;">

		<h2 class="text-center text-decoration-underline">All Books</h2>
		
		<table class="table my-3">
			<thead class="thead-dark">



				<tr>
					<th scope="col">ID</th>
					<th scope="col">Book_id</th>
					<th scope="col">Book Name</th>
					<th scope="col">Auther</th>
					<th scope="col">Category</th>
					<th scope="col">Delet</th>
					<th scope="col">Edit</th>
				</tr>
			</thead>
			<tbody>

				<%
				AddbookDAOiml dao = new AddbookDAOiml(DBConnect.getConn());
				List<Add_book> list = dao.getAllbook();
				for (Add_book b : list) {
				%>



				<tr>
					<th><%=b.getId()%></th>
					<td><%=b.getBook_id()%></td>
					<td><%=b.getBook_Name()%></td>
					<td><%=b.getAuther()%></td>
					<td><%=b.getCategory()%></td>
					<td><a href="delete?Id=<%=b.getId()%>"
						class="btn btn-sm btn-danger">Delete</a></td>
					<td><a href="Edit_Book.jsp?id=<%=b.getId()%>" class="btn btn-sm btn-primary">Edit</a></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>