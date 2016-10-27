<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ReadingBetter_Admin</title>
<link href="/readingbetter/assets/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="/readingbetter/assets/css/board.css" rel="stylesheet" type="text/css">
<link href="/readingbetter/assets/css/admin.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="/readingbetter/assets/js/jquery/jquery-3.1.0.js" charset="utf-8"></script>
<script type="text/javascript" src="/readingbetter/se/js/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body>
<c:import url='/WEB-INF/views/admin/header.jsp'></c:import>
<h4>공지 수정</h4>
<div id="board">
	<form id="frm" action="../noticemodify" method="post">
	<input type="hidden" name="no" value="${vo.no }">
		<table class="table table-bordered">
			<tr>
				<td class="active">제목</td>
					<td colspan=7>
						<div class="form-group">
							<input type="text" class="form-control" name="title" value="${vo.title }">
						</div>
					</td>
				</tr>
			<tr>
				<td class="active">작성자</td>
				<td>${vo.name }</td>
				<td class="active">조회수</td>
				<td>${vo.viewCount }</td>
				<td class="active">작성일</td>
				<td>${vo.regDate }</td>
			</tr>
			<tr>
				<td id="notice-content" colspan=8 rowspan=5>
					<div class="form-group">
						<%-- <textarea class="form-control" name="content" >${vo.content }</textarea> --%>
						<textarea name="content" id="ir1" rows="10" cols="100">${vo.content }</textarea>
						<script type="text/javascript">
						var oEditors = [];
						nhn.husky.EZCreator.createInIFrame({
						    oAppRef: oEditors,
						    elPlaceHolder: "ir1",
						    sSkinURI: "/readingbetter/se/SmartEditor2Skin.html",
						    fCreator: "createSEditor2"
						});
						</script>
					</div>
				</td>
			</tr>
		</table>
	</form>
	
	<div id="button-set">
		<a href="/readingbetter/admin/noticelist" class="btn btn-default">목록</a>
		<button id="sbmt" class="btn btn-default">수정</button>
	</div>
</div>
</body>
</html>

<script type="text/javascript">
$("#sbmt").click(function(){
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	
	$("#frm").submit();
})
</script>