<% 
String errorMessage = (String) request.getAttribute("errorMessage");
String message = (String) request.getAttribute("message");
%>

<!-- Your form to issue a book -->

<form action="Issue" method="post">
<form action="issueBook" method="Post">
    <label for="studentId">Student ID:</label>
    <input type="text" id="studentId" name="studentId" required>
    
    <label for="bookId">Book ID:</label>
    <input type="text" id="bookId" name="bookId" required>
    
    <input type="submit" value="Issue Book">
</form>
</form>
<% if (errorMessage != null) { %>
    <p style="color: red;"><%= errorMessage %></p>
<% } %>

<% if (message != null) { %>
    <p style="color: green;"><%= message %></p>
<% } %>
