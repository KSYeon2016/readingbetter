<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>
<head>
<title>ReadingBetter_Admin</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/readingbetter/assets/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="/readingbetter/assets/css/admin.css" rel="stylesheet" type="text/css">
<link href="/readingbetter/assets/css/board.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container-fluid">
		<c:import url='/WEB-INF/views/admin/header.jsp' />
		<br><br>
		<h4>등록 퀴즈 내용</h4>
		<form action="../quizUpdate" method="post">
			<input type="hidden" name="no" value="${vo.no }">
			<input type="hidden" name="memberNo" value="${vo.memberNo }">
			<input type="hidden" name="bookNo" value="${vo.bookNo }">
			<input type="hidden" name="preaccept" value="${vo.accept }">
			
			<table class="table" id="board">
				<tr>
					<td class="active">책제목</td>
					<td>${vo.title }</td>
					<td class="active">상태</td>
					<td>
						<c:choose>
							<c:when test="${vo.accept == 0 }">대기</c:when>
							<c:when test="${vo.accept == 1 }">승인</c:when>
							<c:when test="${vo.accept == 2 }">반려</c:when>
							<c:when test="${vo.accept == 3 }">신고</c:when>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td class="active" colspan="6">문제</td>
				</tr>
				<tr>
					<td colspan="6"><input type="text" class="form-control" name="quiz" value="${vo.quiz }"></td>
				</tr>
				<tr>
					<td class="active" colspan="6">보기</td>
				</tr>
				<tr>
					<td class="active">1</td>
					<td colspan="5"><input type="text" class="form-control" name="ex1" value="${vo.ex1 }"></td>
				</tr>
				<tr>
					<td class="active">2</td>
					<td colspan="5"><input type="text" class="form-control" name="ex2" value="${vo.ex2 }"></td>
				</tr>
				<tr>
					<td class="active">3</td>
					<td colspan="5"><input type="text" class="form-control" name="ex3" value="${vo.ex3 }"></td>
				</tr>
				<tr>
					<td class="active">4</td>
					<td colspan="5"><input type="text" class="form-control" name="ex4" value="${vo.ex4 }"></td>
				</tr>
				<tr>
					<td class="active">정답</td>
					<td colspan="5">
						<select class="form-control" name="answer">
						<c:if test="${vo.answer==vo.ex1 }">
							<option selected >1</option>
						</c:if>
						<option >1</option>
						<c:if test="${vo.answer==vo.ex2 }">
							<option selected >2</option>
						</c:if>
						<option >2</option>
						<c:if test="${vo.answer==vo.ex3 }">
							<option selected >3</option>
						</c:if>
						<option >3</option>
						<c:if test="${vo.answer==vo.ex4 }">
							<option selected >4</option>
						</c:if>
						<option >4</option>		
						</select>
					</td>
				</tr>
				<c:choose>
					<c:when test="${vo.accept == 0 }">
						<tr>
							<td class="active">승인여부</td>
							<td colspan="5">
								<label class="radio-inline">
								  	<input type="radio" name="accept" value=0 checked>대기
								</label>
								<label class="radio-inline">
								  	<input type="radio" name="accept" value=1>승인
								</label>
								<label class="radio-inline">
								  	<input type="radio" name="accept" value=2>반려
								</label>
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<input type="hidden" name="accept" value="${vo.accept }">
					</c:otherwise>
				</c:choose>
			</table>
	
			<a class="btn btn-default" href="/readingbetter/admin/quizlist" role="button">목록</a> 
			<button type="submit" class="btn btn-default">확인</button>
		</form>
	</div>
</body>
</html>