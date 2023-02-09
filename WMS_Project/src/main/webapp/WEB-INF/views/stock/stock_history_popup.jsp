<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="kr">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>WMS Project</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/vendors/jquery-bar-rating/css-stars.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/vendors/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/stock_history_popup.css" />
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/demo_1/style.css" />
    <!-- End layout styles -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/images/favicon.png" />
    <script src="${pageContext.request.contextPath }/resources/assets/js/jquery-3.6.3.js"></script>
	<script type="text/javascript">
	
	</script>
  </head>
  <body>
  <button type="button" class="btn btn-light" onclick="history.back()">뒤로가기</button>
    <div class="container-scroller">
        <!-- 본문 영역 -->
        <div class="main-panel">
<!-- 			<h1>이력 조회</h1> -->
	
		<!-- table 영역 -->
       <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">재고이력</h4>
<!-- 						<section id="buttonArea"> -->
					<p class="card-description">Stock Detail</p>
<!-- 						</section> -->
                    <div class="table-responsive">
                      <table class="table table-striped">
                        <thead>
                          <tr>
                            <th>재고번호</th>
                            <th>작업일자</th>
                            <th>작업구분</th>
                            <th>품목명[규격]</th>
                            <th>보내는 재고번호</th>
                            <th>받는 재고번호</th>
                            <th>수량</th>
                            <th>작업자명</th>
                            <th>적요</th>
                          </tr>
                        </thead>
                        <tbody>
                       <c:forEach var="stock" items="${stock_history }">
	                         
	                          <tr>
	                          	<th class="stock_cd">${stock.stock_cd }</th>
	                          	<th class="stock_date">${stock.stock_date }</th>
	                          	<th class="work_type_name">${stock.work_type_name }</th>
	                            <td class="product_name">${stock.product_name } [${stock.size_des }]</td>
	                            <td class="source_stock_cd"><a href="Stock_history_popup.st?stock_cd=${stock.source_stock_cd }">${stock.source_stock_cd }</a></td>
	                            <td class="target_stock_cd"><a href="Stock_history_popup.st?stock_cd=${stock.target_stock_cd }">${stock.target_stock_cd }</a></td>
	                            <td class="qty">${stock.qty }</td>
	                            <td class="emp_name">${stock.emp_name }</td>
	                            <td class="remarks">${stock.remarks }</td>
	                          </tr>
	                         </c:forEach>
                        </tbody>
                      </table>
                    </div>
			        <div class="template-demo" style="text-align: center;">
<!-- 	           			<button type="button" class="btn btn-primary btn-rounded btn-fw" onclick="location.href='#'">#</button> -->
<!-- 	           			<button type="button" class="btn btn-primary btn-rounded btn-fw" onclick="location.href='#'">#</button> -->
        <!-- table 영역 -->
		<section id="pageList">
		<!-- 
		현재 페이지 번호(pageNum)가 1보다 클 경우에만 [이전] 링크 동작
		=> 클릭 시 BoardList.bo 서블릿 주소 요청하면서 
		   현재 페이지 번호(pageNum) - 1 값을 page 파라미터로 전달
		-->
		<c:choose>
			<c:when test="${pageNum > 1}">
				<input type="button"  class="btn btn-light" value="이전" onclick="location.href='#'">
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
					<a href="#?pageNum=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<!-- 현재 페이지 번호(pageNum)가 총 페이지 수보다 작을 때만 [다음] 링크 동작 -->
		<c:choose>
			<c:when test="${pageNum < pageInfo.maxPage}">
				<input type="button" class="btn btn-light" value="다음" onclick="location.href='#?pageNum=${pageNum + 1}'">
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