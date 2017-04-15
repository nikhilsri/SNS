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
		<jsp:useBean class="olx.StateCheck" id="c1"></jsp:useBean>
<%
		String name= request.getParameter("state");
		

			c1.addState(name);
			
		
%>
			<jsp:include page="state2.jsp"></jsp:include>

	</body>
</html>