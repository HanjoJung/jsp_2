<%@page import="com.jhj.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//MemberDTO dto = (MemberDTO) session.getAttribute("member");
%>
<jsp:useBean id="member" scope="session" class="com.jhj.member.MemberDTO"></jsp:useBean>
<jsp:getProperty property="*" name="member"/>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<title>Bootstrap Theme Company Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../temp/bootstrap.jsp" %>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="60">
<%@ include file="../temp/header.jsp" %>

	<div class="container-fluid">
		<div class="row" align="center">
			<table class="table table-bordered table-hover" style="max-width: 700px">
				<tr>
					<td style="width: 10%">아이디</td>
					<td><jsp:getProperty property="id" name="member"/></td>
				</tr><tr>
					<td style="width: 50%">이름</td>
					<td><jsp:getProperty property="name" name="member"/></td>
				</tr><tr>
					<td style="width: 15%">E-mail</td>
					<td><jsp:getProperty property="email" name="member"/></td>
				</tr><tr>
					<td style="width: 10%">학년</td>
					<td><jsp:getProperty property="grade" name="member"/></td>
				</tr><tr>
					<td style="width: 10%">반</td>
					<td><jsp:getProperty property="ban" name="member"/></td>
				</tr>
			</table>
			<a href="./memberLogout.jsp"><button class="btn btn-danger" >로그아웃</button></a> <a
				href="./memberUpdate.jsp?id=<jsp:getProperty property="id" name="member"/>"><button class="btn btn-danger" >수정</button></a>
			<a href="./memberDelete.jsp?id=<jsp:getProperty property="id" name="member"/>"><button class="btn btn-danger" >탈퇴</button></a>
		</div>
	</div>
	
	<%@ include file="../temp/footer.jsp" %>
</body>
</html>