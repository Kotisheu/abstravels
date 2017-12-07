<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Current Trips</title>
</head>
<body>

	<jsp:include page="_header.jsp"></jsp:include>

	<div class="list-group container">
		<c:forEach items="${reservationList}" var="reservation">
			<a href="#" class="list-group-item">
				<h4 class="list-group-item-heading">Reservation #:
					${reservation.reservationNumber}</h4>

				<table class="table table-striped table-hover ">
					<thead>
						<tr>
							<th>Account No.</th>
							<th>Reservation Date</th>
							<th>Booking Fee</th>
							<th>Total Fare</th>
						</tr>
					</thead>

					<tr>
						<td>${reservation.accountNo}</td>
						<td>${reservation.reservationDate}</td>
						<td>${reservation.bookingFee}</td>
						<td>${reservation.totalFare}</td>

					</tr>

				</table>
				<form method="POST"
					action="${pageContext.request.contextPath}/CurrentTripServlet"
					class="form-horizontal" role="form">
					<input type="hidden" name="reservationNumber" value= "${reservation.reservationNumber}">
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>

				<div class="btn-group">
					<a href="#" class="btn btn-primary">Edit Trip</a> <a href="#"
						class="btn btn-primary dropdown-toggle" data-toggle="dropdown"
						aria-expanded="false"><span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">Cancel Reservation</a></li>
					</ul>
				</div>

			</a>
		</c:forEach>
	</div>


	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>