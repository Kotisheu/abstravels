<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <title>Flight List</title>
 </head>
 <body>
 
    <jsp:include page="_header.jsp"></jsp:include>
   
 
    <h3>Flight List</h3>
 
    <p style="color: red;">${errorString}<br>
    ****WORK IN PROGRESS****</p>

 
 <table border="1" cellpadding="10" cellspacing="5" >
       <tr>
          <th>Airline</th>
          <th>FlightNo</th>
          <th>LegNo</th>
          <th>Departure Airport</th>
          <th>Departure Date</th>
          <th>Departure Time</th>
          <th>Arrival Airport</th>
          <th>Arrival Date</th>
          <th>Arrival Time</th>
          <th>Seat Available</th>
          <th>Total Seats</th>
          <th>Price</th>
          <th>View</th>
     
       </tr>
       <c:forEach items="${flightList}" var="flightEntry" >
          <tr>
             <td>${flightEntry.flight.airlineID}</td>
             <td>${flightEntry.flight.flightNo}</td>
             <td>${flightEntry.legNo}</td>
             <td>${flightEntry.depAirport}</td>
             <td>${flightEntry.day}</td>
             <td>${flightEntry.depTime}</td>
             <td>${flightEntry.arrAirport}</td>
             <td>${flightEntry.day}</td>
             <td>${flightEntry.arrTime}</td>
             <td>${flightEntry.noSeats}</td>
             <td>${flightEntry.flight.noSeats}</td>
             <td>${flightEntry.price}</td>
             <td>
                <a href="${pageContext.request.contextPath}/viewFlight?airlineID=${flightEntry.flight.airlineID}&flightNo=${flightEntry.flight.flightNo}">Book Flight</a>
             </td>
          </tr>
       </c:forEach>
    </table>

 
    <jsp:include page="_footer.jsp"></jsp:include>
 
 </body>
</html>