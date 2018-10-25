<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Cookie[] cookies = request.getCookies();
	String r = "";
	for (Cookie c : cookies) {
		if (c.getName().equals("remember")) {
			r = c.getValue();
			break;
		}
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<title>Bootstrap Theme Company Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../../../../../../../temp/bootstrap.jsp"%>

</head>
<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="60">

	<%@ include file="../../../../../../../temp/header.jsp"%>


	<div class="container-fluid">
		<div class="row">
			<form action="memberLoginProcess.jsp" method="post">
				<div class="form-group">
					<label for="title">아이디:</label> <input type="text"
						class="form-control" id="id" placeholder="Enter id" name="id"
						value="<%=r%>">
				</div>
				<div class="form-group">
					<label for="contents">비밀번호:</label> <input type="password"
						class="form-control" id="pw" placeholder="Enter password"
						name="password">
				</div>
				<div class="form-group">
					<input type="checkbox" name="remember" checked="checked">ID기억하기
				</div>
				<input id="Btn" type="submit" class="btn btn-danger" value="로그인">
			</form>
		</div>
	</div>
	<%@ include file="../../../../../../../temp/footer.jsp"%>
</body>
</html>