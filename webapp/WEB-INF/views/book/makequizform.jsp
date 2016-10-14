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
<script type="text/javascript" src="/readingbetter/assets/js/makequizform.js"></script>
</head>
<body>

<c:import url='/WEB-INF/views/include/header.jsp' />
	
<div id="wrap">

	<div id="menu">
		<c:import url='/WEB-INF/views/include/navi_book.jsp' />
	</div>
	
	<div id="cont">
		<div id="makequiz">
			<div class="small-menu">
				<a href="/readingbetter/main">홈</a> > 
				<a href="/readingbetter/book/booklist">독서활동</a> > 
				<a href="/readingbetter/book/booklist">책 목록</a> > 문제 내기
			</div>

			<p class="menu-title">문제 내기</p>

			<div id="quiz-content" class="col-lg-6">
				<input type="hidden" name="no" value="${vo.no}">
				<img id="img" class="img-thumbnail" src="${vo.cover}"><br>
				<table class="table">
					<tr>
						<td>제목</td>
						<br>
						<td>${vo.title}</td>
					</tr>
					<tr>
						<td>출판사</td>
						<br>
						<td>${vo.publisherTitle }</td>
					</tr>
					<tr>
						<td>추천 학년</td>
						<br>
						<td>${vo.recommend}</td>
					</tr>
				</table>
				<br>
			</div>
					
			<div class="col-lg-6">
				<form method="post" action="../makequizinsert" id="make-quiz-form">
					<input type="hidden" name="bookNo" value="${vo.no}">					

					<div id="radio-group">
						<h4>문제</h4>
						<textarea id="quiz" name="quiz" class="form-control" rows="3"></textarea><br>
						<h6>보기1</h6>
						<input id="ex1" name="ex1" type="text" class="form-control" placeholder="Text input"><br>
						<h6>보기2</h6>
						<input id="ex2" name="ex2" type="text" class="form-control" placeholder="Text input"><br>
						<h6>보기3</h6>
						<input id="ex3" name="ex3"  type="text" class="form-control" placeholder="Text input"><br>
						<h6>보기4</h6>
						<input id="ex4" name="ex4" type="text" class="form-control" placeholder="Text input"><br>
						<h6>정답</h6>
						<select class="form-control" name="answer">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
						</select><br>
					</div>

					<button type="submit" class="btn btn-default">제출</button>
				</form>	
			</div>
		</div>
	</div>
</div>
	
<c:import url='/WEB-INF/views/include/footer.jsp' />

</body>
</html>