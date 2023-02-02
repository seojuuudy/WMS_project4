<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="kr">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <title>Warehouse List</title>
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
   // AJAX 를 활용한 게시물 목록 표시에 사용될 페이지 번호값 미리 저장
//    let pageNum = 1;
   
//    $(function() {
//       // 검색타입(searchType)과 검색어(keyword) 값 가져와서 변수에 저장
//       let searchType = $("#searchType").val();
//       let keyword = $("#keyword").val();
// //       alert(searchType + ", " + keyword);
      
//       // 게시물 목록 조회를 처음 수행하기 위해 load_list() 함수 호출
//       // => 검색타입과 검색어를 파라미터로 전달(검색하지 않을 경우에도 동일) 
// //       load_list(searchType, keyword);
      
//       // 무한스크롤 기능 구현
//       // window 객체에서 scroll 동작 시 기능 수행(이벤트 처리)을 위해 scroll() 함수 호출
//       $(window).scroll(function() {
// //          $("#listForm").before("확인");
//          // 1. window 객체와 document 객체를 활용하여 스크롤 관련 값 가져오기
//          // => 스크롤바 현재 위치, 문서 표시되는 창의 높이, 문서 전체 높이
//          let scrollTop = $(window).scrollTop();
//          let windowHeight = $(window).height();
//          let documentHeight = $(document).height();
         
// //          console.log("scrollTop : " + scrollTop + ", windowHeight : " + windowHeight + ", documentHeight : " + documentHeight + "<br>");

//          // 2. 스크롤바 위치값 + 창 높이 + x 가 문서 전체 높이 이상이면
//          //    다음 페이지 게시물 목록 로딩하여 추가
//          // => 이 때, x 값은 마지막으로부터 여유 공간으로 둘 스크롤바 아래쪽 남은 공간(픽셀값)
//          //    (x 값을 1로 지정 시 스크롤바가 바닥에 닿을 때 다음 페이지 로딩)
//          if(scrollTop + windowHeight + 1 >= documentHeight) {
//             // 다음 페이지 로딩하기 위한 load_list() 함수 호출
//             // => 이 때, 페이지 번호를 1 증가시켜 다음 페이지 목록 로딩
//             pageNum++;
// //             load_list(searchType, keyword);
//          }
//       });
//    });
   
   // 게시물 목록 조회를 AJAX + JSON 으로 처리할 load_list() 함수 정의
   // => 검색타입과 검색어를 파라미터로 지정
//    function load_list(searchType, keyword) {
//       $.ajax({
//          type: "GET",
// //          url: "BoardListJson.bo?pageNum=" + pageNum,
//          url: "WhListJson.wh?pageNum=" + pageNum + "&searchType=" + searchType + "&keyword=" + keyword,
//          dataType: "json"
//       })
//       .done(function(boardList) { // 요청 성공 시
// //          $("#listForm > table").append(boardList);
         
//          // JSONArray 객체를 통해 배열 형태로 전달받은 JSON 데이터를
//          // 반복문을 통해 하나씩 접근하여 객체 꺼내기
//          for(let warehouse of whList) {
//             // 테이블에 표시할 JSON 데이터 출력문 생성
//             // => 출력할 데이터는 board.xxx 형식으로 접근
//             let result = "<tr height='100'>"
//                      + "<td>" + wh.wh_cd + "</td>"
//                      + "<td id='subject'>" 
//                         + "<a href='BoardDetail.bo?board_num=" + board.board_num + "'>"
//                         + board.board_subject + "</a></td>"
//                      + "<td>" + board.board_name + "</td>"
//                      + "<td>" + board.board_date + "</td>"
//                      + "<td>" + board.board_readcount + "</td>"
//                      + "</tr>";
            
//             // 지정된 위치(table 태그 내부)에 JSON 객체 출력문 추가
//             $("#listForm > table").append(result);
//          }
//       })
//       .fail(function() {
//          $("#listForm > table").append("<h3>요청 실패!</h3>");
//       });
   }
</script>
<body>
    <div class="container-scroller">
      <!-- 사이드바 -->
      <jsp:include page="../partials/sidebar_wh.jsp"></jsp:include>
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
                    <h4 class="card-title">창고 조회</h4>
						<section id="buttonArea">
							<form action="List.wh">
								<!-- 검색 타입 추가 -->
								<div class="form-group">
                      	<div class="input-group">
                        <div class="input-group-prepend">
                          <select name="searchType" id="searchType" class="btn btn-sm btn-outline-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<option value="wh_Cd" <c:if test="${param.searchType eq 'wh_cd'}">selected</c:if>>창고 코드</option>
							<option value="wh_name" <c:if test="${param.searchType eq 'wh_name'}">selected</c:if>>창고명</option>
							<option value="wh_man_name" <c:if test="${param.searchType eq 'wh_man_name'}">selected</c:if>>관리자명</option>
                          </select>
                        </div>
							<input type="text" class="form-control" name="keyword" value="${param.keyword }">
							<input type="submit" class="btn btn-light" value="검색"> &nbsp;&nbsp; 
                        </div>
                   		</div>
					</form>
<!-- 						</section> -->
                    <div class="table-responsive">
                      <table class="table table-striped">
                        <thead>
                          <tr>
                            <th>창고코드</th>
                            <th>창고명</th>
                            <th>구분</th>
                            <th>관리자명</th>
                            <th>사용여부</th>
                          </tr>
                        </thead>
                        <tbody>
	                        <!-- JSTL 과 EL 활용하여 글목록 표시 작업 반복 -->
							<!--=============== 사용여부가 '2'일 경우 뷰페이지에서 숨김처리=========== -->
							<c:forEach var="wh" items="${warehouseList}">
								<c:choose>
								<c:when test="${wh.wh_use eq '1' }">
								<tr>
									<c:choose>
										<c:when test="${empty param.pageNum }">
											<c:set var="pageNum" value="1" />
										</c:when>
										<c:otherwise>
											<c:set var="pageNum" value="${param.pageNum }" />
										</c:otherwise>
										</c:choose>
										<td id="wh_cd">
											<a href="WhDetail.wh?wh_cd=${wh.wh_cd }&pageNum=${pageNum }&wh_name=${wh.wh_name }">
												${wh.wh_cd }
											</a>
										</td>
										<td id="wh_name">
											<a href="WhDetail.wh?wh_cd=${wh.wh_cd }&pageNum=${pageNum }&wh_name=${wh.wh_name }">
												${wh.wh_name }
											</a>
										</td>
										<td id="wh_gubun">${wh.wh_gubun }</td>
										<td id="wh_man_name">${wh.wh_man_name }</td>
										<td id="wh_use">${wh.wh_use }</td>
								</tr>
							</c:when>
						</c:choose>
					</c:forEach>
                  </tbody>
                </table>
              </div>
        <div class="template-demo" style="text-align: right;">
        <!-- table 영역 -->
		<section id="pageList" style="font-size: 0.5em; text-align: center; padding-top: 10px;">
		<!-- 
		현재 페이지 번호(pageNum)가 1보다 클 경우에만 [이전] 링크 동작
		=> 클릭 시 BoardList.bo 서블릿 주소 요청하면서 
		   현재 페이지 번호(pageNum) - 1 값을 page 파라미터로 전달
		-->
		<c:choose>
			<c:when test="${pageNum > 1}">
				<input type="button"  class="btn btn-light" value="이전" onclick="location.href='List.wh?pageNum=${pageNum - 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" class="btn btn-light" value="이전">
			</c:otherwise>
		</c:choose>
			
		<!-- 페이지 번호 목록은 시작 페이지(startPage)부터 끝 페이지(endPage) 까지 표시 -->
		
		
		<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
<!-- 			<!-- 단, 현재 페이지 번호는 링크 없이 표시 -->
			<c:choose>
				<c:when test="${pageNum eq i}">
					${i }
				</c:when>
				<c:otherwise>
					<a href="List.wh?pageNum=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<!-- 현재 페이지 번호(pageNum)가 총 페이지 수보다 작을 때만 [다음] 링크 동작 -->
		<c:choose>
			<c:when test="${pageNum < pageInfo.maxPage}">
				<input type="button" class="btn btn-light" value="다음" onclick="location.href='List.wh?pageNum=${pageNum + 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" class="btn btn-light" value="다음">
			</c:otherwise>
		</c:choose>
		
	</section>	
	<input type="button" class="btn btn-primary btn-rounded btn-fw" value="신규 창고 등록" onclick="location.href='Regist.wh'" />
	 </div>
            </div>
               		</div>
             
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