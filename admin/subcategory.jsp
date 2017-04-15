<%@page import="olx.SubCategory" session="false"%>
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
</head>
	<script>
     	   function check1()
     	   {
             var a=document.getElementById("addname").value;
             if(a.trim()=="")
             {
             alert("Subcategory Name Is  Not Correct");
             return false;
             }
             var b=document.getElementById("picname").value;
             if(b.trim()=="")
             {
             alert("Photo Is  Not Choosen");
             return false;
             }
             return true;
     	    }
</script>
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
	olx.SubCategory s1=new olx.SubCategory();
	if("display".equals(mode))
	{
		Vector<String []> v = s1.showRecordAll();
%>      <center>
		<div class="panel-group" id="accordion" style="margin-top:70px;">
<div class="panel panel-info">
<div class="panel-heading">
<h3 class="panel-heading">
<a href="#collpaseone" data-toggle="collapse" data-parent="accordion">SubCategory Details </a> </h3>
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
				<tr>
		<th>Sub Category Id</th> 		<th>Sub Category Name</th>
		<th>Category Name</th><th>Picture</th><th></th><th></th></tr>
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
				<td><img src="/./olx/subcategoryimages/<%=s[3]%>" alt="subcategory_img" style="width:40px;height:40px" /></td>
				<td><a href="subcategory.jsp?subcat_id=<%=s[0]%>&subcat_name=<%=s[1]%>&cat_name=<%=s[2]%>&subcat_pic=<%=s[3]%>&mode=edit&user_id=<%=user_id%>">Edit </a></td>
				<td><a href="subcategory.jsp?subcat_id=<%=s[0] %>&mode=delete&user_id=<%=user_id%>">Delete</a></td>
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
	
		<a href="subcategory.jsp?mode=add&user_id=<%=user_id%>">Add New Sub category</a> &nbsp;&nbsp;&nbsp; |  &nbsp;&nbsp;&nbsp;
		<a href="dashboard.jsp?user_id=<%=user_id%>">Go To DashBoard</a><br><br><br><br>
<%
		return;
	}
	else if("delete".equals(mode))
	{
		int subcat_id=Integer.parseInt(request.getParameter("subcat_id"));
		int cnt=s1.deletecheck(subcat_id);
		if(cnt==0)
		{
			String name=s1.getImageName(subcat_id);
			String s=application.getRealPath("/")+"/subcategoryimages/"+name;
			File f=new File(s);
			f.delete();
			s1.deleteRecord(subcat_id);
		}
		else
		{
%>
			<center><h3>First delete its product!</h3></center>
<%
		}		
	}
	else if("edit".equals(mode))
	{
		String subcat_id=request.getParameter("subcat_id");
		String subcat_name=request.getParameter("subcat_name");
	        String cat_name=request.getParameter("cat_name");
		String subcat_pic=request.getParameter("subcat_pic");	
	        Vector<String []> v = s1.showcatid();
%>
		<form action="subcategoryedit.jsp?subcat_id=<%=subcat_id%>" method="post" enctype="multipart/form-data" onSubmit="return check1();">
		<div class="panel-group" id="accordion" style="margin-top:70px;">
<div class="panel panel-info">
<div class="panel-heading">
<h3 class="panel-heading">
<a href="#collpaseone" data-toggle="collapse" data-parent="accordion">Edit SubCategory Details </a> </h3>
</div>
<div id="collpaseone" class="panel-collapse collapse in">
<div class="panel-body">

			<table border="1" width="500px" class="table table-bordered table-striped" >
			<tr>
		<td>Sub Category Id</td>
		<td><input type="text" name="subcat_id" value="<%=subcat_id%>" readonly="readonly"/></td>
		</tr>
		<tr>
		<td>Sub Category Name</td>
		<td><input id="addname" type="text" name="subcat_name"  value="<%=subcat_name%>"/></td>
		</tr>
                <tr><td>Category Id</td>
                 <td><select name="cat_id" width="100">
        <%   
               		for(int i=0;i<v.size();i++)
		{			
			String s[]=(String [])v.elementAt(i);
			if(cat_name.equalsIgnoreCase(s[1]))
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
                 %> </select></td>  
                 </tr>
		<tr><td><img src="/./olx/subcategoryimages/<%=subcat_pic%>" alt="subcategory_img" style="width:30px;height:30px" /></td>
		    <td><input type="file" name="uploadpic" size="200000" id="picname" value="uploadpic"/></td></tr>
		<tr><td colspan="2" align="center"><input type="submit" value="save" name="submit" /></td></tr>
		</table>
		</div>
		</div>
		</div>
		</div>
			<a href="dashboard.jsp?user_id=<%=user_id%>">Go To DashBoard</a><br><br><br><br>

		</form>
		
	<%
		return;
	}
	/*else if("update".equals(mode))
	{
		int subcat_id=Integer.parseInt(request.getParameter("subcat_id"));
		String subcat_name=request.getParameter("subcat_name");
		int cat_id=Integer.parseInt(request.getParameter("cat_id"));
		String subcat_pic=request.getParameter("subcat_pic");
		s1.updateRecord(subcat_id , subcat_name , cat_id, subcat_pic); 
	}*/
	else if("add".equals(mode))
	{
		int r=s1.maxId()+1;
			Vector<String []> v = s1.showcatid();
%>
	<form action="subcategorysave.jsp?subcat_id=<%=r %>&user_id=<%=user_id%>" method="post" name="addform" enctype="multipart/form-data" onSubmit="return check1();">
	<div class="panel-group" id="accordion" style="margin-top:70px;">
<div class="panel panel-info">
<div class="panel-heading">
<h3 class="panel-heading">
<a href="#collpaseone" data-toggle="collapse" data-parent="accordion">Add SubCategory Details </a> </h3>
</div>
<div id="collpaseone" class="panel-collapse collapse in">
<div class="panel-body">

			<table border="1" width="500px" class="table table-bordered table-striped" >
		
	<tr>
	<td>Sub Category Id</td>
	<td><input type="text" name="subcat_id" value="<%=r%>" readonly="readonly"/></td>
	</tr>
	<tr>
	<td>Sub Category Name</td>
	<td><input id="addname" type="text" name="subcat_name"/></td>
	</tr>
                <tr><td>Category Id</td>
                  <td><select name="cat_id" width="100">
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
<tr><td>Change Image:</td><td><input type="file" name="uploadpic" size="200000" id="picname" value="uploadpic"/></td></tr>
	<tr><td colspan="2" align="center"><input type="submit" value="save" name="submit"/></td></tr>
	</table>
	</div>
		</div>
		</div>
		</div>
			<a href="dashboard.jsp?user_id=<%=user_id%>">Go To DashBoard</a><br><br><br><br>

	</form>
<%
		return;
	}
		

%>
	<jsp:include page="subcategory.jsp">
		<jsp:param value="display" name="mode"/>
	</jsp:include>
</div>
</body>
</html>