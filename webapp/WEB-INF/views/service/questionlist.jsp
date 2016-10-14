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

<link href="/readingbetter/assets/css/board.css" rel="stylesheet" type="text/css">
</head>
<body>
<input type="hidden" class="category" value="question">

<c:import url='/WEB-INF/views/include/header.jsp' />
	
<div id="wrap">

	<div id="menu">
		<c:import url='/WEB-INF/views/include/navi_service.jsp' />
	</div>
	
	<div id="cont">
		<div class="small-menu">
			<a href="/readingbetter/main">홈</a> > 
			<a href="/readingbetter/service/noticelist">고객센터</a> > 문의 게시판
		</div>

		<p class="menu-title">문의 게시판</p>
				
		<form id="search_form" action="" method="get">
			<input type="text" name="borKwd" value="${borKwd }">
			<input type="submit" value="찾기">
		</form>
				
		<div id="board">
			<table class="table table-bordered">
				<tr>
					<th class="th-board-no active">번호</th>
					<th class="th-board-title active">제목</th>
					<th class="th-board-writer active">글쓴이</th>
					<th class="active">조회수</th>
					<th class="active">작성일</th>
					<th class="active">답변</th>
				</tr>

				<c:forEach items="${list }" var="boardvo">
					<tr>
						<c:choose>
							<c:when test="${boardvo.boardPosition eq 2 }">
								<td class="board-no"></td>
							</c:when>
							<c:otherwise>
								<td class="board-no">${boardvo.no }</td>
							</c:otherwise>
						</c:choose>
						<td class="board-title">
							<c:if test="${boardvo.boardPosition eq 2 }">
								<img id="re-img" src="http://ec2-52-34-170-68.us-west-2.compute.amazonaws.com/images/re.png">
							</c:if>
							<a href="/readingbetter/service/questionview?no=${boardvo.no }">${boardvo.title }</a>
						</td>
						<c:choose>
							<c:when test="${boardvo.position eq 0 }">
								<td>${boardvo.name }</td>
							</c:when>
							<c:otherwise>
								<td >${boardvo.id }</td>
							</c:otherwise>
						</c:choose>
						<td>${boardvo.viewCount }</td>
						<td>${boardvo.regDate }</td>
						<c:choose>
							<c:when test="${boardvo.accept eq 0}">
								<td>대기</td>
							</c:when>
							<c:when test="${boardvo.accept eq 1}">
								<td>완료</td>
							</c:when>
							<c:otherwise>
								<td></td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</table>

			<div id="button-set">
				<c:choose>
					<c:when test="${not empty sessionScope.authUser}">
						<c:if test="${authUser.position eq 1 }">
							<a class="btn btn-default" href="/readingbetter/service/questionwrite" role="button">글쓰기</a>
						</c:if>
					</c:when>
				</c:choose>
			</div>

			<!-- begin:paging -->
           	<div class="pager">
           	<br>
           		<ul>
           			<c:if test='${beginPage>1}'>
           				<li><a href="/readingbetter/service/questionlist?borPage=${beginPage-1}&borKwd=${borKwd}">◀</a></li>
           			</c:if>

              		<c:forEach begin='${beginPage}' end='${endPage}' step='1' var='i'>
               			<c:choose>
               				<c:when test='${currentPage == i}'>
               					<li class="selected">${i}</li>
               				</c:when>
               				<c:otherwise>
              					<li><a href="/readingbetter/service/questionlist?borPage=${i}&borKwd=${borKwd}">${i}</a></li>
               				</c:otherwise>
               			</c:choose>
               		</c:forEach>

              		<c:if test='${endPage<totalPage}'>
               			<li><a href="/readingbetter/service/questionlist?borPage=${endPage+1}&borKwd=${borKwd}">▶</a></li>
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