<%@page import="java.util.*, dao.SeatDAO"%>
<%
SeatDAO dao = new SeatDAO();

boolean leoFull     = dao.allBooked("Leo");
boolean jailerFull  = dao.allBooked("Jailer");
boolean vikramFull  = dao.allBooked("Vikram");
%>

<html>
<head>
<title>Dashboard</title>

<style>
body {
    font-family: Arial;
    background: #f2f2f2;
}

.container {
    width: 90%;
    margin: auto;
    text-align: center;
}

.movie-box {
    width: 260px;
    display: inline-block;
    background: white;
    margin: 20px;
    padding: 15px;
    border-radius: 12px;
    box-shadow: 0 0 10px #ccc;
}

.movie-box img {
    width: 100%;
    height: 320px;
    border-radius: 10px;
}

button {
    margin-top: 10px;
    padding: 10px 16px;
    font-size: 16px;
    background: #1a73e8;
    color: white;
    border: none;
    border-radius: 6px;
}
button:disabled {
    background: gray;
}
</style>
</head>

<body>

<h2 style="text-align:center;">Choose Your Movie</h2>

<div class="container">

    <!-- LEO -->
    <div class="movie-box">
        <img src="images/Leo.jpg">
        <h3>LEO</h3>
        

        <% if(leoFull){ %>
            <button disabled>BOOKED</button>
        <% } else { %>
            <form action="movieDetails.jsp">
                <input type="hidden" name="movie" value="Leo">
                <input type="hidden" name="rate" value="150">
                <button type="submit">Book Now</button>
            </form>
        <% } %>
    </div>

    <!-- JAILER -->
    <div class="movie-box">
        <img src="images/Jailer.webp">
        <h3>JAILER</h3>

        <% if(jailerFull){ %>
            <button disabled>BOOKED</button>
        <% } else { %>
            <form action="movieDetails.jsp">
                <input type="hidden" name="movie" value="Jailer">
                <input type="hidden" name="rate" value="150">
                <button type="submit">Book Now</button>
            </form>
        <% } %>
    </div>

    <!-- VIKRAM -->
    <div class="movie-box">
        <img src="images/Vikram.webp">
        <h3>VIKRAM</h3>

        <% if(vikramFull){ %>
            <button disabled>BOOKED</button>
        <% } else { %>
            <form action="movieDetails.jsp">
                <input type="hidden" name="movie" value="Vikram">
                <input type="hidden" name="rate" value="150">
                <button type="submit">Book Now</button>
            </form>
        <% } %>
    </div>

</div>

</body>
</html>
