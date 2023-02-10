<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="kr">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <title>Warehouse List</title>
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
</head>
<script src="http://code.jquery.com/jquery-3.6.3.min.js"></script>
<script type="text/javascript">
// $(function() {
// //    	console.log( $(#wh_use).val());
// alert($(".wh_use").val());
// 	$("#use_btn").click(function() {
// 		  $("table tr").each(function() {
// 			  if ( $(this).find(".wh_use").val() == '사용') {
// 		      $(this).show();
// 		    } else {
// 		      $(this).hide();
// 		    }
// 		  });
// 		});
	
// 	$("#not_use_btn").click(function() {
// 		  $("table tr").each(function() {
// 			  if ( $(this).find(".wh_use").val() == '미사용') {
// 		      $(this).show();
// 		    } else {
// 		      $(this).hide();
// 		    }
// 		  });
// 		});
// });
</script>
<body>
    <div class="container-scroller">
      <!-- 사이드바 -->
      <jsp:include page="../partials/sidebar_wh.jsp"></jsp:include>
      <!-- 사이드바 -->
      
      <div class="container-fluid page-body-wrapper">
        <!-- 색상 커스텀 설정 -->
        <jsp:include page="../partials/settings-panel.jsp"></jsp:include>
        <!-- 색상 커스텀 설정 -->
        <!-- 상단 메뉴바 -->
      	<jsp:include page="../partials/navbar.jsp"></jsp:include>
        <!-- 상단 메뉴바  -->
        
        <!-- 본문 영역 -->
        <div class="main-panel">
		<!-- table 영역 -->
       <div class="col-lg-12 grid-margin stretch-card" id="listForm">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">창고 조회</h4>
						<section id="buttonArea">
							<form action="List.wh">
								<!-- 검색 타입 추가 -->
								<div class="form-group">
		                      		<div class="input-group">
		                        		<div class="input-group-prepend">
				                         	<select name="searchType" id="searchType" class="btn btn-sm btn-outline-primary dropdown-toggle"
				                         	 data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
												<option value="wh_cd" <c:if test="${param.searchType eq 'wh_cd'}">selected</c:if>>창고 코드</option>
												<option value="wh_name" <c:if test="${param.searchType eq 'wh_name'}">selected</c:if>>창고명</option>
												<option value="wh_man_name" <c:if test="${param.searchType eq 'wh_man_name'}">selected</c:if>>관리자명</option>
					                        </select>
		                        		</div>
											<input type="text" class="form-control" name="keyword" value="${param.keyword }">
											<input type="submit" class="btn btn-light" value="검색"> &nbsp;&nbsp; 
		                       		 </div>
		                   		</div>
							</form>
						</section>
					<div style="text-align: right;">
						<input type="button" class="btn btn-primary btn-rounded btn-fw" value="전체" onclick="location.href='List.wh'"/>
						<input type="button" class="btn btn-primary btn-rounded btn-fw" value="사용" onclick="location.href='UseAll.wh?wh_use=1'"/>
						<input type="button" class="btn btn-primary btn-rounded btn-fw" value="미사용" onclick="location.href='NotUseAll.wh?wh_use=2'"/>
					</div>
                    <div class="table-responsive">
                      <table class="table table-striped">
                        <thead>
                          <tr>
                            <th>창고코드</th>
                            <th>창고명</th>
                            <th>구분</th>
                            <th>관리자명</th>
                            <th>사용여부</th>
                          </tr>
                        </thead>
	                  <tbody>
	                        <!-- JSTL 과 EL 활용하여 글목록 표시 작업 반복 -->
							<!--=============== 사용여부가 '2'일 경우 뷰페이지에서 숨김처리=========== -->
							<c:forEach var="wh" items="${warehouseList}">
<%-- 								<c:choose> --%>
<%-- 								<c:when test="${wh.wh_use eq '1' }"> --%>
								<tr>
									<c:choose>
										<c:when test="${empty param.pageNum }">
											<c:set var="pageNum" value="1" />
										</c:when>
										<c:otherwise>
											<c:set var="pageNum" value="${param.pageNum }" />
										</c:otherwise>
										</c:choose>
										<td id="wh_cd">
											<a href="WhDetail.wh?wh_cd=${wh.wh_cd }&pageNum=${pageNum }&wh_name=${wh.wh_name }">
												${wh.wh_cd }
											</a>
										</td>
										<td id="wh_name">
											<a href="WhDetail.wh?wh_cd=${wh.wh_cd }&pageNum=${pageNum }&wh_name=${wh.wh_name }">
												${wh.wh_name }
											</a>
										</td>
										<c:choose>
											<c:when test="${wh.wh_gubun eq '1'}">
												<td id="wh_gubun">창고</td>
											</c:when>
											<c:otherwise>
												<td id="wh_gubun">공장</td>
											</c:otherwise>
										</c:choose>
										<td id="wh_man_name">${wh.wh_man_name }</td>
										<c:choose>
											<c:when test="${wh.wh_use eq '1'}">
												<td id="wh_use">사용</td>
											</c:when>
											<c:otherwise>
												<td id="wh_use">미사용</td>
											</c:otherwise>
										</c:choose>
								</tr>
<%-- 							</c:when> --%>
<%-- 						</c:choose> --%>
					</c:forEach>
                  </tbody>
                </table>
              </div>
        <div class="template-demo" style="text-align: right;">
        <!-- table 영역 -->
		<section id="pageList" style="font-size: 0.5em; text-align: center; padding-top: 10px;">
		<!-- 
		현재 페이지 번호(pageNum)가 1보다 클 경우에만 [이전] 링크 동작
		=> 클릭 시 BoardList.bo 서블릿 주소 요청하면서 
		   현재 페이지 번호(pageNum) - 1 값을 page 파라미터로 전달
		-->
		<c:choose>
			<c:when test="${pageNum > 1}">
				<input type="button"  class="btn btn-light" value="이전" onclick="location.href='List.wh?pageNum=${pageNum - 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" class="btn btn-light" value="이전">
			</c:otherwise>
		</c:choose>
			
		<!-- 페이지 번호 목록은 시작 페이지(startPage)부터 끝 페이지(endPage) 까지 표시 -->
		
		<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
<!-- 			<!-- 단, 현재 페이지 번호는 링크 없이 표시 -->
			<c:choose>
				<c:when test="${pageNum eq i}">
					${i }
				</c:when>
				<c:otherwise>
					<a href="List.wh?pageNum=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<!-- 현재 페이지 번호(pageNum)가 총 페이지 수보다 작을 때만 [다음] 링크 동작 -->
		<c:choose>
			<c:when test="${pageNum < pageInfo.maxPage}">
				<input type="button" class="btn btn-light" value="다음" onclick="location.href='List.wh?pageNum=${pageNum + 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" class="btn btn-light" value="다음">
			</c:otherwise>
		</c:choose>
		
	</section>	
	<input type="button" class="btn btn-primary btn-rounded btn-fw" value="신규 창고 등록" onclick="location.href='Regist.wh'" />
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
  </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="${pageContext.request.contextPath }/resources/assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="${pageContext.request.contextPath }/resources/assets/vendors/jquery-bar-rating/jquery.barrating.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/vendors/chart.js/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/vendors/flot/jquery.flot.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/vendors/flot/jquery.flot.resize.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/vendors/flot/jquery.flot.categories.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/vendors/flot/jquery.flot.fillbetween.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/vendors/flot/jquery.flot.stack.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/off-canvas.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/hoverable-collapse.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/misc.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/settings.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/todolist.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/dashboard.js"></script>
    <!-- End custom js for this page -->
  </body>
</html>