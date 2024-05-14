<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
	
    <title>내 정보 | 영화속으로 Dflix</title>
    
     <script src="<%=request.getContextPath() %>/resources/jquery/jquery.min.js"></script>
  </head>
<body>
<%@ include file="../include/header/myinfoHeader.jsp" %>
<%@ include file="../include/nav/userNav.jsp" %>

<!-- body -->
  <div class="properties section">
    <div class="myinfo-container">
    	<!-- 프로필 -->
    	<div class="profile">
    		<div class="profile-box">
	    		<sec:authorize access="isAuthenticated()">
				<strong><sec:authentication property="principal.mname"/> 님</strong>
				<em><sec:authentication property="principal.username"/></em>
				<br> 
				</sec:authorize>
    		</div>
    	</div>
    	<!-- 내 정보 내역 -->
    	<div class="myinfo-content">
    		<!-- 서브메뉴 -->
    		<div class="myinfo-submenu">
    			<ul>
    				<li>
    					<a href="<%=request.getContextPath() %>/myInfo">나의 예매내역</a>
    				</li>
    			</ul>
    			<ul>
    				<li>
    					<a href="<%=request.getContextPath() %>/myInfo/changeMyinfo">개인정보 변경</a>
    				</li>
    			</ul>
    			<ul>
    				<li>
    					<a href="<%=request.getContextPath() %>/myInfo/withdrawal">회원탈퇴</a>
    				</li>
    			</ul>
    		</div>
    		<!-- 본문내용 -->
    		<div class="myinfo-detail">
				<!-- My 예매내역 -->
    			<div class="myTicketing-tit">
    				<h3>MY 예매내역</h3>
					<p><em>${list.size()}건</em></p>
					<span>예매번호로만 티켓을 찾을 수 있으니 반드시 확인 부탁드립니다.</span>
				</div>
				<div class="myTicketing-box">
					<div class="box-inner"> 
				  	<table class=" row navbar navbar-example navbar-expand-lg bg-light mb-3 list-group">
						<c:forEach var="tVo" items="${list}">
						<tr>
							<th>예매번호: </th>
							<td>${tVo.ticket.ticketno}</td>
						</tr>
						<tr>
							<th>영화명: </th>
							<td>${tVo.detail[0].cname}</td>
 						</tr>
						<tr>
							<th>극장:</th>
							<td>${tVo.detail[0].tname}/${tVo.detail[0].shallLocation} </td>
						</tr>
						<tr>
							<th>일시:</th>
							<td>${tVo.detail[0].sday} ${tVo.detail[0].sstartTime} ~ ${tVo.detail[0].sendTime} </td>
						</tr>
						<tr>
							<th>인원:</th>
							<td>${tVo.detail.size()}명</td>
						</tr>
						<tr>
							<th>좌석</th>
							<td>
								<c:forEach var="detail" items="${tVo.detail}">
	                                    ${detail.sseatCol}${detail.sseatRow} 
                            	</c:forEach>
							</td>
						</tr>
						<tr>
							<th></th>
							<td>
								<form action="myTicketDel" method="post" name="myTicketDel">
									<input type="hidden" name="ticketno" id="ticketno" value="${tVo.ticket.ticketno}">
									<button type="button" class="btn btn-danger btn-sm float-right deleteBtn">예매 취소</button>
								</form>
							</td>
						</tr>
						</c:forEach>
					</table>
					 </div>

				</div>
    		</div>
    	</div>
    	<script>
	    // 삭제 버튼 클릭 시 서버로 삭제 요청
	    $(".deleteBtn").click(function() {
	    	console.log(this);
	    	console.log($(this));
	    	console.log($(this).parent());
	    	let flag = confirm("삭제하시겠습니까?"); 
	        if (flag) {
	        	$(this).parent().submit()
//	            document.forms['myTicketDel'].submit();
	        }
	    });
    	</script>
    </div>
  </div>
	<!-- 푸터 -->
	<%@ include file="../include/footer/userFooter.jsp" %>
  </body>
</html>