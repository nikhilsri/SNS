<%@ page import="olx.*" session="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
    <%@page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>SNS</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    	<!-- CUSTOM -->
    	<link href='https://fonts.googleapis.com/css?family=Oswald|Open+Sans' rel='stylesheet' type='text/css'>
    		
    		
     <link href="css/Custom.css" rel="stylesheet">
     	
     	<link href="css/font-awesome.min.css" rel="stylesheet">
      
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
DConnection dc=new DConnection();
%>
<% 
response.setHeader("Pragma","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Expires","0"); 
response.setDateHeader("Expires",-1); 
%> 



<footer class="navbar navbar-default navbar-fixed-bottom">
    <div class="container">
      <p class="navbar-text" style="color:#fff">Copyrights Reserved By Matrix Computers ..</p>
      
    </div>

  </footer>

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#"><img src="images/logo1.jpg" class="logo"></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    	
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">HOME <span class="sr-only">(current)</span></a></li>
        <li><a href="#aboutme">ABOUT</a></li>

        <li><a href="contact.jsp">CONTACT</a></li>
        <li><a href="login.jsp"><button class="btn btn-success">Sign In/Sign Up</button></a></li>
        <li><a href="admin/index.jsp"><button class="btn btn-danger">Login As ADMIN</button></a></li>


      </ul>
      
     
      <ul class="nav navbar-nav navbar-right">
        <li class="twitter"><a href="https://www.twitter.com/olxindia" target="blank"><i class="fa fa-twitter"></i></a></li>
        <li class="facebook"><a href="https://www.facebook.com/olxindia/?fref=ts" target="blank"><i class="fa fa-facebook"></i></a></li>
        
      </ul>
      
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container -->
</nav>

<!-- HEADER -->
<header class="container">
	<div class="row">
  <div class="col-sm-12">
  <div class="carousel slide" id="my-slider" data-ride="carousel">

  <ol class="carousel-indicators">
    <li class="active" datra-target="#my-slider" data-slide-to="0"></li>
    <li datra-target="#my-slider" data-slide-to="1"></li>
    <li datra-target="#my-slider" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner" role="listbox">

  <!--ITEM!-->
  <div class="item active"> 
    <img src="images/slide1.jpg">
    <div class="carousel-caption">
      
    </div>
    
  </div>
  <!-- ITEM !-->
  <div class="item">
  <img src="images/slide2.jpg">
    <div class="carousel-caption">
  </div>
    
  </div>

  <div class="item">
  <img src="images/slide3.jpg">
    <div class="carousel-caption">
  </div>
    
  </div>
    
  </div>

  <a class="left carousel-control" href="#my-slider" role="button" data-slide="prev">
  <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
  <span class="sr-only">Previous</span>

  </a>
  <a class="right carousel-control" href="#my-slider" role="button" data-slide="next">
  <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
  <span class="sr-only">Previous</span>

  </a>

	</div>
  <!--<img src="img/a.png" class="img-circle profile-picture">!-->
      <!--<h4>HELLO AND WELCOME TO MY WEBSITE!</h4>!-->
</header>



<!-- /HEADER -->



<!-- MAIN CONTENT -->
<form class="form-inline">
<div class="page-header">
<div class="form-group" style="margin-left:100px;">


<%@ include file="location.jsp" %>
</div>
<div class="form-group" >
  <%@ include file="searchbar2.html" %>


</div>
</div>
</form>
 <!-- <div class="w3-third w3-container" style="float:left;">
      <p class="w3-border w3-padding-large w3-padding-32 w3-center">AD</p>
      <p class="w3-border w3-padding-large w3-padding-64 w3-center">AD</p>
      <p class="w3-border w3-padding-large w3-padding-32 w3-center">AD</p>
      <p class="w3-border w3-padding-large w3-padding-64 w3-center">AD</p>
            
    </div>!-->


<div class="row">
	<div class="main-content container">
  
<div class="w3-main" style="margin-left:250px">

  <div class="w3-row w3-padding-64">
    <div class="w3-twothird w3-container">
 <table border="1" style="width:500px;" cellspacing="2" cellpadding="2">
      <tr>
      <%
        olx.DConnection db=new olx.DConnection();
        int i=0;
        try
  {
    ResultSet rst=db.executeSelect("select * from category");
    while(rst.next())
    {
      i++;
    out.print("<td><a href='index3.jsp?cat_id="+rst.getInt(1)+"'><center><img src='categoryimages/"+rst.getString(3)+"' class='img img-responsive' style='width:65px;height:65px;' />"+rst.getString(2)+" </center></a></td>");
    
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


    </div>

    <div class="row">
      
      <!-- ABOUT ME -->
      <a name="aboutme"></a>
          <h3>ABOUT US</h3>
          <h4>ShopNSell <small>ADD UPLOAD</small></h4>
          <p>ShopNSell is a free local classifieds site. Sell anything from used cars to mobiles, furniture, laptops, clothing and more. Submit ads for free and without creating an account. If you want to buy something - here you will find interesting items, cheaper than in the store. Start buying and selling in the most easy way on ShopNSell.</p>
        
        

	</div>

<!--
	<div class="modal fade" id="contact" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
			<form class="form-horizontal" action="mail.jsp">
				<div class="modal-header">
					<h4>CONTACT</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
					<label for="contact-name" class="col-lg-2 control-label">Name:</label>
					<div class="col-lg-10">

					<input type="text" class="form-control" id="contact-name" placeholder="Full Name">
						
					</div>
						
					</div>
					<div class="form-group">
					<label for="email" class="col-lg-2 control-label">Email:</label>
					<div class="col-lg-10">

					<input type="email" class="form-control" id="email" value="olxtest1234@gmail.com" name="email" readonly="readonly">
						
					</div>
					</div>

					<div class="form-group">
          <label for="contact-msg" class="col-lg-2 control-label">Subject</label>
          <div class="col-lg-10">

          <input type="text" class="form-control" name="subject" placeholder="Subject">
            
          </div>
          </div>

						<div class="form-group">
					<label for="contact-msg" class="col-lg-2 control-label">Message</label>
					<div class="col-lg-10">

					<textarea class="form-control" rows="8" name="msg">
						
					</textarea>	
					</div>
					</div>

				</div>
				<div class="modal-footer">
					<a class="btn btn-primary" data-dismiss="modal">Close</a>
					<button class="btn btn-danger" type="submit">Send</button>
				</div>
				</form>
			</div>
		</div>
	</div> !-->
<!-- /MAIN CONTENT -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    
   <script src="js/jquery1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>

		
	</body>
</html>