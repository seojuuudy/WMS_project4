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
		
		<!-- 합계 계산 -->
	    let sum1 = 0;
	    $('input[id*="in_schedule_qty"]').each(function(){
            sum1 += parseInt($(this).val());
	    });
	    $("input[name=sum1]").val(sum1);
	    
	    let sum2 = 0;
	    $('input[id*="not_in_qty"]').each(function(){
            sum2 += parseInt($(this).val());
	    });
	    $("input[name=sum2]").val(sum2);
	 
	 	<!-- 폼 전송 전 유효성 검사 -->
		$(document).on("click","#btn", function(){
			
			// 인덱스를 사용하기 위해 배열 저장
			var inQtyArr = $('input[id^="in_qty"]');
			var locCdArr = $('input[id^="locationcd"]');
			var isValid = true; // 입고지시수량과 위치의 유효성 검사를 위한 변수
			
			// 1. 입고지시수량 유효성 검사
			inQtyArr.each(function(index) {
			    if (this.value <= 0) { // 입고지시수량이 0 이하이면 알림창
			        alert("입고지시수량을 입력해주세요!");
			        isValid = false; // 유효성 체크 실패
			        return false; // 반복문 종료
			    } // 입고지시수량이 0 이상이면 if문이 실행되지 않으므로 true
			});
			
			// 2. 위치선택 유효성 검사
			if(isValid) { // 입고지시수량 유효성 검사 통과
			    locCdArr.each(function(index) {
			        if (!this.value) { // 위치를 선택하지 않으면 알림창
			            alert("위치를 선택해주세요!");
			            isValid = false; // 유효성 체크 실패
			            return false; // 반복문 종료
			        } // 위치가 선택되어 있으면 true
			    });
			}
			
			if(isValid) { // 모든 유효성 검사 통과
			    $("#processform").submit(); // 폼전송
			    alert("입고처리 완료되었습니다.");
			
			    setTimeout(function() { // 데이터 전송을 위해 시간 설정
			        opener.location.reload();
			        self.close();
			    }, 100);
			}
		 }); // 폼 전송 유효성 검사 끝
 	 
		<!-- 입고지시수량 변경 이벤트(수정중) --> 
		$('input[id^="in_qty"]').on("input", function() {
			
   	     	let inScheduleQty = parseInt($('input[id^="in_schedule_qty"]').val()); // 입고예정수량
   	  	 	let notInQty = parseInt($('input[id^="not_in_qty"]').val()); // 미입고수량
   	  	 	let InQty = parseInt($('input[id^="in_qty"]').val()); // 입고지시수량
   	  	 	
   	  		var inQtyArr = $('input[id^="in_qty"]'); // 입고지시수량을 배열로 저장
    
  		 	let sum3 = 0; // 입고지시수량 합계

  		 	inQtyArr.each(function(index) {
  		 	    let val = Number($(this).val());
  		 	    if ($.isNumeric(val)) { 
  		 	        sum3 += val;
  		 	    } else { // 입력값이 숫자가 아닌 경우 알림창.. 이 떠야하는데 안뜬다.. 하..
  		 	        alert("숫자를 입력해주세요!");
  		 	        $(this).val(""); // 입력값이 숫자가 아닌 경우 value 초기화
  		 	        return false; // 반복문 종료
  		 	    }
  		 	});
   	     	
  		 	 // 이 밑코드도 index 적용해야함
	   	     let num = inScheduleQty - InQty; // 입고예정수량 - 입고지시수량
   	     
	   	     if(num < 0) { // 미입고수량보다 큰 수를 입력받으면 동작 제어
	   	    	 alert("입고지시수량은 " + notInQty + "개를 초과할 수 없습니다!")
	   	    	 $('input[id^="in_qty"]').val(""); 
	   	     } else { // 동작O
		   	     $("input[name=sum3]").val(sum3);
	   	     }
   	 	 }); // 입고지시수량 이벤트 끝
	  }) // document
	  
	<!-- 재고코드 검색 팝업 -->
//  	function openPopup1(index) {
 	function openPopup1(index, product_cd) {
 	    var _width = '650';
 	    var _height = '380';
 	 
 	    // 팝업을 가운데 정렬하기 위해 값 구하기
 	    var _left = Math.ceil(( window.screen.width - _width )/2);
 	    var _top = Math.ceil(( window.screen.height - _height )/2); 
 	 
//  	    window.open('SearchStockcd?index='+index, '재고코드 검색', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
 	    window.open('SearchStockcd?index='+index+'&product_cd='+product_cd, '재고코드 검색', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
 	} // 재고 검색 팝업 끝
 	
 	<!-- 구역명_선반위치 검색 팝업 -->
 	function openPopup2(index) {
 	    var _width = '650';
 	    var _height = '380';
 	 
 	    // 팝업을 가운데 정렬하기 위해 값 구하기
 	    var _left = Math.ceil(( window.screen.width - _width )/2);
 	    var _top = Math.ceil(( window.screen.height - _height )/2); 
 	 
 	    window.open('SearchArea?index='+index, '위치 검색', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
 	} // 구역 위치 검색 팝업 끝
	</script>
	<!-- jquery -->
  </head>
  <body>
        <!-- 본문 영역 -->
        <div class="main-panel">

		<!-- table 영역 -->
       <div class="col-lg-12 grid-margin stretch-card">
           <div class="card">
              	<div class="card-body">
                    <h4 class="card-title">입고처리</h4>
                    <p class="card-description">입고처리</p>
					 <form action="DoInbound" method="POST" id="processform">
<!-- 					 <form method="POST" id="processform"> -->
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
							 <input type="hidden" name="emp_num" value="${inproduct.emp_num}"> <!-- 담당자 사원코드 -->
							 <input type="hidden" name="remarks" value=" "> <!-- 적요 -->
							 
							 <input type="hidden" name="wh_area" value="${inproduct.wh_area}"> <!-- 내부구역명 -->							 
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
                            <td><input type="number" min="0" max="${inproduct.in_schedule_qty - inproduct.in_qty}" name="in_qty" 
                           		id="in_qty${status.index }" class="form-control"></td>
                            <td><div class="col-sm-12">
                      			<div class="input-group">
                        			<input type="text" id="stockcd${status.index }" name="stock_cd" class="form-control" value="0" onclick="new_Stockcd(${status.index })">
                        		<div class="input-group-append">
<%--                           			<button class="btn btn-sm btn-primary" type="button" onclick="openPopup1(${status.index })">검색</button> --%>
                          			<button class="btn btn-sm btn-primary" type="button" onclick="openPopup1(${status.index }, ${inproduct.product_cd})">검색</button>
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
                         	<td><input type="text" name="sum3" value="0" class="form-control" readonly="readonly"></td>
                         	<td></td>
                         	<td></td>
                      </table>
                    </div>
			        <div class="template-demo" style="text-align: right;">
	           			<button type="button" id="btn" class="btn btn-primary btn-rounded btn-fw">등록</button>
           			</div>
				 </form>
               	</div>
             </div>
          </div>
        <!-- table 영역 -->
        </div>
        <!-- 본문 영역 --> 
<!--       </div> -->
<!--       page-body-wrapper ends -->
<!--     </div> -->
        
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