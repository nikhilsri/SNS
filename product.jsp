<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="olx.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
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
     	<script>
     	   function check1()
     	   {
     	   var a=document.getElementById("addtitle").value;
             if(a.trim()=="")
             {
             alert("Title  Is  Not Correct");
             return false;
             }
             var b=document.getElementById("addpic").value;
             if(b.trim()=="")
             {
             alert("Photo Is  Not Choosen");
             return false;
             }
             	var c=document.getElementById("addprice").value;
             if(c.trim()=="")
             {
             alert("Price  Is  Not Entered");
             return false;
             }
             var d=document.getElementById("adddescription").value;
             if(d.trim()=="")
             {
             alert("Description Is  Not There");
             return false;
             }
              var e=document.getElementById("adddate").value;
             if(e.trim()=="")
             {
             alert("Date Is  Not entered");
             return false;
             }
             return true;
     	    }
</script>

</head>
<body>
<%
	olx.Product p1=new olx.Product();
	int id=0;
	String mode=request.getParameter("mode");
	String user_id=request.getParameter("user_id");	
	if(mode==null)
	{
		mode="showall";
	}
	if("showall".equals(mode))
	{	%><center><%
		//p1.updateExpiry();
		if(user_id==null)
		{
%>
			<h1>No records entered!!</h1>
<%
		}
		else
		{
			//p1.updateExpiry();
			id=Integer.parseInt(user_id);
			Vector<String []> v1=new Vector<String []>();
			v1=p1.display(id);
%>
<br>
<div class="panel-group" id="accordion">
<div class="panel panel-default">
<div class="panel-heading">
<h3 class="panel-heading">
<a href="#collpaseone" data-toggle="collapse" data-parent="accordion">Product Details </a> </h3>
</div>
<div id="collpaseone" class="panel-collapse collapse in">
<div class="panel-body">
<table border="1" class="table table-bordered table-striped">
<tr>
		<td>Post Date</td>
		<td>Expiry Date</td>
		<td>Title</td>
		<td>Price</td>
		<td>Description</td>
		<td>Picture</td>
		<td>To Edit</td>
		<td>To Preview</td>
		<td>To Delete</td>
	</tr>
	
<%
			for(int i=0;i<v1.size();i++){
				String s1[]=v1.get(i);
%>
		<tr>
<%
				boolean flag=false;
				String post=s1[0];
				String expiry=s1[1];
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				Date d1 = null;
				Date d2 = null;
				long diffDays=0;
				try {
					d1 = format.parse(post);
					d2 = format.parse(expiry);

					//in milliseconds
					long diff = d2.getTime() - d1.getTime();

					//long diffSeconds = diff / 1000 % 60;
					//long diffMinutes = diff / (60 * 1000) % 60;
					//long diffHours = diff / (60 * 60 * 1000) % 24;
					diffDays = diff / (24 * 60 * 60 * 1000);

					//System.out.print(diffDays + " days, ");
					//System.out.print(diffHours + " hours, ");
					//System.out.print(diffMinutes + " minutes, ");
					//System.out.print(diffSeconds + " seconds.");

				} catch (Exception e) {
					e.printStackTrace();
				}
				if(diffDays<=3){
					flag=true;
				}
				int pid=p1.getProductId(s1[2]);
				for(int j=0;j<5;j++){
					
%>
				<td><%=s1[j]%></td>
<%
				}
%>
			<td><img src="productimages\<%=s1[5]%>" alt="picture_img" style="width:40px;height:40px" /></td>
			<td><a href="product.jsp?mode=edit&p_id=<%=pid %>&user_id=<%=id%>">Edit</a></td>
			<td><a href="product.jsp?mode=preview&p_id=<%=pid %>&user_id=<%=id%>">Preview</a></td>
			<td><a href="product.jsp?mode=delete&p_id=<%=pid %>&user_id=<%=id%>&picname=<%=s1[5] %>>">Delete</a></td>
<%
			if(diffDays<=3){
%>
				<td><a href="product.jsp?mode=updateExpiry&p_id=<%=pid %>&user_id=<%=id%>">Update</a></td>
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
<a href="product.jsp?user_id=<%=id%>&mode=add">Add new Product </a>
&nbsp;&nbsp; |  &nbsp;&nbsp;
<a href="dashboard.jsp?user_id=<%=id%>">Go Back To Dashboard </a></center>
<%
		}
%>
<%		
	}
	else if("edit".equals(mode))
	{
		String b=request.getParameter("p_id");
		int pid=Integer.parseInt(b);
		
		String c=request.getParameter("user_id");
		id=Integer.parseInt(c);
		String s2[]=new String[5];
		s2=p1.displayProduct(pid);
		int ids[]=p1.getIds(pid);
		System.out.println(ids[0]+","+ids[1]+","+ids[2]);
		String cat1=p1.getCatName(ids[0]);
		System.out.println(cat1);
		String subcat1=p1.getSubCatName(ids[1]);
		System.out.println(subcat1);
		String brand1=p1.getBrandName(ids[2]);
		System.out.println(brand1);
		if(s2==null)
			System.out.println("s2 is null");
		else
			System.out.println(s2[0]+","+s2[1]+","+s2[2]+","+s2[3]+","+s2[4]);
%>
	<form action="editproduct.jsp?p_id=<%=pid %>&user_id=<%=id%>" method="post" enctype="multipart/form-data">
	<br>
<div class="panel-group" id="accordion">
<div class="panel panel-default">
<div class="panel-heading">
<h3 class="panel-heading">
<center>
<a href="#collpaseone" data-toggle="collapse" data-parent="accordion">Update Product Details </a> </h3></center>
</div>
<div id="collpaseone" class="panel-collapse collapse in">
<div class="panel-body">

	<table border="1" class="table table-bordered table-striped">
	<center>
	<tr><td>Post Date:</td><td><input type="text" name="pdate" value="<%=s2[0] %>" readonly="readonly" /></td></tr>
		<tr><td>Expiry Date:</td><td><input type="text" name="edate" value="<%=s2[1] %>" readonly="readonly" /></td></tr>
		<tr><td>Category*:</td><td><select name="category">
<%
						Vector<String> v=p1.allCategoryNames();
						Iterator itr=v.iterator();
						
						while(itr.hasNext()){
								String value=(String)itr.next();
								if(value.equalsIgnoreCase(cat1))
								{
%>
									<option value="<%=value %>" selected><%=value %></option>
<%
								}
								else
								{
%>
							<option value="<%=value %>"><%=value %></option>
<%
								}
							}
%>
			    	</select></td></tr>
		<tr><td>Sub-Category*:</td><td><select name="subcategory">
<%
						Vector<String> v1=new Vector<String>();
						v1=p1.allSubCategoryNames();
						Iterator itr1=v1.iterator();
						//int j=0;
						while(itr1.hasNext()){
							String value=(String)itr1.next();
							if(value.equalsIgnoreCase(subcat1))
							{
%>
								<option value="<%=value %>" selected><%=value %></option>
<%
							}
							else
							{
%>
						<option value="<%=value %>"><%=value %></option>
<%
							}
						}
%>
			    	</select></td></tr>
		<tr><td>Brand*:</td><td><select name="brand">
<%
						Vector<String> v2=new Vector<String>();
						v2=p1.allBrandNames();
						Iterator itr2=v2.iterator();
						
						while(itr2.hasNext()){
							String value=(String)itr2.next();
							if(value.equalsIgnoreCase(brand1))
							{
%>
								<option value="<%=value %>" selected><%=value %></option>
<%
							}
							else
							{
%>
						<option value="<%=value %>"><%=value %></option>
<%
							}
						}
%>
			    	</select></td></tr>
		<tr><td>Product Title:</td><td><input type="text" name="pname" value="<%=s2[2] %>" /></td></tr>
		
		<tr><td>Price:</td><td><input type="text" name="price" value="<%=s2[3] %>" /></td></tr>
		<tr><td>Description:</td><td><textarea name="description" /><%=s2[4] %></textarea></td></tr>
		<td colspan="2"><img src="productimages\<%=s2[5]%>" alt="picture_img" style="width:70px;height:50px" /></td>
		<tr><td>Change Image:</td><td><input type="file" name="uploadpic" size="200000" /></td></tr>
		</table>
		</div>
		</div>
		</div>
		</div>

	<center>	<input type="submit" value="update" /><br /><br />
	
	</form>
	<a href="product.jsp?mode=showall&user_id=<%=id %>">Go Back to product dashboard.</a></center>

<%		
	}
	else if("update".equals(mode)){
		int pid=Integer.parseInt(request.getParameter("p_id"));
		id=Integer.parseInt(request.getParameter("user_id"));
		int cat_id=Integer.parseInt(request.getParameter("cat_id"));
		int subcat_id=Integer.parseInt(request.getParameter("subcat_id"));
		int brand_id=Integer.parseInt(request.getParameter("brand_id"));

		String pdate=request.getParameter("pdate");
		String edate=request.getParameter("edate");
		String pname=request.getParameter("pname");
		double price=Double.parseDouble(request.getParameter("price"));
		String description=request.getParameter("description");
		int cnt=0;
		//int cnt=p1.update(pid, cat_id, subcat_id, brand_id, pname, price,description, pdate, edate);
		if(cnt>0){
%>
<h1>updated!</h1>
<a href="product.jsp?mode=showall&user_id=<%=id %>">Go Back to product dashboard.</a>
<%
		}
		else{
%>
			<h2>not updated!</h2>
			<a href="product.jsp?mode=edit&p_id=<%=pid %>&user_id=<%=id%>">Edit again</a>	
<%
		}
	
	}
	else if("delete".equals(mode)){
		int pid=Integer.parseInt(request.getParameter("p_id"));
		id=Integer.parseInt(request.getParameter("user_id"));
		p1.delete(pid);
%>
	<jsp:include page="product.jsp">
		<jsp:param value="showall" name="mode"/>
	</jsp:include>
	
<%
	}
	else if("preview".equals(mode)){
		int pid=Integer.parseInt(request.getParameter("p_id"));
		String s3[];
		s3=p1.displayProduct(pid);
%>
		<img src="productimages/<%=s3[5]%>" alt="product_img" style="width:300px;height:400px" />
		<br>
<div class="panel-group" id="accordion">
<div class="panel panel-default">
<div class="panel-heading">
<h3 class="panel-heading">
<a href="#collpaseone" data-toggle="collapse" data-parent="accordion">Product Preview</a> </h3>
</div>
<div id="collpaseone" class="panel-collapse collapse in">
<div class="panel-body">

		<table border="1" class="table table-bordered table-striped">
		<tr>
			<th>PostDate</th>
			<th>ExpiryDate</th>
			<th>ProductName</th>
			<th>Price</th>
			<th>Description</th>
			<th>Picture Name</th>
		</tr>
		<tr>
<%
			for(int i=0;i<s3.length;i++){
%>
			<td><%=s3[i]%></td>
<%
			}
%>
		</tr>
		</table>
		</div>
		</div>
		</div>
		</div>
		<a href="product.jsp?mode=showall&user_id=<%=user_id %>">Go Back</a>
<%
	}
	else if("updateExpiry".equals(mode)){
		String b=request.getParameter("p_id");
		int pid=Integer.parseInt(b);
		System.out.println(b+" "+pid);
		String b1=request.getParameter("user_id");
		int uid=Integer.parseInt(b1);
		System.out.println(b1+" "+uid);
		
		//to convert input string date to calendar object
		String edate=p1.expiry(pid);
		System.out.println(edate);
		String a[]=edate.split("-");
		Calendar expiry=Calendar.getInstance();
		expiry.set(Integer.parseInt(a[0]),Integer.parseInt(a[1])-1,Integer.parseInt(a[2]));
		System.out.println((a[0])+"-"+(a[1])+"-"+(a[2]));

		//to extend its expiry date - here getExpiry() is adding one month 
		String nexpiry=p1.getExpiry(expiry);
		System.out.println(""+nexpiry);

		//to update the table
		int cnt=p1.updateExpiry(nexpiry, pid);
		System.out.println(""+cnt);
		if(cnt>0)
		{
%>
			<h1>expiry date is updated</h1>
			<a href="product.jsp?mode=showall&user_id=<%=uid %>">Go Back to the product dashboard</a>
			
<%
		}
		else
		{
%>
			<h1>expiry date is not updated</h1>
			<a href="product.jsp?mode=showall&user_id=<%=uid %>">Go Back to the product dashboard</a>
<%
		}
	}
	else if("add".equalsIgnoreCase(mode))
	{
%>

	<form action="submitnewad.jsp?user_id=<%=user_id %>" method="post" id="usrform" enctype="multipart/form-data" onSubmit="return check1();">
	<br>
<div class="panel-group" id="accordion">
<div class="panel panel-default">
<div class="panel-heading">
<h3 class="panel-heading">
		<center><a href="#collpaseone" data-toggle="collapse" data-parent="accordion">Add Product </a> </h3>		</center>
</div>
<div id="collpaseone" class="panel-collapse collapse in">
<div class="panel-body">
		<table border="1" class="table table-bordered table-striped" width="500px" height="400px">

			<tr>
				<th align="right">Category*</th>
				<td><select name="category">
<%
						Vector<String> v=p1.allCategoryNames();
						Iterator itr=v.iterator();
						//int i=0;
						while(itr.hasNext()){
								String value=(String)itr.next();
%>
							<option value="<%=value %>"><%=value %></option>
<%
						}
%>
			    	</select>
				</td>
			</tr>
			<tr>
				<th align="right">Sub-Category*</th>
				<td><select name="subcategory">
<%
						Vector<String> v1=new Vector<String>();
						v1=p1.allSubCategoryNames();
						Iterator itr1=v1.iterator();
						//int j=0;
						while(itr1.hasNext()){
							String value=(String)itr1.next();
%>
							<option value="<%=value %>"><%=value %></option>
<%
						}
%>
			    	</select>
				</td>
			</tr>
			<tr>
				<th align="right">Brand*</th>
				<td><select name="brand">
<%
						Vector<String> v2=new Vector<String>();
						v2=p1.allBrandNames();
						Iterator itr2=v2.iterator();
						//int k=0;
						while(itr2.hasNext()){
							String value=(String)itr2.next();
%>
							<option value="<%=value %>"><%=value %></option>
<%
						}
%>
			    	</select>
				</td>
			</tr>
			<tr>
				<td>Ad Title</td>
				<td><input id="addtitle" type="text" name="adtitle" /></td>
			</tr>
			<tr>
				<th>Upload Photo</th>
				<td><input id="addpic" type="file" name="uploadpic" size="200000" /></td>
			</tr>
			<tr>
				<th>Price</th>
				<td><input id="addprice" type="text" name="price" /></td>
			</tr>
			<tr>
				<th>Description</th>
				<td><textarea id="adddescription" name="description" form="usrform" placeholder="Enter your description"></textarea></td>
			</tr>
			<tr>
				<th>Post Date</th>
				<td><input id="adddate" type="date" name="postdate" value="yyyy-mm-dd" /></td>
			</tr>

		</table>
		</div>
		</div>
		</div>
		</div>
		<center><input type="submit" value="ADD" class="btn btn-primary" /><br /><br /><br />
		<a href="product.jsp?mode=showall&user_id=<%=user_id %>">Go Back</a>
	</form>

<%
	}
%>
 <script src="js/jquery1.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>

</body>
</html>