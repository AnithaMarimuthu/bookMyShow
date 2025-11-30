package dao;

import java.sql.*;
import java.util.*;

public class SeatDAO {

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(
              "jdbc:mysql://localhost:3306/moviedb", "root", "Anitha@2003");
    }

    // Load seats for a selected movie
    public Map<String, Boolean> getSeats(String movie) {
        Map<String, Boolean> map = new LinkedHashMap<>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(
                "SELECT seat_id, status FROM seats WHERE movie_name=?"
            );

            ps.setString(1, movie);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                map.put(rs.getString("seat_id"), rs.getInt("status") == 1);
            }
            con.close();

        } catch(Exception e) {
            e.printStackTrace();
        }

        return map;
    }

    // Book seat
    public void bookSeats(List<String> seatList, String movie) {

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(
                "UPDATE seats SET status=1 WHERE movie_name=? AND seat_id=?"
            );

            for (String s : seatList) {
                ps.setString(1, movie);
                ps.setString(2, s);
                ps.executeUpdate();
            }
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Check full status
    public boolean allBooked(String movie) {
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(
                "SELECT COUNT(*) FROM seats WHERE movie_name=? AND status=0"
            );

            ps.setString(1, movie);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) return rs.getInt(1) == 0;

            con.close();

        } catch(Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
