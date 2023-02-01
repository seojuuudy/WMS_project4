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
      <jsp:include page="../partials/sidebar_client.jsp"></jsp:include>
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
              <h4 class="card-title">거래처 상세정보</h4>
              <form action="ClientModify.cl" class="form-sample">
                <p class="card-description">${client.cust_name } Information<br></p>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">거래처명</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" value="${client.cust_name }" />
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">거래처 코드</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" value="${client.business_no }"/>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">대표자명</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" value="${client.boss_name }"/>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">대표전화번호</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" value="${client.tel }"/>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">이메일</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" value="${client.email }"/>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">모바일</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" value="${client.mobile_no }"/>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">업태</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" value="${client.uptae }"/>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">종목</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" value="${client.jongmok }"/>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">Fax</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" value="${client.fax }"/>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">홈페이지</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" value="${client.url_path }"/>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">우편번호</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" value="${client.post_no }"/>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">주소</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" value="${client.addr }"/>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">담당자</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" value="${client.man_name }"/>
                      </div>
                    </div>
                  </div>
<!--                   <div class="col-md-6"> -->
<!--                     <div class="form-group row"> -->
<!--                       <label class="col-sm-3 col-form-label">담당자 전</label> -->
<!--                       <div class="col-sm-9"> -->
<!--                         <input type="text" class="form-control" /> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                   </div> -->
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">담당자 전화번호</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" value="${client.man_tel }"/>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">담당자 E-Mail</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" value="${client.man_email }"/>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">적요(비고)</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" value="${client.remarks }"/>
                      </div>
                    </div>
                  </div>
                  </div>
                  <div class="template-demo" style="text-align: right;">
<!--                   <button type="submit" class="btn btn-primary mr-2"> 거래처 수정</button> -->
<!--                   <input type="button" class="btn btn-primary btn-rounded btn-fw" value="거래처 삭제" onclick="location.href='ClientDelete.cl'" /> -->
                  <input type="submit" class="btn btn-primary mr-2" value="거래처 수정" />
<!--                   <input type="submit" class="btn btn-primary mr-2" value="거래처 수정" onclick="location.href='ClientModify.cl'" /> -->
                  <input type="button" class="btn btn-primary mr-2" value="거래처 삭제" onclick="location.href='ClientDelete.cl?business_no=${client.business_no }&pageNum=${pageNum }&cust_name=${client.cust_name }'" />
                  </div>
              </form>
                 </div>
                </div>
               </div>
<!--              </div> -->
<!--             </div> -->
<!--           </div> -->
        
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