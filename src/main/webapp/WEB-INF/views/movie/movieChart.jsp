<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>무비차트</title>

    <!-- CSS -->
    <link href="<%=request.getContextPath() %>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/fontawesome.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/templatemo-villa-agency.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/owl.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
    
  </head>
<body>
  <%@ include file="../include/nav/userNav.jsp" %>
  
<!-- 배너 -->
  <div class="page-heading header-text">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <!-- <span class="breadcrumb">영화</span> -->
          <h3>무비차트</h3>
        </div>
      </div>
    </div>
  </div>

  <div class="section properties">
    <div class="container">
      <ul class="properties-filter">
        <li>
          <a class="is_active" href="#!" data-filter="*">전체</a>
        </li>
        <li>
          <a href="#!" data-filter=".액션">액션</a>
        </li>
        <li>
          <a href="#!" data-filter=".로맨스">로맨스</a>
        </li>
        <li>
          <a href="#!" data-filter=".드라마">드라마</a>
        </li>
        <li>
          <a href="#!" data-filter=".스릴러">스릴러</a>
        </li>
        <li>
          <a href="#!" data-filter=".공포">공포</a>
        </li>
        <li>
          <a href="#!" data-filter=".판타지">판타지</a>
        </li>
        <li>
          <a href="#!" data-filter=".코메디">코메디</a>
        </li>
      </ul>
      
      <div class="row properties-box">
      <div class="row">
      	<c:forEach items="${movieChart }" var="movieChart">
        <div class="col-lg-4 col-md-6 align-self-center mb-30 properties-items col-md-6 ${fn:replace(movieChart.cgenreNm,',',' ')} ">
          <div class="item">
            <img src="${movieChart.cposter }" alt="${movieChart.cname }포스터" style="height: 510px;">
            <span class="category">${movieChart.cwatchGradeNm }</span>
            <c:choose>
            	<c:when test="${movieChart.crank != null}">
	            	<h6>${movieChart.crank }위</h6>
	            </c:when>
	            <c:otherwise>
	            	<h6>${movieChart.crank }</h6>
	            </c:otherwise>
            </c:choose>
            <h4>${movieChart.cname }</h4>
            <ul>
              <li>상영시간: <span>${movieChart.cshowTime }분</span></li>
            </ul>
            <div class="main-button">
              <a href="<%=request.getContextPath() %>/movie/movieView?cno=${movieChart.cno}">상세보기</a>
              <a href="<%=request.getContextPath() %>/ticket/ticketing">예매하기</a>
            </div>
          </div>
        </div>
        </c:forEach>
      </div>
        
</div>
      <!-- 페이징 -->
      <div class="row">
        <div class="col-lg-12">
          <ul class="pagination">
           	<c:if test="${pagingVO.startPage > pagingVO.cntPage }">
	        	<li>
	               <a href="movieChart?nowPageParam=${pagingVO.startPage-1}"><i class="tf-icon bx bx-chevrons-left">&lt;</i></a>
	            </li>
            </c:if>
           	<c:set var="loop_flag" value="false" />
            <c:forEach var="i" begin="${pagingVO.startPage }" end="10">
                            	
               	<c:if test="${i > pagingVO.endPage }">
                  <c:set var="loop_flag" value="true" />
            	</c:if>
                            	                 
                <c:if test="${not loop_flag }">
		           <li >
		              <a href="movieChart?nowPageParam=${i}">${i}</a>
		           </li>
		        </c:if>
            </c:forEach>
            <c:if test="${pagingVO.endPage < pagingVO.lastPage}">
	        	<li>
	        		<a href="movieChart?nowPageParam=${pagingVO.endPage+1}"><i class="tf-icon bx bx-chevrons-right">&gt;</i></a>
	        	</li>
            </c:if>
          </ul>
        </div>
      </div>
    </div>
  </div>

<%@ include file="../include/footer/userFooter.jsp" %>

  </body>
</html>