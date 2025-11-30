<%@ page import="java.util.*" %>
<%
HttpSession session1 = request.getSession(false);
if (session1 == null) {
    out.println("Session expired. Please start booking again.");
    return;
}

List<String> selectedSeats = (List<String>) session1.getAttribute("selectedSeats");
String movie = (String) session1.getAttribute("movie");
Integer rate = (Integer) session1.getAttribute("rate");
int total = selectedSeats != null && rate != null ? selectedSeats.size() * rate : 0;
%>

<!DOCTYPE html>
<html>
<head>
    <title>Booking Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 400px;
            margin: 80px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            text-align: center;
        }
        h2 {
            color: #28a745;
            margin-bottom: 20px;
        }
        p {
            font-size: 16px;
            margin: 10px 0;
        }
        .seats {
            color: #007bff;
            font-weight: bold;
        }
        .total {
            color: #28a745;
            font-weight: bold;
            font-size: 18px;
        }
        a {
            display: inline-block;
            margin: 15px 10px 0 10px;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 8px;
            background-color: #007bff;
            color: #fff;
            transition: background-color 0.3s;
        }
        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Booking Successful!</h2>

    <p><b>Movie:</b> <%= movie %></p>
    <p><b>Selected Seats:</b> <span class="seats"><%= selectedSeats %></span></p>
    <p><b>Total Amount:</b> <span class="total">amount <%= total %></span></p>

    <a href="ViewServlet?movie=<%= movie %>">View Full Seat Table</a>
    <a href="dashboard.jsp"> Back to Dashboard</a>
</div>

</body>
</html>
