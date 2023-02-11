<%@ page language="Java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	<script type="text/javascript">
		// 진행 상태 조회
		function open_sta(schedule_cd) {
			let url = "InboundScheduleStatus.in?in_schedule_cd=" + schedule_cd;
			window.open(url,'','width=700,height=700,location=no,top=0');
		}

		// 종결여부 변경
		function complete(in_schedule_cd, in_complete) {
// 			alert(in_schedule_cd + "," + in_complete);
			let result = confirm("종결 여부를 변경하시겠습니까?");
			if(result) {
				$.ajax({
					type: "GET",
					url: "InboundComplete.in?in_schedule_cd=" + in_schedule_cd + "&in_complete=" + in_complete,
					success: function(data) {
						if(data == "success") {
							alert("변경이 완료되었습니다.");
							location.reload();
						} else if(data == "fail") {
							alert("모든 품목이 입고처리 되지 않았으므로 종결이 불가합니다.");
							location.reload();
						}
					}
				}) // ajax end
			}
		}
		
		// POST로는 왜 안될까 michin	
// 		$(document).ready(function() {
// 			$("#complete").click(function test() {
// 				let result = confirm("종결 여부를 변경하시겠습니까?");
// 				if(result) {
// 					$.ajax({
// 						type: "POST",
// 						url: "InboundComplete.in",
// 						dataType: "JSON",
// 						data: JSON.stringify({"in_schedule_cd" : "${ins.in_schedule_cd}", "in_complete" : "${ins.in_complete}"}),
// 						contentType: 'application/json',
// 						success: function(data) {
// 							alert("성공");
// 						}
// 					}) // ajax end
// 				}
// 			});
// 		});
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
                    <h4 class="card-title">입고 예정 조회</h4>
                    <p class="card-description">입고 예정</p>
					 <form action="InboundScheduleList.in">
						<!-- 검색 타입 추가 -->
						<div class="form-group">
                      	<div class="input-group">
                        <div class="input-group-prepend">
                          <select name="searchType" id="searchType" class="btn btn-sm btn-outline-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <option class="dropdown-item" value="cust_name" <c:if test="${param.searchType eq 'cust_name'}">selected</c:if>>거래처</option>
                            <option class="dropdown-item" value="emp_num" <c:if test="${param.searchType eq 'emp_num'}">selected</c:if>>담당자</option>
                          </select>
                        </div>
                       	  <input type="text" name="keyword" value="${param.keyword }" class="form-control"/>
                          <input type="submit" class="btn btn-sm btn-primary" value="search" />
                        </div>
                    	</div>
					</form>
					<div class="page-header">
		              <nav aria-label="breadcrumb">
		                <ol class="breadcrumb">
		                  <li class="breadcrumb-item"><a href="InboundScheduleList.in?in_complete=">전체</a></li>
		                  <li class="breadcrumb-item"><a href="InboundScheduleList.in?in_complete=0" >진행중</a></li>
		                  <li class="breadcrumb-item"><a href="InboundScheduleList.in?in_complete=1">완료</a></li>
		                </ol>
		              </nav>
		            </div>
                    <div class="table-responsive">
                      <table class="table table-striped">
                        <thead>
                          <tr>
                            <td>입고 예정 번호</td>
                            <th>유형</th>
                            <th>거래처명</th>
                            <th>담당자명</th>
                            <th>품목명[규격]</th>
                            <th>납기일자</th>
                            <th>입고예정수량 합계</th>
                            <th>종결여부</th>
                            <th>진행상태</th>
                          </tr>
                        </thead>
                        <tbody>
                        <!-- 반복문 들어갈 자리 -->
                        <c:forEach var="ins" items="${InScheList }" varStatus="status">
<%--                         <c:forEach var="cnt" items="${InScheCount}"> --%>
                          <tr>
                            <td>${ins.in_schedule_cd}</td>
                            	<c:choose>
                            		<c:when test="${ins.in_type_cd eq '1'}">
                            			<td>${fn:replace(ins.in_type_cd, '1', '발주서') }
                            		</c:when>
                            		<c:when test="${ins.in_type_cd eq '2'}">
                            			<td>${fn:replace(ins.in_type_cd, '2', '구매') }</td>
                            		</c:when>
                            	</c:choose>
                            <td>${ins.cust_name} </td>
                            <td>${ins.emp_name}</td>
                            <td>${ins.product_name}[${ins.size_des }] 외 ${InScheCnt[status.index].inSchePerCnt - 1}건</td>
                            <td>${ins.in_date}</td>
<%--                             <td>${cnt.in_schedule_qty}</td> --%>
<%--                             <td>${InScheCount[status.index].in_schedule_qty}</td> --%>
                            <td>${InScheSum[status.index].in_schedule_qty}</td>
<%--                             <td><button type="button" class="badge badge-success" id="complete" onclick="test('${ins.in_schedule_cd}', '${ins.in_complete}')">종결</button></td> --%>
                            	<c:choose>
                            		<c:when test="${ins.in_complete eq '0'}">
                            			 <td>
                            				<button type="button" class="badge badge-success" id="complete" onclick="complete('${ins.in_schedule_cd}', '${ins.in_complete}')">종결</button>
                            		</c:when>
                            		<c:when test="${ins.in_complete eq '1'}">
                            			 <td>
                            			 	<button type="button" class="badge badge-danger" id="complete" onclick="complete('${ins.in_schedule_cd}', '${ins.in_complete}')">취소</button>
                            			 </td>
                            		</c:when>
                            	</c:choose>
                            <td>
                            	<button type="button" class="badge badge-info" onclick="open_sta('${ins.in_schedule_cd}')">조회</button>
                            </td>
                          </tr>
                        </c:forEach>
<%--                         </c:forEach> --%>
                        </tbody>
                      </table>
                    </div>
			        <div class="template-demo" style="text-align: right;">
	           			<button type="button" class="btn btn-primary btn-rounded btn-fw" onclick="location.href='InboundScheduleRegist.in'">입고 예정 등록</button>
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
								<input type="button" class="btn btn-sm btn-outline-primary" value="이전" onclick="location.href='InboundScheduleList.in?pageNum=${pageNum - 1}'">
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
									<a href="InboundScheduleList.in?pageNum=${i }">${i }</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
				
						<c:choose>
							<c:when test="${pageNum < pageInfo.maxPage}">
								<input type="button" class="btn btn-sm btn-outline-primary" value="다음" onclick="location.href='InboundScheduleList.in?pageNum=${pageNum + 1}'">
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