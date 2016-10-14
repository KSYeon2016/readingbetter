<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ReadingBetter_Admin</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/readingbetter/assets/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="/readingbetter/assets/css/admin.css" rel="stylesheet" type="text/css">
<link href="/readingbetter/assets/css/board.css" rel="stylesheet" type="text/css">
<link href="/readingbetter/assets/css/shop.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:import url='/WEB-INF/views/admin/header.jsp' />
	<br>
	<br>
	<h4>상품 목록</h4>
	<form id="search_form" action="/readingbetter/admin/shoplist" method="post">
		<input type="text" id="title" name="title"> <input type="submit" value="찾기">
	</form>
	
	<div id="board">
		<div id="button-set">
			<a href="shopaddform" class="btn btn-default">추가</a>
		</div>
		<br>
		<table id="shopgoods" class="table table-bordered">
			<thead>
				<tr class="active">
					<th>번호</th>
					<th>사진</th>
					<th>상품명</th>
					<th>가격</th>
					<th></th>
				</tr>
			</thead>
			<c:forEach items="${getGoodsList}" var="shopVo">
				<tbody>
					<tr>
						<td>${shopVo.no}</td>
						<td><img id="img-shop" class="img-thumbnail" src="${shopVo.cover}" /></td>
						<td>${shopVo.title}</td>
						<td>${shopVo.price}</td>
						<td>
							<a href="/readingbetter/admin/shoplist/modifyform?no=${shopVo.no}">수정</a>
							<a href="/readingbetter/admin/shoplist/delete?no=${shopVo.no}">삭제</a>
						</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>
</body>
</html>