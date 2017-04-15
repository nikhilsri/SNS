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
		<jsp:useBean class="olx.AdminSignupCheck" id="c1"></jsp:useBean>
<%
		String otp= request.getParameter("otp");
		String otp1= request.getParameter("generatedotp");
		
		
		if(!(otp.equals(otp1)))
		{
%>
			<jsp:forward page="admin_signup.jsp"></jsp:forward>
<%			
		}
		String name= request.getParameter("sname");
		String pass= request.getParameter("pass");
		String adminid= request.getParameter("id1");
		String msg="Welcome Admin your account created\nYour Id is "+adminid +" and password is "+ pass;

		
		int cnt=olx.CommonMethods.adminCount(adminid);
		//int cnt1=olx.CommonMethods.adminCount1(contact);
		if(cnt== 0)// if authorized
		{
				c1.addAdmin(name,pass,adminid);

%>
			<jsp:include page="mail.jsp">
		<jsp:param name="email" value="<%=adminid%>" />
		<jsp:param name="subject" value="Account Created" />
		<jsp:param name="msg" value="<%=msg%>" />
			</jsp:include>
		<jsp:include page="index.jsp"></jsp:include>

<%
		}
		 else	//if unauthorized
			{
%>
				<jsp:include page="admin_signup.jsp"></jsp:include>
<%				out.print("<center><h1>Mail id   already exists</h1></center><br><br>"); %>
<%				
			}
			 	
%>
		
	</body>
</html>