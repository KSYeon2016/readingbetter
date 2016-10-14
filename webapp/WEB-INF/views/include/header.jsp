<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 해더 -->
<script type="text/javascript" src="/readingbetter/assets/js/header.js"></script>
<!-- /해더 -->

<div id="header">

	<div class="container-fluid">
	
		<div class="row">
		
			<div class="col-lg-12">
	 			<ul id="headeritem1">
					<c:choose>
						<c:when test='${empty authUser }'>
							<li><a href="/readingbetter/member/loginform">로그인</a></li>
							<li><a href="/readingbetter/member/joinform">회원가입</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="/readingbetter/mypage/modifyform">회원정보수정</a></li>
							<li><a href="/readingbetter/main/logout">로그아웃</a></li>
							<li>${authUser.name}님 반갑습니다 ^0^</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>

			<div class="col-lg-2">
				<a href="/readingbetter/main">
					<img id="logo" src="http://ec2-52-34-170-68.us-west-2.compute.amazonaws.com/images/design/logo.png">
				</a>
			</div>
		
			<div class="col-lg-10">
				<table class="tbl-category">
					<tr>
						<td rowspan="3" valign="bottom">
							<a href="/readingbetter/book/booklist"> 
								<img id="btn-book" align="bottom" src="http://ec2-52-34-170-68.us-west-2.compute.amazonaws.com/images/design/b_reading.png">
							</a>
						</td>
						<td rowspan="3" valign="bottom">
							<a href="/readingbetter/ranking/summary">
								<img id="btn-rank" align="bottom" src="http://ec2-52-34-170-68.us-west-2.compute.amazonaws.com/images/design/b_ranking.png">
							</a>
						</td>
						<td rowspan="2">
							<a href="/readingbetter/main">
								<img id="anim" src="http://ec2-52-34-170-68.us-west-2.compute.amazonaws.com/images/design/anim.gif">
							</a>
						</td>
						<td rowspan="3" valign="bottom">
							<a href="/readingbetter/mypage/info">
								<img id="btn-info" align="bottom" src="http://ec2-52-34-170-68.us-west-2.compute.amazonaws.com/images/design/b_myinfo.png">
							</a>
						</td>
						<td rowspan="3" valign="bottom">
							<a href="/readingbetter/service/noticelist">
								<img id="btn-center" align="bottom" src="http://ec2-52-34-170-68.us-west-2.compute.amazonaws.com/images/design/b_center.png">
							</a>
						</td>
					</tr>
					<tr>
					</tr>
					<tr>
						<td>
							<a href="/readingbetter/shop">
								<img id="btn-store" align="bottom" src="http://ec2-52-34-170-68.us-west-2.compute.amazonaws.com/images/design/b_store.png">
							</a>
						</td>
					</tr>
				</table>
			</div>
			
		</div>
		
	</div>
	
</div>