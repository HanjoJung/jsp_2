<%@page import="com.jhj.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	String id = request.getParameter("id");
	MemberDAO dao = new MemberDAO();
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	$(function() {
		$("#idSearch").click(function() {
		})
	})
	</script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#joinform{
	margin: 10px auto;
}
</style>
</head>
<body>

	<div id="joniform">
		<div class="form-group">
			<input type="text" class="form-inline" id="id" name="id" value="<%=id %>"> <input
				class="btn btn-danger" type="button" value="중복확인" id="idSearch">
		</div>
		<input class="btn btn-danger" type="button" value="사용하기" id="btn2">
	</div>
</body>
</html>