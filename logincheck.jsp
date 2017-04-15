<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" session="false" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
	</head>
	<body>
<%
		olx.DConnection db=new olx.DConnection();
		String mail=request.getParameter("mailid");
		String pass=request.getParameter("pass");
		try
		{
			ResultSet rst=db.executeSelect("select * from users where mail_id='"+mail+"' and password='"+pass+"'");
			if(rst.next()) // if authorized
			{
				int user_id=rst.getInt(1);
				HttpSession session=request.getSession();
				session.setAttribute("user_id",user_id);
				session.setAttribute("mail_id",mail);
				session.setAttribute("user_type","seller");
				session.setAttribute("user_name",rst.getString(4));
				db.close();
				response.sendRedirect("dashboard.jsp?user_id="+user_id);
			}
			else //if unauthorized
			{
%>
				<jsp:include page="login.jsp"></jsp:include>
<%				out.print("<center><h1>Invalid user or password</h1></center>"); %>
<%				
			}
		}
		catch(SQLException e)
		{
			out.print(e.getMessage());
		}
	%>
	</body>
</html>