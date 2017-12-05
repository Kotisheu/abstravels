<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/flatly/bootstrap.min.css" rel="stylesheet" integrity="sha384-+ENW/yibaokMnme+vBLnHMphUYxHs34h9lpdbSLuAwGkOKFRl4C34WkjazBtb7eT" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Customer Information</title>
</head>
<body>
 <jsp:include page="_header.jsp"></jsp:include>
  <!-- <center> <jsp:include page="_menu.jsp"></jsp:include>-->
    <%
    	String username= (String) session.getAttribute("userName");
    	if (username == null) {
    %>
    	<h3>Please login in view customer information</h3>
	<% } else {
	%>  

<h2>Reservations</h2>
   <p style="color: red;">${errorString}</p>

   <table class="table table-striped table-hover " >
   <thead>
      <tr>
         <th>Reservation No.</th>
         <th>Reservation Date</th>
         <th>Booking Fee</th>
         <th>Total Fare</th>
         <th>Account No.</th>
      </tr>
      </thead>
      <c:forEach items="${reservationList}" var="reservation" >
         <tr>
            <td>${reservation.reservationNumber}</td>
            <td>${reservation.reservationDate}</td>
            <td>${reservation.bookingFee}</td>
            <td>${reservation.totalFare}</td>
            <td>${reservation.accountNo}</td>
         </tr>
      </c:forEach>
   </table>

<h2>Bid History</h2>
 <table class="table table-striped table-hover " >
   <thead>
      <tr>
         <th>Airline ID</th>
         <th>Flight No</th>
         <th>Class</th>
         <th>Date</th>
         <th>Bid Price</th>
      </tr>
      </thead>
      <c:forEach items="${bidHistoryList}" var="bids" >
         <tr>
            <td>${bids.airlineID}</td>
            <td>${bids.flightNo}</td>
            <td>${bids.flightClass}</td>
            <td>${bids.date}</td>
            <td>${bids.accountNo}</td>
         </tr>
      </c:forEach>
   </table>
   <% }%>

   <jsp:include page="_footer.jsp"></jsp:include> 
   
</body>
</html>