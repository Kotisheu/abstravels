<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link
	href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/flatly/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+ENW/yibaokMnme+vBLnHMphUYxHs34h9lpdbSLuAwGkOKFRl4C34WkjazBtb7eT"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Current Trips</title>
</head>
<body>

	<jsp:include page="_header.jsp"></jsp:include>

	<h2>Current Reservations</h2>
	<table class="table table-striped table-hover ">
		<thead>
			<tr>
				<th>Reservation No.</th>
				<th>Reservation Date</th>
				<th>Booking Fee</th>
				<th>Total Fare</th>
				<th>Account No.</th>
			</tr>
		</thead>
		<c:forEach items="${reservationList}" var="reservation">
			<tr>
				<td>${reservation.reservationNumber}</td>
				<td>${reservation.reservationDate}</td>
				<td>${reservation.bookingFee}</td>
				<td>${reservation.totalFare}</td>
				<td>${reservation.accountNo}</td>
			</tr>
		</c:forEach>
	</table>

	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>