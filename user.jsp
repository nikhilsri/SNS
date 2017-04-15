<%@page import="olx.State" session="false"%>
<%@page import="olx.City"%>
<%@page import="olx.DConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>
 <link href="css/bootstrap.min.css" rel="stylesheet">
    	<!-- CUSTOM -->
    	<link href='https://fonts.googleapis.com/css?family=Oswald|Open+Sans' rel='stylesheet' type='text/css'>
    		
    		
     <link href="css/Custom.css" rel="stylesheet">
     	
     	<link href="css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="header.jsp" %>  
<%@ include file="footer.jsp" %> 

	

<%
	String mode=request.getParameter("mode");
	olx.User u1=new olx.User();
	int user_id=Integer.parseInt(request.getParameter("user_id"));
	if("display".equals(mode))
		{  
		
		Vector<String []> v=u1.showContactDetails(user_id);
%>
<div class="panel-group" id="accordion" style="margin-top:70px;">
<div class="panel panel-default">
<div class="panel-heading">
<h3 class="panel-heading">
<a href="#collpaseone" data-toggle="collapse" data-parent="accordion">USER Details </a> </h3>
</div>
<div id="collpaseone" class="panel-collapse collapse in">
<div class="panel-body">
<table border="1" class="table table-bordered table-striped">
		<tr>
			<th>User id</th>
			<th>Password</th>
			<th>Name</th>
			<th>Mobile No.</th>
			<th>City</th>
			<th>State</th>
			<th>Location</th>
		</tr>

<%		
		for(int i=0;i<v.size();i++)
		{
%>
			<tr>
<%			
			String s[]=(String [])v.elementAt(i);
			for(int j=1;j<=7;j++)
			{
%>
				<td><%=s[j] %></td>
<%				
			}
%>
			</tr>
<%
		}

%>
		</table>
		</div>
</div>
</div>
</div>

		<a href="dashboard.jsp?user_id=<%=user_id%>">Go To DashBoard </a>
		<br><br><br><br>
<%
	
		return;
	}
	else if("delete".equals(mode))
	{
		
		u1.deleteAccount(user_id);		
	}
	else if("edit".equals(mode))
	{	
		
		Vector<String[]> v=u1.showContactDetails(user_id);
		
		String sc[]=(String [])v.elementAt(0);
			
		
	
		%>
		<form action="user.jsp?mode=update&user_id=<%=user_id%>" method="post">
		<div class="panel-group" id="accordion" style="margin-top:70px;">
<div class="panel panel-default">
<div class="panel-heading">
<h3 class="panel-heading">
<a href="#collpaseone" data-toggle="collapse" data-parent="accordion"> Edit Details </a> </h3>
</div>
<div id="collpaseone" class="panel-collapse collapse in">
<div class="panel-body">
<table border="1" class="table table-bordered table-striped">
<tr>
		<td>mail_id</td>
		<td><input type="text" name="mail_id" value="<%=sc[1]%>" /></td>
		</tr>
		<tr>
		<td>name</td>
		<td><input id="editname" type="text" name="name"  value="<%=sc[3]%>"/></td>
		</tr>
		<tr>
		<td>contact</td>
		<td><input id="editcontact" type="text" name="contact"  value="<%=sc[4]%>"/></td>
		</tr>
		<tr>
		<td><label>State</label></td>
		<td><select name="state_name">
			<% 
			  State s1=new State();
					Vector<String []> v2=s1.showRecordAll();	
					for(int i=0;i<v2.size();i++)
					{
						String sb[]=(String [])v2.elementAt(i);
					if(sb[1].equals(sc[6]))
						{
			%>
							<option value="<%=sb[1]%>" selected><%=sb[1]%></option>
			<%			}
					else
						{
			%>
							<option value="<%=sb[1]%>" ><%=sb[1]%></option>
			<%
						}
					}
			%>
			</select></td>
		</tr>
		<tr>
		<td><label>city</label></td>
		<td><select name="city_name">
		<%
		City c1=new City();
		Vector<String []> v1=c1.showRecordAll();
		for(int i=0;i<v1.size();i++)
		{
			String sa[]=(String [])v1.elementAt(i);
			if(sa[1].equals(sc[5]))
			{
		%>
				<option value="<%=sa[1]%>" <%=sa[1]%> selected><%=sa[1]%></option>
		<%	}
					else
			{
		%>
				<option value="<%=sa[1]%>" <%=sa[1]%> ><%=sa[1]%></option>
		<% 
			}
		}
		%>
		</select></td>
		</tr>
		<tr>
		<td>location</td>
		<td><input id="editlocation" type="text" name="location"  value="<%=sc[7]%>"/></td>
		</tr>
		<tr><td colspan="2" align="center"><input type="submit" value="save" name="submit" /></td></tr>
		</table>
		</div>
</div>
</div>
</div>
		</form>
<a href="dashboard.jsp?user_id=<%=user_id%>">Go To DashBoard </a>&nbsp;&nbsp;| &nbsp;&nbsp;		
<a href="user.jsp?mode=delete&user_id=<%=user_id%>">Delete Account</a><br><br><br>	<br>	

	<%
		return;
	}
	else if("update".equals(mode))
	{	olx.User u2=new olx.User();
		
		String mail_id=request.getParameter("mail_id");
		String name=request.getParameter("name");
		String contact=request.getParameter("contact");
		String city_name=request.getParameter("city_name");
		String state_name=request.getParameter("state_name");
		String location=request.getParameter("location");
		int state_id=u2.getState_id(state_name);
		int city_id=u2.getCity_id(city_name);

		u1.updateContactDetails(user_id, name, city_id, state_id, location, contact, mail_id) ;
		
	}
	else if("logout".equals(mode))
	{
		RequestDispatcher rd=request.getRequestDispatcher("/index.jsp");
		rd.include(request,response);
	}
	else if("changepass".equals(mode))
	{	
		%><form action="user.jsp?mode=check&user_id=<%=user_id%>" method="post">
		<div class="panel-group" id="accordion" style="margin-top:70px;">
<div class="panel panel-default">
<div class="panel-heading">
<h3 class="panel-heading">
<a href="#collpaseone" data-toggle="collapse" data-parent="accordion"> Edit Details </a> </h3>
</div>
<div id="collpaseone" class="panel-collapse collapse in">
<div class="panel-body">
<table border="1" class="table table-bordered table-striped">
<tr>
<th>
			ENTER CURRENT PASSWORD
</th>
<td>
			<input type="password" name="oldpass"/></td>
			</tr>
			<tr>
			<th>
			ENTER NEW PASSWORD
			</th>
			<td>
			<input type="password" name="newpass"/></td>
			</tr>
			<tr>
			<th colspan="2">
			<center><input type="submit" name="submit" value="submit"/></center> </th>
			</tr>
			</table>
			</div>
</div>
</div>
</div>		
		</form><%
	}
	else if("check".equals(mode))
	{	
		String oldpass=request.getParameter("oldpass");
		String newpass=request.getParameter("newpass");
		
		boolean b=u1.checkpass(oldpass,user_id);
		if(b==true)
			u1.changePassword(newpass, user_id);
		else{
			%>
			<jsp:include page="dashboard.jsp"></jsp:include>
			<%
			out.print("Incorrect previous password");}}
%>
<jsp:include page="user.jsp">
		<jsp:param value="display" name="mode"/>
	</jsp:include>


   <script src="js/jquery1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>

</body>
</html>