<%@ page import="olx.*" session="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
    <%@page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
    <!--<meta http-equiv="X-UA-Compatible" content="IE=edge">!-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

 <link href="css/bootstrap.min.css" rel="stylesheet">
      <!-- CUSTOM -->
      <link href='https://fonts.googleapis.com/css?family=Oswald|Open+Sans' rel='stylesheet' type='text/css'>
        
        
      
      <link href="css/font-awesome.min.css" rel="stylesheet">
           <link href="css/Custom.css" rel="stylesheet">

</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<style>
html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif}
.w3-sidenav a,.w3-sidenav h4{padding:12px;}
.w3-navbar a{padding-top:12px !important;padding-bottom:12px !important;}
</style>
<body>
<ul class="w3-navbar w3-theme w3-top w3-left-align w3-large" style="z-index:4;">
  <li class="w3-opennav w3-right w3-hide-large">
    <a class="w3-hover-white w3-large w3-theme-l1" href="javascript:void(0)" onclick="w3_open()"><i class="fa fa-bars"></i></a>
  </li>
 <li><img src="images/logo1.jpg" class="logo"></li>
  <li class="w3-hide-small"><a href="index.jsp" class="w3-hover-white">Home</a></li>
  <li class="w3-hide-small"><a href="index3.jsp" class="w3-hover-white">Back</a></li>

</ul>

<div class="panel-group" id="accordion" style="margin-top:70px;">
<div class="panel panel-default">
<div class="panel-heading">
<h3 class="panel-heading">
<a href="#collpaseone" data-toggle="collapse" data-parent="accordion">Product Details </a> </h3>
</div>
<div id="collpaseone" class="panel-collapse collapse in">
<div class="panel-body">

<table border="1" class="table table-bordered table-striped" cellpadding="0" cellspacing="0">
      <tr>
      <th>Name</th>
      <th>pic</th>
      <th>price</th>
      <th>Description</th>
      <th>Owner</th>
      <th>Contact</th>
      <th>Brand</th>
      </tr>
      <tr>

<%
olx.DConnection db=new DConnection();
//int pn=Integer.parseInt(request.getParameter("page"));
int subcat_id=Integer.parseInt(request.getParameter("subcat_id"));
ResultSet rst,rst2,rst3;
  int product_id=Integer.parseInt(request.getParameter("prdt_id"));
  rst=db.executeSelect("select * from product where product_id='"+product_id+"'");
int userid=0;
int brand=0;

   while(rst.next())
    {
      out.print("<td>"+rst.getString(2)+"</td>");
            out.print("<td><img src='productimages/"+rst.getString(6)+"' class='img img-responsive' id='pic' style='width:200px;height:250px;' /></td>");

      out.print("<td>"+rst.getInt(7)+"</td>");

      out.print("<td><p>"+rst.getString(8)+"</p></td>");
        userid=rst.getInt(11); 
        brand=rst.getInt(3);

    }
    rst2=db.executeSelect("select * from users where user_id='"+userid+"'");
   while(rst2.next())
   {
       out.print("<td>"+rst2.getString(4)+"</td>");

      out.print("<td>"+rst2.getString(5)+"</td>");
         
  }
    rst3=db.executeSelect("select * from brand where brand_id='"+brand+"'");
while(rst3.next())
   {
       out.print("<td>"+rst3.getString(2)+"</td>");
    }
%>
</tr>
</table>
</div>
</div>
</div>
</div>

<!--<a href="index2.jsp?subcat_id=<%=subcat_id%>">Go Back </a>!-->
<a href="index3.jsp">GO BACK</a>

<br><br><br><br>

<%@ include file="footer.jsp" %>



 
   <script src="js/jquery1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>