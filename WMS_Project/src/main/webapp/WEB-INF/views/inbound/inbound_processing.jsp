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
 	<!-- jquery -->
	<script src="${pageContext.request.contextPath }/resources/assets/js/jquery-3.6.3.js"></script>
	<script type="text/javascript">
	$("document").ready(function(){
	    let sum1 = 0;
	    $('input[id*="in_schedule_qty"]').each(function(){
// 	    	if(!isNaN($(this).val())){ // 숫자만 들어오기 때문에 XX
	            sum1 += parseInt($(this).val());
// 	    	}
	    });
	    $("input[name=sum1]").val(sum1);
	    
	    let sum2 = 0;
	    $('input[id*="not_in_qty"]').each(function(){
            sum2 += parseInt($(this).val());
	    });
	    $("input[name=sum2]").val(sum2);
	    
	    let sum3 = 0;
	    $('input[id*="order_qty"]').each(function(){
            sum3 += parseInt($(this).val());
	    });
	    $("input[name=sum3]").val(sum3);
	    
	  }) // document
	 // ---입고 처리 화면 들어왔을때 합계 출력
	  
	// 입고지시수량 변경 이벤트
	function onchage_orderinqty(i){
      
   	     // 입고지시수량 계산
       	 let sum3 = 0;
   	     $('input[id*="order_qty"]').each(function(){
               sum3 += parseInt($(this).val());
   	     });
   	     $("input[name=sum3]").val(sum3);

    } // function
 	  
	<!-- 재고코드 검색 팝업 -->
 	function openPopup1(index) {
 	    var _width = '650';
 	    var _height = '380';
 	    var pindex = index;
 	 
 	    // 팝업을 가운데 정렬하기 위해 값 구하기
 	    var _left = Math.ceil(( window.screen.width - _width )/2);
 	    var _top = Math.ceil(( window.screen.height - _height )/2); 
 	 
 	    window.open('SearchStockcd?index='+index, '재고코드 검색', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
 	}
 	
 	<!-- 구역명_선반위치 검색 팝업 -->
 	function openPopup2(index) {
 	    var _width = '650';
 	    var _height = '380';
 	 
 	    // 팝업을 가운데 정렬하기 위해 값 구하기
 	    var _left = Math.ceil(( window.screen.width - _width )/2);
 	    var _top = Math.ceil(( window.screen.height - _height )/2); 
 	 
 	    window.open('SearchArea?index='+index, '위치 검색', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
 	
 	}
 	
	</script>
	<!-- jquery -->
  </head>
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

		<!-- table 영역 -->
       <div class="col-lg-12 grid-margin stretch-card">
           <div class="card">
              	<div class="card-body">
                    <h4 class="card-title">입고처리</h4>
                    <p class="card-description">입고처리</p>
					 <form action="DoInbound" method="POST" id="processform">
						<!-- 검색 타입 추가 -->
						<div class="form-group">
                      	<div class="input-group">
                        </div>
                    </div>
                    <div class="table-responsive">
                      <table class="table table-striped">
                        <thead>
                          <tr>
                            <th>입고예정번호</th>
                            <th>품목명</th>
                            <th>입고예정수량</th>
                            <th>미입고수량</th>
                            <th>입고지시수량</th>
                            <th>재고번호</th>
                            <th>구역명_선반위치</th>
                          </tr>
                        </thead>
                        
                        <tbody>
                        
                         <c:forEach var="inproduct" items="${inProductList }" varStatus="status">
							 <input type="hidden" name="wh_loc_in_area" value="${inproduct.wh_loc_in_area}"> <!-- 위치명 -->
							 <input type="hidden" name="product_cd" value="${inproduct.product_cd}"> <!-- 품목코드 -->
							 <input type="hidden" name="in_date" value="${inproduct.in_date}"> <!-- 납기일자 -->
							 
							 <input type="hidden" name="wh_area" value="${inproduct.wh_area}"> <!-- 내부구역명 -->							 
							 <input type="hidden" name="in_qty" value="${inproduct.in_qty}"> <!-- 입고수량 -->
							 <input type="hidden" name="wh_loc_in_area_cd" value="${inproduct.wh_loc_in_area_cd}"> <!-- 위치코드 -->
							 <input type="hidden" name="wh_area_cd" value="${inproduct.wh_area_cd}"> <!-- 내부구역코드 -->
                         <tr>
                            <td><input type="text" id="in_schedule_cd${status.index }" name="in_schedule_cd" 
                            value="${inproduct.in_schedule_cd}" class="form-control" readonly="readonly"></td> 
                         	<td><input type="text" id="product_name${status.index }" name="product_name" 
                         	value="${inproduct.product_name}" class="form-control" readonly="readonly"></td>
                            <td><input type="number" id="in_schedule_qty${status.index }" name="in_schedule_qty"
                             class="form-control" value="${inproduct.in_schedule_qty}" readonly="readonly"></td>
                            <td><input type="number" id="not_in_qty${status.index }" name="not_in_qty" class="form-control" 
                            	value="${inproduct.in_schedule_qty - inproduct.in_qty}" readonly="readonly"></td>
                            <td><input type="number" min="0" max="${inproduct.in_schedule_qty - inproduct.in_qty}" name="order_qty" 
                           		 id="order_qty${status.index }" class="form-control" value="${inproduct.order_qty}" 
                           		 onclick="onchage_orderinqty(${status.index })"></td>
                            <td><div class="col-sm-12">
                      			<div class="input-group">
                        			<input type="text" id="stockcd${status.index }" name="stock_cd" class="form-control" value="0" onclick="new_Stockcd(${status.index })">
                        		<div class="input-group-append">
                          			<button class="btn btn-sm btn-primary" type="button" onclick="openPopup1(${status.index })">검색</button>
                        		</div>
                    			</div>
                     		 </div></td>
                     		 <td><div class="col-sm-14">
                      			<div class="input-group">
                        			<input type="text" id="locationcd${status.index }" name="locationcd" class="form-control" placeholder="구역명_선반위치" />
                        		<div class="input-group-append">
                          			<button class="btn btn-sm btn-primary" type="button" onclick="openPopup2(${status.index })">검색</button>
                        		</div>
                    			</div>
                     		 </div></td>
                          </tr>
                        </c:forEach>
                         	
                        </tbody>
                         	<td colspan="2" style="text-align: center;">합계</td>
                         	<td><input type="text" name="sum1" class="form-control" readonly="readonly"></td>
                         	<td><input type="text" name="sum2" class="form-control" readonly="readonly"></td>
                         	<td><input type="text" name="sum3" class="form-control" readonly="readonly"></td>
                         	<td></td>
                         	<td></td>
                      </table>
                    </div>
			        <div class="template-demo" style="text-align: right;">
	           			<button type="submit" class="btn btn-primary btn-rounded btn-fw">등록</button>
           			</div>
				 </form>
               	</div>
             </div>
          </div>
        <!-- table 영역 -->
        </div>
        <!-- 본문 영역 --> 
      </div>
      <!-- page-body-wrapper ends -->
    </div>
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