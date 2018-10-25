<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap Theme Company Page</title>
<%@ include file="../../../../../../../temp/bootstrap.jsp" %>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="60">

<%@ include file="../../../../../../../temp/header.jsp" %>



	<div class="container-fluid">
		<div class="row">
			<form action="memberJoinProcess.jsp" method="post">
				<div class="form-group">
					<label for="title">아이디:</label> <input type="text"
						class="form-control" id="id" placeholder="Enter id" name="id">
						<input class="btn btn-danger" type="button" value="중복확인" id="btn">
				</div>
				<div class="form-group">
					<label for="contents">비밀번호:</label> <input type="password"
						class="form-control" id="pw" placeholder="Enter password">
					<input type="password" class="form-control" id="pw2"
						placeholder="Enter password" name="password">
				</div>
				<div class="form-group">
					<label for="title">이름:</label> <input type="text"
						class="form-control" id="name" placeholder="Enter name"
						name="name">
				</div>
				<div class="form-group">
					<label for="title">E-mail:</label> <input type="email"
						class="form-control" id="email" placeholder="Enter email"
						name="email">
				</div>
				<div class="form-group">
					선생님<input type="radio" name="kind" value="T"> 학생<input
						type="radio" name="kind" value="S">
				</div>
				<div class="form-group">
					1학년<input type="radio" name="grade" value="1"> 
					1반<input type="radio" name="class" value="1"><br> 
					2학년<input type="radio" name="grade" value="2">
					2반<input type="radio" name="class" value="2"><br> 
					3학년<input type="radio" name="grade" value="3">  
					3반<input type="radio" name="class" value="3"><br>
				</div>
				<input id="joinBtn" type="button" class="btn btn-danger" value="가입">
				<input id="Btn" type="submit" class="btn btn-danger" value="가입">
			</form>
		</div>
	</div>
<%@ include file="../../../../../../../temp/footer.jsp" %>
</body>
</html>