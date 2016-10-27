<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ReadingBetter_Admin</title>
<link href="/readingbetter/assets/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="/readingbetter/assets/css/board.css" rel="stylesheet" type="text/css">
<link href="/readingbetter/assets/css/admin.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="/readingbetter/assets/js/jquery/jquery-3.1.0.js"></script>
<script type="text/javascript" src="/readingbetter/assets/js/memberlist.js"></script>
</head>
<body>
<c:import url='/WEB-INF/views/admin/header.jsp'></c:import>
<br><br>
<h4>회원 관리</h4>
	<div id="board">
		<form action="/readingbetter/admin/memberlist" method="get">
			<input type="text" id="kwd" name="kwd" value="${param.kwd }"> 
			<input type="submit" class="btn btn-default" value="찾기">
		</form>
		<br>
		<table class="table table-bordered">
			<tr class="active">
				<th>번호</th>
				<th>아이디</th>
				<th>경고</th>
				<th>캔디</th>
				<th>삭제</th>
			</tr>
			<c:forEach var='vo' items='${list }' varStatus='s'>
				<tr>
					<td>${vo.no }</td>
					<td>${vo.id }</td>
					<td>${vo.penalty }</td>
					<td>
						<input type="hidden" class="memberNo" value="${vo.no }">
						<input type="text" class="point" value="${vo.point }">
						<button class="btn btn-default point-add">변경</button>
					</td>
					<td><a href="/readingbetter/admin/memberlist/delete/${vo.no }">삭제</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>