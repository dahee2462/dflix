<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<!--최상단 -->
	<div class="sub-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-8"></div>
				<div class="col-lg-4 col-md-4">
					<ul class="topmenu">
						<li>
						<sec:authorize access="isAnonymous()">
						<a href="<%=request.getContextPath() %>/join">회원가입 </a> |
						</sec:authorize>
						</li>
						<li>
							<!-- 시큐리티 로그인-->
							<sec:authorize access="isAuthenticated()">
							<%-- <sec:authentication property="principal.username"/>님, 환영합니다. --%>
							<a href="<%=request.getContextPath() %>/logout">로그아웃</a> | 
							</sec:authorize>
							<sec:authorize access="isAnonymous()">
							<a href="<%=request.getContextPath() %>/login">로그인</a> |
							</sec:authorize>
						</li>
						<li>
						<sec:authorize access="isAuthenticated()">
						<a href="<%=request.getContextPath() %>/myInfo">내정보</a> |
						</sec:authorize>
						</li>
						<li><a href="<%=request.getContextPath() %>/serviceCenter/noticeList">고객센터</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!-- 헤더 -->
	<header class="header-area header-sticky">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav class="main-nav">
						<a href="<%=request.getContextPath() %>/" class="logo">
							<h1>DFLIX</h1>
						</a>
						<!-- 네비메뉴 -->
						<ul class="nav">
							<li class="dropdown"><a href="<%=request.getContextPath() %>/movie/movieChart"
								data-bs-toggle="dropdown collapse" aria-expanded="false">영화</a>
								<ul class="dropdown-menu dropdown-menu-dark ulbg-whtie">
									<li><a class="dropdown-item item-hover" href="<%=request.getContextPath() %>/movie/movieChart">무비차트</a></li>
									<li><a class="dropdown-item item-hover" href="<%=request.getContextPath() %>/movie/movieSchedule">상영예정작</a></li>
								</ul>
							</li>
							<li class="dropdown"><a href="<%=request.getContextPath() %>/ticket/ticketing" role="button"
								data-bs-toggle="dropdown" aria-expanded="false">예매</a>
								<ul class="dropdown-menu dropdown-menu-dark ulbg-whtie">
									<li><a class="dropdown-item item-hover" href="<%=request.getContextPath() %>/ticket/ticketing">예매하기</a></li>
									<li><a class="dropdown-item item-hover" href="<%=request.getContextPath() %>/myInfo">예매조회</a></li>
								</ul>
							</li>
							<li class="dropdown"><a href="#" role="button"
								data-bs-toggle="dropdown" aria-expanded="false">극장</a>
								<ul class="dropdown-menu dropdown-menu-dark ulbg-whtie">
									<li><a class="dropdown-item item-hover" href="<%=request.getContextPath() %>/theater?tno=1">전주극장</a></li>
									<li><a class="dropdown-item item-hover" href="<%=request.getContextPath() %>/theater?tno=2">익산극장</a></li>
								</ul>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</header>
</body>
</html>