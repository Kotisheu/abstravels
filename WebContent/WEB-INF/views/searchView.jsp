<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<div style="padding: 5px;">
<form method="POST" action="${pageContext.request.contextPath}/search">
	<input type="text" name="from" placeholder="From where?"><br>
	<input type="text" name="to" placeholder="To where?"><br>
	<input type="submit" value="submit">

</form>
</div>