package servlets;

import java.io.IOException;
import java.sql.*;

import dbconnectiion.DBcon;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet{

	    @Override
	    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
	    String user = req.getParameter("username").trim();
        String pass = req.getParameter("password").trim();

        boolean validUser = false;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DBcon.getConnection();

            String sql = "SELECT * FROM users WHERE username=? AND password=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                validUser = true;
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (validUser) {
            HttpSession session = req.getSession();
            session.setAttribute("username", user);
            resp.sendRedirect("dashboard.jsp");
        } else {
            req.setAttribute("msg", "Invalid username or password");
            RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
            rd.forward(req, resp);
        }
    }
}
