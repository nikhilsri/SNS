<%@ page import="olx.*" session="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>

<html>
<head>
	<title>Admin Dashboard</title>
</head>
<body>
<%
	HttpSession session=request.getSession(false);
	if(session==null)
	{
%>
		<jsp:forward page="login.jsp"></jsp:forward>
<%		
		return;
	}
	olx.DConnection dc=new olx.DConnection();
	String user_id=request.getParameter("user_id");
	int userid=Integer.parseInt(user_id);
	olx.CommonMethods cm = new olx.CommonMethods();
	String userName=cm.getUserName(userid);
%>

	<%@ include file="header.jsp" %>  
	<%@ include file="footer.jsp" %> 
	
		<div class="panel panel-primary" style="margin-top:70px;">
  <div class="panel-heading">
    <h3 class="panel-title">DASHBOARD</h3>
  </div>
		 <div class="panel-body">
    
    		<a href="user.jsp?mode=edit&user_id=<%=user_id%>">Change contact Details</a>&nbsp; &nbsp; | &nbsp;
    		<a href="index.jsp">LOGOUT</a>&nbsp; &nbsp; | &nbsp;
    		<a href="user.jsp?mode=changepass&user_id=<%=user_id%>">change password</a>&nbsp; &nbsp; | &nbsp;
<a href="product.jsp?user_id=<%=user_id%>&mode=showall">Upload/Edit your Add</a>
	<label class="pull-right">Name:<%= userName %></label>





  </div>
  </div>

</body>
</html>