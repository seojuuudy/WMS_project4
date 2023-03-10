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
    <!-- End layout styles -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/images/favicon.png" />
 	<!-- jquery -->
	<script src="${pageContext.request.contextPath }/resources/assets/js/jquery-3.6.3.js"></script>
	<script type="text/javascript">
		function setParentText(stock_cd) {
// 			alert('잘왔고?');
			
			window.close();
			opener.set_st(stock_cd);
		}
		// 재고 수량 합계 계산을 위한 제이쿼리 식
		$(function() {
			sum = 0;
			for(var i = 0; i < $(".stock_qty").length; i++) {
				var stock = $(".stock_qty").eq(i).text();
				sum += parseInt(stock);
			}
			$("#sum_stock_qty").text(sum);
			
			// 체크 박스에서 checked된 데이터만 submit하기
			$("#revise_btn").on("click", function() {
			var param = [];
			var checkedStocks = [];
				 if($('input[type="checkbox"]').is(':checked') == false){
				      alert('조정할 재고를 선택해주세요.');
				      return false;
				    } else {
// 						for(var i = 0; i < $('input[type="checkbox"]:checked').length; i++) {
					    	$("input[type='checkbox']:checked").each(function(i) {		                				
// 					    		checkedStocks.push($(this).parents("tr").eq(i).text());
					    		var str = $(this).parents("tr").find(".product_name").text();
					    		var str2 = str.substring(str.indexOf(' [') + 1);
					    		var str3 = str2.substring(str2.lastIndexOf('[') + 1);
					    		checkedStocks = {
					    				stock_cd : $(this).parents("tr").find(".stock_cd").text(),
					    				product_name : str.substring(0, str.indexOf(' [')),
					    				size_des : str3.substring(0, str3.indexOf(']')),
					    				wh_name : $(this).parents("tr").find(".wh_name").text(),
					    				wh_area : $(this).parents("tr").find(".wh_area").text(),
					    				wh_loc_in_area : $(this).parents("tr").find(".wh_loc_in_area").text(),
					    				stock_qty : $(this).parents("tr").find(".stock_qty").text()
					    		};
					    	
					    		param.push(checkedStocks);
					    		
					    		localStorage.setItem("param", JSON.stringify(param));
					    	});
							
						}
						
			});
			
		});
		
		function history_popup(stock_cd) {
			let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1200, height=800, top=0,left=0";
			window.open("Stock_history_popup.st?stock_cd=" + stock_cd ,"_blank", options);
		}
		
	</script>
  </head>
  <body>
  
    <div class="container-scroller">
      
      <div class="container-fluid page-body-wrapper">
        <!-- 색상 커스텀 설정 -->
        <jsp:include page="../partials/settings-panel.jsp"></jsp:include>
        <!-- 색상 커스텀 설정 -->
        <!-- 본문 영역 -->
        <div class="main-panel">

		<!-- table 영역 -->
       <div class="col-lg-12 grid-margin stretch-card">
           <div class="card">
              	<div class="card-body">
                    <h4 class="card-title">재고 현황</h4>
                    <p class="card-description">재고 현황</p>
					 <form action="">
						<!-- 검색 타입 추가 -->
						<div class="form-group">
                      	<div class="input-group">
                        <div class="input-group-prepend">
                          <select name="searchType" id="searchType" class="btn btn-sm btn-outline-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <option class="dropdown-item" value="stock_cd" <c:if test="${param.searchType eq 'stock_cd'}">selected</c:if>>재고번호</option>
                            <option class="dropdown-item" value="product_name" <c:if test="${param.searchType eq 'product_name'}">selected</c:if>>품목명</option>
                            <option class="dropdown-item" value="wh_name" <c:if test="${param.searchType eq 'wh_name'}">selected</c:if>>창고명</option>
                            <option class="dropdown-item" value="wh_area" <c:if test="${param.searchType eq 'wh_area'}">selected</c:if>>구역명</option>
                            <option class="dropdown-item" value="wh_loc_in_area" <c:if test="${param.searchType eq 'wh_loc_in_area'}">selected</c:if>>위치명</option>
                          </select>
                        </div>
                       	  <input type="text" name="keyword" value="${param.keyword }" class="form-control"/>
                          <input type="submit" class="btn btn-sm btn-primary" value="search" />
                        </div>
                    </div>
						</form>
					<form action="StockControl.st">
					<input type="hidden" id="jsonData">
	                    <div class="table-responsive">
	                      <table class="table table-striped">
	                        <thead>
	                          <tr>
	                          	<th>체크박스</th>
	                            <th>재고번호</th>
	                            <th>품목명 [규격]</th>
	                            <th>창고명</th>
	                            <th>구역명</th>
	                            <th>위치명</th>
	                            <th>재고수량</th>
	                          </tr>
	                        </thead>
	                        <tbody>
	                        
	                         <c:forEach var="stock" items="${stockList }">
	                         
	                          <tr>
	                          	<th><input type="checkbox" class="checkedStock"></th>
	                          	<th class="stock_cd">
	                          	<a href="javascript:setParentText('${stock.stock_cd }')">${stock.stock_cd }</a>
	                          	</th>
	                            <td class="product_name">${stock.product_name} [${stock.size_des }]</td>
	                            <td class="wh_name">${stock.wh_name }</td>
	                            <td class="wh_area">${stock.wh_area }</td>
	                            <td class="wh_loc_in_area">${stock.wh_loc_in_area }</td>
	                            <td class="stock_qty">${stock.stock_qty }</td>
	                          </tr>
	                         </c:forEach>
	                          <tr>
	                            <td colspan="6" style="text-align: center;">재고수량 합계</td>
	                            <td id="sum_stock_qty"></td>
	                          </tr>
	                         
	                        </tbody>
	                      </table>
	                    </div>
				        <div class="template-demo" style="text-align: right;">
		           			<button type="submit" class="btn btn-primary btn-rounded btn-fw" id="revise_btn">조정</button>
	           			</div>
					</form>	
           			
         
				         <section id="pageList" style="text-align: center;"> <!-- 페이징 처리 영역 -->
				    
					     <!-- 만약, pageNum 파라미터가 비어있을 경우 pageNum 변수 선언 및 기본값 1로 설정 -->
						<c:choose>
							<c:when test="${empty param.pageNum }">
								<c:set var="pageNum" value="1" />
							</c:when>
							<c:otherwise>
								<c:set var="pageNum" value="${param.pageNum }" />
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${pageNum > 1}">
								<input type="button" class="btn btn-sm btn-outline-primary" value="이전" onclick="location.href='Stock.st?pageNum=${pageNum - 1}'">
							</c:when>
							<c:otherwise>
								<input type="button" class="btn btn-sm btn-outline-primary" value="이전">
							</c:otherwise>
						</c:choose>
							
						<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
							<c:choose>
								<c:when test="${pageNum eq i}">
									${i }
								</c:when>
								<c:otherwise>
									<a href="Stock.st?pageNum=${i }">${i }</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
				
						<c:choose>
							<c:when test="${pageNum < pageInfo.maxPage}">
								<input type="button" class="btn btn-sm btn-outline-primary" value="다음" onclick="location.href='Stock.st?pageNum=${pageNum + 1}'">
							</c:when>
							<c:otherwise>
								<input type="button" class="btn btn-sm btn-outline-primary" value="다음">
							</c:otherwise>
						</c:choose>
					</section>
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