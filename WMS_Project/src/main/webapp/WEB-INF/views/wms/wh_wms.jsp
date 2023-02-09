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
	<!-- jquery -->
	<!-- 창고관리 css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/wms_css.css" />
	<script type="text/javascript">
	// 	창고관리 메뉴 js
		function areaD(a,an) {
    		if(confirm(an+"을(를) 삭제하시겠습니까?")) {
         		alert("삭제를 진행합니다.");
       			location.href="AreaDelete.wms?wh_area_cd="+a;
        	} else {
     		}
     	}
		function locationD(l,ln) {
    		if(confirm(ln+"을(를) 삭제하시겠습니까?")) {
         		alert("삭제를 진행합니다.");
       			location.href="LocDelete.wms?wh_loc_in_area_cd="+l;
        	} else {
     		}
     	}
	// 창고관리 제이쿼리
		$(function() {
			$("#list1 li a").click(function(){
			    var code1 = $(this).attr("id");
			    $(this).css("color","red");
			});
			$("#list2 li a").click(function(){
			    var code2 = $(this).attr("id");
			    $(this).css("color","red");
			});
			//=====================================================================
// 			$("#list1 li a").click(function(){
// 			    var code1 = $(this).attr("id");
// 			    $(this).css("color","red");
// // 			    var code2 = $("#list2 li[id="+code1+"]").attr("id");
// 			    $(".stock[id="+code1+"]").hide();
// 			});
		});
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
        <div class="contain-to-grid">
		<!-- 창고 목록 영역 -->
       <div class="col-lg-12 grid-margin stretch-card">
           <div class="card">
              	<div class="card-body">
                    <h4 class="card-title">창고 관리</h4>
                    <p class="card-description">warehouse management</p>
                    <section class="table-responsive">
                      <section class="table table-striped">
                            <div class="container">
	                            <div class="item">
	                            창고 목록
	                            <div id="list1">
		                            <ol>
										<c:forEach var="wh" items="${whList }">
	<!-- 									구역추가 버튼 -->
				                            <li id="${wh.wh_cd}"><a id="${wh.wh_cd}" onclick="location.href='Wh.wms?searchArea=${wh.wh_cd}'">${wh.wh_name}</a>
<%-- 				                            <li><a id="${wh.wh_cd}">${wh.wh_name}</a> --%>
				                            <button type="button" class="btn btn-outline-primary btn-sm" onclick="location.href='RegistArea.wms?wh_cd=${wh.wh_cd}&wh_name=${wh.wh_name }'">+</button></li>
				                        </c:forEach>
		                            </ol>
	                            </div>
			           			</div>
	                            <div class="item">
	                            구역 목록
	                            <div id="list2">
		                         	<ol>
			                            <c:forEach var="ar" items="${arList }">
	<!-- 		                            위치 추가버튼, 구역 삭제 버튼 -->
				                            <li id="${ar.wh_cd}" class="${ar.wh_area_cd }"><a id="${ar.wh_cd}" class="${ar.wh_area_cd }" onclick="location.href='Wh.wms?searchArea=${ar.wh_cd}&searchLocation=${ar.wh_area_cd}'">${ar.wh_area}</a>
<%-- 				                            <li><a id="${ar.wh_cd}" class="${ar.wh_area_cd }">${ar.wh_area}</a> --%>
				                            	<button type="button" class="btn btn-outline-primary btn-sm" onclick="location.href='RegistLoc.wms?wh_area=${ar.wh_area }&wh_area_cd=${ar.wh_area_cd}'">+</button>
				                            	<button type="button" class="btn btn-outline-primary btn-sm" onclick="areaD('${ar.wh_area_cd}','${ar.wh_area}')" >-</button>
			    	                        	<button type="button" class="btn btn-outline-primary btn-sm" onclick="location.href='UpdateArea.wms?wh_area=${ar.wh_area}&wh_area_cd=${ar.wh_area_cd }'">
			    	                        		<i class="mdi mdi-grease-pencil" style="font-size: 13px;"></i>
		    	                        		</button>
			        	                    </li>
				                        </c:forEach>
			                         </ol>
	                            </div>
			           			</div>
	                            <div class="item">
	                            위치 목록
	                            <div id="list3">
			                        <ol>
			                            <c:forEach var="lo" items="${loList }">
	<!-- 			                            위치 삭제버튼, 위치명 변경 버튼 -->
				                            <li class="${lo.wh_area_cd}"><a class="${lo.wh_area_cd}" onclick="location.href='Wh.wms?searchArea=${lo.wh_cd}&searchLocation=${lo.wh_area_cd}&searchGo=${lo.wh_loc_in_area_cd }'">${lo.wh_loc_in_area}</a>
<%-- 				                            <li><a class="${lo.wh_area_cd}">${lo.wh_loc_in_area}</a> --%>
				                            	<button type="button" class="btn btn-outline-primary btn-sm" onclick="locationD('${lo.wh_loc_in_area_cd}','${lo.wh_loc_in_area}')" >-</button>
				                            	<button type="button" class="btn btn-outline-primary btn-sm" onclick="location.href='UpdateLoc.wms?wh_loc_in_area=${lo.wh_loc_in_area}&wh_loc_in_area_cd=${lo.wh_loc_in_area_cd }'">
				                            		<i class="mdi mdi-grease-pencil" style="font-size: 13px;"></i>
			                            		</button>
				                            </li>
				                        </c:forEach>
			                        </ol>
	                            </div>
			           			</div>
		           			</div>
		           		</section>
		           	</section>
                  </div>
             	</div>
           </div>
        </div>
		<!-- 재고 table 영역 -->
		<div class="card-body">
		<h4 class="card-title">재고 조회</h4>
           <div class="table-responsive">
             <table class="table table-striped">
               <thead>
                 <tr>
                   <th>재고번호</th>
                   <th>품목명</th>
                   <th>규격</th>
                   <th>재고수량</th>
                   <th>창고명_구역명</th>
                   <th>위치명</th>
                 </tr>
               </thead>
               <tbody>
               <!-- 관련 재고 목록 반복문 들어갈 자리 -->
               <c:forEach var="st" items="${stList }">
                 <tr id="stock">
                   <td>${st.stock_cd}</td>
                   <td>${st.product_name}</td>
                   <td>${st.size_des}</td>
                   <th>${st.stock_qty}</th>
                   <th>${st.wh_name} _ ${st.wh_area}</th>
                   <th>${st.wh_loc_in_area}</th>
                 </tr>
               </c:forEach>
               </tbody>
             </table>
           </div>
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
						<input type="button" class="btn btn-sm btn-outline-primary" value="이전" onclick="location.href='Wh.wms?pageNum=${pageNum - 1}'">
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
							<a href="Wh.wms?pageNum=${i }">${i }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${pageNum < pageInfo.maxPage}">
						<input type="button" class="btn btn-sm btn-outline-primary" value="다음" onclick="location.href='Wh.wms?pageNum=${pageNum + 1}'">
					</c:when>
					<c:otherwise>
						<input type="button" class="btn btn-sm btn-outline-primary" value="다음">
					</c:otherwise>
				</c:choose>
			</section>
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