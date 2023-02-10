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
function deleteCheck() {
	 if (confirm("창고를 삭제하시겠습니까??") == true){// 확인
		 location.href='WhDelete.wh?wh_cd=${wh.wh_cd }&pageNum=${pageNum }&wh_name=${wh.wh_name }';
	 }else{// 취소
	     return false;
	 }
}
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
<!-- 			<h1>사원 등록</h1> -->
		<!-- 사원 등록 table -->	
        <div class="col-12 grid-margin">
          <div class="card">
            <div class="card-body">
              <h4 class="card-title">창고 상세정보</h4>
                <p class="card-description">${wh.wh_name } warehouse Information<br></p>
<!--                 <div class="row"> -->
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">창고 코드</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" value="${wh.wh_cd }" readonly="readonly" />
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">창고명</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" value="${wh.wh_name }" readonly="readonly"/>
                      </div>
                    </div>
                  </div>
<!--                 </div> -->
<!--                 <div class="row"> -->
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">구분</label>
                      <div class="col-sm-9">
                      	<c:choose>
                      		<c:when test="${wh.wh_gubun eq '1' }">
                       			<input type="text" class="form-control" value="창고" readonly="readonly"/>
                      		</c:when>
                      		<c:otherwise>
                        		<input type="text" class="form-control" value="공장" readonly="readonly"/>
                      		</c:otherwise>
                      	</c:choose>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">위치</label>
                      <div class="col-sm-9">
                      	<c:choose>
                      		<c:when test="${wh.wh_location eq '1' }">
                       			<input type="text" class="form-control" value="외부" readonly="readonly"/>
                      		</c:when>
                      		<c:otherwise>
                        		<input type="text" class="form-control" value="내부" readonly="readonly"/>
                      		</c:otherwise>
                      	</c:choose>
                      </div>
                    </div>
                  </div>
<!--                 </div> -->
<!--                 <div class="row"> -->
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">주소</label>
                      <div class="col-sm-9">
                      <c:choose>
                      		<c:when test="${wh.wh_location eq '2'}">
                       			<input type="text" class="form-control" value="없음" readonly="readonly"/>
                      		</c:when>
                      		<c:otherwise>
		                        <input type="text" class="form-control" value="(${wh.wh_postCode }) ${wh.wh_addr }" readonly="readonly"/>
                      		</c:otherwise>
                      	</c:choose>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">전화번호</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" value="${wh.wh_tel }" readonly="readonly"/>
                      </div>
                    </div>
                  </div>
<!--                 </div> -->
<!--                 <div class="row"> -->
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">관리자명</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" value="${wh.wh_man_name }" readonly="readonly"/>
                      </div>
                    </div>
                  </div>
	                  <div class="col-md-6">
	                    <div class="form-group row">
	                      <label class="col-sm-3 col-form-label">사용여부</label>
	                      	<div class="col-sm-9">
		                      <c:choose>
		                      	<c:when test="${wh.wh_use eq '1' }">
		                       	 <input type="text" class="form-control" value="사용" readonly="readonly"/>
		                      	</c:when>
		                      	<c:otherwise>
		                      	  <input type="text" class="form-control" value="미사용" readonly="readonly"/>
		                     	</c:otherwise>
		                      </c:choose>
	                      	</div>
	                   	 </div>
	                  </div>
<!--                 </div> -->
<!--                 <div class="row"> -->
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">적요</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" value="${wh.remarks }" readonly="readonly"/>
                      </div>
                    </div>
<!--                   </div> -->
                  
                  <div class="template-demo" style="text-align: right;">
	                  <input type="button" class="btn btn-primary mr-2" value="창고 수정" onclick="location.href='WhModify.wh?wh_cd=${wh.wh_cd }&pageNum=${pageNum }&wh_name=${wh.wh_name }'" />
                  	  <input type="button" id="wh_delete" class="btn btn-primary mr-2" value="창고 삭제" onclick="deleteCheck()"  />
                  </div>
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