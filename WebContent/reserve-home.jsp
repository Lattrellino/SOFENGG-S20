<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.*" %>
<%@ page import="controller.Database" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>MyLaSalle PC Reservation System</title>
        
        <script
        src="http://code.jquery.com/jquery-3.2.1.js"
        integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
        crossorigin="anonymous"></script>

        <script src="javascript/jquery-3.2.1.min.js"></script>

        <script src="javascript/script.js"></script>

        <link rel="stylesheet" type="text/css" href="css/stylesheet.css">
    </head>

    <body>

        <section class = "navbar">
            <ul>
                <li id="nav-loggedin"><span>Welcome, ${person.getUserID()} </span></li>
                <span class="divider"> | </span>
                <li><span id="nav-date">Date </span></li>
                <li><span id="nav-time"><script type="text/javascript"></script></span></li>
                 <span class="divider"> | </span>
                <li id="logout-button"><a href="index.html">Logout</a></li>
<!--                <li> MLS PC Reservation System</li>-->
            </ul>
        
        </section>
        
         <h1 class="header-text">
            MLS PC Reservation System
        </h1>
        
        <div class="bg-image">

            <div class="tint">

            </div>

        </div>

        <section class="black-tint">

            <!-- sidebar to choose resrvation details -->

            <section class="left-sidebar">

                <!-- dropdown to select the floor -->

                <select class="place-dropdown" name="Place"> 
                    <option value = "7th-Floor"> 7th Floor</option>
                    <option value = "8th-Floor"> 8th Floor</option>
                    <option value = "9th-Floor"> 9th Floor</option>
                    <option value = "10th-Floor"> 10th Floor</option>
                    <option value = "11th-Floor"> 11th Floor</option>
                    <option value = "12th-Floor"> 12th Floor</option>
                </select>

                <!-- calendar -->
                <div class="calendar-container">

                    <div class="month"> 
                        <ul>
                            <li id="prev-month">&#10094;</li>
                            <li id="next-month">&#10095;</li>
                            <li id = "month-name"> August </li>
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
                    
                    <!-- TODO Complete form action -->
					<FORM ACTION="/sofengg/Admin_Controller" METHOD="post" name = "reserve-form" id = "reserve-form">
					
					</FORM>
                    <button id = "submit_button"> RESERVE </button>
                    <FORM ACTION="/sofengg/Admin_Controller" METHOD="post" name = "edit-form" id = "edit-form">
					
					</FORM>
					<button id = "edit_button"> EDIT </button>
                </div>

            </section>

            <!-- sidebart containing PC information -->

            <section class="right-sidebar">
                <table class = "pc-info">

                    <!-- row containing time -->

                    <tr class="time-header">
                        <th></th>
                        <td>07:00 AM</td>
                        <td>08:00 AM</td>
                        <td>09:00 AM</td>
                        <td>10:00 AM</td>
                        <td>11:00 AM</td>
                        <td>12:00 PM</td>
                        <td>01:00 PM</td>
                        <td>02:00 PM</td>
                        <td>03:00 PM</td>
                        <td>04:00 PM</td>
                        <td>05:00 PM</td>
                        <td>06:00 PM</td>
                        <td>07:00 PM</td>
                        <td>08:00 PM</td>
                        <td>09:00 PM</td>
                        <td>10:00 PM</td>
                    </tr>

					
						<c:forEach var="pc" items="${pcs}" varStatus="pcloop">
							<tr> 
								<td>${pc.pcNo}</td>
								<c:forEach begin="0" end="15" step="1" varStatus="loop">
									<c:choose>
	    								<c:when test="${avail[pcloop.index][loop.index]}">
											<td class="available-pc"><p class = "hidden">${pcloop.index + 1}|${loop.index + 7}0000</p></td>
										</c:when>
										<c:otherwise>
											<td class="reserved-pc"><p class = "hidden">${pcloop.index + 1}|${loop.index + 7}0000</p> </td>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</tr>	
						</c:forEach>
					

					<!--  
					<tr>
                        <td>01</td>
                        <td class="available-pc"> </td>
                        <td class="available-pc"> </td>
                        <td class="available-pc"> </td>
                        <td class="available-pc"> </td>
                        <td class="available-pc"> </td>
                        <td class="available-pc"> </td>
                        <td class="available-pc"> </td>
                        <td class="available-pc"> </td>
                        <td class="available-pc"> </td>
                        <td class="available-pc"> </td>
                        <td class="available-pc"> </td>
                        <td class="available-pc"> </td>
                        <td class="reserved-pc"> </td>
                        <td class="available-pc"> </td>
                        <td class="available-pc"> </td>
                        <td class="available-pc"> </td>
                    </tr>
                    -->
                    

                </table>

                <div class="legend">
                    <span> Legend: </span>

                    <table class="legend-table">

                        <tr class = "legend-tr">  
                            <td class="available-pc"> </td>
                            <td class="legend-td"> Available </td>
                        </tr>

                        <tr class = "legend-tr">  
                            <td class="reserved-pc"> </td>
                            <td class="legend-td"> Reserved </td>
                        </tr>

                        <tr class = "legend-tr"> 
                            <td class="unavailable-pc"> </td>
                            <td class="legend-td">Under Repair</td>
                        </tr>

                    </table>
                </div>
            </section>
        </section>
        <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
   			<form action="/sofengg/view" method="POST">	
                <input type="text" name="view-floor" placeholder="view-floor">
                <input type="text" name="view-date" placeholder="view-date">
                <input type="submit" class = "button" value="View">
   		 	</form>
   		 	
    		<form action="/sofengg/reserve" method="POST">
                <input type="text" name="reserve-pcno" placeholder="reserve-pcno">
                <input type="text" name="reserve-time" placeholder="reserve-time">
                <input type="submit" class = "button" value="reserve">
    		</form>

    		<form action="/sofengg/remove" method="POST">
                <input type="text" name="remove-pcno" placeholder="remove-pcno">
                <input type="text" name="remove-time" placeholder="remove-time">
                <input type="submit" class = "button" value="remove">
    		</form>
    </body>
</html>
