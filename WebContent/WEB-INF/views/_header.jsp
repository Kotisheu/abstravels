<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<div style="background: #bfd3c1; height: 55px; padding: 5px;">

  <div style="float: left">
     <h1 style="color:#ffffff;">ABSTravelling</h1>
  </div>
 
  <div style="float: right; padding: 10px; text-align: right;">
 
     <!-- User store in session with attribute: loginedUser -->
     Hello, <b>${loginedUser.userName}</b>
     <!--  make this log off when user is logged in? -->
<a href="${pageContext.request.contextPath}/login">Login</a>
   |
   <a href="${pageContext.request.contextPath}/register">Register</a>

   <br/>
   
     Search <input name="search">
     <input type="submit" value="Submit" />
 
  </div>
 
</div>