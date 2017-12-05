<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="${pageContext.request.contextPath}/">ABS Travellings</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
      <ul class="nav navbar-nav navbar-right">

        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Accounts <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            
            <%
    			String username= (String) session.getAttribute("userName");
    			if (username == null) {
    			%>
    		<li><a href="${pageContext.request.contextPath}/login">Login</a></li>
            <li><a href="${pageContext.request.contextPath}/register">Register</a></li>
			<% } else {
			%>  
			<li>Hello, <b>${loginedUser.userName}</b>
			<li><a href="${pageContext.request.contextPath}/userInfo">User Information</a></li>
			<li><a href="${pageContext.request.contextPath}/customerInfo">User Information</a></li>
           	<li class="request.getSession().invalidate();"><a href="#">Logoff</a></li>
            
            <% }%>
          </ul>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-left">
        <li><a href="${pageContext.request.contextPath}/productList">Product List</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-left">
        <li><a href="${pageContext.request.contextPath}/userInfo">Account Info</a>
      </ul>
      <ul class="nav navbar-nav navbar-left">
        <li><a href="${pageContext.request.contextPath}/view">View Tables</a>
      </ul>
      <ul class="nav navbar-nav navbar-left">
        <li><a href="${pageContext.request.contextPath}/customerInfo">CustomerInfo</a>
      </ul>
      <ul class="nav navbar-nav navbar-left">
        <li><a href="${pageContext.request.contextPath}/currentTrip">My Trips</a>
      </ul>
      
    </div>
  </div>
</nav>