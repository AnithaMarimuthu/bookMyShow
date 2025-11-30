package servlets;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

import dao.SeatDAO;

@WebServlet("/VerifyOtpServlet")
public class VerifyOtpServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

    	 HttpSession session = req.getSession(false);
         if (session == null) {
             res.sendRedirect("dashboard.jsp");
             return;
         }

         String input = req.getParameter("otpInput");
         int otp = (int) session.getAttribute("otp");

         if(input != null && input.equals(String.valueOf(otp))) {
           
             List<String> seats = (List<String>) session.getAttribute("selectedSeats");
             String movie = (String) session.getAttribute("movie");

             SeatDAO dao = new SeatDAO();
             dao.bookSeats(seats, movie); 

          
             session.removeAttribute("otp");

             res.sendRedirect("confirmation.jsp?movie=" + movie);
         } else {
             req.setAttribute("msg", "Incorrect OTP! Try again.");
             RequestDispatcher rd = req.getRequestDispatcher("verifyOtp.jsp");
             rd.forward(req, res);
        }
    }
}
