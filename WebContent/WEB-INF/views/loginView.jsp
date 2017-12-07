<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<jsp:include page="_header.jsp"></jsp:include>


	<h3>Login Page</h3>
	<p style="color: red;">${errorString}</p>

	<ul class="nav nav-tabs">
		<li class="active"><a href="#customer" data-toggle="tab"
			aria-expanded="true">Customer</a></li>
		<li class=""><a href="#employee" data-toggle="tab"
			aria-expanded="false">Employee</a></li>
	</ul>
	<div id="myTabContent" class="tab-content">
		<div class="tab-pane fade active in" id="customer">
			<form method="POST" action="${pageContext.request.contextPath}/login">
				<table border="0">
					<tr>
						<td>User Name</td>
						<td><input type="text" name="userName"
							value="${user.userName}" /></td>
					</tr>
					<tr>
						<td>Password</td>
						<td><input type="text" name="password"
							value="${user.pass}" /></td>
					</tr>
					<tr>
						<td>Remember me</td>
						<td><input type="checkbox" name="rememberMe" value="Y" /></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="Submit" /> <a
							href="${pageContext.request.contextPath}/">Cancel</a></td>
					</tr>
				</table>
			</form>

			<p style="color: blue;">User Name: tom, password: tom001 or
				jerry/jerry001</p>
		</div>
		<div class="tab-pane fade" id="employee">
			<form method="POST" action="${pageContext.request.contextPath}/login">
				<table border="0">
					<tr>
						<td>User Name</td>
						<td><input type="text" name="userName"
							value="${user.userName}" /></td>
					</tr>
					<tr>
						<td>Password</td>
						<td><input type="password" name="pass"
							value="${user.pass}" /></td>
					</tr>
					<tr>
						<td>Remember me</td>
						<td><input type="checkbox" name="rememberMe" value="Y" /></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="Submit" /> <a
							href="${pageContext.request.contextPath}/">Cancel</a></td>
					</tr>
				</table>
			</form>

			<p style="color: blue;">User Name: tom, password: tom001 or
				jerry/jerry001</p>

		</div>
	</div>

	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>