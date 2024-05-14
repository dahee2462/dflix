<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <title>영화 상세보기</title>

    <link href="<%=request.getContextPath() %>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/fontawesome.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/templatemo-villa-agency.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/owl.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/animate.css">
    <link rel="stylesheet"href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
    <script src="<%=request.getContextPath() %>/resources/jquery/jquery.min.js"></script>
    <style>
    	.saveBtn{margin-left:90%;}
    	.btn-danger{
    		background-color:#f35525 !important; border: 1px solid #f35525 !important;
    		margin-top:10px;
    	}
    </style>

  </head>
<body>
  <%@ include file="../include/nav/userNav.jsp" %>

<!-- 상세보기 -->
  <div class="single-property section">
    <div class="container">
      <div class="row">
          <div class="col-lg-6 main-image detailimg">
            <img src="${movieDetail.cposter }" alt="${movieDetail.cname }">
          </div>
          <div class="col-lg-6 main-content">
            <span class="category age">${movieDetail.cwatchGradeNm }</span>
            <h4 class="moviename">${movieDetail.cname }</h4>
            <p class="movieinfo"><b>${movieDetail.copenDate } 개봉 </b>| <b>${movieDetail.cshowTime }분</b> | <b>누적관객수</b></p>
            <br>
            <p>${movieDetail.cintro}</p><br>
			<div class="icon-button">
               <a href="<%=request.getContextPath() %>/ticket/ticketing"><i class="fa fa-calendar"></i>예매하기</a>
            </div>
          </div>
           
          <!-- 상세정보, 트레일러, 스틸컷 -->
          <div class="accordion" id="accordionExample">
          
            <div class="accordion-item">
              <h2 class="accordion-header" id="headingOne">
                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                  <b>상세정보</b>
                </button>
              </h2>
              <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                <div class="accordion-body">
	                <ul>
	                	<li>장르: ${movieDetail.cgenreNm}</li>
	                	<li>감독: ${movieDetail.cdirectorNm}</li>
	                	<li>출연: ${movieDetail.cactorNm}</li>
	                </ul>
                </div>
              </div>
            </div>
            
<!--             <div class="accordion-item">
              <h2 class="accordion-header" id="headingTwo">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                  <b>스틸컷</b>
                </button>
              </h2>
              <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                	사진들
                </div>
              </div>
            </div>
            
            <div class="accordion-item">
              <h2 class="accordion-header" id="headingThree">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                  <b>트레일러</b>
                </button>
              </h2>
              <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                <div class="accordion-body">
                	영상들
                </div>
              </div>
            </div> -->
          </div>
      </div>
    </div>
  </div>

<!-- 댓글 -->
<div class="container">
      <div class="card my-4">
      	<h5 class="card-header">댓글</h5>
		  <div class="card-body">
		  	<!-- 댓글 작성창: 로그인한 유저만 보이게 -->
		  	<sec:authorize access="isAuthenticated()">
			  	<form action="replyWrite" method="post" name="replyAdd">
			  		<div class="form-group">
			  			<input type="text" class="form-control" name="ccmtContent" id="ccmtContent">
			  		</div>
			  		<input type="hidden" name="cno" value="${movieDetail.cno}">
			  		<input type="hidden" name="mno" value="<sec:authorize access="isAuthenticated()"><sec:authentication property="principal.mno"/></sec:authorize>">
			  		<button type="submit" class="btn btn-danger saveBtn" onclick="replyWriteFn()">댓글 작성</button>
			  	</form>
		  	</sec:authorize>
		  	<div class="card my-4">
			  	<!-- 댓글 목록 -->
			  	<h5 class="card-header">댓글 목록</h5>
			  	<div class="card-body">
				  	<ul class=" row navbar navbar-example navbar-expand-lg bg-light mb-3 list-group">
						<c:forEach var="item" items="${replyList}">
							<li class="list-group-item">
								<!-- 댓글 구분가능하도록 댓글내용_댓글번호 부여 -->
								<b>${item.mnickNm}</b> :<span id="ccmtContent_${item.ccmtno}">${item.ccmtContent}</span>
								<span>(${item.ccmtRdadte})</span>
								<sec:authorize access="isAuthenticated()">
	                               <c:if test="${item.mno eq pageContext.request.userPrincipal.principal.mno}">
	                               <span>
	                                  <button type="button" class="btn btn-danger btn-sm float-right editBtn" data-ccmtno="${item.ccmtno}">수정</button>
	                               </span>
	                               	  <button type="button" class="btn btn-danger btn-sm float-right deleteBtn">삭제</button>
	                               </c:if>
	                            </sec:authorize>							
	                         </li>
	                         	<form action="replyDelete" method="post" name="replyDel">
								<input type="hidden" name="ccmtno" id="ccmtno" value="${item.ccmtno}">
								<input type="hidden" name="cno" value="${movieDetail.cno}">
							</form>
						</c:forEach>
					</ul>
				</div>

			  </div>
			</div>
  	</div>
  </div>
      <script>
	    function replyWriteFn() {
	    	document.getElementById('ccmtContent').value = document.getElementById('ccmtContent').value;
	    	document.forms['replyAdd'].submit();
	    }
	    // 수정 버튼 클릭 시 수정 폼 표시
    	 $(document).on("click", ".editBtn", function() {
	        var ccmtno = $(this).data("ccmtno");
	        var contentSpan = $("#ccmtContent_"+ccmtno);
	        var currentContent = contentSpan.text().trim();
	        contentSpan.html('<input type="text" id="editInput_'+ccmtno+'" value="'+currentContent+'">');
	        //e.stopPropagation();
	        $(this).parent().html('<button class="btn btn-danger btn-sm float-right confirmEdit" data-ccmtno="'+ccmtno+'">확인 </button>');
	        $(this).remove();
	    });

	    // 확인 버튼 클릭 시 수정 내용 서버로 전송
	    $(document).on("click", ".confirmEdit", function() {
	        var ccmtno = $(this).data("ccmtno");
	        var newContent = $("#editInput_"+ccmtno).val();
	        $.ajax({
	            url: "replyUpdate",
	            method: "POST",
	            data: { ccmtno: ccmtno, ccmtContent: newContent },
	            success: function(response) {
	                $("#ccmtContent_"+ccmtno).text(newContent);
	                var parent = $(".confirmEdit[data-ccmtno="+ccmtno+"]").parent();
	                $(".confirmEdit[data-ccmtno="+ccmtno+"]").remove();
	                parent.html('<button class="btn btn-danger btn-sm float-right editBtn" data-ccmtno="'+ccmtno+'">수정</button>');
	            },
	            error: function(xhr, status, error) {
	                console.error("AJAX 요청 중 오류 발생:", error);
	            }
	        });
	    });

	    // 삭제 버튼 클릭 시 서버로 삭제 요청
	    $(".deleteBtn").click(function() {
	       
	        if (confirm("삭제하시겠습니까?")) {
	       
	            document.forms['replyDel'].submit();
	        }
	    });
    </script>
  <%@ include file="../include/footer/userFooter.jsp" %>


  </body>
</html>