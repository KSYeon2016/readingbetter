<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>
<head>
<title>문의 게시판</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">

<!-- 공통 -->
<script type="text/javascript" src="/readingbetter/assets/js/jquery/jquery-3.1.0.js"></script>
<script type="text/javascript" src="/readingbetter/assets/dist/js/bootstrap.js"></script>
<link href="/readingbetter/assets/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<!-- /공통 -->

<link href="/readingbetter/assets/css/board.css" rel="stylesheet" type="text/css">
</head>
<body>
<input type="hidden" class="category" value="question">

<c:import url='/WEB-INF/views/include/header.jsp' />
	
<div id="wrap">

	<div id="menu">
		<c:import url='/WEB-INF/views/include/navi_service.jsp' />
	</div>
	
	<div id="cont">
		<div id="questionview">
			<div class="small-menu">
				<a href="/readingbetter/main">홈</a> > 
				<a href="/readingbetter/service/noticelist">고객센터</a> > 
				<a href="/readingbetter/service/questionlist"> 문의 게시판 </a> > 글보기
			</div>

			<p class="menu-title">문의 게시판</p>

			<div id="board">
				<table id="board" class="table table-bordered">
					<tr>
						<th class="active">제목</th>
						<td>${contents.title }</td>
					</tr>
					<tr>
						<th class="active" colspan=2>내용</th>
					</tr>
					<tr>
						<td id="content" colspan=2>${contents.content }</td>
					</tr>
				</table>

				<div id="buttonalign">
					<a href="/readingbetter/service/questionlist" class="btn btn-default">목록</a>
					<c:if test="${not empty sessionScope.authUser}">
						<c:if test="${authUser.position eq 0 }">
							<c:if test="${contents.position eq 1}">
								<c:if test="${contents.accept eq 0 }">
									<a href="/readingbetter/service/questioncomment?no=${contents.no }" class="btn btn-default">답글 작성</a>
								</c:if>
								<br>
								<br>
							</c:if>
						</c:if>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>
	
<c:import url='/WEB-INF/views/include/footer.jsp' />

</body>
</html>