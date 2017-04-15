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
<body>
<%@ include file="header.jsp" %>  
  <%@ include file="footer.jsp" %> 
<div class="container">


<div style="width:100%; margin:0px auto; padding:0px; position:relative; margin-top:60px;">

     
<iframe width="100%" height="300" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.co.in/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Matrix+Computers,+Mansarovar,+Jaipur,+Rajasthan&amp;aq=1&amp;oq=matrix+computers,+Ma&amp;sll=20.98352,82.752628&amp;sspn=45.240231,56.513672&amp;ie=UTF8&amp;hq=Matrix+Computers,&amp;hnear=Mansarovar,+Jaipur,+Rajasthan&amp;ll=26.875447,75.748375&amp;spn=0.02159,0.027595&amp;t=m&amp;z=14&amp;iwloc=A&amp;cid=8255865241495908687&amp;output=embed"></iframe>

</div>
<div class="jumbotron">
  <div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">Contact Us</h3>
  </div>
  <div class="panel-body">
    <form  action="" method="post" > 
<table class="tablefield" cellspacing='0' cellpadding=0 style=" width:100%">  
<tr><td>
<div id='success'>
<center>
<table align=center class="innertable" cellspacing='3' style="height:400px; width:95%; border:none;">
 <tr><td colspan=2 align=left class="registerfrm"><b>Contact Form</b><hr></td><td align=left class="registerfrm"><b>Our Address</b><hr></td></tr>
 <tr><td width="10%">Name </td>
      <td width="40%"> <input type='text' name='name' class="pop_txt" required pattern="[a-zA-Z]+" title="Please enter only alphabets" placeholder="Enter Name" /></td>
      <td rowspan="5">
      <Table width="95%" style="margin-left:20px;">
      <tr> <td><strong> Training &amp; Developement Office</strong></td></tr>
      <tr><td>MATRIX COMPUTERS<br />
   <strong> Address: </strong>10/564, Opp. Kaveri Appartments,<br />Near K.L. Saini Cricket Stadium,<br />Kaveri Path, Mansarovar,<br/> Jaipur-302020, Rajasthan (INDIA)<br />
<strong>E-Mail:</strong><a href="mailto:matrix.computers@ymail.com">matrix.computers@ymail.com</a><BR/>
<strong>Mob no.</strong>+91-9414930104, +91-9414752750<br />
<strong>Director :</strong>Kamal Bhatia (+91-9414244351),<br/>
<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>           Divya Bhatia (+91-9828445536)<br />
<strong>Phone no. </strong>0141-2399633 <br /></td></tr>
      </Table>

      </td>
    </tr>
  <tr> <td>Email</td> 
  <td> <input type='email' name='email'  required  title="Please enter valid email id" placeholder="Enter Email Id" /></td></td> </tr>
  <tr> <td>Qualification</td> 
  <td><input type='text' name='education'  required  placeholder="Enter Current Education" /></td> </tr>
   
<tr><td> Contact No. </td>
      <td> <input type='text' name='contact'  required  placeholder="Enter Mobile No" pattern="[0-9]{10,11}" title="Please enter correct Mobile no "/></td>
    </tr>
      <tr><td>Message </td>
      <td> <textarea rows="5" name="msg" placeholder="Enter Some Text"> </textarea></td>
    </tr>
 <tr> <td colspan="2">
<input type="submit" value="Submit Details" class="btn btn-primary" name="submit"/><a style="color:#F00"><?php error_reporting(E_ERROR); echo $msg;?> </a>
</td></tr>
  </td> </tr>
</table></center>
</div>
</td>
</tr>
</table>
</form>

  </div>
</div>
</div>

 
<br><br><br><br><br><br>  
</div>
</body>


   <script src="js/jquery1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</html>