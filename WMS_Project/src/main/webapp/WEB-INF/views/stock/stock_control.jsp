<%@ page language="Java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="kr">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Stock</title>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/stock_control.css" />
    <!-- End layout styles -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/images/favicon.png" />
 	<!-- jquery -->
	<script src="${pageContext.request.contextPath }/resources/assets/js/jquery-3.6.3.js"></script>
	<script type="text/javascript">
		let pageNum = 1;	
	
		$(function() {
			var jsonStrData = localStorage.getItem("param");
			
			$.ajax({
					type : "POST",
					url : "StockAjaxPro.st",
					dataType : "json", // 컨트롤러에서 응답받을 데이터 타입
					contentType : "application/json", // 컨트롤러로 전달할 요청 데이터 타입
					// 전송할 JSON 데이터를 하나의 문자열로 직접 결합하여 전송
					data : jsonStrData,
					success : function(data) {
							console.log(data)
							
							for(let i = 0; i < data.length; i++) {
								let result = "<tr>"
											+ "<td name='stock_cd'><input type='text' name='stock_cd_arr' class='form-control' id='stock_cd_arr" + i + "' value='" + data[i].stock_cd + "' readonly='readonly'></td>"
											+ "<td name='product_name'><input type='text' name='product_name_arr' class='form-control' id='product_name_arr" + i + "' value='" + data[i].product_name + "' readonly='readonly'></td>"
											+ "<td name='size_des'><input type='text' name='size_des_arr' class='form-control' id='size_des_arr" + i + "' value='" + data[i].size_des + "' readonly='readonly'></td>"
											+ "<td name='wh_area'><input type='text' class='form-control' name='wh_area_arr' id='wh_area_arr" + i + "' value='" + data[i].wh_area + "(" + data[i].wh_name + ")" + "' readonly='readonly'></td>"
											+ "<td name='wh_loc_in_area'><input type='text' class='form-control' name='loc_in_area_arr' id='loc_in_area_arr" + i + "' value='" + data[i].wh_loc_in_area + "' readonly='readonly'></td>"
											+ "<td name='stock_qty'><input type='text' name='stock_qty_arr' class='form-control' id='stock_qty_arr" + i + "' value='" + data[i].stock_qty + "' readonly='readonly'></td>"
											+ "<td><input type='text' name='control_qty_arr' class='form-control' id='control_qty_arr" + i + "' onblur='stock_qty_sum(" + i + ")' value=0 onKeyup='onlyNumber(this)'></td>"
											+ "<td class='moving_area'><input type='text' name='moving_stock_cd_arr' class='form-control' id='moving_stock_cd_arr" + i + "' class='moving_stock_cd_arr' value=0>&nbsp;<input type='button' name='area_btn' onclick='stock_search(" + i + ")' class='btn btn-sm btn-outline-primary' value='재고선택'></td>"
											+ "<td class='moving_area'><input type='text' name='wh_loc_in_area_arr' class='form-control' id='moving_wh_loc_in_area_arr" + i + "' class='wh_loc_in_area_arr'>&nbsp;<input type='button' name='area_btn' onclick='area_search(" + i + ")' class='btn btn-sm btn-outline-primary' value='위치선택'></td>"
											+ "<td><input type='text' name='moving_qty_arr' class='form-control' id='moving_qty_arr" + i + "' onblur='stock_qty_sum(" + i + ")' value=0 onKeyup='onlyNumber(this)'></td>"
											+ "<td name='stock_qty_sum_arr'><input type='text' class='form-control' id='stock_qty_sum_arr" + i + "'></td>"
											+ "<td class='remarks'><input type='text' name='remarks_arr' class='form-control' id='remarks_arr" + i + "'></td>"
											+ "</tr>";
								$("tbody").append(result);			
							}
					}
				});
			
			// 재고 수량보다 조정수량 + 이동수량이 클 경우 페이지 이동 불가
			$('#stockForm').submit(function() {
	        	 let sum = 0;
	        	 
	        	 for(let i = 0; i < $("input[name=stock_cd_arr]").length; i++) {
	        		 let sum = parseInt($("#control_qty_arr" + i).val()) + parseInt($("#moving_qty_arr" + i).val());
// 						alert(sum);
					
					if(parseInt($("#stock_qty_arr" + i).val()) < parseInt($("#control_qty_arr" + i).val())) {
						alert(parseInt($("#stock_qty_arr" + i).val()) < parseInt($("#control_qty_arr" + i).val()));
						
	                	alert("조정 수량이 현재 재고 수량보다 클 수 없습니다!");
	                	return false;
	             	}

					if($('#stock_qty_arr' + i).val() < sum) {
	                	alert("조정 수량과 이동 수량의 합이 재고 수량보다 클 수 없습니다!");
	                return false;
	             	}
					
					if($("#control_qty_arr" + i).val() == 0) {
	                	let result = confirm("조정수량이 0이면 재고에서 삭제됩니다. 삭제하시겠습니까?");
	                	
	                	if(!result) {
			                return false;
	                	}
	             	}
					
					// 이동 위치가 있는데 이동 수량이 0인 경우 이동하지 않도록 함
					if($("#moving_wh_loc_in_area_arr" + i).val() !== "") {
// 						alert($("#moving_wh_loc_in_area_arr" + i).val());
						if($("#moving_qty_arr" + i).val() == 0) {
	                		alert("이동수량이 0인 경우 조정이 불가능합니다!");
	                		console.log($("#moving_wh_loc_in_area_arr" + i).val());
			                return false;
							
						}
	             	}
					
					// 현재 위치와 같은 위치로 이동할 경우 이동할 수 없도록 제한
					let wareArea = $("#wh_area_arr" + i).val().substring($("#wh_area_arr" + i).val().indexOf('(') + 1, $("#wh_area_arr" + i).val().indexOf(')'));
					let area = wareArea + " " + $("#wh_area_arr" + i).val().split('(', 1) + " " + $("#loc_in_area_arr" + i).val();
					
					if(area == $("#moving_wh_loc_in_area_arr" + i).val()) {
						alert("현재 재고 위치와 같은 위치로 재고 이동할 수 없습니다!");
						return false;
					}
				

	        	 }
	        	 
	          });

		});
			
			function stock_search(index) {
				let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1200, height=800, top=0,left=0";
				window.name = index;
				window.open("StockPopup.st?index=" + index,"_blank", options);
			}
			function area_search(index) {
				let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1200, height=800, top=0,left=0";
				window.name = index;
				window.open("Stock_area_popup.st?index=" + index,"_blank", options);
			}
			
			function stock_qty_sum(index) {
				let sum = 0;
				sum = parseInt($("#control_qty_arr" + index).val()) + parseInt($("#moving_qty_arr" + index).val());
				$("#stock_qty_sum_arr" + index).val(sum);
				
			}
			
			function onlyNumber(obj) {
				  obj.value = obj.value.replace(/[^0-9]/g, "");
			}
	
	</script>
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
                    <h4 class="card-title">재고 조정</h4>
                    <p class="card-description">Stock Control</p>
                    <div class="table-responsive">
		 <form action="StockControlPro.st" id="stockForm">
                      <table class="table table-striped">
                        <thead>
                          <tr>
                          	<th>재고번호</th>
                            <th>품목명</th>
                            <th>규격</th>
                            <th>구역명(창고명)</th>
                            <th>위치</th>
                            <th>재고수량</th>
                            <th>조정수량</th>
                            <th>이동재고번호</th>
                            <th>이동위치</th>
                            <th>이동수량</th>
                            <th>합계수량</th>
                            <th>적요</th>
                          </tr>
                        </thead>
                        
                      
                        <tbody>
                        
                       
                        </tbody>
                      </table>
                    </div>
			        <div class="template-demo" style="text-align: right;">
	           			<button type="submit" class="btn btn-primary btn-rounded btn-fw" onclick="">조정</button>
	           			<button type="reset" class="btn btn-primary btn-rounded btn-fw" onclick="">초기화</button>
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