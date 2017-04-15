<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import ="java.sql.* "%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>In</title>
	</head>
	<body>
		<jsp:useBean class="olx.CityCheck" id="c1"></jsp:useBean>
<%
		String name= request.getParameter("city");
		

			c1.addCity(name);
			
		
%>
			<jsp:include page="city2.jsp"></jsp:include>

	</body>
</html>