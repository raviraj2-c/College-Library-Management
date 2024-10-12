package conn.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.DAO.IssueDAOiml;
import conn.DB.DBConnect;
import conn.entity.Issue_book;

@WebServlet("/Issue")
public class Issue_servlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String Book_Name=req.getParameter("Book_Name");
		String Auther=req.getParameter("Auther");
		String Category=  req.getParameter("Category");
		String Book_id=req.getParameter("Book_id");
		String Name=req.getParameter("Name");
		String Department=req.getParameter("Department");
		String Phone_number=  req.getParameter("Phone_number");
		String College_id=req.getParameter("College_id");
		String Addres=req.getParameter("Address");
		String Date = req.getParameter("Date");
		
		Issue_book Issue = new Issue_book();
		
		Issue.setBook_Name(Book_Name);
		Issue.setAuther(Auther);
		Issue.setCategory(Category);
		Issue.setBook_id(Book_id);
		Issue.setName(Name);
		Issue.setDepartment(Department);
		Issue.setPhone_number(Phone_number);
		Issue.setCollege_id(College_id);
		Issue.setAddres(Addres);
		Issue.setDate(Date);
		
		IssueDAOiml dao = new IssueDAOiml(DBConnect.getConn());
		
//		boolean f=dao.Issue(Issue);
//		if(f) {
//			resp.sendRedirect("index.jsp");
//		}else {
//			resp.sendRedirect("Book_management.jsp");
//		}
		
        int issuedBookCount = dao.getIssuedBookCountByStudent(College_id); // Use studentId as String for query

        if (issuedBookCount < 3) {
            // Proceed to issue the book as the student has less than 3 books issued
        	boolean f=dao.Issue(Issue);
            if (f) {
            	req.setAttribute("message", "Book issued successfully!");
            } else {
            	req.setAttribute("errorMessage", "Error issuing the book. Please try again.");
            }
        } else {
            // If the student already has 3 books, do not allow them to issue another book
        	req.setAttribute("errorMessage", "You already have 3 books issued. Please return one before issuing a new book.");
        }

        // Forward back to the JSP form with the appropriate message
        RequestDispatcher dispatcher = req.getRequestDispatcher("/Issue.jsp");
        dispatcher.forward(req, resp);
    
    }
}
