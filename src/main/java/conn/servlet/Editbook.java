package conn.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.DAO.AddbookDAOiml;
import conn.DB.DBConnect;
import conn.entity.Add_book;

@WebServlet("/editbooks")

public class Editbook extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int Id = Integer.parseInt(req.getParameter("Id"));
			String Book_Name=req.getParameter("Book_Name");
			String Auther=req.getParameter("Auther");
			String Category=  req.getParameter("Category");
			String Book_id=req.getParameter("Book_id");

			Add_book b = new Add_book();
			b.setId(Id);
			b.setBook_Name(Book_Name);
			b.setAuther(Auther);
			b.setCategory(Category);
			b.setBook_id(Book_id);
			
			
			AddbookDAOiml dao = new AddbookDAOiml(DBConnect.getConn());
			boolean f = dao.updateEditBooks(b);

			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("sussMag", "book update successfully");
				resp.sendRedirect("Available_Book.jsp");
			} else {
				session.setAttribute("failedmsg", "Sometion wrong on server ");
				resp.sendRedirect("index.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
