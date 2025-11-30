<!DOCTYPE html>
<html>
<head>
    <title>Ticket Booking</title>

    <style>
        body {
            background: #f0f4ff; 
            font-family: Arial;
        }

        h2{
            text-align: center;
            color: #2b3dff;
        }
         h1 {
            text-align: center;
            color: lightblue;
        }

        .box {
            width: 300px;
            margin: 50px auto;
            padding: 25px;
            border: 2px solid #2b3dff;
            border-radius: 10px;
            background: white;
            box-shadow: 0 0 10px #999;
        }

        input[type="text"], input[type="password"] {
            width: 95%;
            padding: 10px;
            margin: 10px 0;
            border: 2px solid #2b3dff;
            border-radius: 5px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background: #2b3dff;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background: #1429c7;
        }
    </style>
</head>

<body>

    <h2>Welcome to Ticket Booking</h2>

    <div class="box">
    <h1>enter user name and password</h1>
        <form action="LoginServlet" method="post">
            UserName : <br>
            <input type="text" name="username" required>

            Password : <br>
            <input type="password" name="password" required>

            <br><br>
            <input type="submit" value="Login">
        </form>
    </div>

</body>
</html>
