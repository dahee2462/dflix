<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html lang="ko" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="resources/"
	data-template="vertical-menu-template-free">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>관리자 문의 목록</title>

<meta name="description" content="" />
<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet" />

<!-- CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/core.css"
	class="template-customizer-core-css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/theme-default.css"
	class="template-customizer-theme-css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/demo.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/perfect-scrollbar.css" />

<!-- JS -->
<script src="<%=request.getContextPath()%>/resources/js/helpers.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/config.js"></script>








</head>

<body>

	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">


			<!-- 좌측 메뉴바 -->
        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
          <div class="app-brand demo">
            <a href="<%=request.getContextPath() %>/" class="app-brand-link">
              <span class="app-brand-text demo menu-text fw-bolder ms-2">dflix</span>
            </a>
            <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
              <i class="bx bx-chevron-left bx-sm align-middle"></i>
            </a>
          </div>

          <div class="menu-inner-shadow"></div>

          <ul class="menu-inner py-1">
            <!-- 관리자메인 -->
            <li class="menu-item">
              <a href="<%=request.getContextPath() %>/admin/theaters/theatersMgList" class="menu-link menu-toggle">
                	극장 관리
              </a>
            </li>
            <li class="menu-item ">
              <a href="<%=request.getContextPath() %>/admin/notice/noticeList" class="menu-link menu-toggle">
                	공지관리
              </a>
            </li>
            <li class="menu-item active">
              <a href="<%=request.getContextPath() %>/admin/inquiry/inquiryList" class="menu-link menu-toggle"">
                	문의관리
              </a>
            </li>
          </ul>
        </aside>

			<!-- 본문 컨테이너 -->
			<div class="layout-page">

				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- 본문 시작 -->
					<div class="container-xxl flex-grow-1 container-p-y">
					
						<h4 class="fw-bold py-3 mb-4">
							문의 게시판
						</h4>
						<!-- Basic Bootstrap Table -->
						<div class="row">
							<div class="card">
								<div class="table-responsive text-nowrap">
									<table class="table">
										<thead>
											<tr>
												<th>번호</th>
												<th>제목</th>
												<th>작성자</th>
												<th>작성일</th>
											</tr>
										</thead>
										<tbody class="table-border-bottom-0">
											<c:forEach items="${board}" var="boardVO" varStatus="status">
												<tr>
													<td>${status.count }</td>
													<td><a href="inquiryView?bno=${boardVO.bno }">${boardVO.btitle } </a>
														<b><span style="color:orange">
															<c:choose>
																<c:when test="${boardVO.replyCnt > 0 }">
																	[답변완료]
																</c:when>
																<c:otherwise>
																	[대기중]
																</c:otherwise>
															</c:choose>
														</span></b>
													</td>
													<td>${boardVO.mname }</td>
													<td>${boardVO.brdate }</td>
												</tr>
											</c:forEach>
										</tbody>
										
									</table>
									
								</div>
								
							</div>
						</div>
						<!--/ Basic Bootstrap Table -->
						<!-- 페이징 -->
						 <div class="demo-inline-spacing">
                        <nav aria-label="Page navigation">
                          <ul class="pagination justify-content-center">
                            
                            <c:if test="${pagingVO.startPage > pagingVO.cntPage }">
	                            <li class="page-item prev">
	                              <a class="page-link" href="inquiryList?nowPageParam=${pagingVO.startPage-1}"><i class="tf-icon bx bx-chevrons-left">&lt;</i></a>
	                            </li>
                            </c:if>
                            
                            <c:set var="loop_flag" value="false" />
                            <c:forEach var="i" begin="${pagingVO.startPage }" end="10">
                            	
                            	<c:if test="${i > pagingVO.endPage }">
                            		<c:set var="loop_flag" value="true" />
                            	</c:if>
                            	
                        
                            	<c:if test="${not loop_flag }">
		                            <li class="page-item">
		                              <a class="page-link" href="inquiryList?nowPageParam=${i}">${i}</a>
		                            </li>
		                        </c:if>
                            </c:forEach>
                            
                            <c:if test="${pagingVO.endPage < pagingVO.lastPage}">
	                            <li class="page-item next">
	                              <a class="page-link" href="inquiryList?nowPageParam=${pagingVO.endPage+1}"><i class="tf-icon bx bx-chevrons-right">&gt;</i></a>
	                            </li>
                            </c:if>
                            
                          </ul>
                          </nav>
						</div>

					
					</div>
				</div>
			</div>
		</div>

		<!-- Overlay -->

	</div>
	<!-- / Layout wrapper -->

</body>
</html>
