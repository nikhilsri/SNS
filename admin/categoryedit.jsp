<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
<%@ page import="olx.*" %>
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
	olx.Category s1=new olx.Category();
	int cat_id=Integer.parseInt(request.getParameter("cat_id"));
	
	String itemName="", cat_name="";
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
						itemName=cat_id+itemName.substring(itemName.lastIndexOf("."));

						savedFile = new File(config.getServletContext().getRealPath("/")+"/categoryimages/"+itemName);
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
				if(fieldname.equals("cat_name"))
					cat_name=fieldvalue;
				
			}
		}
	}

	
	int cnt=s1.updateRecord(cat_id , cat_name, itemName); 

	if(cnt>0){
%>
<jsp:include page="category.jsp">
		<jsp:param value="display" name="mode"/>
	</jsp:include>

<%
	}
	else 
	{

%>
		<h1>Sorry Data is Not Saved</h1>
		<% } %>
</body>
</html>