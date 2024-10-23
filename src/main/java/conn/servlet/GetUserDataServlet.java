package conn.servlet;

import conn.DAO.UserDAO;
import conn.DAO.UserDAOIml;
import conn.DB.DBConnect;
import conn.entity.Student_regstration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/getUserData")
public class GetUserDataServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userIdParam = request.getParameter("userId");

        if (userIdParam != null && !userIdParam.isEmpty()) {
            String userId = userIdParam;

            // Fetch the user data from the database using UserDAO
            UserDAOIml userDAO = new UserDAOIml(DBConnect.getConn());
            Student_regstration user = userDAO.getUserById(userId);

            if (user != null) {
                // Return user data as JSON
                response.setContentType("application/json");
                response.getWriter().write("{\"name\":\"" + user.getName() + "\", \"department\":\"" + user.getDepartment() + "\", " +
                        "\"addres\":\"" + user.getAddres() + "\", \"phone_number\":\"" + user.getPhone_number() + "\",\"College_id\":\""+user.getCollege_id()+"\"}");
            } else {
                // No user found
                response.getWriter().write("null");
            }
        } else {
            response.getWriter().write("null");
        }
    }
}
