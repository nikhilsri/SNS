<%@page import="olx.State" session="false" %>
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
             alert("State Name Is  Not Correct");
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
	olx.State s1=new olx.State();
	if("display".equals(mode))
	{
		Vector<String []> v = s1.showRecordAll();
%>	<center>
<div class="panel-group" id="accordion">
<div class="panel panel-default">
<div class="panel-heading">
<h3 class="panel-heading">
<a href="#collpaseone" data-toggle="collapse" data-parent="accordion">State Details </a> </h3>
</div>
<div id="collpaseone" class="panel-collapse collapse in">
			<div class="panel-body">
			<%
	int a=s1.maxId();
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
			<tr><th>State Id</th><th>State Name</th><th></th><th></th></tr>
<%		
		for(int i=0;i<v.size();i++)
		{
%>
			<tr>
<%			
			String s[]=(String [])v.elementAt(i);
			for(int j=0;j<2;j++)
			{
%>
				<td><%=s[j] %></td>
<%				
			}
%>
				<td><a href="state.jsp?state_id=<%=s[0]%>&state_name=<%=s[1]%>&mode=edit&user_id=<%=user_id%>">Edit</a></td>
				<td><a href="state.jsp?state_id=<%=s[0] %>&mode=delete">Delete</a></td>
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
		<a href="state.jsp?mode=add&user_id=<%=user_id%>">Add New state </a>
		&nbsp;&nbsp;  |  &nbsp;&nbsp;
		<a href="dashboard.jsp?user_id=<%=user_id%>">Go To DashBoard </a></center>
		<br><br><br><br><br><br>
<%
		return;
	}
	else if("delete".equals(mode))
	{
		int state_id=Integer.parseInt(request.getParameter("state_id"));


		int cnt=s1.deletecheck(state_id);
		if(cnt==0)
		{		s1.deleteRecord(state_id);
		}	
			else
		{
%>
			<center><h3 style="margin-top:70px;">First Delete its city!</h3></center>
<%
		}	
	}
	else if("edit".equals(mode))
	{
		String state_id=request.getParameter("state_id");
		String state_name=request.getParameter("state_name");
	
		%>
		<br><br>
		
			<form action="state.jsp?mode=update" method="post"onSubmit="return check1();">

<div class="panel-group" id="accordion" style="margin-top:70px;">
<div class="panel panel-default">
<div class="panel-heading">
<h3 class="panel-heading">
<a href="#collpaseone" data-toggle="collapse" data-parent="accordion">Update State </a> </h3>
</div>
<div id="collpaseone" class="panel-collapse collapse in">
		<table border="1" class="table table-bordered table-striped">
		<tbody>
		<tr>
		<th>State Id </th>
		<td><input type="text" name="state_id" value="<%=state_id%>" readonly="readonly"/></td>
		</tr>
		<tr>
		<th>State Name </th>
		<td><input id="addname" type="text" name="state_name"  value="<%=state_name%>"/></td>
		</tr>
		<tr><td colspan="2" align="center"><input type="submit" value="update" name="submit" class="btn btn-primary" /></td></tr>
		</tbody>
		</table>
		</div>
		</div>
		</div>	
							<center>	<a href="state.jsp?user_id=<%=user_id%>">Go Back </a></center>

				</form>

	<%
		return;
	}
	else if("update".equals(mode))
	{
		int state_id=Integer.parseInt(request.getParameter("state_id"));
		String state_name=request.getParameter("state_name");
		
		s1.updateRecord(state_id,state_name); 
	}
	else if("add".equals(mode))
	{
		int r=s1.maxId()+1;
%>
<br><br>
	<form action="state.jsp?mode=save" method="post" name="addform" onSubmit="return check1();">

<div class="panel-group" id="accordion">
<div class="panel panel-default">
<div class="panel-heading">
<h3 class="panel-heading">
<a href="#collpaseone" data-toggle="collapse" data-parent="accordion">Add State </a> </h3>
</div>
<div id="collpaseone" class="panel-collapse collapse in">

	<table border="1" class="table table-bordered table-striped">
	<tbody>
	<tr>
	<td>State Id</td>
	<td><input type="text" name="state_id" value="<%=r%>" readonly="readonly"/></td>
	</tr>
	<tr>
	<td>State Name</td>
	<td><input id="addname" type="text" name="state_name" /></td>
	</tr>
	<tr><td colspan="2" align="center"><input type="submit" value="save" name="submit" class="btn btn-primary"/></td></tr>
	</tbody>
	</table>
		

	</div>
	</div>
</div>
<center><a href="state.jsp?user_id=<%=user_id%>">Go Back </a></center>
</form>
<%
		return;
	}
	else if("save".equals(mode))
	{
		int state_id=Integer.parseInt(request.getParameter("state_id"));
		String state_name=request.getParameter("state_name");
		
		s1.addRecord(state_id, state_name); 
	}	

%>
	<jsp:include page="state.jsp">
		<jsp:param value="display" name="mode"/>
	</jsp:include>
</div>
<!-- /MAIN CONTENT -->
    
   <script src="js/jquery1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    
</body>
</html>