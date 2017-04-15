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
<link rel="stylesheet" href="css/w3.css">
<link rel="stylesheet" href="css/w3-theme-black.css">
<link rel="stylesheet" href="css/css.css">
<link rel="stylesheet" href="css/font-awesome2.min.css">
<style>
html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif}
.w3-sidenav a,.w3-sidenav h4{padding:12px;}
.w3-navbar a{padding-top:12px !important;padding-bottom:12px !important;}
</style>
<body>
<% 
response.setHeader("Pragma","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Expires","0"); 
response.setDateHeader("Expires",-1); 
%> 


<%@ include file="footer.jsp" %>

<!-- Navbar -->
<ul class="w3-navbar w3-theme w3-top w3-left-align w3-large" style="z-index:4;">
  <li class="w3-opennav w3-right w3-hide-large">
    <a class="w3-hover-white w3-large w3-theme-l1" href="javascript:void(0)" onclick="w3_open()"><i class="fa fa-bars"></i></a>
  </li>
 <li><img src="images/logo1.jpg" class="logo"></li>
  <li class="w3-hide-small"><a href="index.jsp" class="w3-hover-white">Home</a></li>
  <li class="w3-hide-small"><a href="index3.jsp" class="w3-hover-white">Back</a></li>

</ul>

<!-- Sidenav -->
!-- Sidenav -->
<nav class="w3-sidenav w3-collapse w3-theme-l5 w3-animate-left" style="z-index:3;width:250px;margin-top:21px;" id="mySidenav">
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-right w3-xlarge w3-padding-large w3-hover-black w3-hide-large" title="close menu">
    <i class="fa fa-remove"></i>
  </a>
  <h4><b>Menu</b></h4>
   <a href="index.jsp" class="w3-hover-black">Home</a>
   <a href="index3.jsp" class="w3-hover-black">Back</a>
</nav>


<!-- Overlay effect when opening sidenav on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- Main content: shift it to the right by 250 pixels when the sidenav is visible -->
<%
        olx.DConnection db=new olx.DConnection();
        int subcat_id=Integer.parseInt(request.getParameter("subcat_id"));
        String subcat_name="";
        int pn=Integer.parseInt(request.getParameter("page"));
        

  int cnt=0;
  int i=0,size=0;
        ResultSet rst2=db.executeSelect("select count(*) from product where subcat_id='"+subcat_id+"'");
        while(rst2.next())
        {
          cnt=rst2.getInt(1);
         // out.print("<td>Total Add "+cnt+"</td>");
        }
        ResultSet rst3=db.executeSelect("select * from subcategory where subcat_id='"+subcat_id+"'");
        while(rst3.next())
        {
          subcat_name=rst3.getString(2);
         // out.print("<td>Total Add "+cnt+"</td>");
        }
        int pg=0;
    if(cnt%5==0)
      pg=cnt/5;
    else
      pg=(cnt/5)+1;
    int start=(pn-1)*5+1;
    int end=start+4;
    
%>

<div class="w3-main" style="margin-left:250px">

  <div class="w3-row w3-padding-64">
    <div class="w3-twothird w3-container">

      <h1 class="w3-text-teal"><%=subcat_name%></h1>
      <div class="page-header">
          <h1>Total Adds <small><b><%=cnt%></b></small></h1>
      </div>





      <%
      	try
	{
    
		ResultSet rst=db.executeSelect("select * from product where subcat_id='"+subcat_id+"'");
    rst.absolute(start);
    if(cnt==0)
      return;
    for(i=1;i<=5;i++)
    {
      
      
      out.print("<div class='panel panel-primary' style='margin-top: 0px;'><div class='panel-body'><a href='result.jsp?prdt_id="+rst.getInt(1)+"&subcat_id="+subcat_id+"' style='float:left;'><img src='productimages/"+rst.getString(6)+"' class='img img-responsive' style='width:95px;height:95px;margin-top: 0px;' />"+rst.getString(2)+"</a><label><p>"+rst.getString(8)+"</p></label><label style='float:right;'>Price: <img src='images/rupee.png'>  "+rst.getInt(7)+"</label></div></div>");
   
      rst.next();
      if(rst.isAfterLast())
        break;
      
    }
      
  }
  catch(SQLException e)
  {
    out.print(e);
  }

%>   

  
    
    
  </div>
</div>
</div>


  <!-- Pagination -->
  <div class="w3-center w3-padding-64">
    <ul class="w3-pagination">
  
  <%
    i=1;
  while(i<=pg)
    {

  %>

      <li><a class="w3-hover-black" href="index2.jsp?subcat_id=<%=subcat_id%>&page=<%=i%>"><%=i%></a></li>
  <%
    i++;
    }
  %>
    </ul>
  </div>
  

  


<!--  <footer id="myFooter">
    <div class="w3-container w3-theme-l2 w3-padding-32">
      <h4>Footer</h4>
    </div>

    <div class="w3-container w3-theme-l1">
      <p>Powered by Nikhil</a></p>
    </div>
  </footer>!-->

<!-- END MAIN -->

<script>
// Script to open and close the sidenav
function w3_open() {
    document.getElementById("mySidenav").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
    document.getElementById("mySidenav").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}
</script>

</body>
</html>


