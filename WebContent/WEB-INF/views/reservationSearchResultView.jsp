<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="_header.jsp"></jsp:include>
	<div class="container">
	<h3>Search Results</h3>
		<table class="table table-striped table-hover" id="reservation">
			<thead>
				<tr>
					<th>Reservation No.</th>
					<th>Date</th>
					<th>FlightNo</th>
					<th>Booking Fare</th>
					<th>Total Fare</th>
					<th>Rep SSN</th>
					<th>Account No.</th>
					<th>First Name</th>
					<th>Last Name</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${reservationList}" var="reservation">
					<tr>
						<td>${reservation.reservationNumber}</td>
						<td>${reservation.reservationDate}</td>
						<td>${reservation.flightNo}</td>
						<td>${reservation.bookingFee}</td>
						<td>${reservation.totalFare}</td>
						<td>${reservation.SSN}</td>
						<td>${reservation.accountNo}</td>
						<td>${reservation.firstName}</td>
						<td>${reservation.lastName}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>