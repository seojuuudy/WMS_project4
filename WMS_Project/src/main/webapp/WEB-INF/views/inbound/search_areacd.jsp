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
	    
		// 위치 중복 검사
        function check(location_cd, product_cd, callback) {
            $.ajax({
                url: 'ck_Locatecd',
                type: 'GET',
                dataType: 'json',
                data: { location_cd: location_cd, product_cd: product_cd }, // 데이터 전달
                success: function(data) {
                    if(data == 0) { 
                    	callback(true); // 중복된 창고위치가 존재하지 않으면 true
                    } else {
                        callback(false); // 중복된 창고위치가 존재하면 false
                    }
                },
                error: function() {
                    callback(false);
                }
            }); // ajax
        }
		
		<!-- 입고 처리의 구역명_선반위치에 값 전달 -->
        function send_area(i, area_cd, location_cd) {
			const index = ${index}; // 부모창의 인덱스
			const product_cd = ${product_cd}; // 품목 코드
	    	const area = document.getElementById("area"+i).innerHTML;
        	const location = document.getElementById("location"+i).innerHTML;
        	
        	// 창고 위치 중복을 검사하는 check 함수 호출
        	check(location_cd, product_cd, function(result) { 
        	    if(result) { // 중복된 창고 위치가 없으면 실행
        	
        	    	// 부모창에 구역명_위치명 전달
		        	$("#location"+index, opener.document).val((area+"_"+location));
		        	
		        	// 이미 hidden 값으로 넘긴 구역_위치 코드가 존재한다면 삭제
		        	if($("#location" + index, opener.document).find("input[name='wh_area_cd']").length > 0) {
		        		$("#location" + index, opener.document).find("input[name='wh_area_cd']").remove();
		        		$("#location" + index, opener.document).find("input[name='wh_loc_in_area_cd']").remove();
		        	} 
		        	
		        	// 구역코드, 위치코드 넘기기
		       		$("#location"+index, opener.document).append("<input type='hidden' name='wh_area_cd' value='"+ area_cd +"'>");
		       		$("#location"+index, opener.document).append("<input type='hidden' name='wh_loc_in_area_cd' value='"+ location_cd +"'>");
		       		
		       		// 새재고번호를 생성하기위해 부모창의 newStockcd 함수 호출
		        	window.opener.newStockcd(index);
		        	window.close();
        		} else { // 중복된 창고 위치가 존재하면 알림창
        		 	 alert("해당 위치에 이미 재고가 존재합니다.");
        		} // if문 끝
        	}) // check 함수 끝
        }
	</script>
	<!-- jquery -->
  </head>
  <body>
  
    <div class="container-scroller">
        
        <!-- 본문 영역 -->
        <div class="main-panel">

		<!-- table 영역 -->
       <div class="col-lg-12 grid-margin stretch-card">
           <div class="card">
              	<div class="card-body">
                    <h4 class="card-title">구역명_위치검색</h4>
                    <p class="card-description">구역명_위치검색</p>
					 <form action="SearchArea">
						<!-- 검색 타입 추가 -->
						<div class="form-group">
                      	<div class="input-group">
                        <div class="input-group-prepend">
                          <select name="searchType" id="searchType" class="btn btn-sm btn-outline-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <option class="dropdown-item" value="wh_area" <c:if test="${param.searchType eq 'wh_area'}">selected</c:if>>구역명</option>
                            <option class="dropdown-item" value="wh_loc_in_area" <c:if test="${param.searchType eq 'product_name'}">selected</c:if>>위치명</option>
                          </select>
                        </div>
                       	  <input type="text" name="keyword" value="${param.keyword }" class="form-control"/>
                          <input type="submit" class="btn btn-sm btn-primary" value="search" />
                          <input type="hidden" name="index" value="${index}" />
                        </div>
                    </div>
						</form>
                    <div class="table-responsive">
                      <table class="table table-striped">
                        <thead>
                          <tr>
                            <th>내부 구역명</th>
                            <th>위치</th>
                            <th></th>
                          </tr>
                        </thead>
                        <tbody>
	                        <c:forEach var="area" items="${areaList }" varStatus="status">
	                          <tr>
	                          	<td id="area${status.index }">${area.wh_area}</td>
								<td id="location${status.index }">${area.wh_loc_in_area}</td>
	                          	<td>
	                            	<button type="button" class="btn btn-primary btn-rounded i" onclick="send_area(${status.index },'${area.wh_area_cd}','${area.wh_loc_in_area_cd}')">선택</button>
	                            </td>
	                          </tr>
	                        </c:forEach>
                        </tbody>
                      </table>
                    </div>
         
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
								<input type="button" class="btn btn-sm btn-outline-primary" value="이전" onclick="location.href='SearchArea?pageNum=${pageNum - 1}&searchType=${param.searchType}&keyword=${param.keyword}&index=${index}'">
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
									<a href="SearchArea?pageNum=${i }&searchType=${param.searchType}&keyword=${param.keyword}&index=${index}">${i }</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
				
						<c:choose>
							<c:when test="${pageNum < pageInfo.maxPage}">
								<input type="button" class="btn btn-sm btn-outline-primary" value="다음" onclick="location.href='SearchArea?pageNum=${pageNum + 1}&searchType=${param.searchType}&keyword=${param.keyword}&index=${index}'">
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