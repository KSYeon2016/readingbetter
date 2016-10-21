<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>
<head>
<title>문의 게시판</title>
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
<input type="hidden" class="category" value="question">

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
				<a href="/readingbetter/service/questionlist">문의 게시판 </a> > 글보기
			</div>

			<p class="menu-title">문의 게시판</p>
		</div>
		
		<div id="questionwrite">
			<div id="board">
				<form id="frm" action="/readingbetter/service/questionwrite/write" method="post">
					<table class="table table-bordered">
						<tr>
							<th id="celltitle" class="active">제목</th>
							<td><input type="text" class="form-control" name="title" placeholder="필수 입력"></td>
						</tr>
						<tr>
							<th class="active" colspan=2>내용</th>
						</tr>
						<tr>
							<td id="content" colspan=2>
								<!-- <textarea id="sub" class="form-control" name="content" placeholder="내용을 입력하세요."></textarea> -->
								<textarea name="content" id="ir1" rows="10" cols="100"></textarea>
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
					<button id="sbmt" class="btn btn-default">제출</button>
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