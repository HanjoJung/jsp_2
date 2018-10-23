<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.jhj.member.MemberDTO"%>
<%@page import="com.jhj.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MemberDAO memberDAO = new MemberDAO();

	int curPage = 1;
	try {
		curPage = Integer.parseInt(request.getParameter("curPage"));
	} catch (Exception e) {
	}
	String kind = request.getParameter("kind");
	String search = request.getParameter("search");
	if (kind == null) {
		kind = "id";
	}
	if (search == null) {
		search = "";
	}
	int perPage = 10;
	int startPage = (curPage - 1) * perPage + 1;
	int lastPage = curPage * perPage;
	List<MemberDTO> ar = memberDAO.selectList(startPage, lastPage, kind, search);

	//1.전체 글의 갯수
	int totalCount = memberDAO.getCount(kind, search);
	//2.전체 페이지 수
	int totalPage = totalCount / perPage;
	if (totalCount % perPage != 0) {
		totalPage++;
	}

	//3.전체 블럭의 수
	int perBlock = 10;
	int totalBlock = totalPage / perBlock;
	if (totalPage % perBlock != 0) {
		totalBlock++;
	}

	//4.현재 페이지로 현재 블럭 찾기
	int curBlock = curPage / perBlock;
	if (curPage % perBlock != 0) {
		curBlock++;
	}

	//5.블럭 출력 시작과 끝지점 찾기
	int startNum = (curBlock - 1) * perBlock + 1;
	int lastNum = curBlock * perBlock;
	if (curBlock == totalBlock) {
		lastNum = totalPage;
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<title>Bootstrap Theme Company Page</title>
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
<style>
body {
	font: 400 15px Lato, sans-serif;
	line-height: 1.8;
	color: #818181;
}

h2 {
	font-size: 24px;
	text-transform: uppercase;
	color: #303030;
	font-weight: 600;
	margin-bottom: 30px;
}

h4 {
	font-size: 19px;
	line-height: 1.375em;
	color: #303030;
	font-weight: 400;
	margin-bottom: 30px;
}

.jumbotron {
	background-color: #f4511e;
	color: #fff;
	padding: 100px 25px;
	font-family: Montserrat, sans-serif;
}

.container-fluid {
	padding: 60px 50px;
}

.bg-grey {
	background-color: #f6f6f6;
}

.logo-small {
	color: #f4511e;
	font-size: 50px;
}

.logo {
	color: #f4511e;
	font-size: 200px;
}

.thumbnail {
	padding: 0 0 15px 0;
	border: none;
	border-radius: 0;
}

.thumbnail img {
	width: 100%;
	height: 100%;
	margin-bottom: 10px;
}

.carousel-control.right, .carousel-control.left {
	background-image: none;
	color: #f4511e;
}

.carousel-indicators li {
	border-color: #f4511e;
}

.carousel-indicators li.active {
	background-color: #f4511e;
}

.item h4 {
	font-size: 19px;
	line-height: 1.375em;
	font-weight: 400;
	font-style: italic;
	margin: 70px 0;
}

.item span {
	font-style: normal;
}

.panel {
	border: 1px solid #f4511e;
	border-radius: 0 !important;
	transition: box-shadow 0.5s;
}

.panel:hover {
	box-shadow: 5px 0px 40px rgba(0, 0, 0, .2);
}

.panel-footer .btn:hover {
	border: 1px solid #f4511e;
	background-color: #fff !important;
	color: #f4511e;
}

.panel-heading {
	color: #fff !important;
	background-color: #f4511e !important;
	padding: 25px;
	border-bottom: 1px solid transparent;
	border-top-left-radius: 0px;
	border-top-right-radius: 0px;
	border-bottom-left-radius: 0px;
	border-bottom-right-radius: 0px;
}

.panel-footer {
	background-color: white !important;
}

.panel-footer h3 {
	font-size: 32px;
}

.panel-footer h4 {
	color: #aaa;
	font-size: 14px;
}

.panel-footer .btn {
	margin: 15px 0;
	background-color: #f4511e;
	color: #fff;
}

.navbar {
	margin-bottom: 0;
	background-color: #f4511e;
	z-index: 9999;
	border: 0;
	font-size: 12px !important;
	line-height: 1.42857143 !important;
	letter-spacing: 4px;
	border-radius: 0;
	font-family: Montserrat, sans-serif;
}

.navbar li a, .navbar .navbar-brand {
	color: #fff !important;
}

.navbar-nav li a:hover, .navbar-nav li.active a {
	color: #f4511e !important;
	background-color: #fff !important;
}

.navbar-default .navbar-toggle {
	border-color: transparent;
	color: #fff !important;
}

footer .glyphicon {
	font-size: 20px;
	margin-bottom: 20px;
	color: #f4511e;
}

.slideanim {
	visibility: hidden;
}

.slide {
	animation-name: slide;
	-webkit-animation-name: slide;
	animation-duration: 1s;
	-webkit-animation-duration: 1s;
	visibility: visible;
}

@media screen and (max-width: 768px) {
	.col-sm-4 {
		text-align: center;
		margin: 25px 0;
	}
	.btn-lg {
		width: 100%;
		margin-bottom: 35px;
	}
}

@media screen and (max-width: 480px) {
	.logo {
		font-size: 150px;
	}
}
</style>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="60">

	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="../index.jsp">Logo</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="../notice/noticeList.jsp">NOTICE</a></li>
					<li><a href="../member/memberList.jsp">MEMBER</a></li>
					<li><a href="#portfolio">PORTFOLIO</a></li>
					<li><a href="#pricing">PRICING</a></li>
					<li><a href="#contact">CONTACT</a></li>
				</ul>
			</div>
		</div>
	</nav>


	<div class="container-fluid">

		<div class="row" align="center">
			<table class="table table-bordered table-hover">
				<tr>
					<td style="width: 5%"></td>
					<td style="width: 20%">ID</td>
					<td style="width: 15%">이름</td>
					<td style="width: 25%">이메일</td>
					<td style="width: 15%">직업</td>
					<td style="width: 10%">학년</td>
					<td style="width: 10%">반</td>
				</tr>
				<%
					for (MemberDTO memberDTO : ar) {
				%>
				<tr>
					<td><%=memberDTO.getNum()%></td>
					<td><%=memberDTO.getId()%></td>
					<td><a> <%=memberDTO.getName()%></a></td>
					<td><%=memberDTO.getEmail()%></td>
					<%
						if (memberDTO.getKind().equals("T")) {
					%>
					<td>선생님</td>
					<%
						} else {
					%>
					<td>학생</td>
					<%
						}
					%>
					<td><%=memberDTO.getGrade()%></td>
					<td><%=memberDTO.getBan()%></td>
				</tr>
				<%
					}
				%>
			</table>

			<a href="./memberJoin.jsp"
				style="float: left; margin-right: 10px;"><button>회원가입</button></a>
			<ul class="pagination" style="float: left; margin: 0;">
				<%
					if (curBlock > 1) {
				%>
				<li><a
					href="./memberList.jsp?curPage=<%=1%>&kind=<%=kind%>&search=<%=search%>"><span
						class="	glyphicon glyphicon-step-backward"></span></a></li>
				<li><a
					href="./memberList.jsp?curPage=<%=startNum - 1%>&kind=<%=kind%>&search=<%=search%>"><span
						class="glyphicon glyphicon-chevron-left"></span></a></li>
				<%
					}
					for (int i = startNum; i <= lastNum; i++) {
						if (curPage == i) {
				%>
				<li class="active"><a
					href="./memberList.jsp?curPage=<%=i%>&kind=<%=kind%>&search=<%=search%>"><%=i%></a></li>
				<%
					} else {
				%>
				<li><a
					href="./memberList.jsp?curPage=<%=i%>&kind=<%=kind%>&search=<%=search%>"><%=i%></a></li>
				<%
					}
					}
					if (curBlock < totalBlock) {
				%>
				<li><a
					href="./memberList.jsp?curPage=<%=lastNum + 1%>&kind=<%=kind%>&search=<%=search%>"><span
						class="glyphicon glyphicon-chevron-right"></span></a></li>
				<li><a
					href="./memberList.jsp?curPage=<%=totalPage%>&kind=<%=kind%>&search=<%=search%>"><span
						class="glyphicon glyphicon-step-forward"></span></a></li>
				<%
					}
				%>
			</ul>

			<form class="form-inline" action="./memberList.jsp"
				style="float: right;">
				<div class="form-group">
					<select class="form-control" id="sel1"
						style="display: inline-block;" name="kind">
						<option value="id">아이디</option>
						<option value="name">이름</option>
						<option value="email">E-mail</option>
						<option value="kind">직종</option>
						<option value="classmate">학년</option>
					</select> <input type="text" class="form-control" id="search"
						placeholder="Enter search" name="search">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form>
		</div>
	</div>
</body>
</html>
