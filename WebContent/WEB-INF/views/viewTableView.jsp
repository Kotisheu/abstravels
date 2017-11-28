<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>View Table ${name}</title>
   </head>
   <body>
 
      <jsp:include page="_header.jsp"></jsp:include>
      <jsp:include page="_menu.jsp"></jsp:include>
 
      <h3>View Table ${name}</h3>
 
      <p style="color: red;">${errorString}</p>
 
      <c:if test="${not empty table}">
         <form method="POST" action="${pageContext.request.contextPath}/viewTable">
   
<table border="1" cellpadding="5" cellspacing="1" >
  <thead>
    <tr>
      <c:forEach items="${table[0]}" var="column">
        <td><c:out value="${column.key}" /></td>
      </c:forEach>
    </tr>
  </thead>
  <tbody>
    <c:forEach items="${table}" var="columns">
      <tr>
        <c:forEach items="${columns}" var="column">
          <td><c:out value="${column.value}" /></td>
        </c:forEach>
      </tr>
    </c:forEach>
  </tbody>
</table>
         </form>
      </c:if>
 
      <jsp:include page="_footer.jsp"></jsp:include>
 
   </body>
</html>