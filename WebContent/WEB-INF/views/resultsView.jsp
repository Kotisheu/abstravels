<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <title>Flight List</title>
 </head>
 <body>
 
    <jsp:include page="_header.jsp"></jsp:include>
  
 
    <h3>Flight List</h3>
 
    <p style="color: red;">${errorString}</p>
 
    pls work :c
 
    <jsp:include page="_footer.jsp"></jsp:include>
 
 </body>
</html>