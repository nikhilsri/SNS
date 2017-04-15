<%@ page import="olx.*" session="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
    <%@page import="java.sql.*" %>

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
<body>
<%
	olx.DConnection db=new olx.DConnection();
    int pn=1;
String query=request.getParameter("q");
String catname="",productname="",subcat_name="";
String ans2="",ans4="";
int cat_id=0,subcat_id=0,prdt_id=0,brand_id=0,cnt=0;
ResultSet rst=db.executeSelect("select * from category where cat_name LIKE '%"+query+"%'");
ResultSet rst4=db.executeSelect("select * from product where product_name LIKE '%"+query+"%'");
ResultSet rst5=db.executeSelect("select * from subcategory where subcat_name LIKE '%"+query+"%'");
ResultSet rst6=db.executeSelect("select * from brand where brand_name ='"+query+"'");
boolean flag=false;
if(rst6.next())
{
flag=true;
}
if(rst.next())
{
catname=rst.getString(2);
cat_id=rst.getInt(1);

%>
<div class="container" style="margin-top:70px;">
<h1> Searching for <%=catname%></h1><br>
<%
ResultSet rst2=db.executeSelect("select * from subcategory where cat_id='"+cat_id+"'");
while(rst2.next())
{
subcat_id=rst2.getInt(1);
	ans2=rst2.getString(2);

%>


	<div class="container" style="margin-top:70px;">
<h2> <a href="index2.jsp?subcat_id=<%=subcat_id%>&page=<%=pn%>"> <%=ans2%></a></h2><br><br><br><br>
</div>


<%
}
}

else if(rst4.next())
{
subcat_id=rst4.getInt(5);
prdt_id=rst4.getInt(1);
productname=rst4.getString(2);
%>
<div class="container" style="margin-top:70px;">
<h1> Searching for <%=productname%></h1><br>

<h2> <a href="result.jsp?subcat_id=<%=subcat_id%>&prdt_id=<%=prdt_id%>"> <%=productname%></a></h2><br><br><br><br>
</div>

<%
}
else if(rst5.next())
{
cat_id=rst5.getInt(3);
subcat_id=rst5.getInt(1);
subcat_name=rst5.getString(2);
%>
<div class="container" style="margin-top:70px;">
<h1> Searching for <%=subcat_name%></h1><br>

<h2> <a href="index2.jsp?subcat_id=<%=subcat_id%>&page=<%=pn%>"> <%=subcat_name%></a></h2><br><br><br><br>
</div>

<%
}
if(flag)
{
%>

<h1 style="margin-top:70px;"> Searching for brand <%=query%></h1><br>
<%

    brand_id=rst6.getInt(1);
   // ResultSet rst8=db.executeSelect("select count(*) from brand where brand_id ='"+brand_id+"'");
        ResultSet rst9=db.executeSelect("select count(*) from product where brand_id ='"+brand_id+"'");

        if(rst9.next())
            cnt=rst9.getInt(1);
%>
<div class="container" style="margin-top:70px;">

<h2><%=cnt%> results found for brand <%=query%> </a></h2><br><br><br><br>
</div>
<%
    
    ResultSet rst7=db.executeSelect("select * from product where brand_id='"+brand_id+"'");
    while(rst7.next())
    {
        productname=rst7.getString(2);
        prdt_id=rst7.getInt(1);

%>
<div class="container" style="margin-top:70px;">

<h2> <a href="result.jsp?subcat_id=<%=subcat_id%>&prdt_id=<%=prdt_id%>"> <%=productname%></a></h2><br><br><br><br>
</div>

<%
}
}
else if(flag==false)
{
%>
<div class="container" style="margin-top:70px;">
<h1>0 results found for brand <%=query%></h1>
<br><br><br>
</div>
<%
}
else
{
%>
<div class="container" style="margin-top:70px;">
<h1>0 results found</h1>
<br><br><br>
</div>
<%

}
%>
</div>
<%@ include file="header.jsp" %>  
	<%@ include file="footer.jsp" %> 

<script src="js/jquery1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>

</body>
</html>