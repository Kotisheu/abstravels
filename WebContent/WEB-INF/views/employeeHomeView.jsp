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
	<h2>Customers</h2>
	
	<jsp:include page="_header.jsp"></jsp:include>
	
	<table class="table table-striped table-hover ">
		<thead>
			<tr>
				<th>Id</th>
				<th>Account No.</th>
				<th>Creation Date</th>
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
					<td>${customer.ccNo}</td>
					<td>${customer.email}</td>
					<td>${customer.phoneNum}</td>
					<td>${customer.rating}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<jsp:include page="_footer.jsp"></jsp:include>
	
</body>
</html>