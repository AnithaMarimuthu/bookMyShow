package servlets;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.*;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

        String movie = req.getParameter("movie");
        int rate = Integer.parseInt(req.getParameter("rate"));
        String[] selectedSeats = req.getParameterValues("seats");

        if(selectedSeats == null || selectedSeats.length == 0){
            req.setAttribute("msg","Please select at least one seat!");
            req.getRequestDispatcher("booking.jsp?movie=" + movie).forward(req,res);
            return;
        }

        // Save in session for OTP verification
        HttpSession session = req.getSession();
        session.setAttribute("selectedSeats", Arrays.asList(selectedSeats));
        session.setAttribute("movie", movie);
        session.setAttribute("rate", rate);

        // Redirect to payment page
        res.sendRedirect("payment.jsp");
    }
}
