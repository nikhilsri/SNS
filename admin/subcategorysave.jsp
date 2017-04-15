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
	olx.SubCategory s1=new olx.SubCategory();
	int subcat_id=Integer.parseInt(request.getParameter("subcat_id"));
	String user_id=request.getParameter("user_id");
	
	String itemName="",subcatId="", subcatName="", catId="";
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
						itemName=subcat_id+itemName.substring(itemName.lastIndexOf("."));

						savedFile = new File(config.getServletContext().getRealPath("/")+"subcategoryimages/"+itemName);
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
				if(fieldname.equals("subcat_id"))
					subcatId=fieldvalue;
				if(fieldname.equals("subcat_name"))
					subcatName=fieldvalue;
				if(fieldname.equals("cat_id"))
					catId=fieldvalue;
			}
		}
	}
	int cat_id=Integer.parseInt(catId);
	s1.addRecord(subcat_id, subcatName, cat_id, itemName);
	
%>
<jsp:forward page="subcategory.jsp"></jsp:forward>
</body>
</html>