<%@page import="olx.City" session="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
    
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>OLX TYPE</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    	<!-- CUSTOM -->
    	<link href='https://fonts.googleapis.com/css?family=Oswald|Open+Sans' rel='stylesheet' type='text/css'>
    		
    		
     <link href="css/Custom.css" rel="stylesheet">
     	
     	<link href="css/font-awesome.min.css" rel="stylesheet">
     		<script>
     	   function check1()
     	   {
             var a=document.getElementById("addname").value;
             if(a.trim()=="")
             {
             alert("City Name Is  Not Correct");
             return false;
             }
             return true;
     	    }
</script>
</head>
<body>      
	<%
		HttpSession session=request.getSession(false);
		String user_id=request.getParameter("user_id");
		if(session==null)
		{
	%>
			<jsp:forward page="index.jsp"></jsp:forward>
	<%	
			return;		
		}
		
	%>
	<%@ include file="header.jsp" %>
	<%@ include file="footer.jsp" %>

<br><br>
<div id="middle">
<%
	String mode=request.getParameter("mode");
	olx.City s1=new olx.City();
	if("display".equals(mode))
	{
		Vector<String []> v = s1.showRecordAll();
%>	<center>
<div class="panel-group" id="accordion">
<div class="panel panel-default">
<div class="panel-heading">
<h3 class="panel-heading">
<a href="#collpaseone" data-toggle="collapse" data-parent="accordion">City Details </a> </h3>
</div>
<div id="collpaseone" class="panel-collapse collapse in">
			<div class="panel-body">
			<%
	int a=s1.maxcity_id();
	if(a<1)
	{
%>
	<h1>Empty Table</h1>
<%
	}
		else
	{
%>			
			<table border="1" width="500px" class="table table-bordered table-striped">
			<tbody>
			<tr><th>City Id</th><th>City Name</th><th>State</th><th></th><th></th></tr>
<%		
		for(int i=0;i<v.size();i++)
		{
%>
			<tr>
<%			
			String s[]=(String [])v.elementAt(i);
			for(int j=0;j<3;j++)
			{
%>
				<td><%=s[j] %></td>
<%				
			}
%>
				<td><a href="city.jsp?city_id=<%=s[0]%>&city_name=<%=s[1]%>&state_name=<%=s[2]%>&mode=edit&user_id=<%=user_id%>">Edit</a></td>
				<td><a href="city.jsp?city_id=<%=s[0] %>&mode=delete">Delete</a></td>
			</tr>
<%
		}
%>
		</tbody>
		</table>
		<% } %>
		</div>
		</div>
		</div>
		</div>
		<a href="city.jsp?mode=add&user_id=<%=user_id%>">Add New City </a>
		&nbsp;&nbsp;  |  &nbsp;&nbsp;
		<a href="dashboard.jsp?user_id=<%=user_id%>">Go To DashBoard </a></center>
		<br><br><br><br><br><br>
<%
		return;
	}
	else if("delete".equals(mode))
	{
		int city_id=Integer.parseInt(request.getParameter("city_id"));


				s1.deleteRecord(city_id);
	
	}
	else if("edit".equals(mode))
	{
		String city_id=request.getParameter("city_id");
		String city_name=request.getParameter("city_name");
		 String state_name=request.getParameter("state_name");	
	        	Vector<String []> v = s1.showstateid();
		%>
		<br><br>
		
			<form action="city.jsp?mode=update" method="post"onSubmit="return check1();">
<center>
<div class="panel-group" id="accordion" style="margin-top:70px;">
<div class="panel panel-default">
<div class="panel-heading">
<h3 class="panel-heading">
<a href="#collpaseone" data-toggle="collapse" data-parent="accordion">Update City </a> </h3>
</div>
<div id="collpaseone" class="panel-collapse collapse in">
		<table border="1" class="table table-bordered table-striped">
		<tbody>
		<tr>
		<th>City Id </th>
		<td><input type="text" name="city_id" value="<%=city_id%>" readonly="readonly"/></td>
		</tr>
		<tr>
		<th>City Name </th>
		<td><input id="addname" type="text" name="city_name"  value="<%=city_name%>"/></td>
		

		
		</tr>
                <tr><td>State Id</td>
                 <td><select name="state_id" width="100">
        <%   
               	for(int i=0;i<v.size();i++)
		{			
			String s[]=(String [])v.elementAt(i);
			if(s[1].equalsIgnoreCase(state_name))
			{
	%>
			<option value="<%=s[0]%>" selected>
			<%=s[0]%>.<%=s[1]%>
			</option>		
	<%			      
			}
			else
			{		
        %>         
               	
                 	<option value="<%=s[0]%>"><%=s[0]%>.<%=s[1]%></option>
                 <%
			}
                 }
                 %> 
                 </select></td>  
                 </tr>
                 		<tr><td colspan="2" align="center"><input type="submit" value="update" name="submit" class="btn btn-primary" /></td></tr>
		</tbody>
		</table>
		</div>
		</div>
		</div>	
							<a href="city.jsp?user_id=<%=user_id%>">Go Back </a></center>

				</form>

	<%
		return;
	}
	else if("update".equals(mode))
	{
		int city_id=Integer.parseInt(request.getParameter("city_id"));
		String city_name=request.getParameter("city_name");
        int state_id=Integer.parseInt(request.getParameter("state_id"));
		s1.updateRecord(city_id,city_name,state_id); 
	}
	else if("add".equals(mode))
	{
		int r=s1.maxcity_id()+1;
	Vector<String []> v = s1.showstateid();
%>
<br><br>
	<form action="city.jsp?mode=save" method="post" name="addform" onSubmit="return check1();">
<center>
<div class="panel-group" id="accordion">
<div class="panel panel-default">
<div class="panel-heading">
<h3 class="panel-heading">
<a href="#collpaseone" data-toggle="collapse" data-parent="accordion">Add City </a> </h3>
</div>
<div id="collpaseone" class="panel-collapse collapse in">

	<table border="1" class="table table-bordered table-striped">
	<tbody>
	<tr>
	<td>City Id</td>
	<td><input type="text" name="city_id" value="<%=r%>" readonly="readonly"/></td>
	</tr>
	<tr>
	<td>City Name</td>
	<td><input id="addname" type="text" name="city_name" /></td>
</tr>
                <tr><td>State Id</td>
                  <td><select name="state_id" width="100">
        <%   
               		for(int i=0;i<v.size();i++)
		{			
			String s[]=(String [])v.elementAt(i);
			
			{        
        %>         
               	
                 	<option value="<%=s[0]%>"><%=s[0]%>.<%=s[1]%></option>
                 <%
                 }
                 }
                 %>
                         </select></td>  
                 </tr>
	<tr><td colspan="2" align="center"><input type="submit" value="save" name="submit" class="btn btn-primary"/></td></tr>
	</tbody>
	</table>
		

	</div>
	</div>
</div>
<a href="city.jsp?user_id=<%=user_id%>">Go Back </a></center>
</form>
<%
		return;
	}
	else if("save".equals(mode))
	{
		int city_id=Integer.parseInt(request.getParameter("city_id"));
		String city_name=request.getParameter("city_name");
		int state_id=Integer.parseInt(request.getParameter("state_id"));
		s1.addRecord(city_id, city_name,state_id); 
	}	

%>
	<jsp:include page="city.jsp">
		<jsp:param value="display" name="mode"/>
	</jsp:include>
</div>
<!-- /MAIN CONTENT -->
    
   <script src="js/jquery1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>