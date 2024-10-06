package conn.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.DAO.AddbookDAOiml;
import conn.DB.DBConnect;
import conn.entity.Add_book;

@WebServlet("/add_Book")
public class Addbook extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String Book_Name=req.getParameter("Book_Name");
		String Auther=req.getParameter("Auther");
		String Category=  req.getParameter("Category");
		String Book_id=req.getParameter("Book_id");
		
		Add_book adbook = new Add_book();
		
		adbook.setBook_Name(Book_Name);
		adbook.setAuther(Auther);
		adbook.setCategory(Category);
		adbook.setBook_id(Book_id);
		
		
		AddbookDAOiml dao = new AddbookDAOiml(DBConnect.getConn());
		
		boolean f=dao.addbook(adbook);
		if(f) {
			resp.sendRedirect("index.jsp");
		}else {
			resp.sendRedirect("Book_management.jsp");
		}
		
	}

	
	
	
}
