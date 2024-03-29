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
	<script>
	<!-- 수정폼 팝업 -->
 	function openPopup(in_schedule_cd, product_name, in_date) {
 	    var _width = '840';
 	    var _height = '700';
 	 
 	    // 팝업을 가운데 정렬하기 위해 값 구하기
 	    var _left = Math.ceil(( window.screen.width - _width )/2);
 	    var _top = Math.ceil(( window.screen.height - _height )/2); 
 	 
 	    window.open("pdModify.in?in_schedule_cd="+in_schedule_cd+"&product_name="+product_name+"&in_date="+in_date, '항목 수정', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
 	}

	<!-- 입고 버튼 클릭 -->
	function inbound() {
		
		let arr = new Array();
		let arr2 = new Array();
		let arr3 = new Array();
		
		if($(".checkbox").is(":checked")==false) {
			alert("입고처리할 항목을 체크해주세요!");
			return;
		} else {
// 		 $('input:checkbox[name="inboundchk"]:checked').each(function(index, item) {
		 $(".checkbox").each(function(index, item) {
			 if(item.checked) {
			    arr.push($("#in_schedule_cd"+index).text());
				arr2.push($("#product_cd"+index).val());
				arr3.push($("#in_date"+index).text());
				
// 			alert(arr + "," + arr2 + "," + arr3)
	 	    var _width = '1200';
	 	    var _height = '600';
	 	 	 
	 	    // 팝업을 가운데 정렬하기 위해 값 구하기
	 	    var _left = Math.ceil(( window.screen.width - _width )/2);
	 	    var _top = Math.ceil(( window.screen.height - _height )/2);
	 	 
	 	    window.open("pdProcessList.in?in_schedule_cd="+arr+"&product_cd="+arr2+"&in_date="+arr3, '입고처리', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
			 }
		 });
		}
	}
		
	<!-- 정렬타입 선택 -->
	function submitSortForm() {
		
		// url에서 keyword, complete 파라미터 추출
		let urlParams = new URLSearchParams(window.location.search);
		let searchTerm = urlParams.get('keyword');		
		let comstatus = urlParams.get('complete');		
    	
    	if(searchTerm == null) {
    		searchTerm = "";
    	}
    	
    	if(comstatus == null) {
    		comstatus = "";
    	}
    	
    	// 검색, 탭 선택 후의 결과를 유지한채 정렬하기위해 url에서 추출한 파라미터를 각 요소의 value로 설정
   		document.getElementById("keyword").value = searchTerm; 
    	document.getElementById("complete").value = comstatus; 
    	
	    document.getElementById("sortForm").submit();
	}
	
	<!-- 상태 탭 선택 -->
	function submitCompleteForm(value) {
		document.getElementById("complete").value = value;
	    document.getElementById("sortForm").submit();
	}
</script>
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
        
        <!-- 만약, pageNum 파라미터가 비어있을 경우 pageNum 변수 선언 및 기본값 1로 설정 -->
		<c:choose>
			<c:when test="${empty param.pageNum }">
				<c:set var="pageNum" value="1" />
			</c:when>
			<c:otherwise>
				<c:set var="pageNum" value="${param.pageNum }" />
			</c:otherwise>
		</c:choose>

		<!-- table 영역 -->
       <div class="col-lg-12 grid-margin stretch-card">
           <div class="card">
              	<div class="card-body">
                    <h4 class="card-title">입고 예정 항목</h4>
                    <p class="card-description">inbound product list</p>
					 <form id="sortForm" action="pdList.in">
					 	<input type="hidden" name="pageNum" value="${pageNum }">
					 	<input type="hidden" name="complete" id="complete" value="">
						<!-- 검색 타입 추가 -->
						<div class="form-group">
                      	<div class="input-group">
                        <div class="input-group-prepend">
                          <select name="searchType" id="searchType" class="btn btn-sm btn-outline-primary dropdown-toggle">
                            <option class="dropdown-item" value="in_schedule_cd" <c:if test="${param.searchType eq 'in_schedule_cd'}">selected</c:if>>입고예정번호</option>
                            <option class="dropdown-item" value="business_no" <c:if test="${param.searchType eq 'business_no'}">selected</c:if>>거래처명</option>
                            <option class="dropdown-item" value="product_name" <c:if test="${param.searchType eq 'product_name'}">selected</c:if>>품목명</option>
                            <option class="dropdown-item" value="in_date" <c:if test="${param.searchType eq 'in_date'}">selected</c:if>>납기일자</option>
                          </select>
                        </div>
                       	  <input type="text" name="keyword" id="keyword" value="${param.keyword }" class="form-control"/>
                          <input type="submit" class="btn btn-sm btn-primary" value="search" />
                        </div>
                    	</div>
	                    <div class="page-header">
			              <nav aria-label="breadcrumb">
							  <ol class="breadcrumb">
							    <li class="breadcrumb-item" value=""><a href="javascript:void(0);" onclick="submitCompleteForm('')">전체</a></li>
							    <li class="breadcrumb-item" value="0"><a href="javascript:void(0);" onclick="submitCompleteForm('0')">진행중</a></li>
							    <li class="breadcrumb-item" value="1"><a href="javascript:void(0);" onclick="submitCompleteForm('1')">완료</a></li>
							  </ol>
						  </nav>
							<select name="order" id="order" class="btn btn-sm btn-outline-primary dropdown-toggle" onchange="submitSortForm()">
							    <option class="dropdown-item" value="" disabled selected>정렬</option>
							    <option class="dropdown-item" value="incd_asc" <c:if test="${param.order eq 'incd_asc'}">selected</c:if>>입고예정번호(오름차순)</option>
							    <option class="dropdown-item" value="incd_desc" <c:if test="${param.order eq 'incd_desc'}">selected</c:if>>입고예정번호(내림차순)</option>
							    <option class="dropdown-item" value="indate_asc" <c:if test="${param.order eq 'indate_asc'}">selected</c:if>>납기일자(오름차순)</option>
							    <option class="dropdown-item" value="indate_desc" <c:if test="${param.order eq 'indate_desc'}">selected</c:if>>납기일자(내림차순)</option>
						  	</select>
			            </div>
<!-- 					</form> -->
                    <div class="table-responsive">
                      <table class="table table-striped">
                        <thead>
                          <tr>
                            <th></th>
                            <th>입고예정번호</th>
                            <th>입고거래처명</th>
                            <th>품목명[규격]</th>
                            <th>납기일자</th>
                            <th>입고예정수량</th>
                            <th>입고수량</th>
                            <th>미입고수량</th>
                            <th>적요</th>
                          </tr>
                        </thead>
                        <tbody>
                        
                        <c:forEach var="inproduct" items="${inProductList }" varStatus="status">
                          <input type="hidden" id="product_cd${status.index}" value="${inproduct.product_cd}">
                          <tr>
                            <td><input type="checkbox" class="checkbox" name="inboundchk"></td>
                            <td id="in_schedule_cd${status.index }"><a href="javascript:void(0);" onclick="openPopup('${inproduct.in_schedule_cd }','${inproduct.product_name}', '${inproduct.in_date }'); return false;">${inproduct.in_schedule_cd}</a></td>
                            <td>${inproduct.cust_name}</td>
                            <c:choose>
                            	<c:when test="${empty inproduct.size_des}">
                       		     	<td>${inproduct.product_name}</td>
                            	</c:when>
                            	<c:otherwise>
                            		<td>${inproduct.product_name} ${inproduct.size_des}</td>
                            	</c:otherwise>
                            </c:choose>
                            <td id="in_date${status.index }">${inproduct.in_date}</td>
                            <td>${inproduct.in_schedule_qty}</td>
                            <td>${inproduct.in_qty}</td>
                            <td>${inproduct.in_schedule_qty - inproduct.in_qty}</td>
                            <td>${inproduct.remarks}</td>
                          </tr>
                        </c:forEach>
                         
                        </tbody>
                      </table>
                    </form>
                    </div>
			        <div class="template-demo" style="text-align: right;">
	           			<button type="button" id="inboundbtn" class="btn btn-primary btn-rounded btn-fw" onclick="inbound()">입고</button>
           			</div>
         
				         <section id="pageList" style="text-align: center;"> <!-- 페이징 처리 영역 -->
				    
						<c:choose>
							<c:when test="${pageNum > 1}">
								<input type="button" class="btn btn-sm btn-outline-primary" value="이전" onclick="location.href='pdList.in?pageNum=${pageNum - 1}&searchType=${param.searchType}&keyword=${param.keyword}&order=${param.order }&complete=${param.complete }'">
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
									<a href="pdList.in?pageNum=${i }&searchType=${param.searchType}&keyword=${param.keyword}&order=${param.order }&complete=${param.complete }">${i }</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
				
						<c:choose>
							<c:when test="${pageNum < pageInfo.maxPage}">
								<input type="button" class="btn btn-sm btn-outline-primary" value="다음" onclick="location.href='pdList.in?pageNum=${pageNum + 1}&searchType=${param.searchType}&keyword=${param.keyword}&order=${param.order }&complete=${param.complete }'">
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