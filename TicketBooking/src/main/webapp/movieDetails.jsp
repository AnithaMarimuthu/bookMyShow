<%@ page import="java.util.*" %>

<%
String movie = request.getParameter("movie");
String rate = request.getParameter("rate");

if(movie == null) movie = "";
if(rate == null) rate = "";

String img = "";
String rating = "";
String duration = "";
String description = "";

switch(movie){
    case "Leo":
        img = "images/Leo.jpg";
        rating = "9.2";
        duration = "2h 45m";
        description = "A cafe owners dark past returns, forcing him into violence.";
        break;

    case "Jailer":
        img = "images/Jailer.webp";
        rating = "9.0";
        duration = "2h 30m";
        description = "A retired jailer sets out to avenge his son's murder.";
        break;

    case "Vikram":
        img = "images/Vikram.webp";
        rating = "9.5";
        duration = "2h 50m";
        description = "A secret agent hunts down a drug syndicate.";
        break;
}
%>

<html>
<head>
<title><%=movie%> Details</title>

<style>
body {
    font-family: Arial;
    background: #f4f4f4;
    padding: 25px;
}
.box {
    width: 250px;
    margin: auto;
    background: white;
    padding: 20px;
    border-radius: 25px;
    box-shadow: 0 0 10px gray;
}
.movie-img {
    width: 100%;
    height: 300px;
    object-fit: cover;
    border-radius: 15px;
}
button {
    padding: 10px 20px;
    background: #1a73e8;
    color: white;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    font-size: 16px;
}
a {
    text-decoration: none;
    color: #1a73e8;
    font-size: 16px;
}
</style>

</head>

<body>

<div class="box">

    <img class="movie-img" src="<%=img%>">

    <h2><%=movie%></h2>

    <p><b>Rating:</b> <%=rating%>/10</p>
    <p><b>Duration:</b> <%=duration%></p>

    <p><b>Story:</b> <%=description%></p>

    <br>

    <form action="booking.jsp">
        <input type="hidden" name="movie" value="<%=movie%>">
        <input type="hidden" name="rate" value="<%=rate%>">
        <button type="submit">Proceed to Seat Booking</button>
    </form>

    <br><br>

    <a href="dashboard.jsp">Back to Dashboard</a>

</div>

</body>
</html>
