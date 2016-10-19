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
<input type="hidden" class="category" value="monthlyschool">

<c:import url='/WEB-INF/views/include/header.jsp' />
	
<div id="wrap">

	<div id="menu">
		<c:import url='/WEB-INF/views/include/navi_ranking.jsp' />
	</div>
	
	<div id="cont">
		<div id="basic-menu">
			<div class="small-menu">
				<a href="/readingbetter/main">홈</a> > 
				<a href="/readingbetter/ranking/summary">순위</a> > 이번 달 학교 순위
			</div>
		</div>
		
		<div id="monthlyschool">
			<div id="rank-table" class="col-lg-6">
				<P id="title">이번 달 학교 순위</P>
				<br>
				<table class="table">
					<colgroup>
						<col width="20%" />
						<col width="40%" />
						<col width="40%" />
					</colgroup>
					<tr class="active">
						<th>순위</th>
						<th>학교명</th>
						<th>점수</th>
					</tr>
					<c:forEach items="${monthlySchool }" var="rankingvo">
						<c:choose>
							<c:when test="${mySchoolRank.title == rankingvo.title }">
								<tr class="warning">
									<td>${rankingvo.rank }</td>
									<td>${rankingvo.title }</td>
									<td>${rankingvo.schoolScore }</td>
								<tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td>${rankingvo.rank }</td>
									<td>${rankingvo.title }</td>
									<td>${rankingvo.schoolScore }</td>
								<tr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</table>

				<br>
				<p id="title">우리 학교 순위</p>
				<br>
				<table class="table">
					<colgroup>
						<col width="20%" />
						<col width="40%" />
						<col width="40%" />
					</colgroup>
					<tr class="active">
						<th>순위</th>
						<th>학교명</th>
						<th>점수</th>
					</tr>
					<c:choose>
						<c:when test="${not empty sessionScope.authUser}">
							<c:choose>
								<c:when test="${mySchoolRank ne null}">
									<tr>
										<td>${mySchoolRank.rank }위</td>
										<td>${mySchoolRank.title }</td>
										<td>${mySchoolRank.mySchoolScore }</td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan=3>회원님의 학교 정보가 없습니다</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<td colspan=3>로그인이 필요한 기능입니다</td>
						</c:otherwise>
					</c:choose>
				</table>
				<br>
			</div>
		</div>
	</div>
</div>
	
<c:import url='/WEB-INF/views/include/footer.jsp' />

</body>
</html>