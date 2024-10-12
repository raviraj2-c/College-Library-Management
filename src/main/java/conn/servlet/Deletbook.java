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



@WebServlet("/delete")
public class Deletbook extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("Id"));
			
			AddbookDAOiml dao = new AddbookDAOiml(DBConnect.getConn());
			boolean f=dao.deletebooks(id);
			
			HttpSession session = req.getSession();
			
			if(f) {
				session.setAttribute("sussMag", "Book Delet successfly");
				resp.sendRedirect("Available_Book.jsp");
			}else {
				session.setAttribute("failedmsg", "Book Not Delet ");
				resp.sendRedirect("Available_Book.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
	
}
