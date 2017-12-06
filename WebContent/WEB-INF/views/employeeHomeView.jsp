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
			var address = document.getElementById ('address');
			var city = document.getElementById ('city');
			var state = document.getElementById('state');
			var zip = document.getElementById ('zip');
			var ccNo = document.getElementById ('ccNo');
			var email = document.getElementById ('email');
			var phone = document.getElementById ('phoneNum');
			var phone = document.getElementById ('customerId');
			
			firstName.value = (nameArr[1]);
			lastName.value = (nameArr[0]);
			address.value = ($(this).children('td.address').text());
			city.value =($(this).children('td.city').text());
			state.value=($(this).children('td.state').text());
			zip.value = ($(this).children('td.zip').text());
			ccNo.value = ($(this).children('td.ccNo').text());
			email.value =($(this).children('td.email').text());
			phoneNum.value = ($(this).children('td.phone').text());
			customerId.value = ($(this).children('td.id').text());
			
			console.log(name);
			
			$("#myModal").modal("show");
		});
	});
	
</script>
</head>
<body>

	<jsp:include page="_header.jsp"></jsp:include>

	<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
		data-target="#myModal">Open Modal</button>

	<ul class="nav nav-tabs">
		<li class="active"><a href="#home" data-toggle="tab"
			aria-expanded="true">Quick Tools</a></li>
		<li class=""><a href="#allCustomerInfo" data-toggle="tab"
			aria-expanded="true">Customer</a></li>
		<li class=""><a href="#mailingList" data-toggle="tab"
			aria-expanded="true">Mailing List</a></li>
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
							<td class = "id">${customer.id}</td>
							<td class = "accountNo">${customer.accountNo}</td>
							<td class = "creation">${customer.creationDate}</td>
							<td class = "name">${customer.lastName}, ${customer.firstName}</td>
							<td class = "address">${customer.address}</td>
							<td class = "city">${customer.city}</td>
							<td class = "state">${customer.state}</td>
							<td class = "zip">${customer.zipcode}</td>
							<td class = "ccNo">${customer.ccNo}</td>
							<td class = "email">${customer.email}</td>
							<td class = "phone">${customer.phoneNum}</td>
							<td class = "rating">${customer.rating}</td>
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

		<div class="tab-pane fade" id="dropdown2">
			<p>Trust fund seitan letterpress, keytar raw denim keffiyeh etsy
				art party before they sold out master cleanse gluten-free squid
				scenester freegan cosby sweater. Fanny pack portland seitan DIY, art
				party locavore wolf cliche high life echo park Austin. Cred vinyl
				keffiyeh DIY salvia PBR, banh mi before they sold out farm-to-table
				VHS viral locavore cosby sweater.</p>
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

					<h1>Edit Profile</h1>
					<hr>
					<div class="row">

						<!-- edit form column -->
						<div class="col-md-9 personal-info">
							<div class="alert alert-info alert-dismissable">
								<a class="panel-close close" data-dismiss="alert">×</a> <i
									class="fa fa-coffee"></i> Edit <strong>only</strong> the fields that you want to update.
							</div>
							<h3>Personal info</h3>

							<form method ="POST" action="${pageContext.request.contextPath}/CustomerInfoUpdateServlet" class="form-horizontal" role="form">
								<div class = "form-group">
									<input type="hidden" name="customerId" id = "customerId">
								</div>
								<div class="form-group">
									<label class="col-lg-3 control-label">First name:</label>
									<div class="col-lg-8">
										<input class="form-control" type="text" name = "firstName" id = "firstName" >
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-3 control-label">Last name:</label>
									<div class="col-lg-8">
										<input class="form-control" type="text" name = "lastName" id= "lastName">
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-3 control-label">Address: </label>
									<div class="col-lg-8">
										<input class = "form-control"  type="text" name = "address" id="address">
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
										<input class="form-control" type="text" name="state" id="state">
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
										<input class="form-control" type="text" name = "email" id = "email">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">Phone Number:</label>
									<div class="col-md-8">
										<input class="form-control" type="text" name="phoneNum" id="phoneNum">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label"></label>
									<div class="col-md-8">
										<input type="submit" class="btn btn-primary"
											value="Save Changes"> <span></span> <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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