<%@ page language="java" contentType="text/html; charset=UTF-8"
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

	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery-3.6.3.js"></script>
  	<script>
  	<!-- 납기일자에 등록된 날짜 표시 -->
//  	document.getElementById("in_date").value = ${inProduct.in_date }

 	$("document").ready(function(){
	 	<!-- 입고예정수량 변경시 수량 제어 -->
	 	$('input[id="in_schedule_qty"]').on("input", function() {
	   		 let in_schedule_qty = parseInt($(this).val()); // 입력받은 입고예정수량
	    	 
	   		 if($.isNumeric(in_schedule_qty)) { // 입력받은 입고예정수량이 숫자(정수)일 때 
	        	$("#not_in_qty").val(parseInt($("#in_schedule_qty").val()) - parseInt($("#in_qty").val()));
	    	 } else { // 입력받은 입고예정수량이 숫자가 아닐때
	       		alert("숫자를 입력해주세요!");
	        	$(this).val(""); // 입력값이 숫자가 아닌 경우 value 초기화
	    	}
		});
 	});
     	
 	<!-- 품목명 검색 팝업 -->
 	function search_pname() {
 	    var _width = '650';
 	    var _height = '380';
 	 
 	    // 팝업을 가운데 정렬하기 위해 값 구하기
 	    var _left = Math.ceil(( window.screen.width - _width )/2);
 	    var _top = Math.ceil(( window.screen.height - _height )/2); 
 	 
 	    window.open('SearchProduct', '품목명 검색', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
 	}
 	
 	
 	<!-- 수정 작업 완료시 팝업창 닫힘 -->
 	<!-- 데이터 전송 후 팝업창을 닫기 위해 submit이 아닌 ajax로 동작시킴 -->
    function modify(product_name, ex_in_date) {
// 		var formdata = $("form[name=modify_form]").serialize();
		// 변경된 value 함께 넘겨주기
		var product_cd = parseInt($("#product_cd").val());
		var in_schedule_qty = parseInt($("#in_schedule_qty").val());
		var in_date = document.getElementById("in_date").value;
		var remarks = $("#remarks").val();
		var in_schedule_cd = $("#in_schedule_cd").val();
		
		$.ajax({
	        type:"POST",
	        url:"pdModifyPro.in",
	        data : { "product_name":product_name, "in_schedule_qty":in_schedule_qty, "product_cd":product_cd,
		             "in_date":in_date, "remarks":remarks, "in_schedule_cd":in_schedule_cd, "ex_in_date":ex_in_date },
	        success: function(result){
	          if(result > 0) {
	        	  window.opener.location.reload();
	        	  self.close();
	          }
	        }
		});
	}
	</script>
  
  </head>
  <body>
    <div class="container-scroller">
        
        <!-- 본문 영역 -->
        <div class="main-panel">
		
		<!-- 입고 예정 등록 table -->	
        <div class="col-12 grid-margin">
          <div class="card">
            <div class="card-body">
              <h4 class="card-title">입고 예정 항목 수정</h4>
              <form action="pdModifyPro.in" method="post" class="form-sample" name="modify_form">
                <p class="card-description">inbound product modify</p>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">입고예정번호</label>
                      <div class="col-sm-9">
                         <input type="text" name="in_schedule_cd" id="in_schedule_cd" class="form-control" value="${inProduct.in_schedule_cd}" readonly="readonly" />
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">품목코드</label>
                      <div class="col-sm-9">
                         <input type="text" name="product_cd" id="product_cd" class="form-control" value="${inProduct.product_cd}" readonly="readonly" />
                      </div>
                    </div>
                  </div>
                  </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                   	 <label class="col-sm-3 col-form-label">거래처</label>
                   	 <div class="col-sm-9">
                      <div class="input-group">
                        <input type="text" class="form-control" value="${inProduct.cust_name }" readonly="readonly"/>
                      </div>
                      </div>
                    </div>
                  </div>
                <div class="col-md-6">
                    <div class="form-group row">
                   	 <label class="col-sm-3 col-form-label">품목명</label>
                   	 <div class="col-sm-9">
                      <div class="input-group">
                        <input type="text" class="form-control" id="product_name" value="${inProduct.product_name }" />
                        <div class="input-group-append">
                          <button class="btn btn-sm btn-primary" type="button" onclick="search_pname()">검색</button>
                        </div>
                      </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-4">
                    <div class="form-group row">
                      <label class="col-sm-5 col-form-label">입고예정수량</label>
                      <div class="col-sm-9">
                        <input type="number" min="0" name="in_schedule_qty" id="in_schedule_qty" value="${inProduct.in_schedule_qty }" class="form-control"/>
                      </div>
                    </div>
                  </div>
                 <div class="col-md-4">
                    <div class="form-group row">
                      <label class="col-sm-5 col-form-label">입고수량</label>
                      <div class="col-sm-9">
                        <input type="number" min="0" max="${inproduct.in_schedule_qty}" id="in_qty" name="in_qty" value="${inProduct.in_qty }" class="form-control" readonly="readonly"/>
                      </div>
                    </div>
                  </div>
                 <div class="col-md-4">
                    <div class="form-group row">
                      <label class="col-sm-5 col-form-label">미입고수량</label>
                      <div class="col-sm-9">
                        <input type="number" id="not_in_qty" class="form-control" value="${inProduct.in_schedule_qty - inProduct.in_qty}" readonly="readonly"/>
                      </div>
                    </div>
                  </div>
                </div> 
                <div class="row">
	               <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">납기일자</label>
                      <div class="col-sm-9">
                        <input type="date" name="in_date" id="in_date" value="${inProduct.in_date }" class="form-control"/>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                   	 <label class="col-sm-3 col-form-label">적요</label>
                   	 <div class="col-sm-8">
                      <div class="input-group">
                        <textarea name="remarks" id="remarks" class="form-control" rows="10">${inProduct.remarks }</textarea>
                      </div>
                      </div>
                    </div>
                  </div>
                 </div>
             
                  <div class="template-demo" style="text-align: right;">
	                  <button type="button" class="btn btn-primary mr-2" onclick="modify('${inProduct.product_name }', '${inProduct.in_date }')">수정</button>
	                  <button class="btn btn-light" onclick="window.close()">닫기</button>
                  </div>
              	</form>
               </div>
              </div>
             </div>
            </div>
        <!-- 본문 영역 --> 
           </div>
    <!-- container-scroller -->
    
<!--       page-body-wrapper ends -->
<!--           </div> -->
<!-- 		<!-- table -->	 -->
<!--         </div> -->
<!--       </div> -->
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