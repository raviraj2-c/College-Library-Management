package conn.servlet;

import conn.DAO.AddbookDAOiml;

import conn.DAO.StudentDAOiml;
import conn.DB.DBConnect;
import conn.entity.Add_book;
import conn.entity.Student_regstration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String query = request.getParameter("query");
        String searchType = request.getParameter("searchType");

        if (searchType.equals("book")) {
            // Search books
        	AddbookDAOiml bookDao = new AddbookDAOiml(DBConnect.getConn());
            List<Add_book> bookResults = bookDao.searchBooks(query);
            request.setAttribute("bookResults", bookResults);
        } else if (searchType.equals("student")) {
            // Search students
        	StudentDAOiml studentDao = new StudentDAOiml(DBConnect.getConn());
            List<Student_regstration> studentResults = studentDao.searchStudents(query);
            request.setAttribute("studentResults", studentResults);
        }

        // Forward the results to a JSP page for displaying
        request.getRequestDispatcher("Available_Book.jsp").forward(request, response);
    }
}
