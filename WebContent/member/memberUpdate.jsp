<%@page import="com.jhj.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MemberDTO dto = (MemberDTO) session.getAttribute("member");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<title>Bootstrap Theme Company Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../../../../../../../temp/bootstrap.jsp" %>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="60">

<%@ include file="../../../../../../../temp/header.jsp" %>



	<div class="container-fluid">
		<div class="row">
			<form action="memberUpdateProcess.jsp" method="post">
				<div class="form-group">
					<input type="hidden" name="id" value="<%=dto.getId()%>">
				</div>
				<div class="form-group">
					<label for="contents">비밀번호:</label> <input type="password"
						class="form-control" id="pw"> <input type="password"
						class="form-control" id="pw2" name="password">
				</div>
				<div class="form-group">
					<label for="title">이름:</label> <input type="text"
						class="form-control" id="name" name="name"
						value="<%=dto.getName()%>">
				</div>
				<div class="form-group">
					<label for="title">E-mail:</label> <input type="email"
						class="form-control" id="email" name="email"
						value="<%=dto.getEmail()%>">
				</div>
				<div class="form-group">
					<input type="text" name="kind" class="form-control"
						value="<%if (dto.getKind().equals("T")) {%>선생님<%} else {%>학생<%}%>"
						readonly="readonly">
				</div>
				<div class="form-group">
					<input type="text" name="grade" readonly="readonly"
						class="form-control" value="<%=dto.getGrade()%>학년">
				</div>
				<div class="form-group">
					<input type="text" name="ban" readonly="readonly"
						class="form-control" value="<%=dto.getBan()%>반">
				</div>
				<input id="Btn" type="submit" class="btn btn-danger" value="수정">
			</form>
		</div>
	</div>
<%@ include file="../../../../../../../temp/footer.jsp" %>
</body>
</html>