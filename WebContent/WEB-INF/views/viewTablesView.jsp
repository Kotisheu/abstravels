<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
 <head>
    <meta charset="UTF-8">
    <title>Tables List</title>
 </head>
 <body>
 
    <jsp:include page="_header.jsp"></jsp:include>
 
 
    <h3>Tables List List</h3>
 
    <p style="color: red;">${errorString}</p>
 **This is mostly just for testing purposes**
 <div style="color:red;"> REMOVE THIS PAGE LATER</DIV>
 
    <table border="1" cellpadding="5" cellspacing="1" >
     
       <c:forEach items="${tableList}" var="table" >
          <tr>
             <td>${table}</td>
             <td>
                <a href="viewTable?name=${table}">View</a>
             </td>
          </tr>
       </c:forEach>
    </table>
 
    <jsp:include page="_footer.jsp"></jsp:include>
 
 </body>
</html>