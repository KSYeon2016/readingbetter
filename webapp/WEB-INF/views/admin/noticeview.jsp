<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute( "newLine", "\n" );
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ReadingBetter_Admin</title>
<link href="/readingbetter/assets/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="/readingbetter/assets/css/board.css" rel="stylesheet" type="text/css">
<link href="/readingbetter/assets/css/admin.css" rel="stylesheet" type="text/css">
</head>
<body>
<c:import url='/WEB-INF/views/admin/header.jsp'></c:import>
<h4>공지 보기</h4>
	<div id="board">
		<table class="table table-bordered">
			<tr>
				<td class="active">제목</td>
				<td colspan=7>${vo.title }</td>
			</tr>
			<tr>
				<td class="active">작성자</td>
				<td>${vo.name }</td>
				<td class="active">조회수</td>
				<td>${vo.viewCount }</td>
				<td class="active">작성일</td>
				<td>${vo.regDate }</td>
			</tr>
			<tr>
				<td class="board-content" id="notice-content" colspan=8 rowspan=5>${fn:replace(vo.content, newLine, "<br>") }</td>
			</tr>
		</table>
		
		<div id="button-set">
			<a href="/readingbetter/admin/noticelist" class="btn btn-default">목록</a>
			<a href="/readingbetter/admin/noticemodifyform/${vo.no }" class="btn btn-default">수정</a>
		</div>
	</div>
</body>
</html>