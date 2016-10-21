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
<script type="text/javascript" src="/readingbetter/assets/js/main.js"></script>
</head>
<body>

<input type="hidden" name="check-attend" value="${checkAttend }">

<c:import url='/WEB-INF/views/include/header.jsp' />
	
<div id="wrap">

	<div id="menu">
		<c:import url='/WEB-INF/views/include/navi_main.jsp' />
	</div>
	
	<div id="cont">
		<div id="main">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-6">
						<div id="today_book_box">
							<h4>오늘의 책</h4>
							<div id="carousel-today-book" class="carousel slide" data-ride="carousel">
								<!-- Indicators -->
								<ol class="carousel-indicators">
									<li data-target="#carousel-today-book" data-slide-to="0" class="active"></li>
									<li data-target="#carousel-today-book" data-slide-to="1"></li>
									<li data-target="#carousel-today-book" data-slide-to="2"></li>
									<li data-target="#carousel-today-book" data-slide-to="3"></li>
									<li data-target="#carousel-today-book" data-slide-to="4"></li>
								</ol>

								<!-- Wrapper for slides -->
								<div class="carousel-inner" role="listbox">
									<c:forEach var='vo' items='${todayBookList }' varStatus='s'>
										<c:choose>
											<c:when test="${s.index == 0 }">
												<div class="item active">
													<a href="/readingbetter/book/booklist?bkwd=${vo.title }">
														<img class="today-book" src="${vo.cover }" alt="${vo.title }">
													</a>
													<div class="carousel-caption today-book-title">${vo.title }</div>
												</div>
											</c:when>
											<c:otherwise>
												<div class="item">
													<a href="/readingbetter/book/booklist?bkwd=${vo.title }">
														<img class="today-book" src="${vo.cover }" alt="${vo.title }">
													</a>
													<div class="carousel-caption today-book-title">${vo.title }</div>
												</div>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</div>

								<!-- Controls -->
								<a class="left carousel-control" href="#carousel-today-book" role="button" data-slide="prev">
									<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
									<span class="sr-only">Previous</span>
								</a>
								<a class="right carousel-control" href="#carousel-today-book" role="button" data-slide="next">
									<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
									<span class="sr-only">Next</span>
								</a>
							</div>
						</div>

						<div id="notice_box">
							<h4>공지</h4>
							<ul id="notice_list">
								<c:forEach items="${listrecent }" var="noticevo">
									<li>
										<a href="/readingbetter/service/noticeview/${noticevo.no }">${noticevo.title }</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>

					<div class="col-lg-6">
						<div>
							<div id="ranking_box" class="tab-box2">
								<h4>순위</h4>
								<div id="carousel-ranking" class="carousel slide" data-ride="carousel">
									<!-- Wrapper for slides -->
									<div class="carousel-inner" role="listbox">
										<div class="item active">
											<div id="main_totalrank">
												<label>이 달의 Top 5</label>
												<table class="table rank">
													<tr class="active">
														<th>순위</th>
														<th>아이디</th>
														<th>점수</th>
													</tr>
													<c:forEach items="${monthlyMainRank }" var="scoresvo">
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
											
											<div id="main_honorrank">
												<label>명예의 전당 Top 5</label>
												<table class="table rank">
													<tr class="active">
														<td id="mtrtext">순위</td>
														<td id="mtrtext">아이디</td>
														<td id="mtrtext">점수</td>
													</tr>
													<c:forEach items="${mainHonor }" var="scoresvo">
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
											</div>
										</div>
										
										<div class="item">
											<div id="main_schoolrank">
												<label>이 달의 학교 Top 5</label>
												<table class="table rank">
													<tr class="active">
														<th>순위</th>
														<th>학교명</th>
														<th>점수</th>
													</tr>
													<c:forEach items="${mainSchool }" var="scoresvo">
														<c:choose>
															<c:when test="${mySchoolRank.title == scoresvo.title }">
																<tr class="warning">
																	<td>${scoresvo.rank }</td>
																	<td>${scoresvo.title }</td>
																	<td>${scoresvo.schoolScore }</td>
																<tr>
															</c:when>
															<c:otherwise>
																<tr>
																	<td>${scoresvo.rank }</td>
																	<td>${scoresvo.title }</td>
																	<td>${scoresvo.schoolScore }</td>
																<tr>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</table>
											</div>
											
											<div id="main_graderank">
												<c:choose>
													<c:when test="${monthlyMyGradeRank.grade eq 0 }">
														<label>일반 회원 랭킹</label>
													</c:when>
													<c:when test="${mainGrade ne null}">
														<label>이 달의 우리 학년 Top 5 - ${monthlyMyGradeRank.grade }학년</label>
													</c:when>
													<c:otherwise>
														<label>이 달의 우리 학년 Top 5</label>
													</c:otherwise>
												</c:choose>
												
												<table class="table rank">
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
																<c:when test="${mainGrade ne null}">
																	<c:forEach items="${mainGrade}" var="scoresvo">
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
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	
<c:import url='/WEB-INF/views/include/footer.jsp' />

</body>
</html>

<!-- 출석체크 모달 -->
<div id="attendModal" class="modal fade attend-modal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">출석체크</h4>
			</div>
			<div class="modal-body">
				<c:if test="${checkAttend == 0 }">
					<p>출석 확인 되었습니다.</p>
					<p>누적 출석일 : ${attCount }</p>
					<c:choose>
						<c:when test="${attCount%7 == 0 }">
							<p>출석 보너스를 받았습니다. 히스토리에서 확인하세요.</p>
						</c:when>
						<c:otherwise>
							<p>7일 출석할 때마다 캔디를 드려요 ~</p>
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${checkAttend == 1 }">
					<p>이미 오늘 출석하셨습니다.</p>
					<p>누적 출석일 : ${attCount }</p>
					<p>7일 출석할 때마다 캔디를 드려요 ~</p>
				</c:if>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" id="remove-attend">다시 보지 않기</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->