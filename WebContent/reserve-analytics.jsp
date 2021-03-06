<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>MyLaSalle PC Reservation System</title>
        <script src="javascript/jquery-3.2.1.min.js"></script>  
        <script src="javascript/graph.js"></script>
        <script src="javascript/canvasjs.min.js"></script>
        <script src="javascript/script.js"></script>
        <link rel="stylesheet" type="text/css" href="css/stylesheet.css">
    </head>

    <body>

        <section class = "navbar">
            <ul>
                <li id="nav-loggedin"><span>Welcome, ${person.userID} </span></li>
                <span class="divider"> | </span>
                <li><span id="nav-date">Date </span></li>
                <li><span id="nav-time">Time</span></li>
                 <span class="divider"> | </span>
                <li id="logout-button"><a href="index.html">Logout</a></li>
                <li id="site-title"> MLS Admin Analytics</li>
            </ul>
        
        </section>
        
        <div class="bg-image">

            <div class="tint">

            </div>

        </div>
        
        <div class="switchContainer">
			<form action="/sofengg/Admin_Controller" id="view-form" method="POST">
				<input type="submit" class= "rButton" id="remove-submit" value="Reservation">
            </form>
            <form action="/sofengg/analytics" id="view-form" method="POST">
            <input type="submit" class= "aButton" id="remove-submit" value="Analytics">
            </form>
        </div>

        <section class="black-tint-admin">
            <!-- sidebar to choose different details -->
            <section class="sidebar-menu">
                <label class = "chartLabel"> Charts </label>
                <ul class="menu-items">
                    <hr>
                    <li id = "pkChart" onclick="pkcFunction()">Peak Hours</li>
                    <hr>
                    <li id = "mrpChart" onclick="mrpcFunction()">Most Reserved PC</li>
                    <hr>
                    <li id = "mrlChart" onclick="mrlcFunction()">Most Reserved Location</li>
                    <hr>
                </ul>
            </section>
            <!-- sidebar containing Analytics -->
            
            <section class="sidebar-dashboards">
                <div>
                    <select>
                        <option class="eventOpt">Last Day</option>
                        <option>Last Week</option>
                        <option>Last Month</option>
                        <option>Last Term</option>
                    </select>
                    
                    <select class="floorOpt">
                        <option>All floors</option>
                        <option>7th floor</option>
                        <option>8th floor</option>
                        <option>9th floor</option>
                        <option>10th floor</option>
                        <option>11th floor</option>
                        <option>12th floor</option>
                    </select>
                </div>
                <div id="chartContainer"></div>
            </section>
        </section>
    </body>
</html>