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
<script type="text/javascript" src="/readingbetter/assets/js/jquery/jquery-3.1.0.js"></script>
<script type="text/javascript" src="/readingbetter/assets/js/accusationview.js"></script>
</head>
<body>
<input type="hidden" name="no" value="${vo.no }">
<input type="hidden" name="accuTarget" value="${vo.accuTarget }">
<input type="hidden" name="id" value="${vo.id }">
<input type="hidden" name="keyNo" value="${vo.keyNo }">
<input type="hidden" name="identity" value="${vo.identity }">
	<c:import url='/WEB-INF/views/admin/header.jsp' />
	<br>
	<br>
	<h4>신고 글 내용</h4>
	<br>
	<div>
		<table id="board" class="table table-bordered">
			<tr>
				<c:choose>
					<c:when test="${vo.identity == 0}">
						<th class="active">신고자</th>
						<td colspan=5>${vo.id }</td>
					</c:when>
					<c:otherwise>
						<th class="active">신고자</th>
						<td colspan=2>${vo.id }</td>
						<th class="active">피신고자</th>
						<td colspan=2>${vo.accuTarget }</td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<th class="active">종류</th>
				<td>
					<c:choose>
						<c:when test="${vo.identity == 0}">퀴즈</c:when>
                        <c:when test="${vo.identity == 1}">리뷰</c:when>
                        <c:when test="${vo.identity == 2}">댓글</c:when>
                     </c:choose>
				</td>
				<th class="active">승인 여부</th>
				<td>
				 <c:choose>
                        <c:when test="${vo.accept == 0}">대기</c:when>
                        <c:when test="${vo.accept == 1}">승인</c:when>
                        <c:when test="${vo.accept == 2}">반려</c:when>
                     </c:choose>
				</td>
				<th class="active">신고일</th>
				<td>${vo.regDate }</td>
			</tr>
			<tr>
				<th  class="active" colspan=6>글 내용</th>
			</tr>
			<tr>
				<td id="content" colspan=6>${vo.content }</td>
			</tr>
			<tr>
				<th  class="active" colspan=6>신고 이유</th>
			</tr>
			<tr>
				<td id="content" colspan=6>${vo.reason }</td>
			</tr>
			<c:if test="${vo.accept == 0}">
				<tr>
	            	<td class="active">승인여부</td>
	            	<td colspan="5">
	               		<label class="radio-inline">
	                    	<input type="radio" name="accept" value=1>승인
	               		</label>
	               		<label class="radio-inline">
	                    	<input type="radio" name="accept" value=2>반려
	               		</label>
		           		<label class="radio-inline">
		                  	<input type="radio" name="accept" value=3>패널티
		           		</label>
	            	</td>
	         	</tr>
         	</c:if>
		</table>
			
		<div id="buttons">
			<a href="/readingbetter/admin/accusationlist" class="btn btn-default">목록</a>
			<c:if test="${vo.accept == 0}">
				<input class="btn btn-default" type="button" id="btn-accept" value="완료">
			</c:if>
		</div>
	</div>
</body>
</html>