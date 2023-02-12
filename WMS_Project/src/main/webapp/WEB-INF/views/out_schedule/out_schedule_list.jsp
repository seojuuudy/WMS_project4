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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
	function complete(out_schedule_cd, out_complete) {
//			alert(in_schedule_cd + "," + in_complete);
		let result = confirm("종결 여부를 변경하시겠습니까?");
		if(result) {
			$.ajax({
				type: "GET",
				url: "outCompleteChange.out?out_schedule_cd=" + out_schedule_cd + "&out_complete=" + out_complete,
				success: function(result) {
					
					if(result == "true"){
						   if($(this).text() == "취소") {
							   $(this).removeClass("badge-danger");
							   $(this).addClass("badge-info");
					           $(this).text("종결");
					           alert("변경이 완료되었습니다.");
					           location.reload();
					       } else {
					    	   $(this).removeClass("badge-info");
							   $(this).addClass("badge-danger");
					           $(this).text("취소");
					           alert("변경이 완료되었습니다.");
					           location.reload();
					        }
		                } 
				}
				,fail: function() {
                	alert("모든 품목이 출고처리 되지 않았으므로 종결이 불가합니다.");
					location.reload();
					
				}
			}) // ajax end
		}
	}
// 		$(function() {
// 			// 종결버튼 클릭시 취소 변경 및 db작업
// 		   $("#changeBtn").on("click", function() {
// 			   let osc = $('#out_schedule_cd').val(); 
// 			   let oc = $('#out_complete').val(); 
// 				console.log("값 확인 " + osc + oc);
// 		         $.ajax({
// 		        	type:"GET",
// 		            url:"outCompleteChange.out?out_schedule_cd=" + osc + "&out_complete=" + oc,
// // 		            data : { out_complete: "0"},
// 			        success: function(result){
// 			        	console.log(result);
// 		                if(result == "true"){
// 						   if($(this).text() == "취소") {
// 							   $(this).removeClass("badge-danger");
// 							   $(this).addClass("badge-info");
// 					           $(this).text("종결");
// 					           location.reload();
// 					           alert("변경이 완료되었습니다.");
// 					       } else {
// 					    	   $(this).removeClass("badge-info");
// 							   $(this).addClass("badge-danger");
// 					           $(this).text("취소");
// 					           location.reload();
// 					           alert("변경이 완료되었습니다.");
// 					        }
// 		                } else {
// 		                	alert("모든 품목이 입고처리 되지 않았으므로 종결이 불가합니다.");
// 							location.reload();
// 		                }
// 			        }   
// 		         }); // ajax
// 		 	  });
// 		   });
		
// 	    function openPopup(){
// 	        window.open("OutRegist.out", "popup", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=700, height=700, left=0, top=0" );
// 	   		window.close();
// 	    }
// 		$('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
// 		    // 선택되는 요소를 오브젝트화 한다.
// 		    $this = $(e.target);
// 		    // data-load가 false의 경우는 content에 data-load를 한다.
// 		    if(!$this.data("load")) {
// 		      // tab-content의 id를 취득한다.
// 		      var id = $this.attr("href");
// 		      // 페이지 로드를 한다.
// 		      $(id).load($this.data("url"));
// 		      // data-load를 true로 변환하여 중복 로딩이 없게 한다.
// 		      $this.data("load", true);
// 		    }
// 		  });
// 		  $('a[data-toggle="tab"]').on('hide.bs.tab', function (e) {
// 		    // 여기에 load 삭제 기능을 넣어도 되고...
// 		  });
// 		 $(document).ready(function() {
//         // 탭 메뉴를 1번으로 초기화
//         $('ul.tabs li:eq(0)').addClass('current');
//         $('#tab-1').addClass('current');
// 	    });
	 
// 	    //탭 바 클릭 이벤트
// 	    // 클릭할 때 마다 포커스 되는 
// 	    $('ul.tabs').on("click","li",function(event){
// 	        var tab_id = $(this).attr('data-tab');
// 	        $('ul.tabs li').removeClass('current');
// 	        $('.tab-content').removeClass('current');
// 	        $(this).addClass('current');
// 	        $("#"+tab_id).addClass('current');
// 	     });
	function processPop(out_schedule_cd){
		let url = "OutDetail.out?out_schedule_cd=" + out_schedule_cd;
		let pop = window.open(url,'searchList','location=no,toolbar=no,width=700, height=700, left=0, top=0,resizable=yes,scrollbars=yes');
		}
	function set_process(out_schedule_cd) {
		document.getElementById("product_name").value = product_name;
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
                    <h4 class="card-title">출고 예정 항목</h4>
                    <p class="card-description">출고 예정 항목</p>
					 <form action="OutScheduleList.out">
						<!-- 검색 타입 추가 -->
						<div class="form-group">
<!--                       	<div class="input-group"> -->
<!--                         <div class="input-group-prepend"> -->
<!--                           <select name="searchType" id="searchType" class="btn btn-sm btn-outline-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
<%--                             <option class="dropdown-item" value="emp_name" <c:if test="${param.searchType eq 'emp_name'}">selected</c:if>>출고예정번호</option> --%>
<%--                             <option class="dropdown-item" value="emp_name" <c:if test="${param.searchType eq 'emp_name'}">selected</c:if>>보낸곳명</option> --%>
<%--                             <option class="dropdown-item" value="dept_name" <c:if test="${param.searchType eq 'dept_name'}">selected</c:if>>품목명</option> --%>
<%--                             <option class="dropdown-item" value="grade_name" <c:if test="${param.searchType eq 'grade_name'}">selected</c:if>>납기일자</option> --%>
<!--                           </select> -->
<!--                         </div> -->
<%--                        	  <input type="text" name="keyword" value="${param.keyword }" class="form-control"/> --%>
<!--                           <input type="submit" class="btn btn-sm btn-primary" value="search" /> -->
<!--                         </div> -->
                   	 </div>
						</form>
						
						 <!-- Tab을 구성할 영역 설정-->
<!-- 							  <div style="margin:10px;"> -->
<!-- 							    tab 영역이다. -->
<!-- 							    <ul class="nav nav-tabs"> -->
<!-- 							      data-load를 넣어서 이미 로드를 했는지 않했는지의 판단 값을 넣는다. -->
<!-- 							      true면 이미 content영역에 load가 끝나서 더이상 load가 필요없다는 뜻이다. -->
<!-- 							      <li class="active"><a href="#home1" data-toggle="tab" data-load="true">전체&nbsp;&nbsp;&nbsp;</a></li> -->
<!-- 							      <li class="active"><a href="#home1" data-toggle="tab">전체&nbsp;&nbsp;&nbsp;</a></li> -->
<!-- 							      false라면 data-url영역의 url주소로 데이터를 가져와서 tab-content에 표시한다. -->
<!-- 							      <li><a href="#homepage" data-toggle="tab" data-load="false" data-url="OutManage.out">진행중&nbsp;&nbsp;&nbsp;</a></li> -->
<!-- 							      <li><a href="#homepage" data-toggle="tab" data-url="OutManage.out">진행중&nbsp;&nbsp;&nbsp;</a></li> -->
<!-- 							      <li><a href="#dy" data-toggle="tab" data-url="https://www.naver.com/">완료&nbsp;&nbsp;&nbsp;</a></li> -->
<!-- 							      <li><a href="#homepage" data-toggle="tab" data-load="false" data-url="">완료&nbsp;&nbsp;&nbsp;</a></li> -->
<!-- 							    </ul> -->
<!-- 							    tab-content 영역이다. -->
<!-- 							    <div class="tab-content"> -->
<!-- 							      <div class="tab-pane fade in active" id="home">Home 메뉴</div> -->
<!-- 							      <div class="tab-pane fade" id="homepage">여기라구!</div> -->
<!-- 							      <div class="tab-pane fade" id="dy">여기야!</div> -->
<!-- 							    </div> -->
<!-- 							  </div> -->
<!-- 								<div class="container"> -->
<!-- 								        <ul class="tabs"> -->
<!-- 								            <li class="tab-link current" data-tab="tab-1"> -->
<!-- 								                <a class="nav-link active" id="tab1"> -->
<!-- 								                    Number 1 -->
<!-- 								                </a> -->
<!-- 								            </li> -->
<!-- 								            <li class="tab-link" data-tab="tab-2"> -->
<!-- 								                <a class="nav-link" id="tab2"> -->
<!-- 								                    Number 2 -->
<!-- 								                </a> -->
<!-- 								            </li> -->
<!-- 								            <li class="tab-link" data-tab="tab-3"> -->
<!-- 								                <a class="nav-link" id="tab3"> -->
<!-- 								                    Number 3 -->
<!-- 								                </a> -->
<!-- 								            </li> -->
<!-- 								            <li class="tab-link" data-tab="tab-4"> -->
<!-- 								                <a class="nav-link" id="tab4"> -->
<!-- 								                    Number 4 -->
<!-- 								                </a> -->
<!-- 								            </li> -->
<!-- 								        </ul> -->
<!-- 								        <div id="tab-1" class="tab-content"> -->
<!-- 								            <a>탭 영역 1</a>                     -->
<!-- 								        </div> -->
<!-- 								        <div id="tab-2" class="tab-content"> -->
<!-- 								            <a>탭 영역 1</a>                     -->
<!-- 								        </div> -->
<!-- 								        <div id="tab-3" class="tab-content"> -->
<!-- 								            <a>탭 영역 1</a>                     -->
<!-- 								        </div> -->
<!-- 								        <div id="tab-4" class="tab-content"> -->
<!-- 								            <a>탭 영역 1</a>                     -->
<!-- 								        </div> -->
<!-- 								    </div> -->
                    <div class="table-responsive">
                      <table class="table table-striped">
                        <thead>
                          <tr>
                            <th>출고예정번호</th>
                            <th>유형</th>
                            <th>받는곳명</th>
                            <th>담당자명</th>
                            <th>품목명[규격]</th>
                            <th>납기일자</th>
                            <th>출고예정수량합계</th>
                            <th>종결여부</th>
                            <th>진행상태</th>
                          </tr>
                        </thead>
                        <tbody>
                        
                        <!-- 출고 예정 목록 반복문 들어갈 자리 -->
                        <c:forEach var="release" items="${out_schedule_list }" varStatus="status">
                          <tr>
                            <td>
                            	<input type="hidden" name="out_schedule_cd" id="out_schedule_cd" value="${release.out_schedule_cd}">
                            	<input type="hidden" name="out_complete" id="out_complete" value="${release.out_complete}">
                             <a href="javascript:processPop('${release.out_schedule_cd}');">${release.out_schedule_cd}</a>
                           </td>
                           <c:choose>
                           		<c:when test="${release.in_type_cd eq '01'}">
                           			<td>${fn:replace(release.in_type_cd, '01', '발주서') }
                           		</c:when>
                           		<c:when test="${release.in_type_cd eq '02'}">
                           			<td>${fn:replace(release.in_type_cd, '02', '구매') }</td>
                           		</c:when>
                           	</c:choose>
                            <td>${release.cust_name}</td>
                            <td>${release.emp_name}</td>
                             <td>${release.product_name}[${release.size_des }] 외 ${outscheduleCount[status.index].outSchePerCnt - 1}건</td>
                            <td>${release.out_date}</td>
                             <td>${outscheduleSum[status.index].out_schedule_qty}</td>
<%--                             <td><label class="badge badge-info" onclick="open_sta('${ins.in_schedule_cd}')">조회</label></td> --%>
<%--                          		<button type="button" class="btn btn-primary btn-rounded i" onclick="location.href='Detail.hr?emp_email=${emp.emp_email}'">상세조회</button> --%>
<%--                             	<button type="button" class="btn btn-primary btn-rounded i" onclick="location.href='Update.hr?emp_email=${emp.emp_email}'">수정</button> --%>
                           <!-- 만약, pageNum 파라미터가 비어있을 경우 pageNum 변수 선언 및 기본값 1로 설정 -->
							<c:choose>
							<c:when test="${release.out_complete eq '0' }">
<%-- 	                            <td><label class="badge badge-danger" id ="changeBtn${status.index }">취소</label></td> --%>
								 <td>
                        			 <button type="button" class="badge badge-danger" id="complete" onclick="complete('${release.out_schedule_cd}', '${release.out_complete}')">취소</button>
                        		 </td>
								
							</c:when>
							<c:otherwise>
								<td>
                            		<button type="button" class="badge badge-success" id="complete" onclick="complete('${release.out_schedule_cd}', '${release.out_complete}')">종결</button>
								</td>
<%-- 								<td><label class="badge badge-info" id ="changeBtn${status.index }"">종결</label></td> --%>
							</c:otherwise>
							</c:choose>
	                            <td><a href="javascript:processPop('${release.out_schedule_cd}');">조회</a></td>
                          </tr>
                        </c:forEach>
                         
                        </tbody>
                        <div class="page-header">
		                    <nav aria-label="breadcrumb">
		                      <ol class="breadcrumb">
		                        <li class="breadcrumb-item"><a href="OutScheduleList.out">전체</a></li>
		                        <li class="breadcrumb-item" name = "ingRelease" id="ingRelease"><a href="OutScheduleListIng.out?out_complete=0" >진행중</a></li>
		                        <li class="breadcrumb-item" name = "endRelease" id="endRelease"><a href="OutScheduleListIng.out?out_complete=1">완료</a></li>
		                      </ol>
		                    </nav>
             		     </div>
                      </table>
                    </div>
                    
			        <div class="template-demo" style="text-align: right;">
<!-- 	           			<button type="button" name="outRegistBtn"class="btn btn-primary btn-rounded btn-fw" onclick="openPopup()">출고 등록</button> -->
	           			<button type="button" name="outRegistBtn"class="btn btn-primary btn-rounded btn-fw" onclick="location.href='OutRegist.out'">출고 등록</button>
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
								<input type="button" class="btn btn-sm btn-outline-primary" value="이전" onclick="location.href='List.hr?pageNum=${pageNum - 1}'">
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
									<a href="List.hr?pageNum=${i }">${i }</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
				
						<c:choose>
							<c:when test="${pageNum < pageInfo.maxPage}">
								<input type="button" class="btn btn-sm btn-outline-primary" value="다음" onclick="location.href='List.hr?pageNum=${pageNum + 1}'">
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