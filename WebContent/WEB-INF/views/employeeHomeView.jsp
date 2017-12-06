<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Home</title>
</head>
<body>

	<jsp:include page="_header.jsp"></jsp:include>

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
						<tr>
							<td>${customer.id}</td>
							<td>${customer.accountNo}</td>
							<td>${customer.creationDate}</td>
							<td>${customer.lastName},${customer.firstName}</td>
							<td>${customer.address}</td>
							<td>${customer.city}</td>
							<td>${customer.state}</td>
							<td>${customer.zipcode}</td>
							<td>${customer.ccNo}</td>
							<td>${customer.email}</td>
							<td>${customer.phoneNum}</td>
							<td>${customer.rating}</td>
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