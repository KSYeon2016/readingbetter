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

<link href="/readingbetter/assets/css/book.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/readingbetter/assets/js/resultquiz.js"></script>
</head>
<body>

<input type="hidden" id="bookNo" value="${param.no }">
<input type="hidden" id="count" value="${param.count }">
<input type="hidden" id="skill" value="${cardVo.skill }">
<input type="hidden" id="bonus" value="${cardVo.bonus }">
	
<c:import url='/WEB-INF/views/include/header.jsp' />
	
<div id="wrap">

	<div id="menu">
		<c:import url='/WEB-INF/views/include/navi_book.jsp' />
	</div>
	
	<div id="cont">
		<div id="resultquiz">
			<div class="small-menu">
				<a href="/readingbetter/main">홈</a> > 
				<a href="/readingbetter/book/booklist">독서활동</a> > 
				<a href="/readingbetter/book/booklist">책목록</a> > 문제 풀기 > 결과 화면
			</div>

			<p class="menu-title">퀴즈 결과</p>
			<br>

			<form class="form-horizontal">
				<img id="img-result" class="img-thumbnail" src="${bookVo.cover }"><br>
				<table class="table">
					<tr>
						<td>제목</td>
						<td>${bookVo.title }</td>
					</tr>
					<tr>
						<td>출판사</td>
						<td>${bookVo.publisherTitle }</td>
					</tr>
					<tr>
						<td>추천 학년</td>
						<br>
						<td>${bookVo.recommend }학년</td>
					</tr>
				</table>
				<br>

				<c:choose>
					<c:when test="${complete == null }">
						<table id="result-table" class="table">
							<tr class="info">
								<td>점수</td>
								<td>캔디</td>
								<td>인증 결과</td>
							</tr>
							<tr>
								<td id="score">(${cardVo.skill}${cardVo.bonus })</td>
								<td id="point"></td>
								<td id="certResult"></td>
							</tr>
						</table><br>
								
						<div id="balls">
							<h3>당신의 포켓몬은 ?!</h3>
							<c:forEach var="i" begin="0" end="2" step="1">
								<img id="img-ball" class="img-rounded balls" src="http://ec2-52-34-170-68.us-west-2.compute.amazonaws.com/images/monsterball.png">
							</c:forEach>
							<br>
						</div>
								
						<div id="button-group">
							<a class="btn btn-default" href="/readingbetter/book/solvequizform?no=${param.no }" type="button">다시풀기</a>
							<a class="btn btn-default" href="/readingbetter/book/booklist" type="button">책 목록으로</a>
						</div>
					</c:when>
					<c:otherwise>
						<h6>퀴즈 결과는 문제를 푼 뒤에 확인할 수 있습니다.</h6>
						<a class="btn btn-default" href="/readingbetter/book/solvequizform?no=${param.no }" type="button">퀴즈풀기</a>
						<a class="btn btn-default" href="/readingbetter/book/booklist" type="button">책 목록으로</a>
					</c:otherwise>
				</c:choose>
			</form>
		</div>
	</div>
</div>
	
<c:import url='/WEB-INF/views/include/footer.jsp' />

</body>
</html>

<!-- 카드모달 -->
<div id="cardModal" class="modal fade card-modal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog card-modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">당신을 도와줄 포켓몬</h4>
			</div>
			<div class="modal-body">
				<img id="img-pokemon" class="img-rounded" src="${cardVo.cover }" >
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->