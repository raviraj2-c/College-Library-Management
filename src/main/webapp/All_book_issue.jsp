<%@page import="conn.entity.Issue_book"%>
<%@page import="conn.DAO.IssueDAOiml"%>
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

		<h2 class="text-center text-decoration-underline">All Books Issue</h2>

		<table class="table my-3">
			<thead class="thead-dark">



				<tr>
					<th scope="col">ID</th>
					<th scope="col">Book_id</th>
					<th scope="col">Book Name</th>
					<th scope="col">Auther</th>
					<th scope="col">Student Name</th>
					<th scope="col">Department</th>
					<th scope="col">Phone Number</th>
					<th scope="col">College Id</th>
					<th scope="col">View More Detail</th>
				</tr>
			</thead>
			<tbody>

				<%
				IssueDAOiml dao = new IssueDAOiml(DBConnect.getConn());
				List<Issue_book> list = dao.getAllIssue();
				for (Issue_book b : list) {
				%>

				

				<tr>
					<th><%=b.getId()%></th>
					<td><%=b.getBook_id()%></td>
					<td><%=b.getBook_Name()%></td>
					<td><%=b.getAuther()%></td>
					<td><%=b.getName()%></td>
					<td><%=b.getDepartment()%></td>
					<td><%=b.getPhone_number()%> </td>
					<td><%=b.getCollege_id()%> </td>
					
					<td><a href="Issue_detail.jsp?id=<%=b.getId()%>"
						class="btn btn-sm btn-primary">Click</a></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>