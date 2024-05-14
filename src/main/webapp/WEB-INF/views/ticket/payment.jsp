<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/templatemo-villa-agency.css">

<title>예매 | 영화속으로 Dflix</title>
<!-- CSS -->
<%@ include file="../include/header/ticketingHeader.jsp"%>
</head>
<body>
	<%@ include file="../include/nav/userNav.jsp"%>
	<!-- contanier -->
	<div id="tikect-container">
		<!-- 네비 -->
		<div class="tk-navi">
			<div class="right">
				
			</div>
		</div>
		<!-- seat 섹션 -->
		<div class="seat-section">
			<!-- 섹션 seat bg -->
			<div class="seat-section-bg">
				<!-- seat 헤드 -->
				<div class="seat-section-head">
					<h3 class="">예매 정보</h3>
				</div>
				<!-- seat 바디 -->
				<div class="section-seat-body">
					<div class="movie_screen">
						<div class="ticketInfo-left">
							<div class="ticketInfo-container">
								<div class="ticketMovieInfo">
									<img src="${cposter}">
								</div>
								<div class="movieInfo" style="display: block;">
									<span class="movieName">${cname }</span>
									<span class="movieWatchGrade">${cwatchGradeNm }</span>
								</div>
							</div>
						</div>
						<div class="ticketInfo-right">
							<table class="ticketInfoTable">
								<tr>
									<th>극장이름<th>
									<td>${tname }</td>
								</tr>
								<tr>
									<th>상영관날짜<th>
									<td>${sday } | ${sstartTime }</td>
								</tr>
								<tr>
									<th>상영관타입<th>
									<td>${shallType }</td>
								</tr>
								<tr>
									<th>상영관 위치<th>
									<td>${shallLocation }</td>
								</tr>
								<tr>
									<th>인원<th>
									<td>${personNum }명</td>
								</tr>
								<tr>
									<th>좌석<th>
									<td>${seats }</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../include/footer/userFooter.jsp"%>
</body>
</html>