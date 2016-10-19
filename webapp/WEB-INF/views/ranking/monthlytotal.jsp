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

<link href="/readingbetter/assets/css/ranking.css" rel="stylesheet" type="text/css">
</head>
<body>
<input type="hidden" class="category" value="monthlytotal">

<c:import url='/WEB-INF/views/include/header.jsp' />
	
<div id="wrap">

	<div id="menu">
		<c:import url='/WEB-INF/views/include/navi_ranking.jsp' />
	</div>
	
	<div id="cont">
		<div id="basic-menu">
			<div class="small-menu">
				<a href="/readingbetter/main">홈</a> > 
				<a href="/readingbetter/ranking/summary">순위</a> > 이번 달 전체 순위
			</div>
		</div>
		
		<div id="monthlytotal">
			<div id="rank-table" class="col-lg-6">
				<P id="title">이번 달 전체 순위</P><br>						
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
					<c:forEach items="${monthlyRank }" end="11" var="rankingvo">
						<c:choose>
							<c:when test="${rankingvo.id == authUser.id }">
								<tr class="warning">
									<td>${rankingvo.rank }</td>
									<td>${rankingvo.id }</td>
									<td>${rankingvo.monthlyScore }</td>
								<tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td>${rankingvo.rank }</td>
									<td>${rankingvo.id }</td>
									<td>${rankingvo.monthlyScore }</td>
								<tr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</table><br>
						
				<p id="title">나의 순위</p><br>
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
						<c:choose>
							<c:when test="${not empty sessionScope.authUser}">
								<td>${myMonthlyRank.rank }</td>
								<td>${myMonthlyRank.id }</td>
								<td>${myMonthlyRank.myMonthlyScore }</td>
							</c:when>
							<c:otherwise>
								<td colspan=3>로그인이 필요한 기능입니다</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</table><br>
			</div>
		</div>
	</div>
</div>
	
<c:import url='/WEB-INF/views/include/footer.jsp' />

</body>
</html>