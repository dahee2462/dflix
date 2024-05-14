<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
	
    <title>회원탈퇴</title>

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
    				<form name="frm" id="checkPwFrm" action="withdrawal" method="post" onsubmit="return false;">
					<div class="mb-3 col-md-8">
                      <label for="mpw" class="form-label block fw-semibold">비밀번호를 입력해주세요</label>
                          <input
                              type="password"
                              class="form-control"
                              id="mpw"
                              name="mpw"
                           />
                       </div>
                        <div class="mt-2">
                          <button type="button" onclick="validation();"
                          	class="btn btn-primary" style="margin-left:340px;" >탈퇴하기</button>
                        </div>
				</form>
				</div>
				<script>
				
		    	function validation(){
		    		//에이작스처리
		    		$.ajax({
						url : "confirmPw2",
						type : "post",
						data : {mpw : $("#mpw").val()},
						success : function(data){
							let result = data;
							
							if(result==1){
								if(confirm("정말 탈퇴하시겠습니까?")){
					    			document.frm.submit();	
					    		}
							}else{
								alert("비밀번호가 일치하지 않습니다");
							}
						},error:function(){
							console.log("error");
							
						}
					});		    		
		    	}
		    </script>
    		</div>
    	</div>
    </div>
  </div>
	<!-- 푸터 -->
	<%@ include file="../include/footer/userFooter.jsp" %>
  </body>
</html>