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
	olx.SubCategory s1=new olx.SubCategory();
	int subcat_id=Integer.parseInt(request.getParameter("subcat_id"));
	
	String itemName="",cat_id="",subcat_name="";
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

						savedFile = new File(config.getServletContext().getRealPath("/")+"/subcategoryimages/"+itemName);

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
				if(fieldname.equals("cat_id"))
					cat_id=fieldvalue;
				if(fieldname.equals("subcat_name"))
					subcat_name=fieldvalue;
				
			}
		}
	}
	
	int catId=Integer.parseInt(cat_id);
	int cnt=s1.updateRecord(subcat_id , subcat_name , catId, itemName); 

	if(cnt>0){
%>
<jsp:include page="subcategory.jsp">
		<jsp:param value="display" name="mode"/>
	</jsp:include>
<% }
	else
	{
	 %>
	 <h1>Data Is Not Saved</h1>
	 <% }
	  %>



	
</body>
</html>