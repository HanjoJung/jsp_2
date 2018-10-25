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
<%@ include file="../../../../../../../temp/bootstrap.jsp"%>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="60">

	<%@ include file="../../../../../../../temp/header.jsp"%>

	<div class="container-fluid">

		<div class="row" align="center">
			<h1>Member List</h1>
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

			<a href="./memberJoin.jsp" style="float: left; margin-right: 10px;"><button>회원가입</button></a>
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
					</select> <input type="text" class="form-control" id="search"
						placeholder="Enter search" name="search">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form>
		</div>

		<%
			MemberDTO dto = (MemberDTO) session.getAttribute("member");
			if (dto == null) {
		%>
		<div id="row">
			<a href="./memberJoin.jsp">Join</a> <a href="./memberLogin.jsp">Login</a>
		</div>
		<%
			} else {
		%>
		<div id="row">
			<h3><%=dto.getName()%>님 환영합니다
			</h3>
			<a href="./memberLogout.jsp">Logout</a> <a href="./memberMyPage.jsp">MyPage</a>
		</div>
		<%
			}
		%>
	</div>
	<%@ include file="../../../../../../../temp/footer.jsp"%>
</body>
</html>
