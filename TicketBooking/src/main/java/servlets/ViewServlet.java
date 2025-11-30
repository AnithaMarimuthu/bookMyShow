package servlets;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;
import dao.SeatDAO;

@WebServlet("/ViewServlet")
public class ViewServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException {

        String movie = req.getParameter("movie");
        if (movie == null) {
            res.sendRedirect("dashboard.jsp");
            return;
        }

        SeatDAO dao = new SeatDAO();
        Map<String, Boolean> seatMap = dao.getSeats(movie);

        req.setAttribute("movie", movie);
        req.setAttribute("seatMap", seatMap);

        RequestDispatcher rd = req.getRequestDispatcher("view.jsp");
        rd.forward(req, res);
    }
}
