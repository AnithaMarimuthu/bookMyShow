<%@ page import="java.util.List" %>
<%
HttpSession session1 = request.getSession(false);
if(session1 == null || session1.getAttribute("selectedSeats") == null){
    out.println("Session expired. Please start booking again.");
    return;
}

List<String> seats = (List<String>) session1.getAttribute("selectedSeats");
String movie = (String) session1.getAttribute("movie");
int rate = (Integer) session1.getAttribute("rate");
int total = seats.size() * rate;
%>

<!DOCTYPE html>
<html>
<head>
    <title>Payment - <%=movie%></title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 400px;
            margin: 50px auto;
            background-color: #fff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        p {
            font-size: 16px;
            color: #555;
        }
        .seats {
            font-weight: bold;
            color: #222;
        }
        form {
            margin-top: 20px;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
        }
        button {
            width: 100%;
            padding: 12px;
            margin-top: 15px;
            background-color: #28a745;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }
        button:hover {
            background-color: #218838;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #007bff;
            text-decoration: none;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Payment for <%=movie%></h2>

    <p>Selected Seats: <span class="seats"><%=seats%></span></p>
    <p>Total Amount: <span class="seats">amount <%=total%></span></p>

    <form action="OtpServlet" method="post">
        <label>Enter Phone or Email:</label>
        <input type="text" name="phoneOrEmail" required>
        <button type="submit">Send OTP</button>
    </form>

    <a href="booking.jsp?movie=<%=movie%>" class="back-link">Back to Seat Selection</a>
</div>

</body>
</html>
