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

<link href="/readingbetter/assets/css/ranking.css" rel="stylesheet"	type="text/css">
</head>
<body>
<input type="hidden" class="category" value="monthlygrade-grade-${param.grade }">

<c:import url='/WEB-INF/views/include/header.jsp' />
	
<div id="wrap">

	<div id="menu">
		<c:import url='/WEB-INF/views/include/navi_ranking.jsp' />
	</div>
	
	<div id="cont">
		<div id="basic-menu">
			<div class="small-menu">
				<a href="/readingbetter/main">홈</a> > 
				<a href="/readingbetter/ranking/summary">순위</a> > 
				<a href="/readingbetter/ranking/monthlygrade">이번 달 학년 순위</a> > 3학년
			</div>
		</div>
		
		<div id="monthlygrade">
			<div id="rank-table" class="col-lg-6">
				<c:choose>
					<c:when test="${param.grade ne 0 }">
						<P id="title">이번 달 학년 순위 - ${param.grade }학년</P>
					</c:when>
					<c:otherwise>
						<P id="title">일반 회원 순위</P>
					</c:otherwise>
				</c:choose>
				<br>

				<table class="table">
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
					<c:forEach items="${monthlygrade }" var="scoresvo">
						<c:choose>
							<c:when test="${scoresvo.id == authUser.id }">
								<tr class="warning">
									<td>${scoresvo.rank }</td>
									<td>${scoresvo.id }</td>
									<td>${scoresvo.score }</td>
								<tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td>${scoresvo.rank }</td>
									<td>${scoresvo.id }</td>
									<td>${scoresvo.score }</td>
								<tr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</table>
				<br>

				<c:if test="${monthlyMyGradeRank.grade eq param.grade}">
					<div id="mygraderank">
						<p id="title">나의 순위</p>
						<br>
						<table class="table">
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
							<tr>
								<td>${monthlyMyGradeRank.rank }</td>
								<td>${monthlyMyGradeRank.id }</td>
								<td>${monthlyMyGradeRank.score }</td>
							</tr>
						</table>
					</div>
				</c:if>
				<br>
			</div>
		</div>
	</div>
</div>
	
<c:import url='/WEB-INF/views/include/footer.jsp' />

</body>
</html>