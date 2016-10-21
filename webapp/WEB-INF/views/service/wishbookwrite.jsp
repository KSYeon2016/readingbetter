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

<link href="/readingbetter/assets/css/board.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/readingbetter/se/js/HuskyEZCreator.js" charset="utf-8"></script>

</head>
<body>
<input type="hidden" class="category" value="wishbook">

<c:import url='/WEB-INF/views/include/header.jsp' />
	
<div id="wrap">

	<div id="menu">
		<c:import url='/WEB-INF/views/include/navi_service.jsp' />
	</div>
	
	<div id="cont">
		<div id="basic-menu">
			<div class="small-menu">
				<a href="/readingbetter/main">홈</a> > 
				<a href="/readingbetter/service/noticelist">고객센터</a> > 
				<a href="/readingbetter/service/wishbooklist"> 희망도서 신청</a> > 글쓰기
			</div>
			
			<p class="menu-title">희망도서 신청</p>
		</div>
		
		<div id="wishbookwrite">
			<div id="board">
				<form id="frm" action="/readingbetter/service/wishbookwrite" method="post">
					<table class="table table-bordered ">
						<tr>
							<th class="active">책 제목</th>
							<td colspan=3>
								<input type="text" class="form-control" name="title" placeholder="필수 입력">
							</td>
						</tr>
						<tr>
							<th class="active">출판사</th>
							<td>
								<input type="text" class="form-control" name="publisher" placeholder="필수 입력">
							</td>
						</tr>
						<tr>
							<th colspan=4 class="active">책 소개 (또는 추천 이유)</th>
						</tr>
						<tr>
							<td colspan=4>
								<!-- <textarea class="form-control" rows="10" placeholder="내용을 입력하세요." name="reason"></textarea> -->
								<textarea name="reason" id="ir1" rows="10" cols="100"></textarea>
								<script type="text/javascript">
								var oEditors = [];
								nhn.husky.EZCreator.createInIFrame({
								    oAppRef: oEditors,
								    elPlaceHolder: "ir1",
								    sSkinURI: "/readingbetter/se/SmartEditor2Skin.html",
								    fCreator: "createSEditor2"
								});
								</script>
							</td>
						</tr>
					</table>
				</form>
				
				<div id="buttonalign">
					<button id="sbmt" class="btn btn-default">작성</button>
					<br><br>
				</div>	
			</div>
		</div>
	</div>
</div>
	
<c:import url='/WEB-INF/views/include/footer.jsp' />

</body>
</html>

<script type="text/javascript">
$("#sbmt").click(function(){
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	
	$("#frm").submit();
})
</script>