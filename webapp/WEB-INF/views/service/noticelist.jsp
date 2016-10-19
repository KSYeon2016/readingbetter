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
<input type="hidden" class="category" value="notice">

<c:import url='/WEB-INF/views/include/header.jsp' />
	
<div id="wrap">

	<div id="menu">
		<c:import url='/WEB-INF/views/include/navi_service.jsp' />
	</div>
	
	<div id="cont">
		<div id="basic-menu">
			<div class="small-menu">
				<a href="/readingbetter/main">홈</a> > 
				<a href="/readingbetter/service/noticelist">고객센터</a> > 공지
			</div>

			<p class="menu-title">공지</p>
		</div>
		
		<div id="notice">
			<div id="board">
				<table class="table table-bordered">
					<tr>
						<th class="th-board-no active">번호</th>
						<th class="th-board-title active">제목</th>
						<th class="th-board-writer active">글쓴이</th>
						<th class="active">조회수</th>
						<th class="active">작성일</th>
					</tr>

					<c:set var="countList" value="${fn:length(list)}"/>
					<c:forEach var='vo' items='${list}' varStatus='s'>
						<tr>
							<td class="board-no">${countList - s.index }</td>
							<td class="board-title"><a href="/readingbetter/service/noticeview/${vo.no }">${vo.title }</a></td>
							<td>${vo.name }</td>
							<td>${vo.viewCount }</td>
							<td>${vo.regDate }</td>
						</tr>
					</c:forEach>
				</table>

				<!-- begin:paging -->
            	<div class="pager">
            	<br>
               		<ul>
               			<c:if test='${beginPage>1}'>
               				<li><a href="/readingbetter/service/noticelist?noticePage=${beginPage-1}">◀</a></li>
               			</c:if>

                  		<c:forEach begin='${beginPage}' end='${endPage}' step='1' var='i'>
                  			<c:choose>
                  				<c:when test='${currentPage == i}'>
                  					<li class="selected">${i}</li>
                  				</c:when>
                  				<c:otherwise>
                  					<li><a href="/readingbetter/service/noticelist?noticePage=${i}">${i}</a></li>
                  				</c:otherwise>
                  			</c:choose>
                  		</c:forEach>

                  		<c:if test='${endPage<totalPage}'>
                  			<li><a href="/readingbetter/service/noticelist?noticePage=${endPage+1}">▶</a></li>
                  		</c:if>               		
               		</ul>
            	</div>
            	<!-- end:paging -->
			</div>
		</div>
	</div>
</div>
	
<c:import url='/WEB-INF/views/include/footer.jsp' />

</body>
</html>