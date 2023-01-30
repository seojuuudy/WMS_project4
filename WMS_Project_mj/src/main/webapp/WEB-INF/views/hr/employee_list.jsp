<%@ page language="JAva" contentType="text/html; charset=UTF-8"
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
 	<!-- jquery -->
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.3.js"></script>
	<!-- jquery -->
  </head>
  <body>
  
    <div class="container-scroller">
      <!-- 사이드바 -->
      <jsp:include page="../partials/sidebar_hr.jsp"></jsp:include>
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
       <div class="col-lg-12 grid-margin stretch-card">
           <div class="card">
              	<div class="card-body">
                    <h4 class="card-title">사원 조회</h4>
                    <p class="card-description">employee list</p>
					 <form action="List.hr">
						<!-- 검색 타입 추가 -->
						<div class="form-group">
                      	<div class="input-group">
                        <div class="input-group-prepend">
                          <select name="searchType" id="searchType" class="btn btn-sm btn-outline-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <option class="dropdown-item" value="emp_name" <c:if test="${param.searchType eq 'emp_name'}">selected</c:if>>사원명</option>
                            <option class="dropdown-item" value="dept_name" <c:if test="${param.searchType eq 'dept_name'}">selected</c:if>>부서</option>
                            <option class="dropdown-item" value="grade_name" <c:if test="${param.searchType eq 'grade_name'}">selected</c:if>>직급</option>
                          </select>
                        </div>
                       	  <input type="text" name="keyword" value="${param.keyword }" class="form-control"/>
                          <input type="submit" class="btn btn-sm btn-primary" value="search" />
                        </div>
                    </div>
						</form>
                    <div class="table-responsive">
                      <table class="table table-striped">
                        <thead>
                          <tr>
                            <th>이미지</th>
                            <th>사원번호</th>
                            <th>사원명</th>
                            <th>부서</th>
                            <th>직급</th>
                            <th>연락처</th>
                            <th>E-mail</th>
                            <th></th>
                          </tr>
                        </thead>
                        <tbody>
                        
                        <!-- 사원 목록 반복문 들어갈 자리 -->
                        <c:forEach var="emp" items="${empList }">
                          <tr>
                            <td class="py-1">
                              <img src="${pageContext.request.contextPath }/resources/upload/${emp.photo}" alt="image" />
                            </td>
                            <td>${emp.emp_num}</td>
                            <td>${emp.emp_name}</td>
                            <td>${emp.dept_name}</td>
                            <td>${emp.grade_name}</td>
                            <td>${emp.emp_tel}</td>
                            <td>${emp.emp_email}</td>
                            <td>
                         		<button type="button" class="btn btn-primary btn-rounded i" onclick="location.href='Detail.hr?emp_email=${emp.emp_email}'">상세조회</button>
                            	<button type="button" class="btn btn-primary btn-rounded i" onclick="location.href='Update.hr?emp_email=${emp.emp_email}'">수정</button>
                            </td>
                          </tr>
                        </c:forEach>
                         
                        </tbody>
                      </table>
                    </div>
			        <div class="template-demo" style="text-align: right;">
	           			<button type="button" class="btn btn-primary btn-rounded btn-fw" onclick="location.href='Regist.hr'">신규등록</button>
           			</div>
         
				         <section id="pageList" style="text-align: center;"> <!-- 페이징 처리 영역 -->
				    
					     <!-- 만약, pageNum 파라미터가 비어있을 경우 pageNum 변수 선언 및 기본값 1로 설정 -->
						<c:choose>
							<c:when test="${empty param.pageNum }">
								<c:set var="pageNum" value="1" />
							</c:when>
							<c:otherwise>
								<c:set var="pageNum" value="${param.pageNum }" />
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${pageNum > 1}">
								<input type="button" class="btn btn-sm btn-outline-primary" value="이전" onclick="location.href='List.hr?pageNum=${pageNum - 1}'">
							</c:when>
							<c:otherwise>
								<input type="button" class="btn btn-sm btn-outline-primary" value="이전">
							</c:otherwise>
						</c:choose>
							
						<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
							<c:choose>
								<c:when test="${pageNum eq i}">
									${i }
								</c:when>
								<c:otherwise>
									<a href="List.hr?pageNum=${i }">${i }</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
				
						<c:choose>
							<c:when test="${pageNum < pageInfo.maxPage}">
								<input type="button" class="btn btn-sm btn-outline-primary" value="다음" onclick="location.href='List.hr?pageNum=${pageNum + 1}'">
							</c:when>
							<c:otherwise>
								<input type="button" class="btn btn-sm btn-outline-primary" value="다음">
							</c:otherwise>
						</c:choose>
					</section>
               	</div>
             </div>
          </div>
        <!-- table 영역 -->
        </div>
        <!-- 본문 영역 --> 
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
		<footer class="footer">
          	<jsp:include page="../partials/footer.jsp"></jsp:include>
        </footer>
    
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