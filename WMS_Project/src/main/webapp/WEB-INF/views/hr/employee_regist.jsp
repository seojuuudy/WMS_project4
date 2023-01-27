<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!-- 			<h1>사원 등록</h1> -->
		
		<!-- 사원 등록 table -->	
        <div class="col-12 grid-margin">
          <div class="card">
            <div class="card-body">
              <h4 class="card-title">사원 등록</h4>
              <form action="#" class="form-sample">
                <p class="card-description">employee regist</p>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">사원명</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" />
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">사원코드</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" value="자동부여로 변경할거임"/>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">부서코드</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" />
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">직급코드</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" />
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">연락처<br>(개인)</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" />
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">연락처<br>(사무실)</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" />
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">성별</label>
                      <div class="col-sm-9">
                        <select class="form-control">
                          <option>Male</option>
                          <option>Female</option>
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">생일</label>
                      <div class="col-sm-9">
                        <input class="form-control" placeholder="yyyy/mm/dd" />
                      </div>
                    </div>
                  </div>
                </div>
<!--                 <div class="row"> -->
<!--                   <div class="col-md-6"> -->
<!--                     <div class="form-group row"> -->
<!--                       <label class="col-sm-3 col-form-label">Category</label> -->
<!--                       <div class="col-sm-9"> -->
<!--                         <select class="form-control"> -->
<!--                           <option>Category1</option> -->
<!--                           <option>Category2</option> -->
<!--                           <option>Category3</option> -->
<!--                           <option>Category4</option> -->
<!--                         </select> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                   <div class="col-md-6"> -->
<!--                     <div class="form-group row"> -->
<!--                       <label class="col-sm-3 col-form-label">Membership</label> -->
<!--                       <div class="col-sm-4"> -->
<!--                         <div class="form-check"> -->
<!--                           <label class="form-check-label"> -->
				<!-- 혹시 radio 버튼 필요할까봐 주석처리 -->
<!--                             <input type="radio" class="form-check-input" name="membershipRadios" id="membershipRadios1" value="" checked /> Free </label> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                       <div class="col-sm-5"> -->
<!--                         <div class="form-check"> -->
<!--                           <label class="form-check-label"> -->
<!--                             <input type="radio" class="form-check-input" name="membershipRadios" id="membershipRadios2" value="option2" /> Professional </label> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                 </div> -->
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">이메일</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" value="추후 자동선택 가능하게 수정"/>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">우편번호</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" value="api사용하여 자동입력"/>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">주소</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" value="api사용하여 자동입력"/>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">상세주소</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" />
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">입사일</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" placeholder="yyyy/mm/dd"/>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">재직여부</label>
                      <!-- 재직 코드 컬럼에서 연결, 목록에서 재직(1), 휴직(2), 퇴사(3) 선택 -->
                      <div class="col-sm-9">
                        <select class="form-control">
                          <option>재직</option>
                          <option>휴직</option>
                          <option>퇴사</option>
                        </select>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">권한</label>
                      <div class="col-sm-9">
                        <select class="form-control">
                          <option>권한선택</option>
                          <option>사원조회</option>
                          <option>사원관리</option>
                          <option>재고조회</option>
                          <option>재고관리</option>
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                     <label class="col-sm-3 col-form-label">사진 업로드</label>
                      <input type="file" name="img[]" class="file-upload-default" />
                      <div class="col-sm-9">
                        <span class="input-group-append">
                        <input type="text" class="form-control file-upload-info" disabled placeholder="Upload Image" />
                          <button class="file-upload-browse btn btn-primary" type="button">Upload</button>
                        </span>
                      </div>
                    </div>
                   </div>
                  </div>
                  <div class="template-demo" style="text-align: right;">
                  <button type="submit" class="btn btn-primary mr-2">등록</button>
                  <button class="btn btn-light">취소</button>
                  </div>
                 </div>
                </div>
               </div>
              </form>
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