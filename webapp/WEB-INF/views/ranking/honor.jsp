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

<!-- 구글차트 Javascript  -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="/readingbetter/assets/js/honorgraph.js"></script>
 
<link href="/readingbetter/assets/css/ranking.css" rel="stylesheet" type="text/css">
</head>
<body>
<input type="hidden" class="category" value="honor">

<c:import url='/WEB-INF/views/include/header.jsp' />
	
<div id="wrap">

	<div id="menu">
		<c:import url='/WEB-INF/views/include/navi_ranking.jsp' />
	</div>
	
	<div id="cont">
		<div id="honor">
			<div class="small-menu">
				<a href="/readingbetter/main">홈</a> > 
				<a href="/readingbetter/ranking/summary">순위</a> > 명예의 전당
			</div>

			<div id="top3" class="col-lg-6">
				<p id="title">★ Reading Better Top 3 ★</p>
				<div id="graph"></div>

				<!-- 구글 차트로 데이터 전송 -->
				<c:forEach items="${totalTopRanker }" var="scoresvo" varStatus="status">
					<input type="hidden" name="id${status.index }" value="${scoresvo.id }">
					<input type="hidden" name="score${status.index }" value="${scoresvo.totalScore }">
				</c:forEach>
			</div>

			<!-- table -->
			<div id="honor-table" class="col-lg-6">
				<p id="title">명예의 전당 - Top 10</p>
				<br>
				<table id="rtable" class="table">
					<colgroup>
						<col width="20%" />
						<col width="40%" />
						<col width="40%" />
					</colgroup>
					<tr class="active">
						<th>순위</th>
						<th>아이디</th>
						<th>점수</th>
					</tr>
					<c:forEach items="${honor }" end="10" var="rankingvo">
						<tr>
							<td>${rankingvo.rank }</td>
							<td>${rankingvo.id }</td>
							<td>${rankingvo.totalScore }</td>
						<tr>
					</c:forEach>
				</table>
				<br> <br>
			</div>

			<div>
				<p id="title">나의 순위</p>
				<br>
				<table id="myhonor" class="table">
					<colgroup>
						<col width="20%" />
						<col width="40%" />
						<col width="40%" />
					</colgroup>
					<tr class="active">
						<th>순위</th>
						<th>아이디</th>
						<th>점수</th>
					</tr>
					<c:choose>
						<c:when test="${not empty sessionScope.authUser}">
							<tr>
								<td>${myTotalRank.rank }</td>
								<td>${myTotalRank.id }</td>
								<td>${myTotalRank.myTotalScore }</td>
							</tr>
						</c:when>
						<c:otherwise>
							<td colspan=3>로그인이 필요한 기능입니다</td>
						</c:otherwise>
					</c:choose>
				</table>
				<br> <br>
			</div>
		</div>
	</div>
</div>
	
<c:import url='/WEB-INF/views/include/footer.jsp' />

</body>
</html>