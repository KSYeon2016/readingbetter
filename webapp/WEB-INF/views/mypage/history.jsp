<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>
<head>
<title>이번 달 학년 순위</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">

<!-- 공통 -->
<script type="text/javascript" src="/readingbetter/assets/js/jquery/jquery-3.1.0.js"></script>
<script type="text/javascript" src="/readingbetter/assets/dist/js/bootstrap.js"></script>
<link href="/readingbetter/assets/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<!-- /공통 -->

<link href="/readingbetter/assets/css/mypage.css" rel="stylesheet" type="text/css">
</head>
<body>
<input type="hidden" class="category" value="history">

<c:import url='/WEB-INF/views/include/header.jsp' />
	
<div id="wrap">

	<div id="menu">
		<c:import url='/WEB-INF/views/include/navi_mypage.jsp' />
	</div>
	
	<div id="cont">
		<div id="basic-menu">
			<div class="small-menu">
				<a href="/readingbetter/main">홈</a> > 
				<a href="/readingbetter/mypage/info">내 정보</a> > 나의 활동
			</div>

			<p class="menu-title">나의 활동</p>
		</div>
		
		<div id="history">
			<div class="col-lg-6">
				<div id="profile">
					<img id="img" class="img-circle" src="http://ec2-52-34-170-68.us-west-2.compute.amazonaws.com/images/pikachu.png">
					<br> <br>
					<p id="idtext">NAME :${ memberVo.name }</p>
					<br> <br>
				</div>
			</div>

			<div class="col-lg-6">
				<table id="info-table" class="table">
					<tr>
						<th>보유 캔디 수 :</th>
						<td>${scoresVo.point }</td>
					</tr>
					<tr>
						<th>누적 점수 :</th>
						<td>${scoresVo.totalScore }점</td>
					</tr>
					<tr>
						<th>이번 달 점수 :</th>
						<td>${scoresVo.score }점</td>
					</tr>
				</table>
			</div>

			<br> <br>
			<table id="history-table" class="table table-striped">
				<tr>
					<th>번호</th>
					<th>활동</th>
					<th>상세 내용</th>
					<th>점수</th>
					<th>캔디</th>
					<th>인증</th>
					<th>날짜</th>
				</tr>
				
				<c:forEach var='vo' items='${historylist}' varStatus='s'>
					<tr>
						<td>${countList - (pageLength * (currentPage - 1)) - s.index }</td>
						<td>
							<c:choose>
                   				 <c:when test="${vo.identity == 0}">문제 풀기</c:when>
                   				 <c:when test="${vo.identity == 1}">상점</c:when>
                   				 <c:when test="${vo.identity == 2 }">문제 내기</c:when>
                   				 <c:when test="${vo.identity == 3}">출석체크</c:when>
                   				 <c:when test="${vo.identity == 4}">랭킹보상</c:when>
          					 </c:choose>
						</td>
						<td>${vo.title }</td>
						<td>${vo.score }</td>
						<td>
							<c:choose>
                   				 <c:when test="${vo.identity == 0 || vo.identity == 2 || vo.identity == 3 || vo.identity == 4}">+${vo.point }</c:when>
                   				 <c:when test="${vo.identity == 1}">-${vo.point }</c:when>
	           				</c:choose>
						</td>
						<td>
							<c:choose>
	                   			<c:when test="${vo.identity == 0}">
	                   				<c:if test="${vo.point>2}">성공</c:if>
	                       		</c:when>
                       			<c:when test="${vo.identity == 1}">
                       			</c:when>
              				</c:choose>
						</td>
						<td>${vo.regDate}</td>
					</tr>
				</c:forEach>
			</table>
			<br>

			<!-- begin:paging -->
			<div class="pager">
				<ul>
					<c:if test="${beginPage>1 }">
						<li>
							<a href="/readingbetter/mypage/history?pageNo=${beginPage-1 }">◀</a>
							<input type="hidden" name="pageNo" value="${beginPage-1 }">
						</li>
					</c:if>

					<c:forEach begin='${beginPage }' end='${endPage }' step='1' var='i'>
						<c:choose>
							<c:when test='${currentPage == i }'>
								<li class="selected">${i }</li>
							</c:when>
							<c:otherwise>
								<li>
									<a href="/readingbetter/mypage/history?pageNo=${i }">${i }</a>
									<input type="hidden" name="pageNo" value="${i}">
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
						
					<c:if test='${endPage<total }'>
						<li>
							<a href="/readingbetter/mypage/history?pageNo=${endPage+1 }">▶</a>
							<input type="hidden" name="pageNo" value="${endPage+1}">
						</li>
					</c:if>
				</ul>
			</div>
			<!-- end:paging -->
		</div>
	</div>
</div>
	
<c:import url='/WEB-INF/views/include/footer.jsp' />

</body>
</html>