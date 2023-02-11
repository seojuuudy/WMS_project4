<%@ page language="JAva" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
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
    <!-- Layout styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/demo_1/style.css" />
    <!-- End layout styles -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/images/favicon.png" />

	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery-3.6.3.js"></script>
  	<script type="text/javascript">
  	
  		// 거래처 검색
  		function open_cl() {
	  		let url = "InboundScheduleSearchClient.in";
	  		window.open(url,'','width=500,height=700,location=no,top=0');
		}
  		function set_cl(cust_name, business_no) {
//   			alert(cust_name + "," + business_no);
			$("#business_no").val(business_no);
		}
  		
  		// 담당자 검색
  		function open_emp() {
			let url = "InboundScheduleSearchEmployees.in";
			window.open(url,'','width=500,height=700,location=no,top=0');
		}
  		function set_emp(emp_name, emp_num) {
//   			alert(emp_num);
			$("#emp_num").val(emp_num); 
		}
		
  		// 전역 변수 선언
  		var idx = k;
  		
  		// 행 추가
  		function addTag() {
			idx = $(".tdCount").length;	
			var addText ='<tr id="Td_'+ idx + '" class="tdCount">'
	        +'<td id="tdNo_'+ idx +'" class="tdNo">'
	        +'<div class="input-group">'
	        +'<input type="text" class="form-control" name="inSchedulePerList[' + idx + '].product_cd" id="product_cd' + idx + '" placeholder="품목 검색" />'
	        +'<div class="input-group-append">'
	        +'<button class="btn btn-sm btn-primary" name="product_cd" id="product_cd' + idx + '" type="button" onclick="open_pr(' + idx + ')">검색</button>'
	        +'</div>'
	        +'</div>'
	        +'</td>'
	        +'<td><input type="text" name="inSchedulePerList[' + idx + '].product_name" id="product_name' + idx + '" class="form-control"/>'
	        +'</td>'
	        +'<td><input type="text" name="inSchedulePerList[' + idx + '].size_des" id="size_des' + idx + '" class="form-control"/></td>'
	        +'<td><input type="text" name="inSchedulePerList[' + idx + '].in_schedule_qty" class="form-control"/></td>'
	        +'<td><input type="date" name="inSchedulePerList[' + idx + '].in_date" class="form-control"/></td>'
	        +'<td><input type="text" name="inSchedulePerList[' + idx + '].remarks" class="form-control"/></td>'
	        +'<td><a href="javascript:void(0);" class="badge badge-info" onclick="addTag(); return false;">+</a></td>'
	        +'</tr>';
	        
	        var tbHtml = $(".tdCount:last");
	        tbHtml.after(addText);
  		}
  		
  		// 품목 검색
  		function open_pr(prIdx) {
//   			alert(prIdx);
  			let url = "InboundScheduleSearchProduct.in?idx=" + prIdx;
  			window.open(url,'','width=500,height=700,location=no,top=0');
  		}
  		
  		function set_pr(product_cd, product_name, size_des, prIdx) {
  			
  			$("#product_cd"+prIdx).val(product_cd); 
  			$("#product_name"+prIdx).val(product_name); 
  			$("#size_des"+prIdx).val(size_des);
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
		
		<!-- 입고 예정 등록 table -->	
        <div class="col-12 grid-margin">
          <div class="card">
            <div class="card-body">
              <h4 class="card-title">입고 예정 등록</h4>
              <form action="InboundScheduleRegistPro.in" method="post" enctype="multipart/form-data" class="form-sample">
                <p class="card-description">income schedule regist</p>
                <p class="card-description">입고 기본</p>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">작성일자</label>
                      <div class="col-sm-9">
                         <input type="date" name="in_schedule_cd" class="form-control" required="required" />
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">입고유형</label>
                      <div class="col-sm-9">
                      	<div class="form-check">
                          <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="in_type_cd" id="in_type_cd" value="1" checked/>발주서</label>
                        </div>
                        <div class="form-check">
                          <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="in_type_cd" id="in_type_cd" value="2"/>구매</label>
                        </div>
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
                        <input type="text" class="form-control" name="business_no" id="business_no" placeholder="거래처 검색" aria-label="Recipient's username" aria-describedby="basic-addon2" />
                        <div class="input-group-append">
                          <button class="btn btn-sm btn-primary" name="business_no" id="business_no" type="button" onclick="open_cl()">검색</button>
                        </div>
                      </div>
                      </div>
                    </div>
                  </div>
                   <div class="col-md-6">
                    <div class="form-group row">
                   	 <label class="col-sm-3 col-form-label">담당자</label>
                   	 <div class="col-sm-9">
                      <div class="input-group">
                        <input type="text" class="form-control" name="emp_num" id="emp_num" placeholder="담당자 검색" aria-label="Recipient's username" aria-describedby="basic-addon2" />
                        <div class="input-group-append">
                          <button class="btn btn-sm btn-primary" name="emp_num" id="emp_num" type="button" onclick="open_emp()">검색</button>
                        </div>
                      </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">납기일자</label>
                      <div class="col-sm-9">
                        <input type="date" name="in_date" class="form-control"/>
                      </div>
                    </div>
                  </div>
                 <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">비고</label>
                      <div class="col-sm-9">
                        <input type="text" name="remarks" class="form-control"/>
                      </div>
                    </div>
                  </div>
                </div>
                <hr>
                  <div class="col-lg-12 grid-margin stretch-card">
<!--                 <div class="card"> -->
                  <div class="card-body">
                    <p class="card-description">입고 품목</p>
                    <div class="table-responsive">
                      <table class="table table-bordered">
                        <thead>
                          <tr>
                            <th>품목코드</th>
                            <th>품목명</th>
                            <th>규격</th>
                            <th>수량</th>
                            <th>납기일자</th>
                            <th>적요</th>
                            <th></th>
                          </tr>
                        </thead>
                        <tbody>
                        <c:set var="k" value="0"/>
                          <tr id="Td" class="tdCount">
                            <td id="tdNo_${k }" class="tdNo">
	                      			<div class="input-group">
	                      				<input type="text" class="form-control" name="inSchedulePerList[${k }].product_cd" id="product_cd${k }" placeholder="품목 검색" aria-label="Recipient's username" aria-describedby="basic-addon2" />
	                        			<div class="input-group-append">
	                         				<button class="btn btn-sm btn-primary" name="product_cd" id="product_cd${k }" type="button" onclick="open_pr('${k}')">검색</button>
	                        			</div>
	                      			</div>
                            </td>
                            <td>
                            	<input type="text" name="inSchedulePerList[${k }].product_name" id="product_name${k }" class="form-control"/>
                            </td>
                            <td>
                            	<input type="text" name="inSchedulePerList[${k }].size_des" id="size_des${k }" class="form-control"/>
                            </td>
                            <td>
                            	<input type="text" name="inSchedulePerList[${k }].in_schedule_qty" class="form-control"/>
                            </td>
                            <td>
		                        <input type="date" name="inSchedulePerList[${k }].in_date" class="form-control"/>
		                    </td>
                            <td>
                            	<input type="text" name="inSchedulePerList[${k }].remarks" class="form-control"/>
                            </td>
                            <td>
	                            <a href="javascript:void(0);" class="badge badge-info" onclick="addTag(); return false;">+</a>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
<!--                 </div> -->
              </div>
                  <div class="template-demo" style="text-align: right;">
	                  <button type="submit" class="btn btn-primary mr-2">등록</button>
	                  <button class="btn btn-light" onclick="history.back()">취소</button>
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