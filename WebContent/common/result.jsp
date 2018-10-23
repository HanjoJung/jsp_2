<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String str = request.getAttribute("message").toString();
    String url = request.getAttribute("path").toString();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert('<%=str%>');
	location.href="<%=url%>";
</script>
</head>
<body>

</body>
</html>