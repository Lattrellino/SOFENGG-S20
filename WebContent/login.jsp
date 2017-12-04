<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

 <title>MyLaSalle PC Reservation System</title>

<!--        <link rel="stylesheet" type="text/css" href="css/materialize.css">-->
        <script src="javascript/jquery-3.2.1.min.js"></script>
        <script src="javascript/script.js"></script>
        <link rel="stylesheet" type="text/css" href="css/stylesheet.css">
    </head>

    <body>

        <h1 class="header-text">
            MLS PC Reservation System
        </h1>

        <div class="bg-image">

            <div class="tint">


            </div>

        </div>

        <div class="black-tint-small">

            <p> Welcome to MyLaSalle PC Reservation System for the Learning Commons! 
                <br />
                <br />                
                To begin reserving a PC, please log in by entering your details below: </p>

            <form class="home-input" action="LogInController" method="POST">

                <input type="text" class="text-input" name="id-number" placeholder="ID Number">
                <input type="password" class="text-input" name="password" placeholder="Password">

                <input type="submit" class = "button" value="Log In">
            </form>

        </div>

    </body>
</html>