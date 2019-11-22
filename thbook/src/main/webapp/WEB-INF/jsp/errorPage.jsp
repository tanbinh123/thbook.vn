<%-- 
    Document   : errorPage
    Created on : Nov 10, 2019, 5:57:50 AM
    Author     : USER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:forEach var="error" items="${errorMsg}">
            ${error}
        </c:forEach>
    </body>
</html>
