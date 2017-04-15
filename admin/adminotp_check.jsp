<%@page import="olx.MailVerification"%>
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
		<jsp:useBean class="olx.AdminUpdate" id="c1"></jsp:useBean>
<%

		String otp= request.getParameter("otp");
		String newpass= request.getParameter("newpass");
		String otp1= request.getParameter("generatedotp");//from hidden input
		
		
		if(!(otp.equals(otp1)))
		{
%>
		<jsp:forward page="admin_signup.jsp"></jsp:forward>
<%			
		}
		
		String name= request.getParameter("sname");
		String adminid= request.getParameter("mailid");
		String msg="\nYour Id is "+adminid +" and your new password is "+ newpass;
		
		
		c1.updateAdmin(name,newpass,adminid);
		
			
		
%>



	<jsp:include page="mail.jsp">
		<jsp:param name="email" value="<%=adminid%>" />
		<jsp:param name="subject" value="Recover Password" />
		<jsp:param name="msg" value="<%=msg%>" />
	</jsp:include>
	
	<jsp:include page="index.jsp"></jsp:include>

	</body>
</html>