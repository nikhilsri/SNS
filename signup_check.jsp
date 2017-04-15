<%@page import="java.sql.SQLException" session="false"%>
<%@page import="olx.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import ="java.sql.* "%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
	</head>
	<body>
		<jsp:useBean class="olx.SignupCheck" id="c1"></jsp:useBean>
				<jsp:useBean class="olx.User" id="c2"></jsp:useBean>
								<jsp:useBean class="olx.CommonMethods" id="c3"></jsp:useBean>




<%
		String otp= request.getParameter("otp");
		String otp1= request.getParameter("generatedotp");
		
		
		if(!(otp.equals(otp1)))
		{
%>
			<jsp:forward page="user_signup.jsp"></jsp:forward>
<%			
		}

		String name= request.getParameter("sname");
		String pass= request.getParameter("pass");
		String rpass= request.getParameter("retype");
		String mail= request.getParameter("email");
		String contact= request.getParameter("mobile");
		String loc=request.getParameter("location");
		int state=Integer.parseInt(request.getParameter("state"));
		int city=Integer.parseInt(request.getParameter("city"));
		
		String msg="Welcome Admin your account created\nYour Id is "+mail +" and password is "+ pass;
		olx.CommonMethods cm=new olx.CommonMethods();
		//int sid=cm.getStateId(state);
		//c3.getStateId(state);
		//int cid=cm.getCityId(city);
		//c3.getCityId(city);
		//System.out.println(sid+","+cid+name);

		
		int cnt=cm.count(mail);
		int cnt1=cm.count1(contact);
		 
		 
		 	if(cnt== 0 && cnt1==0)// if authorized
		 	{
		 		c1.addUser(name,pass,mail,contact,loc,state,city);
%>
				<jsp:include page="mail.jsp">
					<jsp:param name="email" value="<%=mail%>" />
					<jsp:param name="subject" value="Account Created" />
					<jsp:param name="msg" value="<%=msg%>" />
				</jsp:include>
				<jsp:include page="login.jsp"></jsp:include>
<%	 		
		 	}	 	
%>




	
	</body>
</html>