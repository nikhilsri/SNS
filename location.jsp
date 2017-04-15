<%@ page import="java.sql.*" %>
<html>
<head>
	<script>
		function f1(id)
		{

var a;
a=new XMLHttpRequest();
a.onreadystatechange=function()
{	
	
	if(a.readyState==4 && a.status==200)
	{
		document.getElementById("citydiv").innerHTML=a.responseText;
	}
}
a.open("GET","city.jsp?id="+id,true);
a.send();
		}
	</script>

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
		Statement stmt2=conn.createStatement();
		ResultSet rst=stmt.executeQuery("select * from state");
		ResultSet rst2=stmt2.executeQuery("select * from city where 			state_id=1");

%>
<form class="form-inline">

	<div id="statediv" class="form-group">
		<select name="state" onchange="f1(this.value)" class="form-control" style="width:200px;">
		<span class="caret"></span>
<%
			while(rst.next())
			{
%>			
				<option value="<%=rst.getString(1)%>"> 
				<%=rst.getString(2)%></option>
<%
			}
%>
		</select>
	</div>
	<div id="citydiv" class="form-group">
		<select name="city" class="form-control" style="width:200px;">
		<span class="caret"></span>
<%
			while(rst2.next())
			{
%>			
				<option value="<%=rst2.getString(1)%>"> 
				<%=rst2.getString(2)%></option>
<%
			}
%>
		</select>
	</div>

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

