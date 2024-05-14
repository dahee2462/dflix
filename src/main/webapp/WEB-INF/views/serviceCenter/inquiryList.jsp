<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>문의 목록</title>

<!-- nav, footer CSS -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/fontawesome.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/templatemo-villa-agency.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/owl.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/animate.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />


<!-- content CSS, JS -->
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
<script src="<%=request.getContextPath()%>/resources/js/helpers.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/config.js"></script>

</head>
<body>
	<%@ include file="../include/nav/userNav.jsp"%>
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<%@ include file="../include/nav/userBoardNav.jsp"%>
			<!-- 본문 컨테이너 -->
			<div class="layout-page">

				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- 본문 시작 -->
					<div class="container-xxl flex-grow-1 container-p-y">
					
						<h4 class="fw-bold py-3 mb-4">
							문의 게시판
						</h4>
						
						<!-- Search
						<div class="row">
							<div class="navbar-nav right">
								<div class="nav-item d-flex right">
									<input type="text" style="width:300px;  margin-left: auto;" class="form-control border-0 shadow-none"
										placeholder="Search..." aria-label="Search..." />
									<button style="margin-left:10px" class="btn searchbtn">Search</button>
								</div>
							</div>
						</div>
						/Search -->
	
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
						<a href="inquiryWrite"><button style="margin-top:50px" class="right btn btn-primary">문의</button></a>

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




						<!-- 본문 끝 -->
						<%@ include file="../include/footer/adminFooter.jsp"%>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>