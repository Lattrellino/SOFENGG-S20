<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.*"%>
<%@ page import="controller.Database"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>MyLaSalle PC Reservation System</title>

        <script src="<c:url value='javascript/jquery-3.2.1.min.js' />"></script>
        <script src="<c:url value='javascript/script.js' />"></script>
        <!-- 
        <script src="<c:url value='javascript/script.js' />"></script>
		<link type="text/css" rel="stylesheet" href="<c:url value='css/stylesheet.css' />" />
         -->

        
		
		<style>
			@font-face {
			    font-family: Gravity;
			    src: url('../media/Gravity-Regular.otf');
			}
			
			body, html{
			    font-family: Gravity;
			}
			
			h1 {
			    text-align: center;
			    vertical-align: middle;
			    font-size: 250%;
			    margin-top: 2%;
			    color: darkgreen;
			    text-shadow: 3px 3px 0px rgba(0,0,0,0.2);
			    letter-spacing: 4pt;
			    text-decoration: bold;
			}
			
			a {
			    text-decoration: none;
			}
			
			select {
			    width: 250px;
			    padding: 5px;
			    margin: 5px;
			}
			
			section {
			    display: flex;
			}
			
			/*********** Background CSS ***********/
			
			.bg-image{
			    position: fixed; 
			    top: 0; 
			    left: 0; 
			    background-image: url('../media/IMG_6549.JPG');
			    height: 100%;
			    width: 100%;    
			    background-size: cover;
			    z-index: -1;
			}
			
			.tint {
			    z-index: 1;
			    height: 100%;
			    width: 100%;
			    position: fixed;
			    top: 0px;
			    left: 0px;
			    background-image: linear-gradient(180deg, rgba(245, 247, 250, 0.85) 0%, rgba(195, 207, 226, 0.85) 100%); 
			}
			
			.black-tint-small {
			    z-index: 2;
			    height: 60%;
			    width: 100%;
			    position: fixed;
			    top: 15%;
			    left: 0px;
			    background: rgba(0, 0, 0, .24);    
			}
			
			.black-tint-small > p {
			    color: white;
			    font-size: 20pt;
			    margin: 2%;
			    text-align: center;
			    text-shadow: 2px 2px 0px rgba(0,0,0,0.2);
			}
			
			.black-tint {
			    z-index: 2;
			    height: 94.5%;
			    width: 100%;
			    position: fixed;
			    top: 5.5%;
			    left: 0px;
			    background: rgba(0, 0, 0, .24);    
			}
			
			.black-tint > p {
			    color: white;
			    font-size: 20pt;
			    margin: 2%;
			    text-align: center;
			    text-shadow: 2px 2px 0px rgba(0,0,0,0.2);
			}
			
			/*********** Log In Screen CSS ***********/
			
			.home-input {
			    vertical-align: middle;
			    padding: 15px;
			    position: absolute;
			    top: 55%;
			    left: 50%;
			    transform: translate(-50%, -50%);
			    background-color: rgba(0, 0, 0, 0.15);
			    /*    border-radius: 5px;*/
			    border-style: hidden;
			}
			
			.text-input {
			    display: block;
			    margin-bottom: 5%;
			    font-size: 20pt;
			    /*    border-radius: 5px;*/
			    /*    border-style: hidden;*/
			    box-shadow: 2px 2px 0px 0px rgba(0,0,0,0.25);
			}
			
			.button {
			    /*    border-radius: 5px;*/
			    color: white;
			    font-size: 20px;
			    background-color: darkgreen;
			    border-style: hidden;
			    padding: 10px 20px 10px 20px;
			    box-shadow: 2px 2px 0px 0px rgba(0,0,0,0.20);
			    transition: ease .5s;
			    outline: none;
			}
			
			.button:hover {
			    color: aliceblue;
			    background-color: #009dff;
			    cursor: pointer;
			}
			
			
			/*********** Home Screen/PC Reservation Screen CSS ***********/
			
			/* DIV that contains place dropwdown and calendar */
			
			.right-sidebar {
			    position: relative;
			    width: auto;
			    height: inherit;
			    align-content: center;
			    display: inline-block;
			    margin: 1%;  
			}
			
			/* DIV that contains place dropwdown and calendar */
			
			.left-sidebar{
			    position: relative;
			    width: 30%;
			    height: inherit;
			    align-content: center;
			    display:inline-block;
			    margin: 1%;
			}
			
			.left-sidebar > h2 {
			    margin-bottom: 1%;
			    margin-top: 1%;
			}
			
			.place-dropdown{
			    margin: 0;
			    position: relative;
			    width: 100%;
			}
			
			.navbar {
			    background: black;
			    position: fixed;
			    top: 0;
			    left: 0;
			    width: 100%;
			    cursor:default;
			    z-index: 1;
			}
			
			.navbar ul {
			    list-style-type: none;
			    margin: 0;
			    padding: 0;
			    overflow: hidden;
			    background-color: black;
			}
			
			.navbar li {
			    display: inline-block;
			    margin-right: 10px;
			    color: white;
			}
			
			
			.navbar li a {
			    display: inline-block;
			    color: white;
			    text-align: center;
			    padding: 14px 16px;
			    text-decoration: none;
			    transition: ease .5s;
			}
			
			.navbar span {
			    display: inline-block;
			    color: white;
			    text-align: center;
			    padding: 10px 5px;
			    text-decoration: none;
			}3
			
			
			/*********** Current Booking Thing CSS ***********/
			
			.current-bookings {
			    margin-top: 10px;
			    padding: 2%;
			    width: 90%;
			    height: 40%;
			    border: 1px solid gray;
			    background-color: rgba(255,255,255,0.3);
			    overflow-x: hidden;
			    overflow-y: scroll;
			}
			
			.current-bookings > span {
			    font-weight: bold;
			}
			
			.current-bookings > div{
			    display: block;
			    font-size: 15px;
			    cursor: pointer;
			    background-color: rgba(255, 255, 255, 0.50);
			    margin: 2%;
			    padding: 3%;
			    transition: 0.5s ease-in;
			}
			
			.current-booking-links {
			    color: dodgerblue;
			    cursor: pointer;
			}
			
			.current-booking-links > span{
			    position: relative;
			    left: 60%;
			    text-decoration: underline;
			    margin-right: 3%;
			}
			
			.current-booking-links > span:hover{
			    color: darkslategray;
			}
			
			
			#logout-button:hover a {
			    cursor: pointer;
			    /*    background-color: rgba(0, 177, 255, 0.46);*/
			    color: rgba(0, 177, 255, 1);
			}
			
			/*********** Left Sidebar CSS ***********/
			
			/* Calendar container */
			
			.calendar-container {
			    background-color: white;
			    align-items: center;
			    margin-top: 2%
			}
			
			/*********** Calendar CSS ***********/
			
			ul {
			    list-style-type: none;
			}
			
			/* Month header */
			.month {
			    padding: 10px 10px;
			    background: #195d00;
			    text-align: center;
			    font-size: 10%;
			}
			
			/* Month list */
			.month ul {
			    margin: 0;
			    padding: 0;
			}
			
			.month ul li {
			    color: white;
			    font-size: 15px;
			    text-transform: uppercase;
			    letter-spacing: 3px;
			    cursor: pointer;
			}
			
			/* Previous month */
			#prev-month {
			    float: left;
			    padding-left: 2px;
			    padding-bottom: 2px;
			    cursor: pointer;
			    display: inline-block;
			}
			
			#prev-month:hover{
			    background-color: gray;
			}
			
			/* Next button */
			#next-month {
			    float: right;
			    padding-left: 2px;
			    padding-bottom: 2px;
			    cursor: pointer;
			}
			
			#next-month:hover{
			    background-color: gray;
			}
			
			/* Weekdays (Mon-Sun) */
			.weekdays {
			    margin: 0;
			    padding: 2px 2px;
			    background-color:#ddd;
			    font-size: 88%;
			
			}
			
			.weekdays li {
			    display: inline-block;
			    width: 13%;
			    color: #666;
			    text-align: center;
			}
			
			/* Days (1-31) */
			#days {
			    padding: 8px 0;
			    background: #eee;
			    margin: 0;
			    cursor: pointer;
			}
			
			.day {
			
			}
			
			#days li {
			    list-style-type: none;
			    display: inline-block;
			    width: 13.6%;
			    text-align: center;
			    margin-bottom: 5px;
			    font-size:12px;
			    color:#777;
			
			}
			
			.hidden {
			    display:none;
			}
			
			#current-day{
			    background-color: rgba(0, 177, 255, 0.46);
			    color: white !important;
			}
			
			#current-day-inactive{
			    background-color: gray;
			    color: white !important;
			}
			
			#year {
			    color: white;
			    font-size: 15px;
			    text-transform: uppercase;
			    letter-spacing: 3px;
			    text-align: center;
			}
			
			#submit_button {
			    color: white;
			    font-size: 20px;
			    background-color: darkgreen;
			    border-style: hidden;
			    padding: 10px 20px 10px 20px;
			    outline: none;
			    margin-top: 1%;
			    width: 20%;
			    position: relative;
			    left: 80%;
			    cursor: pointer;
			}
			
			#cancel_button {
			    color: white;
			    font-size: 20px;
			    background-color: firebrick;
			    border-style: hidden;
			    padding: 10px 20px 10px 20px;
			    outline: none;
			    margin-top: 1%;
			    width: 20%;
			    position: relative;
			    left: 80%;
			    cursor: pointer;
			}
			
			
			/*********** PC Details Table CSS ***********/
			
			table {
			    background-color: white;
			}
			
			
			td {
			    padding: 0.7%;
			    text-align: center;
			}
			
			.reserved-pc {
			    background-color: firebrick;
			}
			
			.available-pc {
			    background-color: green;
			
			}
			.available-pc:hover {
			    cursor: pointer;
			}
			
			.unavailable-pc {
			    color: white !important;
			    background-color: dimgray;
			}
			
			.selected-pc {
			    background-color: rgba(0, 177, 255, 0.46);
			    color: white !important;
			}
			
			/*********** Legend CSS ***********/
			
			.legend {
			    margin-top: 10px;
			    padding: 1%;
			    width: 52%;
			    border: 1px solid gray;
			    background-color: rgba(255,255,255,0.3);
			}
			
			.legend-table {
			    text-align: left;
			    background-color: transparent;
			    width: 100%;
			}
			
			.legend-td {
			    text-align: left;
			    margin: 1%;
			    padding: 2%;
			    width: 3%;
			}
			
			.booking-details{ 
			    margin-top: 10px;
			    padding: 1%;
			    width: 97.9%;
			    border: 1px solid gray;
			    background-color: rgba(255,255,255,0.3);
			}
			
			.booking-details p {
			    display: inline-flex;
			}
			
			.booking-details input {
			    display: inline-flex;
			    margin: 1%;
			}
			
			#reserve-button {
			    display: block;
			    position: relative;
			    left: 10%;
			}
			
			
			/*********** Admin Analytics Screen CSS ***********/
			
			.black-tint-admin {
			    z-index: 2;
			    height: 80%;
			    width: 100%;
			    position: fixed;
			    top: 15%;
			    left: 0px;
			    background: rgba(0, 0, 0, .24);    
			}
			
			.sidebar-menu{
			    position: relative;
			    width: 15%;
			    height: inherit;
			    margin-top: 30px;
			    display: inline-block;
			    background: darkgreen;
			    border-color: whitesmoke;
			    border-width: 3px;
			    border-top-style: solid;
			    border-right-style: solid;
			    border-bottom-style: solid;
			    border-radius: 5px;
			}
			
			.chartLabel{
			    color: aliceblue;
			    font-weight: bold;
			    text-align: center;
			    display: block;
			    margin: 15px;
			    font-size: 25px;
			}
			
			.menu-items{
			    list-style: none;
			    padding-left: 0px;
			    margin-left: 0px;
			}
			
			.menu-items li{
			    color: aliceblue;
			    margin-left: 35px;
			}
			
			.menu-items li:hover{
			    color: rgba(0, 177, 255, 1);
			    cursor: pointer;
			}
			
			.sidebar-dashboards{
			    position: relative;
			    width: 100%;
			    height: 100%;
			    align-content: center;
			    display: inline-block;
			    margin-top:30px;
			    margin-left: 50px;
			}
			
			#chartContainer{
			    width:90%; 
			    height:80%
			}
			
			#view-button {
			    visibility: hidden;
			    height: 1px;
			}
		</style>
    </head>

    <body>

        <section class="navbar">
            <ul>
                <li id="nav-loggedin">Welcome<span id="id-num">${person.userID} </span></li>
                <span class="divider"> | </span>
                <li><span id="nav-date"><c:choose>
					    <c:when test="${empty date}">
					        ${currdate}
					    </c:when>
					    <c:otherwise>
					        ${date}
					    </c:otherwise>
					</c:choose> 
				</span></li>
                <li><span id="nav-time"><script type="text/javascript"></script></span></li>
                <span class="divider"> | </span>
                <li id="logout-button"><a href="index.html">Logout</a></li>
                <li id="site-title"> MLS PC Reservation System</li>
            </ul>

        </section>

        <div class="bg-image">

            <div class="tint"></div>

        </div>

        <section class="black-tint"> <!-- sidebar to choose resrvation details -->

            <section class="left-sidebar"> <!-- dropdown to select the floor -->

                <h2 id="chosen-date">
                <c:choose>
					    <c:when test="${empty date}">
					        ${currdate}
					    </c:when>
					    <c:otherwise>
					        ${date}
					    </c:otherwise>
				</c:choose>
				</h2>

                <form action="/sofengg/view" id="view-form" method="POST">

                    <input type="hidden" name="view-floor" id="view-floor" value="7">
                    <input type="hidden" name="view-date" id="view-date" value=" ">
                    <input type="submit" class = "button" id="view-button" value="View">
                </form>

                <select id="place-dropdown" name="Place">
               		<option> Select floor</option>
                    <option value="7"> 7th Floor</option>
                    <option value="8"> 8th Floor</option>
                    <option value="9"> 9th Floor</option>
                    <option value="10"> 10th Floor</option>
                    <option value="11"> 11th Floor</option>
                    <option value="12"> 12th Floor</option>
                </select> 

                <!-- calendar -->

                <div class="calendar-container">

                    <div class="month">
                        <ul>
                            <li id="prev-month">&#10094;</li>
                            <li id="next-month">&#10095;</li>
                            <li id="month-name">August</li>
                            <span id="year">2017</span>
                        </ul>
                    </div>

                    <ul class="weekdays">
                        <li>Sun</li>
                        <li>Mon</li>
                        <li>Tues</li>
                        <li>Wed</li>
                        <li>Thurs</li>
                        <li>Fri</li>
                        <li>Sat</li>
                    </ul>

                    <ul id="days">
                    
                    </ul>

                </div>
                <!-- TODO Complete form action -->
                <span> Current Booking(s): </span>

                <div class="current-bookings">     
                <c:forEach var="log" items="${logs}" varStatus="logloop">
                        <div class="details">
                            
                            <div class="booked-date" id="${log.date}">${log.date}</div>
                            <div class="booked-time" id="${log.time}">${log.time}</div>
                            <div class="booked-pcno" id="01"> PC # ${log.pcNo}</div>
                        </div>
                    </c:forEach>

                </div>
                

                <div class="legend">
                    <span> Legend: </span>

                    <table class="legend-table">

                        <tr class="legend-tr">
                            <td class="available-pc"></td>
                            <td class="legend-td">Available</td>
                        </tr>

                        <tr class="legend-tr">
                            <td class="reserved-pc"></td>
                            <td class="legend-td">Reserved</td>
                        </tr>

                        <tr class="legend-tr">
                            <td class="unavailable-pc"></td>
                            <td class="legend-td">Under Repair</td>
                        </tr>

                    </table>
                </div>

            </section> <!-- sidebar containing PC information --> 
            <section class="right-sidebar">
                <table class="pc-info">
                    <!-- row containing time -->

                    <tr class="time-header">
                        <th></th>
                        <td class="booking-time">07:00 AM</td>
                        <td class="booking-time">08:00 AM</td>
                        <td class="booking-time">09:00 AM</td>
                        <td class="booking-time">10:00 AM</td>
                        <td class="booking-time">11:00 AM</td>
                        <td class="booking-time">12:00 PM</td>
                        <td class="booking-time">01:00 PM</td>
                        <td class="booking-time">02:00 PM</td>
                        <td class="booking-time">03:00 PM</td>
                        <td class="booking-time">04:00 PM</td>
                        <td class="booking-time">05:00 PM</td>
                        <td class="booking-time">06:00 PM</td>
                        <td class="booking-time">07:00 PM</td>
                        <td class="booking-time">08:00 PM</td>
                    </tr>
					
					
					<c:forEach var="pc" items="${pcs}" varStatus="pcloop">
							<tr> 
								<td class="pc-number">
                            		<input type="hidden" class="pcnum" value="${pc.pcNo}">${pc.pcNo}
                        		</td>
								<c:forEach begin="0" end="13" step="1" varStatus="loop">
									<c:choose>
	    								<c:when test="${avail[pcloop.index][loop.index]}">
											<td class="available-pc">
												 <input type="hidden" class="time" value="${loop.index + 7}:00:00">
											</td>
										</c:when>
										<c:otherwise>
											<td class="reserved-pc">
												<input type="hidden" class="time" value="${loop.index + 7}:00:00">
											</td>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</tr>	
						</c:forEach>       
                </table>

                <div class="booking-details">
                    <form action="/sofengg/reserve" method="POST">
                        <p> PC Number: </p>
                        <input type="text" name="reserve-pcno" placeholder="reserve-pcno" id="reserve-pcno" readonly="readonly">
                        <p> Time: </p>
                        <input type="text" name="reserve-time" placeholder="reserve-time" id="reserve-time" readonly="readonly">
                        <input type="submit" class = "button" id="reserve-button" value="Reserve">
                    </form>
                </div>
				<div class="booking-details">    
                Cancel Reservation: 
	                <form action="/sofengg/remove" method="POST" id="remove-form">
	                        <p>PC No: </p><input type="text" name="remove-pcno" id="remove-pcno" placeholder="">
	                        <p>Time: </p><input type="text" name="remove-time" id="remove-time" placeholder="HR:00:00">
	                        <p>Date: </p><input type="text" name="remove-date" id="remove-date" placeholder="yyyy-MM-dd">
	                        <input type="submit" class= "button" id="remove-submit" value="Delete">
	                        
	                </form>
                </div>
            </section>


        </section>
    </body>
</html>
