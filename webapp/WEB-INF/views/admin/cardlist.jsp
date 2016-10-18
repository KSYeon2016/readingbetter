<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>
<head>
<title>ReadingBetter_Admin</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/readingbetter/assets/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="/readingbetter/assets/css/board.css" rel="stylesheet" type="text/css">
<link href="/readingbetter/assets/css/admin.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container-fluid">
		<c:import url='/WEB-INF/views/admin/header.jsp' />
		<br>
		<br>
		<h4>카드</h4>
		<form id="search_form" action="" method="post">
			<input type="text" id="title" name="title">
			<input type="submit" value="찾기">
		</form>
		<div id="button-set">
 			<a href="/readingbetter/admin/cardaddform" class="btn btn-default">추가</a>
 		</div>
		<table class="table table-bordered" id="board">
			<tr class="active">
				<th>번호</th>
				<th>사진</th>
				<th>이름</th>
				<th>능력</th>
				<th>점수</th>
				<th>수정 / 삭제</th>
			</tr>
			<c:forEach items="${getCardList}" var="cardVo">
				<tr>
					<td>${cardVo.no }</td>
					<td><img id="img-card" class="img-thumbnail" src="${cardVo.cover}" /></td>
					<td>${cardVo.title }</td>
					<td>${cardVo.skill }</td>
					<td>${cardVo.bonus }</td>
					<td>
						<a href="/readingbetter/admin/cardmodifyform?no=${cardVo.no }" class="btn btn-default">수정</a>
						<a href="/readingbetter/admin/cardlist/delete?no=${cardVo.no }" class="btn btn-default">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>