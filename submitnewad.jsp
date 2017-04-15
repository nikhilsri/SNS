<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*" session="false"%>
<%@ page import="olx.*" %>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.File" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.io.output.DeferredFileOutputStream"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	Product p1=new Product();
	int user_id=Integer.parseInt(request.getParameter("user_id"));
	int id=p1.getNextPid();
	String itemName="",category="",subcategory="",brand="",adtitle="",price="",description="",postdate="";
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	if (isMultipart) 
	{
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		List items = null;
		try 
		{
			items = upload.parseRequest(request);
		} 
		catch (FileUploadException e) 
		{
			e.printStackTrace();
		}
		Iterator itr = items.iterator();
		
		while (itr.hasNext()) 
		{
			FileItem item = (FileItem) itr.next();
			if (!item.isFormField())
			{
				try 
				{
					File savedFile=null;
					if(item.getFieldName().equals("uploadpic"))
					{
						itemName=item.getName();
						itemName=id+itemName.substring(itemName.lastIndexOf("."));

						savedFile = new File(config.getServletContext().getRealPath("/")+"productimages/"+itemName);
					}
					item.write(savedFile);
				}
				catch (Exception e) 
				{
					e.printStackTrace();
				}
			}
			else
			{
				String fieldname = item.getFieldName();
				String fieldvalue = item.getString();
				if(fieldname.equals("category"))
					category=fieldvalue;
				if(fieldname.equals("subcategory"))
					subcategory=fieldvalue;
				if(fieldname.equals("brand"))
					brand=fieldvalue;
				if(fieldname.equals("adtitle"))
					adtitle=fieldvalue;
				if(fieldname.equals("price"))
					price=fieldvalue;
				if(fieldname.equals("description"))
					description=fieldvalue;
				if(fieldname.equals("postdate"))
					postdate=fieldvalue;
			}
		}
	}
	int catId=p1.getCatId(category);
	int subcatId=p1.getSubCatId(subcategory);
	int brandId=p1.getBrandId(brand);
	double price1=Double.parseDouble(price);
	String a[]=postdate.split("-");
	Calendar pdate=Calendar.getInstance();
	pdate.set(Integer.parseInt(a[0]),Integer.parseInt(a[1])-1,Integer.parseInt(a[2]));
	String expirydate=p1.getExpiry(pdate);
	int cnt=p1.add(catId, subcatId, adtitle, brandId, postdate, expirydate, user_id, price1, itemName, description);
	if(cnt>0)
	{
%>
	<jsp:include page="product.jsp">
		<jsp:param value="showall" name="mode"/>
	</jsp:include>
<%	}%>
</center>
</body>
</html>