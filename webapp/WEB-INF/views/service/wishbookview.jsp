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
<script type="text/javascript" src="/readingbetter/assets/js/wishbook.js"></script>
</head>
<body>
<input type="hidden" class="category" value="wishbook">
<input type="hidden" id="no" value="${param.no }">

<c:import url='/WEB-INF/views/include/header.jsp' />
	
<div id="wrap">

	<div id="menu">
		<c:import url='/WEB-INF/views/include/navi_service.jsp' />
	</div>
	
	<div id="cont">
		<div id="wishbookview">
			<div class="small-menu">
				<a href="/readingbetter/main">홈</a> > 
				<a href="/readingbetter/service/noticelist">고객센터</a> > 
				<a href="/readingbetter/service/wishbooklist">희망 도서 신청</a> > 글 보기
			</div>

			<p class="menu-title">희망도서 정보</p>

			<div id="board">
				<table class="table table-bordered">
					<colgroup>
						<col width="25%"/>
						<col width="25%"/>
						<col width="25%"/>
						<col width="25%"/>
					</colgroup>
					<tr>
						<td class="active">책 제목</td>
						<td colspan="4">${vo.title }</td>
					</tr>
					<tr>
						<td class="active">작성자</td>
						<td>${vo.name }</td>
						<td class="active">출판사${vo.no }</td>
						<td>${vo.publisher }</td>
					</tr>
					<tr>
						<td colspan="4">${vo.reason }<br>
						<br></td>
					</tr>
				</table>

				<div id="button-set">
					<c:if test="${authUser != null }">
						<button class="btn btn-default" role="button" id="recommend">추천</button>
					</c:if>
					<a class="btn btn-default" href="/readingbetter/service/wishbooklist" role="button">목록</a>
				</div>
			</div>
		</div>
	</div>
</div>
	
<c:import url='/WEB-INF/views/include/footer.jsp' />

</body>
</html>