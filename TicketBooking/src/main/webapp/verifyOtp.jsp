<%@ page import="java.util.*, jakarta.servlet.http.HttpSession" %>
<%
HttpSession session1 = request.getSession(false);
if (session1 == null || session1.getAttribute("otp") == null) {
    out.println("Session expired. Start booking again.");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Verify OTP</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 350px;
            margin: 80px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            text-align: center;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0 20px 0;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 16px;
        }
        button {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        .message {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Enter OTP</h2>

    <form action="VerifyOtpServlet" method="post">
        <input type="text" name="otpInput" placeholder="Enter 4-digit OTP" required>
        <button type="submit">Verify OTP</button>
    </form>
</div>

</body>
</html>
