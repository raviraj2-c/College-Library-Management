package conn.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// Import your database connection utility class
import conn.DB.DBConnect;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Get username and password from the login form
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Check if the user is valid using a method that queries the database
        if (isValidUser(username, password)) {
            // If valid, create session and set isLoggedIn attribute
            HttpSession session = request.getSession();
            session.setAttribute("isLoggedIn", true);
            session.setAttribute("username", username);
            
            // Redirect to index.jsp or home page
            response.sendRedirect("index.jsp");
        } else {
            // If authentication fails, set error message and redirect back to login page
            request.setAttribute("errorMessage", "Invalid username or password!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    // Method to validate user credentials from the database
    private boolean isValidUser(String username, String password) {
        boolean isValid = false;
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            // Get database connection
            con = DBConnect.getConn();

            // Query to check if user exists with the provided username and password
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            pst = con.prepareStatement(sql);
            pst.setString(1, username);
            pst.setString(2, password);  // In a real-world scenario, you should hash the password and compare

            rs = pst.executeQuery();

            // If a result is returned, the user exists
            if (rs.next()) {
                isValid = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return isValid;
    }
}
