<%@page import="com.jhj.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    int num = Integer.parseInt(request.getParameter("num"));
    NoticeDAO dao = new NoticeDAO();
    int result = dao.delete(num);
    String str = "삭제 완료";
    if(result == 0)
    	str="살제 실패";
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert('<%=str%>');
	location.href="./noticeList.jsp";
</script>
</head>
<body>

</body>
</html>