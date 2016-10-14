<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<br><br>
	<h4>상점 아이템 수정</h4>
	<form action="modify" method="post">
		<input type="hidden" name="no" value="${param.no }">
		<div id="board">
			<table class="table table-bordered">
				<tr>
					<th class="active">상품명</th>
					<td><input type="text" class="form-control" id="title" name="title" placeholder="상품명" value="${vo.title }"></td>
				</tr>
				<tr>
					<th class="active">가격</th>
					<td>
						<select id="price" name="price" class="form-control">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
					</td>
				</tr>
				<tr>
					<th class="active">사진</th>
					<td><input type="text" class="form-control" id="cover" name="cover" placeholder="경로" value="${vo.cover }"></td>
				</tr>
			</table>
			<a href="/readingbetter/admin/shoplist" class="btn btn-default">목록</a>
			<button type="submit" class="btn btn-default">수정</button>
		</div>
	</form>
</body>
</html>