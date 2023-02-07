<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="kr">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Regist Product</title>
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
<script type="text/javascript">
$(function() {     
// 	alert("확인");
	// 그룹 검색 팝업창 확인용
// 	$("#SELECTEDGROUP").ON("CHANGE", FUNCTION() {
// 		ALERT("값 : " + $(THIS).VAL());
// 	});
	
	// 거래처 검색 팝업창
// 	$("#selectedClient").on("change", function() {
// 		alert("값 : " + $(this).val());
// 	});
	
	// 입고단가 계산
	$("#purchasePrice").on("change", function() {
		
		let number = $("#number").val();
		let purchasePr = $("#purchasePrice").val();
		let price = (purchasePr / number).toFixed(2);
		
		$("#purchasePriceResult").val(price);
		
		alert("number : " + number + ", purchase price : " + price);
		
	});
	
	//출고단가 계산
	$("#sellingPrice").on("change", function() {
		
		let number = $("#number").val();
		let sellingPr = $("#sellingPrice").val();
		let price = (sellingPr / number).toFixed(2);
		
		$("#sellingPriceResult").val(price);
		
		alert("number : " + number + ", selling price : " + price);
		
	});
	
});  
// 그룹 검색 팝업창
function findGroup() {
	let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1200, height=800, top=0,left=0";
	window.open("FindGroup.pr","_blank", options);
}

// 거래처 검색 팝업창
function findClient() {
	let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1200, height=800, top=0,left=0";
	window.open("FindClient.pr","_blank", options);
}
</script>  
  </head>
  <body>
  
    <div class="container-scroller">
      <!-- 사이드바 -->
      <jsp:include page="../partials/sidebar_pr.jsp"></jsp:include>
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
<!-- 			<h1>품목 등록</h1> -->	
		
		<!-- 품목 등록 table -->	
        <div class="col-12 grid-margin">
          <div class="card">
            <div class="card-body">
              <h4 class="card-title">품목 등록</h4>
              <form action="RegistPro.pr" class="form-sample" method="post" enctype="multipart/form-data">
                <p class="card-description">product regist</p>
                
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">품목명</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" name="product_name" required="required"/>
                      </div>
                    </div>
                  </div>
                 
                 <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">품목그룹(소)</label>
                      <div class="col-sm-9">
                         <span class="input-group-append">
                         
                        <select class="form-control" name="product_group_bottom_cd" required="required" id="selectedGroup">
                        <option value="" selected="selected" disabled="disabled">선택하세요</option>
                         <c:forEach var="bottomName" items="${prGrBottomNameList }">
                          <option value="${bottomName.product_group_bottom_cd }">${bottomName.product_group_bottom_name }</option>
                         </c:forEach>
                       
                        </select>
                          <button class="file-upload-browse btn btn-primary" type="button" onclick="findGroup()">검색</button>
                        </span>
                      </div>
                    </div>
                  </div>
                </div>
               
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">품목 구분</label>
                      <div class="col-sm-9">
                        <select class="form-control" name="product_type_cd" required="required">
                          <option value="" selected="selected" disabled="disabled">선택하세요</option>
                          <option value="1">원재료</option>
                          <option value="2">부재료</option>
                          <option value="3">반제품</option>
                          <option value="4">제품</option>
                          <option value="5">상품</option>
                        </select>
                      </div>
                    </div>
                  </div>
                 
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">단위</label>
                      <div class="col-sm-9">
                        <input type="text" id="number" class="form-control" name="unit" required="required"/>
                      </div>
                    </div>
                  </div>
                </div>
                
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">매입가</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" name="purchasePrice" id="purchasePrice" required="required"/>
                      </div>
                    </div>
                  </div>
                  
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">입고단가</label>
                      <div class="col-sm-9">
                        <input type="text" name="in_unit_price" class="form-control" id="purchasePriceResult" disabled="disabled"/>
                      </div>
                    </div>
                  </div>
                </div>
               
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">판매가</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" name="sellingPrice" id="sellingPrice" required="required"/>
                      </div>
                    </div>
                  </div>
                  
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">출고단가</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" id="sellingPriceResult" disabled="disabled"/>
                      </div>
                    </div>
                  </div>
                </div>
                
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">규격</label>
                      <div class="col-sm-9">
                        <input type="text" name="size_des" class="form-control" />
                      </div>
                    </div>
                  </div>
                
                <div class="col-md-6">
                    <div class="form-group row">
                     <label class="col-sm-3 col-form-label">대표이미지</label>
                      <div class="col-sm-9">
                       <span class="input-group-append">
                         <input type="file" name="file" id="file" class="form-control file-upload-info" placeholder="Upload Image" />
	                        <button onclick="jQuery('#file').click()" class="file-upload-browse btn btn-primary" type="button">Upload</button>
                        </span>
                      </div>
                    </div>
                  </div>
                </div>
                
               <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">거래처</label>
                      <div class="col-sm-9">
                         <span class="input-group-append">
                        <select class="form-control" name="business_no" required="required" id="selectedClient">
                        <option value="" selected="selected" disabled="disabled">선택하세요</option>
                         <c:forEach var="clientName" items="${clientNameList }">
                          <option value="${clientName.business_no }">${clientName.cust_name }</option>
                         </c:forEach>
                       
                        </select>
                          <button class="file-upload-browse btn btn-primary" type="button" onclick="findClient()">검색</button>
                        </span>
                      </div>
                    </div>
                  </div>
        
		        <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">적요</label>
                      <div class="col-sm-9">
                        <input type="text" name="remarks" class="form-control" />
                      </div>
                    </div>
                  </div>
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
        
		<!-- 품목 등록 table -->	
			
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