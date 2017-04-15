<%@page import="olx.Brand, olx.SubCategory"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
    
<!DOCTYPE html>
<html>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>
 <link href="css/bootstrap.min.css" rel="stylesheet">
    	<!-- CUSTOM -->
    	<link href='https://fonts.googleapis.com/css?family=Oswald|Open+Sans' rel='stylesheet' type='text/css'>
    		
    		
     <link href="css/Custom.css" rel="stylesheet">
     	
     	<link href="css/font-awesome.min.css" rel="stylesheet">

<head>
<script>
     	   function check1()
     	   {
             var a=document.getElementById("addname").value;
             if(a.trim()=="")
             {
             alert("Brand Name Is  Not Correct");
             return false;
             }
             return true;
     	    }
</script>
</head>
<body>
<%@ include file="header.jsp" %>
	<%@ include file="footer.jsp" %>


<%
	String mode=request.getParameter("mode");
	String user_id=request.getParameter("user_id");
	olx.Brand s1=new olx.Brand();
	//olx.SubCategory s2=new olx.SubCategory();
	if("display".equals(mode))
	{
		Vector<String []> v = s1.showRecordAll();
		//Vector<String []> v1 = s1.addRecord();
%>		<center>
<div class="panel-group" id="accordion" style="margin-top:70px;">
<div class="panel panel-default">
<div class="panel-heading">
<h3 class="panel-heading">
<a href="#collpaseone" data-toggle="collapse" data-parent="accordion">Brand Details </a> </h3>
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
			<tr><th>Brand Id</th><th>Brand Name</th><th></th><th></th></tr>
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
				<td><a href="brand.jsp?brand_id=<%=s[0]%>&brand_name=<%=s[1]%>&mode=edit&user_id=<%=user_id%>">Edit </a></td>
				<td><a href="brand.jsp?brand_id=<%=s[0] %>&mode=delete">Delete</a></td>
			</tr>
<%
		}
%>
		</table>
		<% } %>
		</div>
</div>
</div>
</div>

		<a href="brand.jsp?mode=add&user_id=<%=user_id%>">Add New Brand </a>&nbsp;&nbsp; | &nbsp;&nbsp;
 		<a href="dashboard.jsp?user_id=<%=user_id%>">Go To DashBoard </a>
		<br><br><br><br>
<%
		return;
	}
	else if("delete".equals(mode))
	{
		int brand_id=Integer.parseInt(request.getParameter("brand_id"));
		s1.deleteRecord(brand_id);		
	}
	else if("edit".equals(mode))
	{
		String brand_id=request.getParameter("brand_id");
		String brand_name=request.getParameter("brand_name");
		//String user_id=request.getParameter("user_id");
	      //  String cat=request.getParameter("cat");	
		//String subcat=request.getParameter("subcat");
		//Vector<String []> v2 = s2.showcatid();
		//Vector<String []> v1 = s2.showRecordAll();
		
%>
		<form action="brand.jsp?mode=update" method="post" onSubmit="return check1();">
<div class="panel-group" id="accordion" style="margin-top:70px;">
<div class="panel panel-default">
<div class="panel-heading">
<h3 class="panel-heading">
<a href="#collpasetwo" data-toggle="collapse" data-parent="accordion">Brand Details </a> </h3>
</div>
<div id="collpasetwo" class="panel-collapse collapse in">
<div class="panel-body">

			<table border="1" width="500px" class="table table-bordered table-striped" >
		<tr>
		<td>Brand Id</td>
		<td><input type="text" name="brand_id" value="<%=brand_id%>" readonly="readonly"/></td>
		</tr>
		<tr>
		<td>Brand Name</td>
		<td><input id="addname" type="text" name="brand_name"  value="<%=brand_name%>"/></td>
		</tr>
        	
		<tr><td colspan="2" align="center"><input type="submit" value="save" name="submit" /></td></tr>
		</table>
		</div>
		</div>
		</div>
		</div>
		<center><a href="brand.jsp?user_id=<%=user_id%>">Go Back </a></center>
		</form>

		
	<%
		return;
	}
	else if("update".equals(mode))
	{
		int brand_id=Integer.parseInt(request.getParameter("brand_id"));
		String brand_name=request.getParameter("brand_name");
		//int cat_id=Integer.parseInt(request.getParameter("cat_id"));
		//int subcat_id=Integer.parseInt(request.getParameter("subcat_id"));
		s1.updateRecord(brand_id ,brand_name); 
	}
	else if("add".equals(mode))
	{
		int r=s1.maxId()+1;
		
					//Vector<String []> v2 = s2.showcatid();
				//Vector<String []> v1 = s2.showRecordAll();
%>
	<form action="brand.jsp?brand_id=<%=r %>&mode=save" method="post" name="addform" onSubmit="return check1();">
			<div class="panel-group" id="accordion" style="margin-top:50px;">
<div class="panel panel-info">
<div class="panel-heading">
<h3 class="panel-heading">
<a href="#collpaseone" data-toggle="collapse" data-parent="accordion">Brand Details </a> </h3>
</div>
<div id="collpaseone" class="panel-collapse collapse in">
<div class="panel-body">

			<table border="1" width="500px" class="table table-bordered table-striped" >
<tr>
	<td>Brand Id</td>
	<td><input type="text" name="brand_id" value="<%=r%>" readonly="readonly"/></td>
	</tr>
	<tr>
	<td>Brand Name</td>
	<td><input id="addname" type="text" name="brand_name" /></td>
	</tr>
                
	<tr><td colspan="2" align="center"><input type="submit" value="save" name="submit"/></td></tr>
	</table>
	</div>
		</div>
		</div>
		</div>

<center>	<a href="brand.jsp?user_id=<%=user_id%>">Go Back </a></center>
	</form>
<%
		return;
	}
	else if("save".equals(mode))
	{  
		int brand_id=Integer.parseInt(request.getParameter("brand_id"));
		String brand_name=request.getParameter("brand_name");
		s1.addRecord(brand_id,brand_name); 
	}	

%>
	<jsp:include page="brand.jsp">
		<jsp:param value="display" name="mode"/>
	</jsp:include>
	
   <script src="js/jquery1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    
</body>
</html>