<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="model.*"%>
        <%@ page import="controller.Database"%>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

                <html>
                    <head>
                        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
                        <title>MyLaSalle PC Reservation System</title>

                        <script src="javascript/jquery-3.2.1.min.js"></script>

                        <script src="javascript/script.js"></script>

                        <link rel="stylesheet" type="text/css" href="css/stylesheet.css">
                    </head>

                    <body>

                        <section class="navbar">
                            <ul>
                                <li id="nav-loggedin">Welcome<span id="id-num">[id num nung naka login] </span></li>
                                <span class="divider"> | </span>
                                <li><span id="nav-date">Date </span></li>
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

                                <h2 id="chosen-date"> Chosen Date</h2>

                                <select id="place-dropdown" name="Place">
                                    <option value="7th-Floor"> 7th Floor</option>
                                    <option value="8th-Floor"> 8th Floor</option>
                                    <option value="9th-Floor"> 9th Floor</option>
                                    <option value="10th-Floor"> 10th Floor</option>
                                    <option value="11th-Floor"> 11th Floor</option>
                                    <option value="12th-Floor"> 12th Floor</option>
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

                                    <!-- If wala pang PC na na-reserve: -->
                                    <div id="no-pc"> No PCs reserved for today.</div>
                                    <!-- FORMAT -->
                                    <!--                    <div class="details">



<div id="booked-time">08:00AM - 09:00AM</div>
<div id="booked-pc-num"> PC # 01</div>
</div>
-->

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
                                    <form class = "pc-booking-info">

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
                                                <td class="booking-time">${pc.pcNo}</td>
                                                <c:forEach begin="0" end="15" step="1" varStatus="loop">
                                                    <c:choose>
                                                        <c:when test="${avail[pcloop.index][loop.index]}">
                                                            <td class="available-pc"><p class="hidden">${pcloop.index + 1}|${loop.index + 7}0000</p></td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td class="reserved-pc"></td>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </tr>
                                        </c:forEach>

                                    </form>
                                </table>

                            </section> 
                        </section>
                    </body>
                </html>