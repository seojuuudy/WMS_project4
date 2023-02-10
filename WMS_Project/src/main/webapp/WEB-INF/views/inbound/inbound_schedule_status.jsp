<%@ page language="Java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
 	<!-- jquery -->
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.3.js"></script>
	<!-- jquery -->
  </head>
  <body>
  
    <div class="container-scroller">
      <div class="container-fluid page-body-wrapper">
        <!-- 상단 메뉴바 -->
<%--       	<jsp:include page="../partials/navbar.jsp"></jsp:include> --%>
        <!-- 상단 메뉴바  -->
        
        <!-- 본문 영역 -->
        <div class="main-panel">
		<!-- table 영역 -->
      	<div class="col-lg-12 grid-margin stretch-card">
           <div class="card">
              	<div class="card-body">
                    <h4 class="card-title">진행 상황 조회</h4>
                    <p class="card-description">입고 예정 번호 : ${param.in_schedule_cd }</p>
                    <div class="table-responsive">
                      <table class="table table-striped">
                        <thead>
                          <tr>
                            <th>품목코드</th>
                            <th>품목명[규격]</th>
                            <th>입고예정수량</th>
                            <th>미입고수량</th>
                            <th>상태</th>
                          </tr>
                        </thead>
                        <tbody>
                        <!-- 반복문 들어갈 자리 -->
                        <c:forEach var="ins" items="${InScheList }" varStatus="status">
                          <tr>
                            <td>${ins.in_schedule_cd}</td>
                            <td>${ins.product_name}[${ins.size_des }]</td>
                            <td>${ins.in_schedule_qty}</td>
                            <td>${ins.in_schedule_qty - ins.in_qty }</td>
                            <c:choose>
                            		<c:when test="${ins.in_complete_pr eq '0'}">
                            			<td>${fn:replace(ins.in_complete_pr, '0', '진행중') }
                            		</c:when>
                            		<c:when test="${ins.in_complete_pr eq '1'}">
                            			<td>${fn:replace(ins.in_complete_pr, '1', '종결') }</td>
                            		</c:when>
                            	</c:choose>
                          </tr>
                        </c:forEach>
                         
                        </tbody>
                      </table>
                    </div>
			        <div class="template-demo" style="text-align: right;">
	           			<button type="button" class="btn btn-primary btn-rounded btn-fw" onclick="window.close()">닫기</button>
           			</div>
               	</div>
             </div>
          </div>
        <!-- table 영역 -->
        </div>
        <!-- 본문 영역 --> 
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    
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