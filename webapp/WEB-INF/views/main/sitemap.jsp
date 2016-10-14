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

<link href="/readingbetter/assets/css/main.css" rel="stylesheet" type="text/css">
</head>
<body>

<c:import url='/WEB-INF/views/include/header.jsp' />
	
<div id="wrap">

	<div id="menu"></div>
	
	<div id="cont">
		<div id="sitemap">
			<p class="menu-title">사이트맵</p>
					
			<table class="table table-bordered">
				<colgroup>
					<col width="34%" />
					<col width="33%" />
					<col width="33%" />
				</colgroup>
				<tr class="info">
					<td>독서활동</td>
					<td>순위</td>
					<td>상점</td>
				</tr>
				<tr>
					<td>
						<a href="/readingbetter/book/booklist">책목록</a><br>ㄴ문제 풀기<br>ㄴ문제 내기
					</td>
					<td>
						<a href="/readingbetter/ranking/summary">순위 한눈에 보기</a><br>
						<a href="/readingbetter/ranking/monthlytotal">이번달 전체 순위</a><br>
						<a href="/readingbetter/ranking/monthlyschool">이번달 학교별 순위</a><br>
						<a href="/readingbetter/ranking/monthlygrade">이번달 학년별 순위</a><br>
						<a href="/readingbetter/ranking/honor">명예의 전당</a><br>
					</td>
					<td>
						<a href="/readingbetter/shop">상점</a>
					</td>
				</tr>
			</table>
					
			<table class="table table-bordered">
				<colgroup>
					<col width="34%" />
					<col width="33%" />
					<col width="33%" />
				</colgroup>
				<tr class="info">
					<c:choose>
						<c:when test="${not empty authUser }">
							<td>내정보</td>
							<td>고객 센터</td>
							<td></td>
						</c:when>								
						<c:otherwise>
							<td>고객 센터</td>
							<td></td>
							<td></td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<c:choose>
						<c:when test="${not empty authUser }">
							<td>
								<a href="/readingbetter/mypage/info">내 정보 보기</a><br>
								<a href="/readingbetter/mypage/history">내 활동</a>
							</td>
							<td>
								<a href="/readingbetter/service/noticelist">공지</a><br>
								<a href="/readingbetter/service/questionlist">문의 사항</a><br>
								<a href="/readingbetter/service/wishbooklist">희망 도서 신청</a><br>
							</td>
							<td></td>
						</c:when>
						<c:otherwise>
							<td>
								<a href="/readingbetter/service/noticelist">공지</a><br>
								<a href="/readingbetter/service/questionlist">문의 사항</a><br>
								<a href="/readingbetter/service/wishbooklist">희망 도서 신청</a><br>
							</td>
							<td></td>
							<td></td>
						</c:otherwise>
					</c:choose>
				</tr>
			</table>
		</div>
	</div>
</div>
	
<c:import url='/WEB-INF/views/include/footer.jsp' />

</body>
</html>