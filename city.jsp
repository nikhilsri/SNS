<%@ page import="java.sql.*" %>
<html>
<head>

</head>
<body>
<% 
response.setHeader("Pragma","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Expires","0"); 
response.setDateHeader("Expires",-1); 
%> 
<%
	try
	{
		String id=request.getParameter("id");
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection		("jdbc:mysql://localhost:3306/olx","root","");
		Statement stmt=conn.createStatement();
		ResultSet rst=stmt.executeQuery("select * from city where 		state_id="+id);
%>
<form class="form-inline">

		<select name="city" class="form-control" style="width:200px;">
		<span class="caret"></span>
<%		
			while(rst.next())
			{
%>
				<option value="<%=rst.getString(1)%>">
					<%=rst.getString(2)%>
				</option>
<%				
			}
%>
		</select>
<%
		stmt.close();
		conn.close();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
%>
</form>
</body>
</html>

