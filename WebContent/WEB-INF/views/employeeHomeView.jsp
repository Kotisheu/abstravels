<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Home</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function($) {
		$(".clickable-row").click(function() {
			var name = $(this).children('td.name').text();
			var nameArr = name.split(", ");

			var firstName = document.getElementById('firstName');
			var lastName = document.getElementById('lastName');
			var address = document.getElementById('address');
			var city = document.getElementById('city');
			var state = document.getElementById('state');
			var zip = document.getElementById('zip');
			var ccNo = document.getElementById('ccNo');
			var email = document.getElementById('email');
			var phone = document.getElementById('phoneNum');
			var phone = document.getElementById('customerId');

			firstName.value = (nameArr[1]);
			lastName.value = (nameArr[0]);
			address.value = ($(this).children('td.address').text());
			city.value = ($(this).children('td.city').text());
			state.value = ($(this).children('td.state').text());
			zip.value = ($(this).children('td.zip').text());
			ccNo.value = ($(this).children('td.ccNo').text());
			email.value = ($(this).children('td.email').text());
			phoneNum.value = ($(this).children('td.phone').text());
			customerId.value = ($(this).children('td.id').text());

			console.log(name);

			$("#myModal").modal("show");
		});

		$(".employee-clickable-row").click(function() {
			var name = $(this).children('td.name').text();
			var nameArr = name.split(", ");

			var efirstName = document.getElementById('efirstName');
			var elastName = document.getElementById('elastName');
			var eaddress = document.getElementById('eaddress');
			var ecity = document.getElementById('ecity');
			var estate = document.getElementById('estate');
			var ezip = document.getElementById('ezip');
			var eSSN = document.getElementById('essn');
			var start = document.getElementById('start');
			var hourly = document.getElementById('hourly');
			var manager = document.getElementById('manager');
			var employeeId = document.getElementById('employeeId')

			efirstName.value = (nameArr[1]);
			elastName.value = (nameArr[0]);
			eaddress.value = ($(this).children('td.address').text());
			ecity.value = ($(this).children('td.city').text());
			estate.value = ($(this).children('td.state').text());
			ezip.value = ($(this).children('td.zip').text());
			eSSN.value = ($(this).children('td.ssn').text());
			start.value = ($(this).children('td.start').text());
			hourly.value = ($(this).children('td.hourly').text());
			manager.value = ($(this).children('td.manager').text());
			employeeId.value = ($(this).children('td.id').text());

			console.log(name);

			$("#editEmployeeModal").modal("show");
		});
	});
</script>
</head>
<body>

	<jsp:include page="_header.jsp"></jsp:include>
	<div class="container">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#home" data-toggle="tab"
				aria-expanded="true">Quick Tools</a></li>
			<li class=""><a href="#allCustomerInfo" data-toggle="tab"
				aria-expanded="true">Customer</a></li>
			<li class=""><a href="#mailingList" data-toggle="tab"
				aria-expanded="true">Mailing List</a></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#" aria-expanded="false">Revenue <span
					class="caret"></span>
			</a>
				<ul class="dropdown-menu">
					<li><a href="#revDropdown1" data-toggle="tab">Search by
							Flight</a></li>

					<li><a href="#revDropdown2" data-toggle="tab">Search by
							Destination</a></li>

					<li><a href="#revDropdown3" data-toggle="tab">Search by
							Customer</a></li>
				</ul></li>

			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#" aria-expanded="false">Reservation
					<span class="caret"></span>
			</a>
				<ul class="dropdown-menu">
					<li><a href="#resrDropdown1" data-toggle="tab">Search by
							Flight</a></li>

					<li><a href="#resrDropdown2" data-toggle="tab">Search by
							Customers</a></li>
				</ul></li>

			<li class=""><a href="#airport" data-toggle="tab"
				aria-expanded="true">Airport</a></li>
			<li class=""><a href="#flights" data-toggle="tab"
				aria-expanded="true">Flights</a></li>
			<li class=""><a href="#employee" data-toggle="tab"
				aria-expanded="true">Employee</a></li>
		</ul>
		<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade active in" id="home">
				<p>Raw denim you probably haven't heard of them jean shorts
					Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse.
					Mustache cliche tempor, williamsburg carles vegan helvetica.
					Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby
					sweater eu banh mi, qui irure terry richardson ex squid. Aliquip
					placeat salvia cillum iphone. Seitan aliquip quis cardigan american
					apparel, butcher voluptate nisi qui.</p>
			</div>
			<div class="tab-pane fade" id="allCustomerInfo">
				<p>Click on the row to edit customer information</p>
				<form class="" role="search">
					<div class="form-group">
						<input type="text" id="customerName" onkeyup="customerSearch()"
							class="form-control" placeholder="Search by name...">
					</div>
				</form>
				<table class="table table-striped table-hover" id="customerTable">
					<thead>
						<tr>
							<th>Id</th>
							<th>Account No.</th>
							<th>Creation Date</th>
							<th>Name</th>
							<th>Address</th>
							<th>City</th>
							<th>State</th>
							<th>Zip</th>
							<th>Credit Card</th>
							<th>Email</th>
							<th>Phone</th>
							<th>Rating</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${customerList}" var="customer">
							<tr class="clickable-row" data-target="#myModal">
								<td class="id">${customer.id}</td>
								<td class="accountNo">${customer.accountNo}</td>
								<td class="creation">${customer.creationDate}</td>
								<td class="name">${customer.lastName},
									${customer.firstName}</td>
								<td class="address">${customer.address}</td>
								<td class="city">${customer.city}</td>
								<td class="state">${customer.state}</td>
								<td class="zip">${customer.zipcode}</td>
								<td class="ccNo">${customer.ccNo}</td>
								<td class="email">${customer.email}</td>
								<td class="phone">${customer.phoneNum}</td>
								<td class="rating">${customer.rating}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
			<div class="tab-pane fade" id="mailingList">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>Name</th>
							<th>Email</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${customerList}" var="customer">
							<tr>
								<td>${customer.lastName},${customer.firstName}</td>
								<td>${customer.email}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="tab-pane fade" id="flights">


				<table class="table table-striped table-hover" id="customerTable">
					<thead>
						<tr>
							<th>Airline ID</th>
							<th>Flight No.</th>
							<th>Seats</th>
							<th>Day Operating</th>
							<th>Min Stay</th>
							<th>Max Stay</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${flightList}" var="flight">
							<tr class="clickable-row" data-target="#myModal">
								<td>${flight.airlineID}</td>
								<td>${flight.flightNo}</td>
								<td>${flight.noOfSeats}</td>
								<td>${flight.daysOp}</td>
								<td>${flight.minStay}</td>
								<td>${flight.maxStay}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="tab-pane fade" id="revDropdown1">
				<form class="form-horizontal" role="search" method="POST"
					action="${pageContext.request.contextPath}/RevenueSearchServlet">
					<fieldset>
						<legend>Search By Flight</legend>
						<div class="form-group">
							<label for="flightNo" class="col-lg-2 control-label">Flight
								No.</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" id="flightNo"
									name="flightNo" placeholder="Flight No">
							</div>
						</div>
						<div class="form-group">
							<label for="airlineId" class="col-lg-2 control-label">Airline
								ID.</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" id="airlineId"
									placeholder="Airline ID" name="airlineId">
							</div>
						</div>
						<input type="submit" class="btn btn-info" name="searchType"
							value="Search By Flight">

					</fieldset>
				</form>
			</div>

			<div class="tab-pane fade" id="resrDropdown1">
				<form class="" role="search" method="POST"
					action="${pageContext.request.contextPath}/ReservationSearchServlet"
					class="form-horizontal" role="form">
					<div class="form-group">
						<label class="control-label">Input addons</label>
						<div class="input-group">
							<input type="text" class="form-control" name="searchFlight"
								class="searchFlight"> <span class="input-group-btn">
								<input type="submit" class="btn btn-info" name="searchType"
								value="Search By Flight">
							</span>
						</div>
					</div>
				</form>

			</div>

			<div class="tab-pane fade" id="resrDropdown2">
				<form class="form-horizontal" role="search" method="POST"
					action="${pageContext.request.contextPath}/ReservationSearchServlet">
					<fieldset>
						<legend>Search By Customer</legend>
						<div class="form-group">
							<label for="firstName" class="col-lg-2 control-label">First
								Name</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" id="firstName"
									name="firstName" placeholder="First Name">
							</div>
						</div>
						<div class="form-group">
							<label for="lastName" class="col-lg-2 control-label">Last
								Name</label>
							<div class="col-lg-10">
								<input type="text" class="form-control" id="lastName"
									placeholder="Last Name" name="lastName">
							</div>
						</div>
						<input type="submit" class="btn btn-info" name="searchType"
							value="Search By Customer">

					</fieldset>
				</form>
			</div>
			<div class="tab-pane fade" id="reservation">


				<table class="table table-striped table-hover" id="customerTable">
					<thead>
						<tr>
							<th>Airline ID</th>
							<th>Flight No.</th>
							<th>Seats</th>
							<th>Day Operating</th>
							<th>Min Stay</th>
							<th>Max Stay</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${flightList}" var="flight">
							<tr class="clickable-row" data-target="#myModal">
								<td>${flight.airlineID}</td>
								<td>${flight.flightNo}</td>
								<td>${flight.noOfSeats}</td>
								<td>${flight.daysOp}</td>
								<td>${flight.minStay}</td>
								<td>${flight.maxStay}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>


			<div class="tab-pane fade" id="employee">
				<table class="table table-striped table-hover" id="customerTable">
					<thead>
						<tr>
							<th>Id</th>
							<th>Name</th>
							<th>Address</th>
							<th>City</th>
							<th>State</th>
							<th>Zip</th>
							<th>SSN</th>
							<th>Start Date</th>
							<th>Hourly Rate</th>
							<th>isManager</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${employeeList}" var="employee">
							<tr class="employee-clickable-row" data-target="#myModal">
								<td class="id">${employee.id}</td>
								<td class="name">${employee.lastName},
									${employee.firstName}</td>
								<td class="address">${employee.address}</td>
								<td class="city">${employee.city}</td>
								<td class="state">${employee.state}</td>
								<td class="zip">${employee.zipcode}</td>
								<td class="ssn">${employee.SSN}</td>
								<td class="start">${employee.startDate}</td>
								<td class="hourly">${employee.hourlyRate}</td>
								<td class="manager">${employee.manager}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>


		</div>


		<div class="modal" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">Modal title</h4>
					</div>
					<div class="modal-body">

						<h1>Edit Customer Profile</h1>
						<hr>
						<div class="row">

							<!-- edit form column -->
							<div class="col-md-9 personal-info">
								<div class="alert alert-info alert-dismissable">
									<a class="panel-close close" data-dismiss="alert">×</a> <i
										class="fa fa-coffee"></i> Edit <strong>only</strong> the
									fields that you want to update.
								</div>
								<h3>Personal info</h3>

								<form method="POST"
									action="${pageContext.request.contextPath}/CustomerInfoUpdateServlet"
									class="form-horizontal" role="form">
									<div class="form-group">
										<input type="hidden" name="customerId" id="customerId">
									</div>
									<div class="form-group">
										<label class="col-lg-3 control-label">First name:</label>
										<div class="col-lg-8">
											<input class="form-control" type="text" name="firstName"
												id="firstName">
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-3 control-label">Last name:</label>
										<div class="col-lg-8">
											<input class="form-control" type="text" name="lastName"
												id="lastName">
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-3 control-label">Address: </label>
										<div class="col-lg-8">
											<input class="form-control" type="text" name="address"
												id="address">
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-3 control-label">City:</label>
										<div class="col-lg-8">
											<input class="form-control" type="text" name="city" id="city">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">State:</label>
										<div class="col-md-8">
											<input class="form-control" type="text" name="state"
												id="state">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Zip:</label>
										<div class="col-md-8">
											<input class="form-control" type="text" name="zip" id="zip">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Credit Card:</label>
										<div class="col-md-8">
											<input class="form-control" type="text" name="ccNo" id="ccNo">
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-3 control-label">Email:</label>
										<div class="col-lg-8">
											<input class="form-control" type="text" name="email"
												id="email">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Phone Number:</label>
										<div class="col-md-8">
											<input class="form-control" type="text" name="phoneNum"
												id="phoneNum">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label"></label>
										<div class="col-md-8">
											<input type="submit" class="btn btn-primary"
												value="Save Changes"> <span></span>
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
										</div>
									</div>
								</form>
							</div>
						</div>

						<hr>
					</div>
				</div>
			</div>
		</div>

		<div class="modal" id="editEmployeeModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">Edit Employee Profile</h4>
					</div>
					<div class="modal-body">
						<hr>
						<div class="row">

							<!-- edit form column -->
							<div class="col-md-9 personal-info">
								<div class="alert alert-info alert-dismissable">
									<a class="panel-close close" data-dismiss="alert">×</a> <i
										class="fa fa-coffee"></i> Edit <strong>only</strong> the
									fields that you want to update.
								</div>
								<form method="POST"
									action="${pageContext.request.contextPath}/EmployeeUpdateServlet"
									class="form-horizontal" role="form">
									<div class="form-group">
										<input type="hidden" name="employeeId" id="employeeId">
									</div>
									<div class="form-group">
										<label class="col-lg-3 control-label">First name:</label>
										<div class="col-lg-8">
											<input class="form-control" type="text" name="efirstName"
												id="efirstName">
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-3 control-label">Last name:</label>
										<div class="col-lg-8">
											<input class="form-control" type="text" name="elastName"
												id="elastName">
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-3 control-label">Address: </label>
										<div class="col-lg-8">
											<input class="form-control" type="text" name="eaddress"
												id="eaddress">
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-3 control-label">City:</label>
										<div class="col-lg-8">
											<input class="form-control" type="text" name="ecity"
												id="ecity">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">State:</label>
										<div class="col-md-8">
											<input class="form-control" type="text" name="estate"
												id="estate">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Zip:</label>
										<div class="col-md-8">
											<input class="form-control" type="text" name="ezip" id="ezip">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">SSN:</label>
										<div class="col-md-8">
											<input class="form-control" type="text" name="essn" id="essn">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Start Date:</label>
										<div class="col-md-8">
											<input class="form-control" type="text" name="start"
												id="start">
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-3 control-label">Hourly Rate:</label>
										<div class="col-lg-8">
											<input class="form-control" type="text" name="hourly"
												id="hourly">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">IsManager:</label>
										<div class="col-md-8">
											<input class="form-control" type="text" name="manager"
												id="manager">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label"></label>
										<div class="col-md-8">
											<input type="submit" class="btn btn-primary"
												value="Save Changes"> <span></span>
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
										</div>
									</div>
								</form>
							</div>
						</div>

						<hr>
					</div>
				</div>
			</div>
		</div>

		<jsp:include page="_footer.jsp"></jsp:include>
</body>
<script>
	function customerSearch() {
		var input, filter, table, tr, td, i;
		input = document.getElementById("customerName");
		filter = input.value.toUpperCase();
		table = document.getElementById("customerTable");
		tr = table.getElementsByTagName("tr");
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[3];
			if (td) {
				if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = "";
				} else {
					tr[i].style.display = "none";
				}
			}
		}
	}
</script>
</html>