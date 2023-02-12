<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
    <!-- Layout styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/demo_1/style.css" />
    <!-- End layout styles -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/images/favicon.png" />
    
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/insert_list_page.css" />
  </head>
  <body>
     <div class="container-scroller"><!-- div 1 시작 -->
       <!-- 사이드바 -->
      <jsp:include page="partials/sidebar.jsp"></jsp:include>
      <!-- 사이드바 -->
      
      <div class="container-fluid page-body-wrapper"><!-- div 2 시작 -->
        <!-- 색상 커스텀 설정 -->
        <jsp:include page="partials/settings-panel.jsp"></jsp:include>
        <!-- 색상 커스텀 설정 -->
        
        <!-- 상단 메뉴바 -->
      	<jsp:include page="partials/navbar.jsp"></jsp:include>
        <!-- 상단 메뉴바  -->
        
        <!-- 본문 영역 -->
        <div class="main-panel"><!-- div 3 시작 -->
          <div class="content-wrapper"><!-- div 4 시작 -->
            <div class="page-header"><!-- div 5 시작 -->
              <h3 class="page-title">WMS</h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="MainInsertList"> 기본등록 </a></li>
                  <li class="breadcrumb-item active" aria-current="page"> WMS </li>
                </ol>
              </nav>
            </div><!-- div 5 끝 -->
            
<!--               <div class="col-md-4 grid-margin stretch-card"> -->
<!--                 <div class="card"> -->
<!--                   <div class="card-body"> -->
<!--                     <h4 class="card-title">거래처 등록</h4> -->
<!--                     <div class="media"> -->
<!--                       <i class=" mdi mdi-account-multiple icon-md text-info d-flex align-self-start mr-3"></i> -->
<!--                       <div class="media-body"> -->
<!--                         <p class="card-text">gogo</p> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->

<!--  흰색 바탕, 회색 border -->
<div id="boxArea">
	<div id="InsertPageArea">
		 <a href="Wh.wms" >
			 <i class="mdi mdi-houzz"></i>
			창고관리
		 </a>
	</div>
	
	<div id="InsertPageArea">
		 <a href="InboundScheduleList.in" >
			 <i class="mdi mdi-import"></i>
			입고관리
		 </a>
	</div>
	
	<div id="InsertPageArea">
		 			
		 <a href="#" >
			 <i class="mdi mdi-export"></i>
			출고관리
		 </a>
	</div>
	
	<div id="InsertPageArea">
		 <a href=" Stock.st" >
			 <i class="mdi mdi-equal-box"></i>
			재고관리
		 </a>
	</div>
</div>
<!--  흰색 바탕, 회색 border -->

          <!-- content-wrapper ends -->
        <!-- 본문 영역 --> 
        </div><!-- div 4 끝 -->
        <!-- main-panel ends -->
      </div><!-- div 3 끝 -->
      <!-- page-body-wrapper ends -->
    </div><!-- div 2 끝 -->
    <!-- container-scroller -->
    </div><!-- div 1 끝 -->
           <!-- 하단 footer -->
          <footer class="footer">
          <jsp:include page="partials/footer.jsp"></jsp:include>
          </footer>
          <!-- 하단 footer -->
    <!-- plugins:js -->
    <script src="${pageContext.request.contextPath }/resources/assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/off-canvas.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/hoverable-collapse.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/misc.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/settings.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/todolist.js"></script>
    <!-- endinject -->
  </body>
</html>