<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>
<head>
<title>ReadingBetter</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">

<!-- 공통 -->
<script type="text/javascript" src="/readingbetter/assets/js/jquery/jquery-3.1.0.js"></script>
<script type="text/javascript" src="/readingbetter/assets/dist/js/bootstrap.js"></script>
<link href="/readingbetter/assets/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<!-- /공통 -->

<link href="/readingbetter/assets/css/board.css" rel="stylesheet" type="text/css">
<link href="/readingbetter/assets/css/book.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/readingbetter/assets/js/notice_accusation.js"></script>
</head>
<body>
<input type="hidden" class="category" value="notice">

<c:import url='/WEB-INF/views/include/header.jsp' />
	
<div id="wrap">

	<div id="menu">
		<c:import url='/WEB-INF/views/include/navi_service.jsp' />
	</div>
	
	<div id="cont">
		<div id="review">
			<div class="small-menu">
				<a href="/readingbetter/main">홈</a> > 
				<a href="/readingbetter/service/noticelist">고객센터</a> > 
				<a href="/readingbetter/service/noticelist">공지</a> > 신고
			</div>

			<p class="menu-title">신고</p>
			<br>

			<div>
				<form method="post" action="../insertComments" id="comments-accusation">
					<input type="hidden" name="keyNo" value="${vo.no }">
					<input type="hidden" name="memberNo" value="${authUser.no }">

					<table id="board" class="table table-bordered">
						<tr>
							<th class="active" colspan=5>부당하게 신고할 시 본인에게 불이익이 있을 수 있습니다</th>
						</tr>
						<tr>
							<th class="active">신고자</th>
							<td colspan=2>${authUser.id }</td>
							<th class="active">피신고자</th>
							<td colspan=2>${vo.id }</td>
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
							<td id="content" colspan=6>
								<input name="reason" type="text" class="form-control">
							</td>
						</tr>
					</table>
								
					<div id="buttons">
						<button type="submit" class="btn btn-default">제출</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
	
<c:import url='/WEB-INF/views/include/footer.jsp' />

</body>
</html>