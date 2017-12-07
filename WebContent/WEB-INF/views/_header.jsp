<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	if (typeof jQuery == 'undefined') {
		console.log("no jquery");
		document
				.write(unescape('%3Cscript src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"%3E%3C/script%3E'));
	};
</script>

<link
	href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.7/flatly/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+ENW/yibaokMnme+vBLnHMphUYxHs34h9lpdbSLuAwGkOKFRl4C34WkjazBtb7eT"
	crossorigin="anonymous">


<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<jsp:include page="_sidebar.jsp"></jsp:include>
			<%-- <a class="navbar-brand" href="${pageContext.request.contextPath}/">ABS Travelling</a> --%>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-2">
			<ul class="nav navbar-nav navbar-right">

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">Accounts
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">

						<%
							String username = (String) session.getAttribute("userName");
							if (username == null) {
						%>
						<li><a href="${pageContext.request.contextPath}/login">Login</a></li>
						<li><a href="${pageContext.request.contextPath}/register">Register</a></li>
						<%
							} else {
						%>
						<li>Hello, <b>${loginedUser.userName}</b>
						<li><a href="${pageContext.request.contextPath}/userInfo">User
								Information</a></li>
						<li><a href="${pageContext.request.contextPath}/customerInfo">Customer Info</a></li>
						<li class="request.getSession().invalidate();"><a href="#">Logoff</a></li>

						<%
							}
						%>
					</ul></li>
			</ul>
			<ul class="nav navbar-nav navbar-left">
				<li><a href="${pageContext.request.contextPath}/home">Home</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-left">
				<li><a href="${pageContext.request.contextPath}/productList">Product
						List</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-left">
				<li><a href="${pageContext.request.contextPath}/userInfo">Account
						Info</a>
			</ul>
			<ul class="nav navbar-nav navbar-left">
				<li><a href="${pageContext.request.contextPath}/view">View
						Tables</a>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li><a href="${pageContext.request.contextPath}/currentTrip">My
						Trips</a>
			</ul>
			<ul class="nav navbar-nav navbar-left">
				<li><a
					href="${pageContext.request.contextPath}/EmployeeHomeServlet">Employee
						Home</a>
			</ul>

		</div>
	</div>
</nav>