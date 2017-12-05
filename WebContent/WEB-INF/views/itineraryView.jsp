<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reservation Itinerary</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/flatly/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+ENW/yibaokMnme+vBLnHMphUYxHs34h9lpdbSLuAwGkOKFRl4C34WkjazBtb7eT"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="_header.jsp"></jsp:include>
	<h2>Trip Itinerary</h2>
	<div class="list-group">
		<c:forEach items="${legList}" var="leg">
			<a href="#" class="list-group-item">
				<h4 class="list-group-item-heading">${leg.depAirportID} to
					${leg.arrAirportID}</h4>
				<p class="list-group-item-text">
				<div class="row">
					<div class="col-xs-6">
						<table class="table table-striped table-hover ">
							<tbody>
								<tr>
									<td><strong>Flight No:</strong></td>
									<td>${leg.flightNo}</td>
								</tr>
								<tr>
									<td><strong>Depart Time:</strong></td>
									<td>${leg.depTime}</td>
								</tr>
								<tr>
									<td><strong>Arrival Time:</strong></td>
									<td>${leg.arrTime}</td>
								</tr>
								<tr>
									<td><strong>Fare Type</strong></td>
									<td>class</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-xs-6">
						<table class="table table-striped table-hover ">
							<tbody>
								<tr>
									<td>${leg.depTime}</td>
								</tr>
								<tr>
									<td>${leg.depAirportID}</td>
								</tr>
								<tr>
									<td>${leg.arrAirportID}</td>
								</tr>
								<tr>
									<td>TRIP TYPE</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>





				</p>
			</a>
		</c:forEach>
	</div>

	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>