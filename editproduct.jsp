<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
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
	int pid=Integer.parseInt(request.getParameter("p_id"));
	String itemName="",category="",subcategory="",brand="",adtitle="",price="",description="",postdate="",expirydate="";
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
						itemName=pid+itemName.substring(itemName.lastIndexOf("."));

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
				if(fieldname.equals("pname"))
					adtitle=fieldvalue;
				if(fieldname.equals("price"))
					price=fieldvalue;
				if(fieldname.equals("description"))
					description=fieldvalue;
				if(fieldname.equals("pdate"))
					postdate=fieldvalue;
				if(fieldname.equals("edate"))
					expirydate=fieldvalue;
			}
		}
	}
	int catId=p1.getCatId(category);
	int subcatId=p1.getSubCatId(subcategory);
	int brandId=p1.getBrandId(brand);
	double price1=Double.parseDouble(price);
	int cnt=p1.update(pid, catId, subcatId, brandId, itemName, adtitle, price1, description, postdate, expirydate);
	if(cnt>0){
%>
		<jsp:include page="product.jsp">
		<jsp:param value="showall" name="mode"/>
	</jsp:include>
<%
	}
	else{
%>
		<h2>not updated!</h2>
		<a href="product.jsp?mode=edit&p_id=<%=pid %>&user_id=<%=user_id%>">Edit again</a>	
<%
	}
%>

	
</body>
</html>