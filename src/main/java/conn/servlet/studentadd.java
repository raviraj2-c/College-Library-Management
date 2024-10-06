package conn.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import conn.DAO.StudentDAOiml;
import conn.DB.DBConnect;
import conn.entity.Student_regstration;


@WebServlet("/add_student")
public class studentadd extends HttpServlet{



	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
		
			String Name=req.getParameter("Name");
			String Department=req.getParameter("Department");
			String Phone_number=  req.getParameter("Phone_number");
			String College_id=req.getParameter("College_id");
			String Addres=req.getParameter("Address");
			
			Student_regstration us = new Student_regstration();
		     us.setName(Name);
			us.setDepartment(Department);
			us.setPhone_number(Phone_number);
			us.setPhone_number(Phone_number);
			us.setCollege_id(College_id);
			us.setAddres(Addres);
			
			StudentDAOiml dao = new StudentDAOiml(DBConnect.getConn());
			
			boolean f=dao.studentadd(us);
			if(f) {
				resp.sendRedirect("index.jsp");
			}else {
				resp.sendRedirect("Student_regstartion.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		
	}

	
	
}
