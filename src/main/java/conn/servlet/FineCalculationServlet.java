package conn.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;

@WebServlet("/calculateFine")
public class FineCalculationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String issueDateStr = request.getParameter("issueDate");
        String resultMessage = null;
        String errorMsg = null;

        try {
            // Parse the issue date from the request
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date issueDate = dateFormat.parse(issueDateStr);

            // Get today's date (submission date)
            Date today = new Date(); // Current date

            // Calculate the difference in milliseconds
            long diffInMillies = today.getTime() - issueDate.getTime();
            long diffInDays = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);

            // Fine calculation logic
            int gracePeriod = 15;  // No fine for the first 15 days
            int finePerDay = 10;   // 10 rupees per day after 15 days
            int totalFine = 0;

            // If the difference in days is greater than the grace period, calculate the fine
            if (diffInDays > gracePeriod) {
                long overdueDays = diffInDays - gracePeriod;  // Days past the grace period
                totalFine = (int) overdueDays * finePerDay;
            }

            // Construct the result message
            resultMessage = "Issue Date: " + issueDateStr + "<br>" +
                            "Submission Date: " + dateFormat.format(today) + "<br>" +
                            "Days Borrowed: " + (diffInDays > 0 ? diffInDays : 0) + " days<br>" +
                            "Total Fine: ₹" + totalFine;

        } catch (Exception e) {
            e.printStackTrace();
            errorMsg = "Error calculating fine: " + e.getMessage();
        }

        // Set attributes to forward back to the JSP
        request.setAttribute("resultMessage", resultMessage);
        request.setAttribute("errorMsg", errorMsg);
        
        // Forward the request back to the JSP to display the result
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Issue_detail.jsp");
        dispatcher.forward(request, response);
    }
}
