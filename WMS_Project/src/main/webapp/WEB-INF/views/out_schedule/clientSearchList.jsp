<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="kr">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Plus Admin</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/vendors/jquery-bar-rating/css-stars.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/vendors/font-awesome/css/font-awesome.min.css" />
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/demo_1/style.css" />
    <!-- End layout styles -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/images/favicon.png" />
 	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery-3.6.3.js"></script>
  	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		function setParentText(cust_name, business_no){
// 			let business_val = opener.$("#business_no").val();
// 			let business_val = document.getElementById("business_no").value; 
// 			window.opener.document.getElementById("business_no").value = business_val;
			opener.set_cl(cust_name, business_no);
			
			window.close();
// 			$("#business_no").val(business_val);
// 			opener.document.getElementById("pInput").value = document.getElementById("cInput").value
	    }
	
	</script>
  </head>
  <body>
  
    <div class="container-scroller">
      
      <div class="container-fluid page-body-wrapper">
        <!-- 색상 커스텀 설정 -->
        <jsp:include page="../partials/settings-panel.jsp"></jsp:include>
        <!-- 색상 커스텀 설정 -->
        
        <!-- 본문 영역 -->
        <div class="main-panel">
<!-- 			<h1>사원 조회</h1> -->
			
		<!-- table 영역 -->
       <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">거래처 조회</h4>
<!-- 						<section id="buttonArea"> -->
					<p class="card-description">client list</p>
					 <form action="ClientSearchList.cl" >
						<!-- 검색 타입 추가 -->
						<div class="form-group">
                      	<div class="input-group">
                        <div class="input-group-prepend">
                          <select name="searchType" id="searchType" class="btn btn-sm btn-outline-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<option value="business_no" <c:if test="${param.searchType eq 'business_no'}">selected</c:if>>거래처 코드</option>
							<option value="cust_name" <c:if test="${param.searchType eq 'cust_name'}">selected</c:if>>거래처명</option>
							<option value="uptae_jongmok" <c:if test="${param.searchType eq 'uptae_jongmok'}">selected</c:if>>업태&종목</option>
                          </select>
                        </div>
<%-- 							<input type="text" id="business_no" class="form-control" name="business_no" value="${param.keyword }"> --%>
							<input type="text" id="business_no" class="form-control" name="business_no" >
<!-- 							<input type="button" value="창닫기" class="form-control" onclick="window.close()"> -->
<!-- 							<input type="button" value="창닫기" class="form-control" onclick="window.close()"> -->
							<input type="submit" class="btn btn-sm btn-outline-primary" value="검색"> &nbsp;&nbsp; 
                        </div>
                   		</div>
					</form>
<!-- 						</section> -->
                    <div class="table-responsive">
                      <table class="table table-striped">
                        <thead>
                          <tr>
                            <th>거래처코드</th>
                            <th>거래처명</th>
                            <th>대표자명</th>
                            <th>업태</th>
                            <th>종목</th>
                          </tr>
                        </thead>
                        <tbody>
                        <!-- JSTL 과 EL 활용하여 글목록 표시 작업 반복 -->
						<c:forEach var="client" items="${clientList }">
							<tr>
								<!-- 만약, pageNum 파라미터가 비어있을 경우 pageNum 변수 선언 및 기본값 1로 설정 -->
								<c:choose>
									<c:when test="${empty param.pageNum }">
										<c:set var="pageNum" value="1" />
									</c:when>
									<c:otherwise>
										<c:set var="pageNum" value="${param.pageNum }" />
									</c:otherwise>
								</c:choose>
								<td id="business_no">
									<a href="javascript:setParentText('${client.cust_name }', '${client.business_no }')">
										${client.business_no }
									</a>
								</td>
								<td id="cust_name">
								<a href="javascript:setParentText('${client.cust_name }', '${client.business_no }')">${client.cust_name }</a>
								</td>
								
<%-- 									<a href="ClientDetail.cl?cust_name=${client.cust_name }&pageNum=${pageNum }"> --%>
<%-- 									<a href="ClientDetail.cl?business_no=${client.business_no }&pageNum=${pageNum }&cust_name=${client.cust_name }"> --%>
<%-- 										${client.cust_name } --%>
<!-- 									</a> -->
								<td>${client.boss_name }</td>
								<td>${client.uptae }</td>
								<td>${client.jongmok }</td>
							</tr>
						</c:forEach>
                        </tbody>
                      </table>
                    </div>
			        <div class="template-demo" style="text-align: center;">
<!-- 	           			<button type="button" class="btn btn-primary btn-rounded btn-fw" onclick="location.href='Detail.hr'">임시 사원상세정보</button> -->
<!-- 	           			<button type="button" class="btn btn-primary btn-rounded btn-fw" onclick="location.href='Regist.hr'">신규사원 등록</button> -->
        <!-- table 영역 -->
		<section id="pageList">
		<!-- 
		현재 페이지 번호(pageNum)가 1보다 클 경우에만 [이전] 링크 동작
		=> 클릭 시 BoardList.bo 서블릿 주소 요청하면서 
		   현재 페이지 번호(pageNum) - 1 값을 page 파라미터로 전달
		-->
		<c:choose>
			<c:when test="${pageNum > 1}">
				<input type="button"  class="btn btn-light" value="이전" onclick="location.href='ClientSearchList.cl?pageNum=${pageNum - 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" class="btn btn-light" value="이전">
			</c:otherwise>
		</c:choose>
			
		<!-- 페이지 번호 목록은 시작 페이지(startPage)부터 끝 페이지(endPage) 까지 표시 -->
		
		
		<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
			<!-- 단, 현재 페이지 번호는 링크 없이 표시 -->
			<c:choose>
				<c:when test="${pageNum eq i}">
					${i }
				</c:when>
				<c:otherwise>
					<a href="ClientSearchList.cl?pageNum=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<!-- 현재 페이지 번호(pageNum)가 총 페이지 수보다 작을 때만 [다음] 링크 동작 -->
		<c:choose>
			<c:when test="${pageNum < pageInfo.maxPage}">
				<input type="button" class="btn btn-light" value="다음" onclick="location.href='ClientSearchList.cl?pageNum=${pageNum + 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" class="btn btn-light" value="다음">
			</c:otherwise>
		</c:choose>
		
	</section>	
	 </div>
            </div>
               		</div>
             
		<footer class="footer">
          	<jsp:include page="../partials/footer.jsp"></jsp:include>
          </footer>
        </div>
        <!-- 본문 영역 --> 
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <!-- End custom js for this page -->
  </body>
</html>