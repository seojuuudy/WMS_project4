<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>    
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
  	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
// 		let openChildWin;
// 		let url = "ClientSearchList.cl"
// 		$("#business_no").change(function() {
// 			let valll = document.getElementById("business_no").value;
// 			alert(valll);
// 			openChildWin = window.open(url, "searchList", "toolbar=no, menubar=no, scrollbars=yes, resizable=auto, status=yes, width=700, height=700, left=0, top=0" );
// 		});
		
		var trIndex = "";
		$("#productButton").click(function() {
			var trIndex = $('#table > tbody tr').length
// 			alert($('#table > tbody tr').length);
			$('#table > tbody').append(
	            "<tr class ='tr'> <td>"
// 	           		+ "<input type='text' name='outProductList[" + parseInt(trIndex-1) + "].product_cd' id ='product_cd' class='form-control' />"
	           		+ "<input type='text' name='outProductList[" + trIndex + "].product_cd' id ='product_cd" + trIndex + "' class='form-control' onclick='prpop(" + trIndex + ")'/>"
	            +"</td>"
	            +"<td>"
	           	 + "<input type='text' name='outProductList[" + trIndex + "].product_name' id = 'product_name" + trIndex + "' class='form-control' />"
// 	           	 + "<input type='text' name='outProductList[" + parseInt(trIndex-1) + "].product_name' id = 'product_name' class='form-control' />"
	            +"</td>"
	            +"<td>"
// 	            + "<input type='text' name='outProductList[" + parseInt(trIndex-1) + "].out_schedule_qty' id= 'out_schedule_qty' class='form-control'  />"
	            + "<input type='text' name='outProductList[" + trIndex + "].size_des' id= 'size_des" + trIndex + "' class='form-control'  />"
	           	+"</td>"
	           	+"<td>"
	           	+ "<input type='text' name='outProductList[" + trIndex + "].out_schedule_qty' id ='out_schedule_qty' class='form-control'  />"
// 	           	+ "<input type='text' name='outProductList[" + parseInt(trIndex-1) + "].out_qty' id ='out_qty' class='form-control'  />"
	          	+"</td>"
	          	+"<td>"
	          	+ "<input type='date' name='outProductList[" + trIndex + "].out_date' id = 'out_date' class='form-control' />"
// 	          	+ "<input type='date' name='outProductList[" + parseInt(trIndex-1) + "].out_date' id = 'out_date' class='form-control' />"
	           	+"</td>"
	           	+"<td>"
// 	           	+ "<input type='text' name='outProductList[" + parseInt(trIndex-1) + "].remarks' id ='remarks' class='form-control' />"
	           	+ "<input type='text' name='outProductList[" + trIndex + "].remarks' id ='remarks' class='form-control' />"
	        	+"</td>"
	        	+"<td>"
	        	+ "<input type='text' name='outProductList[" + trIndex + "].out_complete' id='out_complete' class='form-control' />"
// 	        	+ "<input type='text' name='outProductList[" + parseInt(trIndex-1) + "].out_complete' id='out_complete' class='form-control' />"
	       		+"</td>"
	          +"</tr>"
     	   )
			
		});
		
		$("#productDeleteButton").click(function() {
			$('#table > tbody > tr:last').remove();
		});
			
// 		var i = 0;
// 		for(int i = 0; i < 10; i++){
// 			$("input[name='outProductList[0].product.cd']").eq(0).click(function prpop() {
// 				alert(this.id);
	// 			var prIndex = this.id.replace("product_cd", "");
	// 			var btnVal = $("#product_cd" + prIndex).val();
	// 			var pr = $("#product_cd" + prIndex).val();
// 				let url = "ProductSearchList.out"	
// 				let pop = window.open(url,'searchList','location=no,toolbar=no,width=700, height=700, left=0, top=0,resizable=yes,scrollbars=yes');
				
	// 			console.log("?????? : " + this.id + btnVal + pr);
// 			});
// 		}
		
	});
		function prpop(ii) {
// 			alert(ii);
// 			var prIndex = this.id.replace("product_cd", "");
// 			var btnVal = $("#product_cd" + prIndex).val();
// 			var pr = $("#product_cd" + prIndex).val();
			let url = "ProductSearchList.out?idx=" + ii;	
			let pop = window.open(url,'searchList','location=no,toolbar=no,width=700, height=700, left=0, top=0,resizable=yes,scrollbars=yes');
			console.log(pop);
		}
		 
	function clientpop(){
		let url = "ClientSearchList.out"
		let pop = window.open(url,'searchList','location=no,toolbar=no,width=700, height=700, left=0, top=0,resizable=yes,scrollbars=yes');
			
		}
	function hrpop(){
		let url = "SearchList.out"
		let pop = window.open(url,'searchList','location=no,toolbar=no,width=700, height=700, left=0, top=0,resizable=yes,scrollbars=yes');
		}
	
	function set_hr(emp_num, emp_name) {
		document.getElementById("showEmp_name").value = emp_name;
		document.getElementById("hiddenEmp_num").value = emp_num;
	}
	function set_cl(cust_name, business_no){
		document.getElementById("showCust_name").value = cust_name;
		document.getElementById("hiddenBusinessNo").value = business_no;
// 		document.getElementById("business_no").value = business_no;
	}
	function set_pr(product_cd, product_name, size_des, idx, objWindow) {
		console.log(product_name + ", " + product_cd + ", " + size_des + ", " + idx);
	
		$("#product_cd" + idx).val(product_cd);
		$("#product_name" + idx).val(product_name);
		$("#size_des" + idx).val(size_des);
		
// 		alert(idx + "idx");
// 		document.getElementById("product_name" + idx).value = product_name;
// 		document.getElementById("product_cd" + idx).value = product_cd;
// 		document.getElementById("size_des" + idx).value = size_des;
		objWindow.close();
	}
	
	
	</script>
  </head>
  <body>
    <div class="container-scroller">
      <!-- ???????????? -->
      <jsp:include page="../partials/sidebar_WMS.jsp"></jsp:include>
      <!-- ???????????? -->
      
      <div class="container-fluid page-body-wrapper">
        <!-- ?????? ????????? ?????? -->
        <jsp:include page="../partials/settings-panel.jsp"></jsp:include>
        <!-- ?????? ????????? ?????? -->
        <!-- ?????? ????????? -->
      	<jsp:include page="../partials/navbar.jsp"></jsp:include>
        <!-- ?????? ?????????  -->
        
        <!-- ?????? ?????? -->
        <div class="main-panel">
		
		<!-- ?????? ?????? ?????? table -->	
        <div class="col-12 grid-margin">
          <div class="card">
            <div class="card-body">
              <h4 class="card-title">?????? ?????? ??????</h4>
              <form action="OutRegistPro.out" method="post" name = "form" enctype="multipart/form-data" class="form-sample">
                <p class="card-description">Release regist</p>
<!--                 <p class="card-description">?????? ??????</p> -->
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">????????????</label>
                      <div class="col-sm-9">
                         <input type="date" name="out_schedule_cd" class="form-control" />
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">????????????</label>
                      <div class="col-sm-9">
                      	<div class="form-check">
                          <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="in_type_cd" id="in_type_cd1" value="01" checked />?????????</label>
                        </div>
                        <div class="form-check">
                          <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="in_type_cd" id="in_type_cd2" value="02" />??????</label>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">?????????</label>
	                      <div class="col-sm-9">
	                      	<input type="hidden" name ="business_no" id="hiddenBusinessNo">
	                      	<input type="text" id="showCust_name" name ="cust_name" class="form-control" />
	                      	<input type="button" class="btn btn-sm btn-outline-primary" onclick="clientpop()" value="??????">
	                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                     <label class="col-sm-3 col-form-label">?????????</label>
	                      <div class="col-sm-9">
	                        <input type="hidden" name="emp_num" id="hiddenEmp_num" class="form-control" />
	                        <input type="text" name="emp_name" id="showEmp_name" class="form-control" />
	                        <input type="button" class="btn btn-sm btn-outline-primary" onclick="hrpop()" value="??????">
	                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">????????????</label>
                      <div class="col-sm-9">
                        <input type="date" name="out_date" class="form-control"/>
                      </div>
                    </div>
                  </div>
                 <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">??????</label>
                      <div class="col-sm-9">
                        <input type="text" name="remarks" class="form-control"/>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="template-demo" style="text-align: right;">
                <button class="btn btn-light" id = "productButton" type="button" >?????? ??????</button>
                <button class="btn btn-light" id = "productDeleteButton" type="button" >?????? ??????</button>
                </div>
                <hr>
                  <div class="col-lg-12 grid-margin stretch-card">
<!--                 <div class="card"> -->
                  <div class="card-body">
                    <p class="card-description">?????? ??????</p>
                    <div class="table-responsive">
                      <table class="table table-bordered" id="table">
                        <thead>
                          <tr>
                            <th>????????????</th>
                            <th>?????????</th>
                            <th>??????</th>
                            <th>??????</th>
                            <th>????????????</th>
                            <th>??????</th>
                            <th>????????????</th>
                            
                          </tr>
                        </thead>
                        <tbody>
                          <tr class ="tr">
                            <td>
                           		<input type="text" name="outProductList[0].product_cd" id ='product_cd0' class="form-control" onclick="prpop(0)" />
                            </td>
                            <td>
	                            <input type="text" name="outProductList[0].product_name" id = "product_name0" class="form-control" />
                            </td>
                            <td>
                           		 <input type="text" name="outProductList[0].size_des" id = "size_des0" class="form-control"  />
                            </td>
                            <td>
                          		 <input type="text" name="outProductList[0].out_schedule_qty" id ="out_schedule_qty" class="form-control"  />
                            </td>
                            <td>
                           		 <input type="date" name="outProductList[0].out_date" id ="out_date" class="form-control" />
                            </td>
                            <td>
                        	 	   <input type="text" name="outProductList[0].remarks" id = "remarks" class="form-control" />
                            </td>
<!--                             <td> -->
<!--                        		     <input type="text" name="outProductList[0].out_complete" id ="out_complete" class="form-control" /> -->
<!--                             </td> -->
                            <td>
                       		     <input type="text" name="outProductList[0].stock_cd" id ="out_complete" class="form-control" />
                            </td>
                          </tr>
                          
                        </tbody>
                        
                      </table>
                    </div>
                  </div>
<!--                 </div> -->
              </div>
                  <div class="template-demo" style="text-align: right;">
	                  <button type="submit" class="btn btn-primary mr-2">??????</button>
<!-- 	                  <button type="reset" class="btn btn-light" onclick="history.back()">??????</button> -->
                  </div>
              	</form>
               </div>
              </div>
             </div>
            </div>
           </div>
          </div>
        
		<!-- ?????? ?????? table -->	
			
		<footer class="footer">
          	<jsp:include page="../partials/footer.jsp"></jsp:include>
          </footer>
        </div>
        <!-- ?????? ?????? --> 
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