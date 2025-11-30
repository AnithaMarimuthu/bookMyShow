<%@ page import="java.util.*" %>
<%
String movie = (String) request.getAttribute("movie");
Map<String, Boolean> seatMap = (Map<String, Boolean>) request.getAttribute("seatMap");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Seat Table – <%= movie %></title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        h2 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: auto;
        }
        th, td {
            border: 1px solid #333;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        .booked {
            background-color: red;
            color: white;
            font-weight: bold;
        }
        .available {
            background-color: lightgreen;
            font-weight: bold;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #fff;
            background-color: #28a745;
            padding: 10px 15px;
            border-radius: 8px;
            transition: background-color 0.3s;
        }
        a:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Seat Booking Table <%= movie %></h2>

    <table>
        <tr>
            <th>Seat</th>
            <th>Status</th>
        </tr>
        <%
        for(Map.Entry<String, Boolean> e : seatMap.entrySet()){
            String seat = e.getKey();
            boolean booked = e.getValue();
        %>
        <tr class="<%= booked ? "booked" : "available" %>">
            <td><%= seat %></td>
            <td><%= booked ? "Booked" : "Available" %></td>
        </tr>
        <% } %>
    </table>

    <div style="text-align:center;">
        <a href="dashboard.jsp">Back to Dashboard</a>
    </div>
</div>

</body>
</html>
