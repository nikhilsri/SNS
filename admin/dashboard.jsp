<%@ page import="olx.*" %>
<%@page import="java.sql.SQLException" session="false" %>


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
			<jsp:forward page="index.jsp"></jsp:forward>
	<%	
			return;		
		}
		
	%>
<%
  olx.DConnection dc=new olx.DConnection();

	String user=request.getParameter("user_id");
  olx.CommonMethods cm=new olx.CommonMethods();
  String userName=cm.getAdminName(user);
%>

	<%@ include file="header.jsp" %>
	<%@ include file="footer.jsp" %>
	
		<div class="panel panel-primary" style="margin-top:70px;">
  <div class="panel-heading">
    <h3 class="panel-title">ADMIN DASHBOARD</h3>
  </div>
		 <div class="panel-body">
    		<a href="state.jsp?user_id=<%=user%>">Add State </a>&nbsp; &nbsp; | &nbsp;
    		<a href="city.jsp?user_id=<%=user%>">Add City </a>&nbsp; &nbsp; | &nbsp;
    		<a href="category.jsp?user_id=<%=user%>">Add Category </a>&nbsp; &nbsp; | &nbsp;
    		<a href="subcategory.jsp?user_id=<%=user%>">Add SubCategory </a>&nbsp; &nbsp; | &nbsp;
    		<a href="brand.jsp?user_id=<%=user%>">Add Brand </a>&nbsp; &nbsp; | &nbsp;
    		<label class="pull-right">Name:<%= userName %></label>


  </div>
  </div>
<!-- /MAIN CONTENT -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    
   <script src="js/jquery1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>

</body>
</html>