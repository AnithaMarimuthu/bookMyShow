package servlets;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/OtpServlet")
public class OtpServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    	String phoneOrEmail = req.getParameter("phoneOrEmail");

        int otp = (int)(Math.random() * 9000) + 1000;

        HttpSession session = req.getSession();
        session.setAttribute("otp", otp);
        session.setAttribute("phoneOrEmail", phoneOrEmail);

        System.out.println("OTP for " + phoneOrEmail + " is: " + otp);

        res.sendRedirect("verifyOtp.jsp");
    }
}
