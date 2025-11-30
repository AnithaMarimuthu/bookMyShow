<%@ page import="java.util.*,dao.SeatDAO" %>

<%
String movie = request.getParameter("movie");
String rate  = request.getParameter("rate");


if(movie == null) movie = "Leo";
if(rate == null) rate = "150";

SeatDAO dao = new SeatDAO();
Map<String, Boolean> seats = dao.getSeats(movie); 
boolean allBooked = true;
for(boolean b : seats.values()){
    if(!b){
        allBooked = false;
        break;
    }
}

if(allBooked){
%>

<h2>No Seats Available for <%= movie %></h2>
<a href="dashboard.jsp">Back to Dashboard</a>

<%
   return;  
}
%>

<html>
<head>
<title>Seat Booking</title>
<style>
.seat {
    width: 45px;
    height: 45px;
    border: 2px solid #333;
    margin: 5px;
    display: inline-block;
    text-align: center;
    line-height: 45px;
    border-radius: 5px;
    font-weight: bold;
}
.booked {
    background: red;
    color: white;
}
.free {
    background: lightgreen;
}
</style>
</head>
<body>

<h2>Select Your Seat <%=movie%> (amount=<%=rate%>)</h2>

<form action="BookingServlet" method="post">

    <!-- Hidden values -->
    <input type="hidden" name="movie" value="<%=movie%>">
    <input type="hidden" name="rate" value="<%=rate%>">

<%
String[] rows = {"A","B","C","D","E"};

for(String r : rows){
%>

<h3><%=r%> Row</h3>

<%
    for(int i=1; i<=10; i++){
        String seatId = r+i;
        boolean booked = seats.get(seatId) != null && seats.get(seatId);
%>

<label>
    <div class="seat <%= booked ? "booked" : "free" %>">
        <%= seatId %>
    </div>

    <input type="checkbox"
           name="seats"
           value="<%=seatId%>"
           <%= booked ? "disabled" : "" %>>
</label>

<%
    } 
} 
%>

<br><br>
<button type="submit">Book Selected Seat</button>
</form>
<a href="dashboard.jsp">back to dashboard</a>

</body>
</html>
