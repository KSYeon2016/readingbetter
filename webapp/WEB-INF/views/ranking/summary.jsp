<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ReadingBetter</title>

<!-- 공통 -->
<script type="text/javascript" src="/readingbetter/assets/js/jquery/jquery-3.1.0.js"></script>
<script type="text/javascript" src="/readingbetter/assets/dist/js/bootstrap.js"></script>
<link href="/readingbetter/assets/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<!-- /공통 -->

<!-- 개별 -->
<link href="/readingbetter/assets/css/ranking.css" rel="stylesheet" type="text/css">
<!-- /개별 -->

</head>
<body>
<input type="hidden" class="category" value="summary">

<c:import url='/WEB-INF/views/include/header.jsp' />
	
<div id="wrap">

	<div id="menu">
		<c:import url='/WEB-INF/views/include/navi_ranking.jsp' />
	</div>
	
	<div id="cont">
		<div id="summary">
			<div class="small-menu">
				<a href="/readingbetter/main">홈</a> > 
				<a href="/readingbetter/ranking/summary">순위</a> > 순위 한눈에 보기/검색
			</div>

			<div id="table" class="col-lg-6">
				<p id="title">이번 달 전체 순위</p>
				<br>
				<table id="ltable" class="table">
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
					<c:forEach items="${monthlyRank }" var="scoresvo">
						<c:choose>
							<c:when test="${scoresvo.id == authUser.id }">
								<tr class="warning">
									<td>${scoresvo.rank }</td>
									<td>${scoresvo.id }</td>
									<td>${scoresvo.monthlyScore }</td>
								<tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td>${scoresvo.rank }</td>
									<td>${scoresvo.id }</td>
									<td>${scoresvo.monthlyScore }</td>
								<tr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</table>
			</div>

			<div id="table" class="col-lg-6">
				<p id="title">이번 달 학교별 순위</p>
				<br>
				<table id="rtable" class="table">
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
					<c:forEach items="${monthlySchool }" var="scoresvo">
						<tr>
							<td>${scoresvo.rank }</td>
							<td>${scoresvo.title }</td>
							<td>${scoresvo.schoolScore }</td>
						</tr>
					</c:forEach>
				</table>
			</div>

			<div id="table" class="col-lg-6">
				<p id="title">이번 달 우리 학년 순위</p>
				<br>
				<table id="ltable" class="table">
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
							<c:choose>
								<c:when test="${monthlyMyGrade ne null}">
									<c:forEach items="${monthlyMyGrade}" var="scoresvo">
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
								</c:when>
								<c:otherwise>
									<td colspan=3>회원님의 학년 정보가<br>없습니다.
									</td>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<td colspan=3>로그인 하시면<br>확인 가능합니다.
							</td>
						</c:otherwise>
					</c:choose>
				</table>
			</div>

			<div id="table" class="col-lg-6">
				<p id="title">명예의 전당</p>
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
					<c:forEach items="${honor }" end="10" var="scoresvo">
						<c:choose>
							<c:when test="${scoresvo.id == authUser.id }">
								<tr class="warning">
									<td>${scoresvo.rank }</td>
									<td>${scoresvo.id }</td>
									<td>${scoresvo.totalScore }</td>
								<tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td>${scoresvo.rank }</td>
									<td>${scoresvo.id }</td>
									<td>${scoresvo.totalScore }</td>
								<tr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</table>
				<br>
			</div>
		</div>
	</div>
</div>
	
<c:import url='/WEB-INF/views/include/footer.jsp' />

</body>
</html>