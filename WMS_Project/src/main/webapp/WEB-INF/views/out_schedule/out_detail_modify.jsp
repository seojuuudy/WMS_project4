<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="kr">
  <head>
	  <style type="text/css">
	  	input[type="number"]::-webkit-outer-spin-button,
		input[type="number"]::-webkit-inner-spin-button {
		    -webkit-appearance: none;
		    margin: 0;
		 	width: 20px;
		}
	  </style>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>출고예정품목수정</title>
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
$(function() {
	  $("#updateParent").click(function() {
		var index = ${param.index}; 
		  
		alert("수정 완료");
	    var out_date = $("#out_date").val();
	    var out_schedule_qty = $("#out_schedule_qty").val();
	    var out_qty = $("#out_qty").val();
	    var remarks = $("#remarks").val();
	    var out_schedule_cd = $("#out_schedule_cd").val();
	    
	    window.opener.$("#out_date" + index).text(out_date);
	    window.opener.$("#out_schedule_qty" + index).text(out_schedule_qty);
	    window.opener.$("#out_qty" + index).text(out_qty);
	    window.opener.$("#remarks" + index).text(remarks);
// 	    window.opener.$("#out_schedule_cd" + index).text(out_schedule_cd);
	    window.opener.focus();
	    window.close();
	    $.ajax({
	    	  type: "POST",
	    	  url: "OutUpdatePro.out",
	    	  data: {
	    	    "out_date": out_date,
	    	    "out_schedule_qty": out_schedule_qty,
	    	    "out_qty": out_qty,
	    	    "remarks": remarks,
	    	    "out_schedule_cd": out_schedule_cd
	    	  },
	    	  success: function(result) {
	    	    if (result > 0) {
	    	      console.log("Value successfully stored in the database.");
	    	      alert("수정완료");
		           window.opener.location.reload();
		           self.close();
	    	    } else {
	    	      console.error("An error occurred while storing the value in the database:", result);
	    	    }
	    	  },
	    	  error: function(xhr, status, error) {
	    	    console.error("An error occurred while making the AJAX request:", error);
	    	  }
	    	});
	  });
	});
</script>
  <body>
        <!-- 본문 영역 -->
        <div class="main-panel">
		<!-- 사원 등록 table -->	
<c:forEach var="out" items="${outModify }">
        <div class="col-12 grid-margin">
          <div class="card">
            <div class="card-body">
              <h4 class="card-title">출고 예정 품목 수정</h4>
         	  <form action="OutUpdatePro.out" method="post" class="form-sample" name="modifyForm" id="modifyForm" onsubmit="return subCheck()">
                <p class="card-description">Out schedule Modify<br></p>
                
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">출고예정번호</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" value="${out.out_schedule_cd }" name="out_schedule_cd" id="out_schedule_cd" maxlength="10" readonly="readonly"/>
                      </div>
                    </div>
                  </div>
                  
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">보낸곳명</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" value="${out.cust_name }" name="out_cust_name" id="out_cust_name" readonly="readonly"/>
                      </div>
                    </div>
                  </div>
                  
                   <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">품목명[규격]</label>
                      <div class="col-sm-9">
                      	<input type="text" class="form-control" value="${out.product_name }[${out.size_des }]" name="product_name" id="product_name" readonly="readonly"><br>
                      </div>
                    </div>
                  </div>
                  
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">품목별납기일자</label>
                      <div class="col-sm-9">
                      	<input type="text" class="form-control" value="${out.out_date }" name="out_date" id="out_date"><br>
                      </div>
                    </div>
                  </div>
                
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">출고예정수량</label>
                      <div class="col-sm-9">
                      	<input type="text" class="form-control" value="${out.out_schedule_qty }" name="out_schedule_qty" id="out_schedule_qty"><br>
                      </div>
                    </div>
                  </div>
                  
<!--                   <div class="col-md-6"> -->
<!--                     <div class="form-group row"> -->
<!--                       <label class="col-sm-3 col-form-label">출고지시수량</label> -->
<!--                       <div class="col-sm-9"> -->
<%--                         <input type="number" class="form-control" value="${out.out_qty }" name="out_qty" id="out_qty"/> --%>
<!--                       </div> -->
<!--                     </div> -->
<!--                   </div> -->
                
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">적요</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" value="${out.remarks }" name="remarks" id="remarks"/>
                      </div>
                    </div>
                  </div>
                  
                  <div class="template-demo" style="text-align: center;">
	                  <input type="button" class="btn btn-primary mr-2" value="수정하기" id="updateParent"/>
<%--    	                  <button type=button class="btn btn-primary mr-2" onclick="OutModify('${out.out_schedule_cd }', '${out.out_date }')">수정</button> --%>
	                  
	                  <input type="button" class="btn btn-light" onclick="close();" value="취소">
                  </div>
                  </form>
                </div>
               </div>
              </div>
	</c:forEach>
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