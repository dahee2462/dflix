<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
	
    <title>Dflix</title>

    <link href="<%=request.getContextPath() %>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/fontawesome.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/templatemo-villa-agency.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/owl.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
  </head>
<body>

  <%@ include file="include/nav/userNav.jsp" %>

<!-- 슬라이드배너 -->
  <div class="main-banner">
    <div class="owl-carousel owl-banner">
      <div class="item item-1">
        <div class="header-text">
          <span class="category">2024.04.10 <em>쿵푸팬더4</em></span>
          <h2>4월,<br> 오랜만이지! 드림웍스 레전드 시리즈 컴백!</h2>
        </div>
      </div>
      <div class="item item-2">
        <div class="header-text">
          <span class="category">2024.02.22 <em>파묘</em></span>
          <h2>“전부 잘 알 거야…<br> 묘 하나 잘못 건들면<br> 어떻게 되는지”</h2>
        </div>
      </div>
      <div class="item item-3">
        <div class="header-text">
          <span class="category">2024.04.16 <em>사랑은 빛</em></span>
          <h2>'사랑을 하는 여성에게는 빛이 보인다'<br>특이한 체질을 가진 대학생 사이조.</h2>
        </div>
      </div>
    </div>
  </div>

<!-- 티저 -->
  <div class="video section">
    <div class="container">
      <div class="row">
        <div class="col-lg-4 offset-lg-4">
          <div class="section-heading text-center">
            <h6>| Tiser View</h6>
            <h2>쿵푸팬더4 티저 <br>보러가기</h2>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="video-content">
    <div class="container">
      <div class="row">
        <div class="col-lg-10 offset-lg-1">
          <div class="video-frame">
            <img src="<%=request.getContextPath() %>/resources/images/쿵푸팬더4_2.jpg" alt="듄">
            <a href="https://youtu.be/b0yAOYIvP1Y" target="_blank"><i class="fa fa-play"></i></a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="fun-facts">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="wrapper">
            <div class="row">
              <div class="col-lg-4">
                <div class="counter">
                  <h2 class="timer count-title count-number" data-to="1" data-speed="1000"></h2>
                   <p class="count-text ">전세계 박스오피스<br>4.2억만 달러 달성</p>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="counter">
                  <h2 class="timer count-title count-number" data-to="2" data-speed="1000"></h2>
                  <p class="count-text ">아카데미 시상식에서<br>6관왕 수상</p>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="counter">
                  <h2 class="timer count-title count-number" data-to="3" data-speed="1000"></h2>
                  <p class="count-text ">시즌1 국내에서<br>162만 관객 동원</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
<!-- 현재상영작 -->
  <div class="properties section">
    <div class="container">
    
      <div class="row">
        <div class="col-lg-4 offset-lg-4">
          <div class="section-heading text-center">
            <h6>| TOP6</h6>
            <h2>현재상영작</h2>
          </div>
        </div>
        <a href="<%=request.getContextPath() %>/movie/movieChart" class="more">더보기 ></a>
      </div>
      <div class="row">
      	<c:forEach items="${movieChart }" var="movieChart">
        <div class="col-lg-4 col-md-6">
          <div class="item">
            <img src="${movieChart.cposter }" alt="${movieChart.cname }포스터" style="height: 510px;">
            <span class="category">${movieChart.cwatchGradeNm }</span>
            <h6>${movieChart.crank }위</h6>
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
  </div>
  
  <!-- 상영예정작 -->
    <div class="properties section">
    <div class="container">
      <div class="row">
        <div class="col-lg-4 offset-lg-4">
          <div class="section-heading text-center">
            <h6>| TOP6</h6>
            <h2>상영예정작</h2>
          </div>
        </div>
        <a href="<%=request.getContextPath() %>/movie/movieSchedule" class="more">더보기></a>
      </div>
      <div class="row">
        <c:forEach items="${unopenMovie }" var="unopenMovie">
        <div class="col-lg-4 col-md-6">
          <div class="item">
            <img src="${unopenMovie.cposter }" alt="${unopenMovie.cname }" style="height: 510px;">
            <span class="category">${unopenMovie.cwatchGradeNm }</span>
            <h6>D${unopenMovie.dday }</h6>
            <h4>${unopenMovie.cname }</h4>
            <ul>
              <li>상영시간: <span>${unopenMovie.cshowTime }분</span></li>
              <li>개봉일: <span>${unopenMovie.copenDate }</span></li>
            </ul>
            <div class="main-button">
              <a href="<%=request.getContextPath() %>/movie/movieView?cno=${unopenMovie.cno}">상세보기</a>
              <a href="<%=request.getContextPath() %>/ticket/ticketing">예매하기</a>
            </div>
          </div>
        </div>
        </c:forEach>
      </div>
    </div>
  </div>
  
<!-- 찾아오시는 길 -->
  <div class="contact section">
    <div class="container">
      <div class="row">
        <div class="col-lg-4 offset-lg-4">
          <div class="section-heading text-center">
            <h6>| dflix 전주점</h6>
             <h2>찾아오시는 길</h2>
          </div>
        </div>
      </div>
    </div>
  </div>

   <div class="contact-content">
    <div class="container">
      <div class="row">
        <div class="col-lg-10 offset-lg-1">
        	<!-- 지도 -->
          <div id="map">
			<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d25873.92121563474!2d127.11292625642456!3d35.843114464841335!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357023cf24351681%3A0x7b826dc435477ec4!2zQ0dWIOyghOyjvOqzoOyCrA!5e0!3m2!1sko!2skr!4v1710292440378!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>          </div>
          <div class="row">
            <div class="col-lg-6">
            </div>
          </div>
        </div>

      </div>
    </div>
  </div> 
<%@ include file="include/footer/userFooter.jsp" %>


  </body>
  

</html>