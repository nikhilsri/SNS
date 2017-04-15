<%@page import="olx.Category" session="false" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,java.io.*"%>
    
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
             alert("Category Name Is  Not Correct");
             return false;
             }
            var b=document.getElementByName("picname").value;
              if(b.trim()=="")
             {
             alert("Photo  Is  Not Choosen");
             return false;
             }
             return true;
     	    }
</script>
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
	<%@ include file="header.jsp" %>
	<%@ include file="footer.jsp" %>

<div id="middle" align="center">
<%

	String mode=request.getParameter("mode");
		String user_id=request.getParameter("user_id");

	olx.Category s1=new olx.Category();
	olx.SubCategory s2=new olx.SubCategory();
	if("display".equals(mode))
	{
		Vector<String []> v = s1.showRecordAll();
%>
			<center>
			<div class="panel-group" id="accordion" style="margin-top:70px;">
<div class="panel panel-info">
<div class="panel-heading">
<h3 class="panel-heading">
<a href="#collpaseone" data-toggle="collapse" data-parent="accordion">Category Details </a> </h3>
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
			<table border="1" width="500px" class="table table-bordered table-striped" >
			<tr><th>Category Id</th><th>Category Name</th><th>Picture</th><th></th><th></th></tr>
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
			//out.println(s[2]);
%>
				<td><img src="/./olx/categoryimages/<%=s[2]%>" alt="category_img" style="width:40px;height:40px" /></td>
				<td><a href="category.jsp?cat_id=<%=s[0]%>&cat_name=<%=s[1]%>&cat_pic=<%=s[2]%>&mode=edit&user_id=<%=user_id%>">Edit</a></td>
				<td><a href="category.jsp?cat_id=<%=s[0] %>&mode=delete&user_id=<%=user_id%>">Delete</a></td>
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
	<center>
		<a href="category.jsp?mode=add&user_id=<%=user_id%>">Add New category</a>   &nbsp;&nbsp;&nbsp; |  &nbsp;&nbsp;&nbsp;
		<a href="dashboard.jsp?user_id=<%=user_id%>">Go To DashBoard </a></center><br><br><br><br><br>
<%
		return;
	}
	else if("delete".equals(mode))
	{
		int cat_id=Integer.parseInt(request.getParameter("cat_id"));
		int cnt=s1.deletecheck(cat_id);
		if(cnt==0)
		{

			String name=s1.getImageName(cat_id);
			String s=application.getRealPath("/")+"/categoryimages/"+name;
			File f=new File(s);
			f.delete();
			s1.deleteRecord(cat_id);
		}
		else
		{
%>
			<center><h3 style="margin-top:70px;">First delete its subcategory!</h3></center>
<%
		}		
	}
else if("edit".equals(mode))
	{
		String cat_id=request.getParameter("cat_id");
		String cat_name=request.getParameter("cat_name");
		String cat_pic=request.getParameter("cat_pic");
		out.println(cat_pic);
	
		%>
		<form action="categoryedit.jsp?cat_id=<%=cat_id%>" method="post" enctype="multipart/form-data" onSubmit="return check1();">
		<div class="panel-group" id="accordion" style="margin-top:70px;">
<div class="panel panel-info">
<div class="panel-heading">
<h3 class="panel-heading">
<a href="#collpaseone" data-toggle="collapse" data-parent="accordion">Edit Category </a> </h3>
</div>
<div id="collpaseone" class="panel-collapse collapse in">
<div class="panel-body">

			<table border="1" width="500px" class="table table-bordered table-striped" >
			<tr>
		<td>Category Id</td>
		<td><input type="text" name="cat_id" value="<%=cat_id%>" readonly="readonly"/></td>
		</tr>
		<tr>
		<td>Category Name</td>
		<td><input id="addname" type="text" name="cat_name"  value="<%=cat_name%>"/></td>
		</tr>
		<tr><td><img src="/./olx/categoryimages/<%=cat_pic%>"  style="width:40px;height:40px" /></td>
		    <td><input type="file" name="uploadpic" size="200000" id="picname" value="uploadpic" selected/></td></tr>
		<tr><td colspan="2" align="center"><input type="submit" value="save" name="submit" /></td></tr>
		</table>
		</div>
		</div>
		</div>
		</div>
	<a href="dashboard.jsp?user_id=<%=user_id%>">Go To DashBoard </a><br><br><br><br><br>
		</form>
		
	<%
		return;
	}
	/*else if("update".equals(mode))
	{
		int cat_id=Integer.parseInt(request.getParameter("cat_id"));
		String cat_name=request.getParameter("cat_name");
		
		s1.updateRecord(cat_id,cat_name); 
	}*/
	else if("add".equals(mode))
	{
		int r=s1.maxId()+1;
%>
	<form action="categorysave.jsp?cat_id=<%=r %>" method="post" name="addform" enctype="multipart/form-data" onSubmit="return check1();">
	<div class="panel-group" id="accordion" style="margin-top:70px;">
<div class="panel panel-info">
<div class="panel-heading">
<h3 class="panel-heading">
<a href="#collpaseone" data-toggle="collapse" data-parent="accordion">Add Category </a> </h3>
</div>
<div id="collpaseone" class="panel-collapse collapse in">
<div class="panel-body">

			<table border="1" width="500px" class="table table-bordered table-striped" >
	<tr>
	<td>Category Id</td>
	<td><input type="text" name="cat_id" value="<%=r%>" readonly="readonly"/></td>
	</tr>
	<tr>
	<td>Category Name</td>
	<td><input id="addname" type="text" name="cat_name" /></td>
	</tr>
<tr><td>Change Image:</td><td><input type="file" name="uploadpic" size="200000" id="picname" value="uploadpic"/></td></tr>
	<tr><td colspan="2" align="center"><input type="submit" value="save" name="submit" /></td></tr>
	</table>
	</div>
		</div>
		</div>
		</div>
	<a href="dashboard.jsp?user_id=<%=user_id%>">Go To DashBoard </a><br><br><br><br><br>
	</form>
<%
		return;
	}
	

%>
	<jsp:include page="category.jsp">
		<jsp:param value="display" name="mode"/>
	</jsp:include>
</div>
</body>
</html>