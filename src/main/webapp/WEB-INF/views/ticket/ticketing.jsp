<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>예매 | 영화속으로 Dflix</title>
    <!-- CSS -->
    <%@ include file="../include/header/ticketingHeader.jsp" %>
  </head>
<body>
<%@ include file="../include/nav/userNav.jsp" %>
	<!-- contanier -->
	<div id="tikect-container">
		<!-- 네비 -->
		<div class="tk-navi">
			<div class="right">
				<a class="button-schedule" href="<%=request.getContextPath()%>/theater?tno=1">
					<span>상영시간표</span>
				</a>
				<a href="" class="button-reset" onclick="return false;">
					<span>예매 다시하기</span>
				</a>
			</div>
		</div>
		<!-- 섹션 -->
		<div class="tk-section">
			<!-- 섹션 movie -->
			<div class="tk-section-movie">
				<!-- movie 헤드 -->
				<div class="section-movie-head">
					<h3 class="">영화</h3>
				</div>
				<!-- movie 바디 -->
				<div class="section-movie-body">
					<div class="movie-body-select">
						<div class="sortmenu">
							<a href="" onclick="rankSelect();return false;" 
								id="rank" class="rank-select background-on">예매율순</a>
							<a href="" onclick="abcSelect();return false;" 
								id="abc" class="abc-select">가나다순</a>
						</div>
						<div class="movie-list">
							<ul class="movie-list-ul">
								<c:forEach items="${movie }" var="movie">
								<li class="">
									<a href="javascript:selCno(${movie.cno})" title="${moive.cname }">
										<i class="movieAge">${movie.cwatchGradeNm }</i>
										<span class="text">${movie.cname }</span>
										<span class="sreader" style="hidden">${movie.ccode }</span>
									</a>
								</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- 섹션 theater -->
			<div class="tk-section-theater">
				<!-- theater 헤드 -->
				<div class="section-theater-head">
					<h3 class="">극장</h3>
				</div>
				<!-- theater 바디 -->
				<div class="section-theater-body">
					<div class="theater-body-select">
						<div class="theater-list">
							<ul class="theater-list-ul">
								<c:forEach items="${theater }" var="theater">
								<li class="">
									<a href="javascript:selTno(${theater.tno })" title="${theater.tname }">
										<span class="text">${theater.tname }</span>
										<span class="sreader" style="hidden">${theater.tno }</span>
									</a>
								</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- 섹션 date -->
			<div class="tk-section-date">
				<!-- date 헤드 -->
				<div class="section-date-head">
					<h3 class="">날짜</h3>
				</div>
				<!-- date 바디 -->
				<div class="section-date-body">
					<div class="date-body-select">
						<div class="date-list">
							<ul class="date-list-ul">
								<!-- 여기에 2주짜리 달력이 생깁니다. -->
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- 섹션 time -->
			<div class="tk-section-time">
				<!-- time 헤드 -->
				<div class="section-time-head">
					<h3 class="">시간</h3>
				</div>
				<!-- time 바디 -->
				<div class="section-time-body">
					<div class="time-body-select">
						<div class="time-option">
							<span class="morning">모닝</span>
							<span class="night">심야</span>
						</div>
						<div class="time-list">
							<!-- ajax로 상영관이 나타납니다. -->
							<span class="floor">영화, 극장, 날짜를 선택해주시기 바랍니다.</span>
						</div>
					</div>
				</div>
			</div>
		</div>
			<!-- 진행버튼 -->
			
			<div id="ticket_tnb" class="tnb_container">
				<div class="tnb">
					<form action="ticketSeat" name="frm" method="post">
					<div class="info movie">
						<span class="movie_poster">
						</span>
						<div class="row movie_title colspan2" style="display: block;">
							<span class="data letter-spacing-min ellipsis-line2">
								<a id="selectionMovieTitle" style="margin-left: 10px;"></a>
								<input type="hidden" name="cno" id="cno">
								<input type="hidden" name="cposter" id="cposter">
								<input type="hidden" name="cname" id="cname">
								<input type="hidden" name="cwatchGradeNm" id="cwatchGradeNm">
							</span>
						</div>
						<!-- 무비타입과 동일하게 관람제한나이도 api에서 받아온 값을 입력해야함. -->
						<div class="row movie_rating" style="display: block;">
						</div>
						<div class="placeholder" title="영화선택" style="display: none;"></div>
					</div>
					<div class="info theater">
						<div class="row name" style="display: block;">
							<span class="header">극장</span>
							<span class="data letter-spacing-min ellipsis-line1">
								<a title="" id="selectionTheater"></a>
								<input type="hidden" name="tname" id="tname">
								<input type="hidden" name="tno" id="tno">
							</span>
						</div>
						<div class="row date" style="display: block;">
							<span class="header">일시</span>
							<span class="data" title="">
								<a id="dateDay"></a>
								<a id="dateTime"></a>
								<input type="hidden" name="inputDateDay" id="inputDateDay">
								<input type="hidden" name="sday" id="sday">
								<input type="hidden" name="sstartTime" id="sstartTime">
								<input type="hidden" name="sendTime" id="sendTime">
							</span>
						</div>
						<div class="row screen" style="display: block;">
							<span class="header">상영관</span>
							<span class="data" id="selectionLocation">
								<a id="selShallType"></a>
								<a id="selShallLocation"></a>
							</span>
							<input type="hidden" name="sno" id="sno">
							<input type="hidden" name="shallno" id="shallno">
							<input type="hidden" name="shallType" id="shallType">
							<input type="hidden" name="shallLocation" id="shallLocation">
						</div>
						<div class="row number" style="display: block;">
							<span class="header">인원</span>
							<span class="data"></span>
						</div>
						<div class="placeholder" title="극장선택" style="display: none;"></div>
					</div>
				<div class="info path">
					<div class="row colspan4">
						<span class="path-step2" title="좌석선택">&nbsp;</span>
						<span class="path-step3" title="결제">&nbsp;</span>
					</div>
				</div>
				</form>
				<button onclick="seatSelBtn();" type="submit"
					class="btn-right" id="seatSelectionButton">
					<span>좌석선택</span>
				</button>
				</div>
			</div>
	</div>
<%@ include file="../include/footer/userFooter.jsp" %>
<script src="<%=request.getContextPath() %>/resources/js/ticketing_event.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/ticketing_view.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/ticketing_submit.js"></script>
</body>
</html>