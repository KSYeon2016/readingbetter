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

<link href="/readingbetter/assets/css/mypage.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/readingbetter/assets/js/modifyform.js"></script>
</head>
<body>
<input type="hidden" class="category" value="info">
<input type="hidden" id="authUserEmail" value="${vo.email }">

<c:import url='/WEB-INF/views/include/header.jsp' />
	
<div id="wrap">

	<div id="menu">
		<c:import url='/WEB-INF/views/include/navi_mypage.jsp' />
	</div>
	
	<div id="cont">
		<div id="basic-menu">
			<div class="small-menu">
				<a href="/readingbetter/main">홈</a> > 
				<a href="/readingbetter/mypage/info">내정보</a> > 
				<a href="/readingbetter/mypage/info">내정보 보기</a> > 내정보 수정
			</div>

			<p class="menu-title">내 정보 수정</p>
		</div>
		
		<div id="chage">
			<div id="radio-group">
				<form id="modify-form" class="form-horizontal" action="/readingbetter/mypage/modify" method="POST">
					<div class="form-group">
						<label class="col-sm-3 control-label">이름</label>
						<div class="col-sm-6">
							<input type="text" name="name" class="form-control" id="inputName" placeholder="Name" value="${vo.name }">
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-3 control-label">비밀번호</label>
						<div class="col-sm-6">
							<input type="password" name="pw" class="form-control" id="inputPassword" placeholder="Password">
						</div>
					</div>
							
					<div class="form-group">
						<label class="col-sm-3 control-label">비밀번호 확인</label>
						<div class="col-sm-6">
							<input type="password" name="check-pw" class="form-control" id="inputPasswordConfirm" placeholder="Password check">
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-3 control-label">이메일</label>
						<div class="col-sm-6">
							<input type="Email" name="email" class="form-control" id="inputEmail" placeholder="Email" value="${vo.email }">
						</div>

						<div class="col-sm-1">
							<img id="image-emailchecked" style="width:16px;" src="/readingbetter/assets/images/check.png"/>
							<a class="btn btn-default" style="display:none" role="button" id="check-email">중복확인</a>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-3 control-label">전화번호</label>
						<div class="col-sm-6">
							<input type="text" name="tel" class="form-control" id="inputPhone" placeholder="PhoneNumber" value="${vo.tel }">
						</div>
					</div>

					<c:choose>
						<c:when test="${vo.schoolName == '기타' }">
							<label class="radio-inline"> 
								<input type="radio" name="element" id="element" value="option1">초등학생
							</label> 
							<label class="radio-inline"> 
								<input type="radio" name="etc" id="etc" value="option3" checked>기타
							</label> <br> <br>
						</c:when>
						<c:otherwise>
							<label class="radio-inline"> 
								<input type="radio" name="inlineRadioOptions" id="element" value="option1" checked>초등학생
							</label> 
							<label class="radio-inline"> 
								<input type="radio" name="inlineRadioOptions" id="etc" value="option3">기타
							</label> <br> <br>
						</c:otherwise>
					</c:choose>
							
					<div id="school-info">
						<div class="form-group">
							<label class="col-sm-3 control-label">학교이름</label>
							<div class="col-sm-6">
								<input type="text" name="schoolName" class="form-control" id="inputSchoolName" placeholder="SchoolName" readOnly value="${vo.schoolName }">
							</div>
							<div class="col-sm-1">
								<button type="button" class="btn btn-default" id="btn-searchschool">찾기</button>
							</div>
						</div>
	
						<div class="form-group">
							<label class="col-sm-3 control-label">학년</label>
							<div class="col-sm-6">
								<input type="text" name="grade" class="form-control" id="inputSchoolGrade" placeholder="Grade" value=${vo.grade }>
							</div>
						</div>
	
						<div class="form-group">
							<label class="col-sm-3 control-label">반</label>
							<div class="col-sm-6">
								<input type="text" name="classNo" class="form-control" id="inputSchoolClass" placeholder="Class" value="${vo.classNo }">
							</div>
						</div>
					</div>

					<button class="btn btn-default" type="submit">수정하기</button>
				</form>
			</div>
		</div>
	</div>
</div>
	
<c:import url='/WEB-INF/views/include/footer.jsp' />

</body>
</html>

<!-- 학교검색모달 -->
<div id="schoolModal" class="modal fade school-modal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">학교 검색</h4>
			</div>
			<div class="modal-body">
				<input type="text" id="school-kwd" name="kwd" value="${param.kwd }">
				<button class="btn btn-default" id="search">검색</button>
				<div id="search-list">
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->