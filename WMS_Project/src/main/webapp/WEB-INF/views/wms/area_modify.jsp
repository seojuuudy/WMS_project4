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
<script src="http://code.jquery.com/jquery-3.6.3.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
</script>

<body>
<div class="container-scroller">
 <!-- 사이드바 -->
	<jsp:include page="../partials/sidebar_WMS.jsp"></jsp:include>
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
		
		<!-- 창고 등록 table -->	
        <div class="col-12 grid-margin">
          <div class="card">
            <div class="card-body">
              <h4 class="card-title">구역명 수정하기</h4>
              <form action="UpdateAreaPro.wms" class="form-sample"  method="post" onsubmit="return submitCheck();" id="registForm">
                <p class="card-description">warehouse area modify</p>
                
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">변경 구역명</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" name="wh_area" id="wh_area" placeholder="${param.wh_area }" required="required"/>
                      </div>
                    </div>
                  </div>
                  
                  <div class="template-demo" style="text-align: right;">
                  	 <input type="hidden" name="wh_area_cd" value="${param.wh_area_cd }">
	                 <input type="submit" id="sub-btn" class="btn btn-primary mr-2" value="수정" location.href='UpdateAreaPro.wms'">
	                 <input type="button" class="btn btn-light" onclick="location.href='Wh.wms'" value="취소">
				  </div>
                
        	 </form>
              </div>
             </div>
            </div>
  </div>
 </div>
<!-- 구역 등록 table -->	
			
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