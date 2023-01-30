<%@ page language="Java" contentType="text/html; charset=UTF-8"
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
		
		<!-- 사원 정보 table -->	
        <div class="col-12 grid-margin">
          <div class="card">
            <div class="card-body">
              <h4 class="card-title">사원 정보</h4>
              <form action="RegistPro.hr" method="post" enctype="multipart/form-data" class="form-sample">
                <p class="card-description">employee information</p>
	              <div class="col-sm-4 stretch-card grid-margin" style="margin:0 auto;">
	                <div class="card_photo">
	                  <div class="card-body p-0">
	                  <img src="${pageContext.request.contextPath }/resources/upload/${emp.photo}" alt="image"/>
	                  </div>
	                  <div class="card-body px-3 text-dark">
	                    <h5 class="font-weight-semibold">${emp.emp_num }</h5>
	                  </div>
	                </div>
	              </div>
	            <hr>  
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                     <label class="col-sm-3 col-form-label">사원명</label>
                      <div class="col-sm-9">
                        <input type="text" name="emp_name" class="form-control" value="${emp.emp_name }" readonly/>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">부서코드</label>
                      <div class="col-sm-9">
                      	<input type="text" name="dept_cd" class="form-control" value="${emp.dept_cd }" readonly/>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">직급코드</label>
                      <div class="col-sm-9">
                      	<input type="text" name="grade_cd" class="form-control" value="${emp.grade_cd }" readonly/>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">연락처<br>(개인)</label>
                      <div class="col-sm-9">
                        <input type="text" name="emp_tel" class="form-control" value="${emp.emp_tel }" readonly/>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">연락처<br>(사무실)</label>
                      <div class="col-sm-9">
                         <input type="text" name="emp_dtel" class="form-control" value="${emp.emp_dtel }" readonly/>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">이메일</label>
                      <div class="col-sm-9">
                      	<span class="input-group-append">
	                        <input type="text" name="emp_email" class="form-control file-upload-info" value="${emp.emp_email }" readonly/>
                     	</span>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">우편번호</label>
                      <div class="col-sm-9">
                    	<span class="input-group-append">
                       		<input type="text" name="emp_post_no" class="form-control file-upload-info" value="${emp.emp_post_no }" id="sample6_postcode" readonly>
                        </span>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- 주소, 상세주소를 따로 입력받기 위해 속성명을 emp_addr1, emp_addr2로 나눔-->    
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">주소</label>
                      <div class="col-sm-9">
						<input type="text" name="emp_addr" class="form-control" value="${emp.emp_addr }" id="sample6_postcode"readonly><br>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">입사일</label>
                      <div class="col-sm-9">
                        <input type="date" name="hire_date" class="form-control" value="${emp.hire_date }" readonly/>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">재직여부</label>
                      <!-- 재직 코드 컬럼에서 연결, 목록에서 재직(1), 휴직(2), 퇴사(3) 선택 -->
                      <div class="col-sm-9">
                       <input type="text" name="work_cd" class="form-control" value="${emp.work_cd }" readonly/>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">권한</label>
                      	<div class="col-sm-9">
                      		<input type="text" name="priv_cd" class="form-control" value="${emp.priv_cd }" readonly/>
                     	</div>
                      </div>
                    </div>
                  </div>
                  <div class="template-demo" style="text-align: right;">
<!-- 	                  <button type="submit" class="btn btn-primary mr-2">수정</button> -->
	                  <input type="button" class="btn btn-light" value="목록" onclick="history.back()">
                  </div>
              	</form>
               </div>
              </div>
             </div>
            </div>
           </div>
          </div>
        
		<!-- 사원 등록 table -->	
			
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