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
		<h3>Flight #: ${airlineId} ${flightNo} RevenueReport</h3>

		<div class="list-group">
			<c:forEach items="${reservationList}" var="reservation">
				<a href="#" class="list-group-item">
					<h4 class="list-group-item-heading">Reservation #: ${reservation.reservationNumber}</h4>
					<table class="table table-striped table-hover" id="reservation">
						<thead>
							<tr>
								<th>Total Fare</th>
								<th>Booking Fare</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${reservation.totalFare}</td>
								<td>${reservation.bookingFee}</td>
							</tr>

						</tbody>
					</table>
				</a>
			</c:forEach>
		</div>

	</div>
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>