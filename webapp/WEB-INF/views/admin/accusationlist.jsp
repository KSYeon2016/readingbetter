<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ReadingBetter_Admin</title>
<link href="/readingbetter/assets/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="/readingbetter/assets/css/admin.css" rel="stylesheet" type="text/css">
<link href="/readingbetter/assets/css/board.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:import url='/WEB-INF/views/admin/header.jsp' />
	<div>
		<br> <br>
		<h4>신고</h4>
		<br>
		<div>
			<table id="board" class="table table-bordered">
				<tr class="active">
					<th>번호</th>
					<th>종류</th>
					<th>신고자</th>
					<th>신고일</th>
					<th>승인</th>
				</tr>
				<c:forEach var='vo' items='${accusationlist}' varStatus='s'>
					<tr>
						<td>${vo.no}</td>
						<td>
							<c:choose>
								<c:when test="${vo.identity == 0}">퀴즈</c:when>
		                        <c:when test="${vo.identity == 1}">리뷰</c:when>
		                        <c:when test="${vo.identity == 2}">댓글</c:when>
	               			</c:choose>
						</td>
						<td>${vo.id }</td>
						<td>${vo.regDate }</td>
						<td><a href="/readingbetter/admin/accusationview/${vo.no}">
								<c:choose>
									<c:when test="${vo.accept == 0}">대기</c:when>
									<c:when test="${vo.accept == 1}">승인</c:when>
									<c:when test="${vo.accept == 2}">반려</c:when>
								</c:choose>
						</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>