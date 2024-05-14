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
				<a class="button-schedule"
					href="<%=request.getContextPath()%>/theater?tno=1"> <span>상영시간표</span>
				</a>
				<a href="" class="button-reset" onclick="return false;">
					<span>예매 다시하기</span>
				</a>
			</div>
		</div>
		<!-- seat 섹션 -->
		<div class="seat-section">
			<!-- 섹션 seat bg -->
			<div class="seat-section-bg">
				<!-- seat 헤드 -->
				<div class="seat-section-head">
					<h3 class="">인원 / 좌석</h3>
				</div>
				<!-- seat 바디 -->
				<div class="section-seat-body">
					<div class="person_screen">
						<div class="person-number">
							<div class="pn-container">
								<div class="max-personNumber">* 최대 8명 선태 가능</div>
								<div class="group_adult" style="display: block;">
									<span class="title">일반</span>
									<ul class="personAdult">
										<li data-count="0" class="selected" type="adult">
											<a href="#" onclick="return false;" style="color: white;"> 
												<span class="sreader mod">일반</span>0
												<span class="sreader">명</span>
											</a>
										</li>
										<li data-count="1" type="adult">
											<a href="#" onclick="return false;">
												<span class="sreader mod">일반</span>1
												<span class="sreader">명</span>
											</a>
										</li>
										<li data-count="2" type="adult">
											<a href="#" onclick="return false;">
												<span class="sreader mod">일반</span>2
												<span class="sreader">명</span>
											</a>
										</li>
										<li data-count="3" type="adult">
											<a href="#" onclick="return false;">
												<span class="sreader mod">일반</span>3
												<span class="sreader">명</span>
											</a>
										</li>
										<li data-count="4" type="adult">
											<a href="#" onclick="return false;">
												<span class="sreader mod">일반</span>4
												<span class="sreader">명</span>
											</a>
										</li>
										<li data-count="5" type="adult">
											<a href="#" onclick="return false;">
												<span class="sreader mod">일반</span>5
												<span class="sreader">명</span>
											</a>
										</li>
										<li data-count="6" type="adult">
											<a href="#" onclick="return false;">
												<span class="sreader mod">일반</span>6
												<span class="sreader">명</span>
											</a>
										</li>
										<li data-count="7" type="adult">
											<a href="#" onclick="return false;">
												<span class="sreader mod">일반</span>7
												<span class="sreader">명</span>
											</a>
										</li>
										<li data-count="8" type="adult">
											<a href="#" onclick="return false;">
												<span class="sreader mod">일반</span>8
												<span class="sreader">명</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div id="user-select-info">
							<p class="theater-info">
								<span class="site">${cname }</span>
								<span class="screen">${shallLocation }</span>
								<span class="seatNum">남은좌석
									<b class="restNum">${selectShallSeatAll-selectShallSeatUseing }</b>/
									<b class="totalNum">${selectShallSeatAll }</b>
								</span>
							</p>
							<p class="playYMD-info">
								<b>${dateDay }</b> <b>${sstartTime }~${sendTime }</b>
							</p>
						</div>
					</div>
				</div>
				<!-- 섹션 seat 선택 -->
				<div class="theater_minimap">
					<div class="theater">
						<div class="screen" title="SCREEN" style="width: 652px;">
							<span class="text">SCREEN</span>
						</div>
						<div class="seats">
						<c:if test="${not empty screenSeat }">
							<c:forEach var="lineColA" items="${screenSeat }" varStatus="loop">
							    <c:choose>
							        <c:when test="${loop.index == 0 && lineColA.sseatCol eq 'A'}">
							            <div class="row" style="top: 0px;">
							                <div class="label">${lineColA.sseatCol }</div>
							                <div class="seat_group">
							                    <div class="group">
							                        <c:set var="leftPosition" value="110"/>
							                        <c:forEach var="lineRowA" items="${screenSeat}">
							                            <c:if test="${lineRowA.sseatCol eq 'A'}">
							                                <div class="seat" style="left: ${leftPosition}px;">
							                                    <a href="#" onclick="return false;">
							                                        <span class="no">${lineRowA.sseatRow}</span>
							                                        <span class="sreader">${lineRowA.sseatType}</span>
							                                        <span class="sreader mod">${lineRowA.sseatno }</span>
							                                        <c:forEach var="useingSeat" items="${useingSeat}">
								                                        <c:if test="${useingSeat.sseatno == lineRowA.sseatno }">
								                                            <input type="hidden" value="${useingSeat.ticketdetailno}" id="ticketNo">
								                                        </c:if>
								                                    </c:forEach>
							                                    </a>
							                                </div>
							                                <c:set var="leftPosition" value="${leftPosition + 16}" />
							                            </c:if>
							                        </c:forEach>
							                    </div>
							                </div>
							            </div>
							        </c:when>
							    </c:choose>
							</c:forEach>
							
							<c:forEach var="lineColB" items="${screenSeat }" varStatus="loop">
							    <c:choose>
							        <c:when test="${loop.index == 6 && lineColB.sseatCol eq 'B'}">
							            <div class="row" style="top: 16px;">
							                <div class="label">${lineColB.sseatCol }</div>
							                <div class="seat_group">
							                    <div class="group">
							                        <c:set var="leftPosition" value="30"/>
							                        <c:forEach var="lineRowB" items="${screenSeat}">
							                            <c:if test="${lineRowB.sseatCol eq 'B'}">
							                                <div class="seat" style="left: ${leftPosition}px;">
							                                    <a href="#" onclick="return false;">
							                                        <span class="no">${lineRowB.sseatRow}</span>
							                                        <span class="sreader">${lineRowB.sseatType}</span>
							                                        <span class="sreader mod">${lineRowB.sseatno }</span>
							                                        <c:forEach var="useingSeat" items="${useingSeat}">
								                                        <c:if test="${useingSeat.sseatno == lineRowB.sseatno }">
								                                            <input type="hidden" value="${useingSeat.ticketdetailno}" id="ticketNo">
								                                        </c:if>
								                                    </c:forEach>
							                                    </a>
							                                </div>
							                                <c:set var="leftPosition" value="${leftPosition + 16}" />
							                            </c:if>
							                        </c:forEach>
							                    </div>
							                </div>
							            </div>
							        </c:when>
							    </c:choose>
							</c:forEach>
							
							<c:forEach var="lineColC" items="${screenSeat }" varStatus="loop">
							    <c:choose>
							        <c:when test="${loop.index == 21 && lineColC.sseatCol eq 'C'}">
							            <div class="row" style="top: 32px;">
							                <div class="label">${lineColC.sseatCol }</div>
							                <div class="seat_group">
							                    <div class="group">
							                        <c:set var="leftPosition" value="30"/>
							                        <c:forEach var="lineRowC" items="${screenSeat}">
							                            <c:if test="${lineRowC.sseatCol eq 'C'}">
							                                <div class="seat" style="left: ${leftPosition}px;">
							                                    <a href="#" onclick="return false;">
							                                        <span class="no">${lineRowC.sseatRow}</span>
							                                        <span class="sreader">${lineRowC.sseatType}</span>
							                                        <span class="sreader mod">${lineRowC.sseatno }</span>
							                                        <c:forEach var="useingSeat" items="${useingSeat}">
								                                        <c:if test="${useingSeat.sseatno == lineRowC.sseatno }">
								                                            <input type="hidden" value="${useingSeat.ticketdetailno}" id="ticketNo">
								                                        </c:if>
								                                    </c:forEach>
							                                    </a>
							                                </div>
							                                <c:set var="leftPosition" value="${leftPosition + 16}" />
							                            </c:if>
							                        </c:forEach>
							                    </div>
							                </div>
							            </div>
							        </c:when>
							    </c:choose>
							</c:forEach>
							
							<c:forEach var="lineColD" items="${screenSeat }" varStatus="loop">
							    <c:choose>
							        <c:when test="${loop.index == 36 && lineColD.sseatCol eq 'D'}">
							            <div class="row" style="top: 48px;">
							                <div class="label">${lineColD.sseatCol }</div>
							                <div class="seat_group">
							                    <div class="group">
							                        <c:set var="leftPosition" value="30"/>
							                        <c:forEach var="lineRowD" items="${screenSeat}">
							                            <c:if test="${lineRowD.sseatCol eq 'D'}">
							                                <div class="seat" style="left: ${leftPosition}px;">
							                                    <a href="#" onclick="return false;">
							                                        <span class="no">${lineRowD.sseatRow}</span>
							                                        <span class="sreader">${lineRowD.sseatType}</span>
							                                        <span class="sreader mod">${lineRowD.sseatno }</span>
							                                        <c:forEach var="useingSeat" items="${useingSeat}">
								                                        <c:if test="${useingSeat.sseatno == lineRowD.sseatno }">
								                                            <input type="hidden" value="${useingSeat.ticketdetailno}" id="ticketNo">
								                                        </c:if>
								                                    </c:forEach>
							                                    </a>
							                                </div>
							                                <c:set var="leftPosition" value="${leftPosition + 16}" />
							                            </c:if>
							                        </c:forEach>
							                    </div>
							                </div>
							            </div>
							        </c:when>
							    </c:choose>
							</c:forEach>
							
							<c:forEach var="lineColE" items="${screenSeat }" varStatus="loop">
							    <c:choose>
							        <c:when test="${loop.index == 51 && lineColE.sseatCol eq 'E'}">
							            <div class="row" style="top: 64px;">
							                <div class="label">${lineColE.sseatCol }</div>
							                <div class="seat_group">
							                    <div class="group">
							                        <c:set var="leftPosition" value="30"/>
							                        <c:forEach var="lineRowE" items="${screenSeat}">
							                            <c:if test="${lineRowE.sseatCol eq 'E'}">
							                                <div class="seat" style="left: ${leftPosition}px;">
							                                    <a href="#" onclick="return false;">
							                                        <span class="no">${lineRowE.sseatRow}</span>
							                                        <span class="sreader">${lineRowE.sseatType}</span>
							                                        <span class="sreader mod">${lineRowE.sseatno }</span>
							                                        <c:forEach var="useingSeat" items="${useingSeat}">
								                                        <c:if test="${useingSeat.sseatno == lineRowE.sseatno }">
								                                            <input type="hidden" value="${useingSeat.ticketdetailno}" id="ticketNo">
								                                        </c:if>
								                                    </c:forEach>
							                                    </a>
							                                </div>
							                                <c:set var="leftPosition" value="${leftPosition + 16}" />
							                            </c:if>
							                        </c:forEach>
							                    </div>
							                </div>
							            </div>
							        </c:when>
							    </c:choose>
							</c:forEach>
							
							<c:forEach var="lineColF" items="${screenSeat }" varStatus="loop">
							    <c:choose>
							        <c:when test="${loop.index == 66 && lineColF.sseatCol eq 'F'}">
							            <div class="row" style="top: 80px;">
							                <div class="label">${lineColF.sseatCol }</div>
							                <div class="seat_group">
							                    <div class="group">
							                        <c:set var="leftPosition" value="30"/>
							                        <c:forEach var="lineRowF" items="${screenSeat}">
							                            <c:if test="${lineRowF.sseatCol eq 'F'}">
							                                <div class="seat" style="left: ${leftPosition}px;">
							                                    <a href="#" onclick="return false;">
							                                        <span class="no">${lineRowF.sseatRow}</span>
							                                        <span class="sreader">${lineRowF.sseatType}</span>
							                                        <span class="sreader mod">${lineRowF.sseatno }</span>
							                                        <c:forEach var="useingSeat" items="${useingSeat}">
								                                        <c:if test="${useingSeat.sseatno == lineRowF.sseatno }">
								                                            <input type="hidden" value="${useingSeat.ticketdetailno}" id="ticketNo">
								                                        </c:if>
								                                    </c:forEach>
							                                    </a>
							                                </div>
							                                <c:set var="leftPosition" value="${leftPosition + 16}" />
							                            </c:if>
							                        </c:forEach>
							                    </div>
							                </div>
							            </div>
							        </c:when>
							    </c:choose>
							</c:forEach>
							
							<c:forEach var="lineColG" items="${screenSeat }" varStatus="loop">
							    <c:choose>
							        <c:when test="${loop.index == 81 && lineColG.sseatCol eq 'G'}">
							            <div class="row" style="top: 96px;">
							                <div class="label">${lineColG.sseatCol }</div>
							                <div class="seat_group">
							                    <div class="group">
							                        <c:set var="leftPosition" value="30"/>
							                        <c:forEach var="lineRowG" items="${screenSeat}">
							                            <c:if test="${lineRowG.sseatCol eq 'G'}">
							                                <div class="seat" style="left: ${leftPosition}px;">
							                                    <a href="#" onclick="return false;">
							                                        <span class="no">${lineRowG.sseatRow}</span>
							                                        <span class="sreader">${lineRowG.sseatType}</span>
							                                        <span class="sreader mod">${lineRowG.sseatno }</span>
							                                        <c:forEach var="useingSeat" items="${useingSeat}">
								                                        <c:if test="${useingSeat.sseatno == lineRowG.sseatno }">
								                                            <input type="hidden" value="${useingSeat.ticketdetailno}" id="ticketNo">
								                                        </c:if>
								                                    </c:forEach>
							                                    </a>
							                                </div>
							                                <c:set var="leftPosition" value="${leftPosition + 16}" />
							                            </c:if>
							                        </c:forEach>
							                    </div>
							                </div>
							            </div>
							        </c:when>
							    </c:choose>
							</c:forEach>
							
							<c:forEach var="lineColH" items="${screenSeat }" varStatus="loop">
							    <c:choose>
							        <c:when test="${loop.index == 96 && lineColH.sseatCol eq 'H'}">
							            <div class="row" style="top: 112px;">
							                <div class="label">${lineColH.sseatCol }</div>
							                <div class="seat_group">
							                    <div class="group">
							                        <c:set var="leftPosition" value="30"/>
							                        <c:forEach var="lineRowH" items="${screenSeat}">
							                            <c:if test="${lineRowH.sseatCol eq 'H'}">
							                                <div class="seat" style="left: ${leftPosition}px;">
							                                    <a href="#" onclick="return false;">
							                                        <span class="no">${lineRowH.sseatRow}</span>
							                                        <span class="sreader">${lineRowH.sseatType}</span>
							                                        <span class="sreader mod">${lineRowH.sseatno }</span>
							                                        <c:forEach var="useingSeat" items="${useingSeat}">
								                                        <c:if test="${useingSeat.sseatno == lineRowH.sseatno }">
								                                            <input type="hidden" value="${useingSeat.ticketdetailno}" id="ticketNo">
								                                        </c:if>
								                                    </c:forEach>
							                                    </a>
							                                </div>
							                                <c:set var="leftPosition" value="${leftPosition + 16}" />
							                            </c:if>
							                        </c:forEach>
							                    </div>
							                </div>
							            </div>
							        </c:when>
							    </c:choose>
							</c:forEach>
							
							<c:forEach var="lineColI" items="${screenSeat }" varStatus="loop">
							    <c:choose>
							        <c:when test="${loop.index == 111 && lineColI.sseatCol eq 'I'}">
							            <div class="row" style="top: 128px;">
							                <div class="label">${lineColI.sseatCol }</div>
							                <div class="seat_group">
							                    <div class="group">
							                        <c:set var="leftPosition" value="30"/>
							                        <c:forEach var="lineRowI" items="${screenSeat}">
							                            <c:if test="${lineRowI.sseatCol eq 'I'}">
							                                <div class="seat" style="left: ${leftPosition}px;">
							                                    <a href="#" onclick="return false;">
							                                        <span class="no">${lineRowI.sseatRow}</span>
							                                        <span class="sreader">${lineRowI.sseatType}</span>
							                                        <span class="sreader mod">${lineRowI.sseatno }</span>
							                                        <c:forEach var="useingSeat" items="${useingSeat}">
								                                        <c:if test="${useingSeat.sseatno == lineRowI.sseatno }">
								                                            <input type="hidden" value="${useingSeat.ticketdetailno}" id="ticketNo">
								                                        </c:if>
								                                    </c:forEach>
							                                    </a>
							                                </div>
							                                <c:set var="leftPosition" value="${leftPosition + 16}" />
							                            </c:if>
							                        </c:forEach>
							                    </div>
							                </div>
							            </div>
							        </c:when>
							    </c:choose>
							</c:forEach>
							
							<c:forEach var="lineColJ" items="${screenSeat }" varStatus="loop">
							    <c:choose>
							        <c:when test="${loop.index == 126 && lineColJ.sseatCol eq 'J'}">
							            <div class="row" style="top: 144px;">
							                <div class="label">${lineColJ.sseatCol }</div>
							                <div class="seat_group">
							                    <div class="group">
							                        <c:set var="leftPosition" value="30"/>
							                        <c:forEach var="lineRowJ" items="${screenSeat}">
							                            <c:if test="${lineRowJ.sseatCol eq 'J'}">
							                                <div class="seat" style="left: ${leftPosition}px;">
							                                    <a href="#" onclick="return false;">
							                                        <span class="no">${lineRowJ.sseatRow}</span>
							                                        <span class="sreader">${lineRowJ.sseatType}</span>
							                                        <span class="sreader mod">${lineRowJ.sseatno }</span>
							                                        <c:forEach var="useingSeat" items="${useingSeat}">
								                                        <c:if test="${useingSeat.sseatno == lineRowJ.sseatno }">
								                                            <input type="hidden" value="${useingSeat.ticketdetailno}" id="ticketNo">
								                                        </c:if>
								                                    </c:forEach>
							                                    </a>
							                                </div>
							                                <c:set var="leftPosition" value="${leftPosition + 16}" />
							                            </c:if>
							                        </c:forEach>
							                    </div>
							                </div>
							            </div>
							        </c:when>
							    </c:choose>
							</c:forEach>
							
							<c:forEach var="lineColK" items="${screenSeat }" varStatus="loop">
							    <c:choose>
							        <c:when test="${loop.index == 141 && lineColK.sseatCol eq 'K'}">
							            <div class="row" style="top: 160px;">
							                <div class="label">${lineColK.sseatCol }</div>
							                <div class="seat_group">
							                    <div class="group">
							                        <c:set var="leftPosition" value="30"/>
							                        <c:forEach var="lineRowK" items="${screenSeat}" begin="139" end="144">
							                            <c:if test="${lineRowK.sseatCol eq 'K'}">
							                                <div class="seat" style="left: ${leftPosition}px;">
							                                    <a href="#" onclick="return false;">
							                                        <span class="no">${lineRowK.sseatRow}</span>
							                                        <span class="sreader">${lineRowK.sseatType}</span>
							                                        <span class="sreader mod">${lineRowK.sseatno }</span>
							                                        <c:forEach var="useingSeat" items="${useingSeat}">
								                                        <c:if test="${useingSeat.sseatno == lineRowK.sseatno }">
								                                            <input type="hidden" value="${useingSeat.ticketdetailno}" id="ticketNo">
								                                        </c:if>
								                                    </c:forEach>
							                                    </a>
							                                </div>
							                                <c:set var="leftPosition" value="${leftPosition + 16}" />
							                            </c:if>
							                        </c:forEach>
							                        
							                        <c:set var="leftPosition" value="190"/>
							                        <c:forEach var="lineRowK" items="${screenSeat}" begin="145" end="149">
							                            <c:if test="${lineRowK.sseatCol eq 'K'}">
							                                <div class="seat" style="left: ${leftPosition}px;">
							                                    <a href="#" onclick="return false;">
							                                        <span class="no">${lineRowK.sseatRow}</span>
							                                        <span class="sreader">${lineRowK.sseatType}</span>
							                                        <span class="sreader mod">${lineRowK.sseatno }</span>
							                                        <c:forEach var="useingSeat" items="${useingSeat}">
								                                        <c:if test="${useingSeat.sseatno == lineRowK.sseatno }">
								                                            <input type="hidden" value="${useingSeat.ticketdetailno}" id="ticketNo">
								                                        </c:if>
								                                    </c:forEach>
							                                    </a>
							                                </div>
							                                <c:set var="leftPosition" value="${leftPosition + 16}" />
							                            </c:if>
							                        </c:forEach>
							                    </div>
							                </div>
							            </div>
							        </c:when>
							    </c:choose>
							</c:forEach>
							
							<c:forEach var="lineColL" items="${screenSeat }" varStatus="loop">
							    <c:choose>
							        <c:when test="${loop.index == 152 && lineColL.sseatCol eq 'L'}">
							            <div class="row" style="top: 176px;">
							                <div class="label">${lineColL.sseatCol }</div>
							                <div class="seat_group">
							                    <div class="group">
							                        <c:set var="leftPosition" value="30"/>
							                        <c:forEach var="lineRowL" items="${screenSeat}" begin="149" end="154">
							                            <c:if test="${lineRowL.sseatCol eq 'L'}">
							                                <div class="seat" style="left: ${leftPosition}px;">
							                                    <a href="#" onclick="return false;">
							                                        <span class="no">${lineRowL.sseatRow}</span>
							                                        <span class="sreader">${lineRowL.sseatType}</span>
							                                        <span class="sreader mod">${lineRowL.sseatno }</span>
							                                        <c:forEach var="useingSeat" items="${useingSeat}">
								                                        <c:if test="${useingSeat.sseatno == lineRowL.sseatno }">
								                                            <input type="hidden" value="${useingSeat.ticketdetailno}" id="ticketNo">
								                                        </c:if>
								                                    </c:forEach>
							                                    </a>
							                                </div>
							                                <c:set var="leftPosition" value="${leftPosition + 16}" />
							                            </c:if>
							                        </c:forEach>
							                        
							                        <c:set var="leftPosition" value="206"/>
							                        <c:forEach var="lineRowL" items="${screenSeat}" begin="155" end="159">
							                            <c:if test="${lineRowL.sseatCol eq 'L'}">
							                                <div class="seat" style="left: ${leftPosition}px;">
							                                    <a href="#" onclick="return false;">
							                                        <span class="no">${lineRowL.sseatRow}</span>
							                                        <span class="sreader">${lineRowL.sseatType}</span>
							                                        <span class="sreader mod">${lineRowL.sseatno }</span>
							                                        <c:forEach var="useingSeat" items="${useingSeat}">
								                                        <c:if test="${useingSeat.sseatno == lineRowL.sseatno }">
								                                            <input type="hidden" value="${useingSeat.ticketdetailno}" id="ticketNo">
								                                        </c:if>
								                                    </c:forEach>
							                                    </a>
							                                </div>
							                                <c:set var="leftPosition" value="${leftPosition + 16}" />
							                            </c:if>
							                        </c:forEach>
							                    </div>
							                </div>
							            </div>
							        </c:when>
							    </c:choose>
							</c:forEach>
							</c:if>
						</div>
					</div>
					<div class="legend" style="width: 125px;">
							<div class="seat-icon-desc">
								<span class="icon selected"><span class="icon"></span>선택</span>
								<span class="icon reserved"><span class="icon"></span>예매완료</span>
								<span class="icon notavail"><span class="icon"></span>선택불가</span>
							</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 진행버튼 -->
						<div id="ticket_tnb" class="tnb_container">
							<div class="tnb">
							<form action="payment" name="frm" method="post">
								<input type="hidden" name="mno" value="${mno }" id="mno">
								<input type="hidden" name="user" value="<%= session.getAttribute("mno") %>" id="user">
								<a type="button"
									href="<%=request.getContextPath()%>/ticket/ticketing"
									class="btn-backmovie-check" id="seatSelectionButton"> <span>영화선택</span>
								</a>
								<div class="info movie">
									<span class="movie_poster"> 
									<img src="${cposter }"
										alt="" style="display: inline;">
									</span>
									<div class="row movie_title colspan2" style="display: block;">
										<span class="data letter-spacing-min ellipsis-line2">
											<a id="selectionMovieTitle" style="margin-left: 10px;">${cname }</a>
											<input type="hidden" name="cno" value="${cno }" id="cno">
											<input type="hidden" name="cposter" value="${cposter }" id="cposter">
											<input type="hidden" name="cname" value="${cname }" id="cname">
											<input type="hidden" name="cwatchGradeNm" value="${cwatchGradeNm }" id="cwatchGradeNm">
										</span>
									</div>
									<div class="row movie_rating" style="text-align: 5px;position: relative;left: 25px;display: block;">
										${cwatchGradeNm }
										</div>
										<div class="placeholder" title="영화선택" style="display: none;"></div>
									</div>
									<div class="info theater">
										<div class="row name" style="display: block;">
											<span class="header">극장</span>
											<span class="data letter-spacing-min ellipsis-line1">
												<a title="" id="selectionTheater">${tname }</a>
												<input type="hidden" name="tname" value="${tname }" id="tname">
												<input type="hidden" name="tno" value="${tno }" id="tno">
											</span>
										</div>
										<div class="row date" style="display: block;">
											<span class="header">일시</span>
											<span class="data" title="">
												<a id="dateDay">${dateDay }</a>
												<a id="dateTime">${sstartTime }</a>
												<input type="hidden" name="sday" value="${sday }" id="sday">
												<input type="hidden" name="sstartTime" value="${sstartTime }" id="sstartTime">
											</span>
										</div>
										<div class="row screen" style="display: block;">
											<span class="header">상영관</span>
											<span class="data" id="selectionLocation">
												<a id="selShallType">${shallType }</a>
												<a id="selShallLocation">${shallLocation }</a>
											</span>
											<input type="hidden" name="sno" value="${sno }" id="sno">
											<input type="hidden" name="shallno" value="${shallno }" id="shallno">
											<input type="hidden" name="shallType" value="${shallType }" id="shallType">
											<input type="hidden" name="shallLocation" value="${shallLocation }" id="shallLocation">
										</div>
										<div class="row number" style="display: block;">
											<span class="header">인원</span>
											<span class="data" id="personNumber"></span>
											<input type="hidden" name="personNum" value="" id="personNum">
											<input type="hidden" name="sseatNos" value="" id="sseatNos">
											<input type="hidden" name="seats" value="" id="seats">
										</div>
										<div class="placeholder" title="극장선택" style="display: none;"></div>
									</div>
								<div class="info path">
									<div class="row colspan4">
										<span class="path-step2" title="좌석선택" style="color: red;">&nbsp;</span>
									</div>
								</div>
								</form>
								<button onclick="ticketInfo();" type="submit"
									class="btn-right-check" id="seatSelectionButton">
									<span>예매하기</span>
								</button>
							</div>
						</div>
	</div>
	<%@ include file="../include/footer/userFooter.jsp"%>
<script src="<%=request.getContextPath() %>/resources/js/ticketSeat_view.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/ticketSeat_event.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/ticketing_submit.js"></script>
</body>
</html>