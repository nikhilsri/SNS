<%@ page session="false" %>
<html>
	<body>
<%
	HttpSession session=request.getSession(false);
	session.removeAttribute("user_id");
	session.removeAttribute("user_name");
	session.removeAttribute("user_type");
	session.invalidate();
%>
<jsp:forward page="index.jsp"></jsp:forward>
	</body>
</html>