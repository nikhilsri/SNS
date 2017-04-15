<%@ page import="olx.*,java.util.*,java.sql.*" session="false" language="java"%>
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
<body onload="activate('act');">
<% 
response.setHeader("Pragma","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Expires","0"); 
response.setDateHeader("Expires",-1); 
%> 
<%
//int cat_id1=Integer.parseInt(request.getParameter("cat_id"));
        
%>
<script type="text/javascript">
  /*function activate(link)
  {
if(document.getElementById)
document.getElementById(link).focus();
else if (document.all)
document.all(link).focus();
}*?
</script>

<!-- Navbar -->
<ul class="w3-navbar w3-theme w3-top w3-left-align w3-large" style="z-index:4;width:250px;">
  <li class="w3-opennav w3-right w3-hide-large">
    <a class="w3-hover-white w3-large w3-theme-l1" href="javascript:void(0)" onclick="w3_open()"><i class="fa fa-bars"></i></a>
  </li>
 <li><img src="images/logo1.jpg" class="logo"></li>
  <li class="w3-hide-small"><a href="index.jsp" class="w3-hover-white">Home</a></li>
</ul>

<!-- Sidenav -->
<nav class="w3-sidenav w3-collapse w3-theme-l5 w3-animate-left" style="z-index:3;width:250px;margin-top:51px;" id="mySidenav">
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-right w3-xlarge w3-padding-large w3-hover-black w3-hide-large" title="close menu">
    <i class="fa fa-remove"></i>
  </a>
  <h4><b>Menu</b></h4>
  <%
   olx.DConnection db=new olx.DConnection();
 
  ResultSet rst3;
        rst3=db.executeSelect("select * from category");
        while(rst3.next())
        {
        String cat_name=rst3.getString(2);
    %>
  <a href="#<%=cat_name%>" class="w3-hover-black"><%=cat_name%></a>
  <%
    }
  %>
  <a href="index.jsp" class="w3-hover-black">Home</a>
</nav>


<!-- Overlay effect when opening sidenav on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- Main content: shift it to the right by 250 pixels when the sidenav is visible -->
<div class="w3-main" style="margin-left:250px">

  <div class="w3-row w3-padding-64">
  <%
        
        ResultSet rst2;
        rst2=db.executeSelect("select * from category");
        while(rst2.next())
        {
        String cat_name=rst2.getString(2);
        int cat_id=rst2.getInt(1);
         int pn=1;
 %>  
  
    <div class="w3-twothird w3-container">
    <a name="<%=cat_name%>"></a><h1 hidden="hidden"><%=cat_name%></h1>
     <h1 class="w3-text-teal"><%=cat_name%></h1>
      <table border="1" width="500px" style="width:500px;" cellpadding="2" cellspacing="2">
      <tr>
      <%
      	try
	{
		ResultSet rst=db.executeSelect("select * from subcategory where cat_id="+cat_id+"");
    int i=0;
   
    while(rst.next())
    {
      int subcat_id=rst.getInt(1);
      i++;
    out.print("<td><a href='index2.jsp?subcat_id="+subcat_id+"&page="+pn+"'><center><img src='subcategoryimages/"+rst.getString(4)+"' class='img img-responsive' style='width:85px;height:85px;' />"+rst.getString(2)+" </center></a></td>");
      

    if(i%4==0)
      {
                out.print("</tr><tr>");
      }
    }
        out.print("</tr>");
  }
  catch(SQLException e)
  {
    out.print(e);
  }

%>    

</table>
    
    </div>
    <div class="w3-third w3-container">
      <p class="w3-border w3-padding-large w3-padding-32 w3-center"><img src="images/7.jpg" style="height:90px;"></p>
      <p class="w3-border w3-padding-large w3-padding-64 w3-center"><img src="images/6.jpg" style="height:90px;"></p>
            
    </div>

    <%
      }
    %>
    
    <div class="w3-third w3-container">
    </div>
  </div>




  <!-- Pagination 
  <div class="w3-center w3-padding-64">
    <ul class="w3-pagination">
      <li><a class="w3-black" href="#">1</a></li>
      <li><a class="w3-hover-black" href="#">2</a></li>
      <li><a class="w3-hover-black" href="#">3</a></li>
      <li><a class="w3-hover-black w3-hide-small" href="#">4</a></li>
      <li><a class="w3-hover-black w3-hide-small" href="#">5</a></li>
      <li><a class="w3-hover-black" href="#">»</a></li>
    </ul>
  </div>-->

  <footer id="myFooter">
    <div class="w3-container w3-theme-l1">
      <p><a href="contact.jsp">Contacts</a> | <a href="aboutus.jsp">About Us</a></p>
    </div>
  </footer>

<!-- END MAIN -->
</div>

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


