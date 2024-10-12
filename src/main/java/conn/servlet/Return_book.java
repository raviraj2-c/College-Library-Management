package conn.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.DAO.IssueDAOiml;
import conn.DB.DBConnect;

@WebServlet("/return")

public class Return_book extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("Id"));
			
			IssueDAOiml dao = new IssueDAOiml(DBConnect.getConn());
			boolean f=dao.returnbook(id);
			
			HttpSession session = req.getSession();
			
			if(f) {
				session.setAttribute("sussMag", "Book Delet successfly");
				resp.sendRedirect("All_book_issue.jsp");
			}else {
				session.setAttribute("failedmsg", "Book Not Delet ");
				resp.sendRedirect("All_book_issue.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
	
}
