<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <script src="${pageContext.request.contextPath}/resources/assets/js/jquery-3.6.3.js"></script>
    <script type="text/javascript">
    $(function() {
		$("#profileDropdown").on("click", function() {
// 	    	alert("확인");
			$.ajax({
				type: "GET", // AJAX 로 요청 시 HTTP 요청 방식(GET or POST) 지정
				url: "Employee_detail_mini.em", // AJAX 로 요청할 요청 주소(URL)
				data: { // 전송할 데이터(파라미터) 지정(일반 파라미터일 경우 중괄호로 묶음)
					// 폼 데이터를 가져와서 파라미터로 표현(전송)하는 경우
					// 파라미터명: 데이터 형식으로 지정
					sId: "${sessionScope.sId }" 
				},
				dataType: "json", // 응답 데이터에 대한 타입 지정(일반 데이터는 text 이며 HTML 코드도 포함 가능, 자바스크립트 포함되면 html 사용)
				success: function(employees) { // 요청에 대한 처리 성공 시(= 정답 응답) 처리할 함수 정의
					// 익명 함수 파라미터로 응답 데이터가 전달됨(처리 페이지의 응답 결과)
					// id 선택자 resultArea 영역에 응답 데이터(response) 출력하기
					let result = "사진: " + employees.photo + "<br>"
								+ "사원 이름: " + employees.emp_name + "<br>"
								+ "이메일: " + employees.emp_email + "<br>"
								+ "부서코드: " + employees.dept_cd + "<br>"
								+ "직급코드: " + employees.grade_cd + "<br>"
								+ "사무실 연락처: " + employees.emp_dtel + "<br>" 
								+ "권한: " + employees.priv_cd + "<br>";
					
					$("#employee_detail_mini").html(result);
				}, 
				error: function(xhr, textStatus, errorThrown) { 
					// 요청에 대한 처리 실패 시(= 에러 발생 시) 실행되는 이벤트
					$("#employee_detail_mini").html("xhr = " + xhr + "<br>textStatus = " + textStatus + "<br>errorThrown = " + errorThrown);
				}
			});
		});
	});
			function logout() {
				let isLogout = confirm("로그아웃 하시겠습니까?");
				
				if(isLogout) {
					location.href = "Logout.em";
				}
			}
    
    </script>

<nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
  <div class="navbar-menu-wrapper d-flex align-items-stretch">
    <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
      <span class="mdi mdi-chevron-double-left"></span>
    </button>
    <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
      <a class="navbar-brand brand-logo-mini" href="./"><img src="${pageContext.request.contextPath }/resources/assets/images/logo-mini.svg" alt="logo" /></a>
    </div>
    
    <!-- 메뉴바 -->
    <ul class="navbar-nav">
      <li class="nav-item dropdown">
        <a class="nav-link" id="messageDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
          <h5>인사관리</h5>
        </a>
        <div class="dropdown-menu dropdown-menu-left navbar-dropdown preview-list" aria-labelledby="messageDropdown">
          <h6 class="p-3 mb-0 font-weight-semibold">인사관리</h6>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item preview-item" href="Regist.hr">
            <div class="preview-thumbnail">
            </div>
            <div class="preview-item-content d-flex align-items-start flex-column justify-content-center">
              <h6 class="preview-subject ellipsis mb-1 font-weight-normal">사원등록</h6>
            </div>
          </a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item preview-item" href="List.hr">
            <div class="preview-thumbnail">
            </div>
            <div class="preview-item-content d-flex align-items-start flex-column justify-content-center">
              <h6 class="preview-subject ellipsis mb-1 font-weight-normal">사원조회</h6>
            </div>
          </a>
          <div class="dropdown-divider"></div>
        </div>
        </li>
       
       <li class="nav-item dropdown">
        <a class="nav-link" id="messageDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
          <h5>재고관리</h5>
        </a>
        <div class="dropdown-menu dropdown-menu-left navbar-dropdown preview-list" aria-labelledby="messageDropdown">
          <h6 class="p-3 mb-0 font-weight-semibold">재고관리</h6>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item preview-item" href="#">
            <div class="preview-thumbnail">
            </div>
            <div class="preview-item-content d-flex align-items-start flex-column justify-content-center">
              <h6 class="preview-subject ellipsis mb-1 font-weight-normal">기본등록</h6>
            </div>
          </a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item preview-item" href="Stock.st">
            <div class="preview-thumbnail">
            </div>
            <div class="preview-item-content d-flex align-items-start flex-column justify-content-center">
              <h6 class="preview-subject ellipsis mb-1 font-weight-normal">WMS</h6>
            </div>
          </a>
          <div class="dropdown-divider"></div>
        </div>
      </li>
    <!-- 메뉴바 -->
      
    </ul>
    <ul class="navbar-nav navbar-nav-right">
      <li class="nav-item nav-logout d-none d-md-block mr-3">
       <!-- 조건절 -->
       <c:choose>
		<%-- 로그인 상태가 아닐 경우 Login, Join 링크 표시 --%>
		<%-- EL 을 사용하여 세션 객체 접근 시 sessionScope.속성명 으로 접근 --%>
		<c:when test="${empty sessionScope.sId }">
			 <a class="nav-link" href="LoginForm.em">login</a>
		      </li>
		      <li class="nav-item nav-logout d-none d-md-block mr-3"> 
		        <a class="nav-link" href="#">join</a>
		      </li>
		</c:when>
		<%-- 로그인 상태일 경우 아이디 표시, Logout 링크 표시 --%>
		<c:otherwise>
	      <li class="nav-item nav-profile dropdown d-none d-md-block">
	        <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
	          <div class="nav-profile-text">${sessionScope.sId } 님 
	          </div>
	        </a>
	        <div class="dropdown-menu center navbar-dropdown" aria-labelledby="profileDropdown">
		        
		        <span id="employee_detail_mini" class="dropdown-item">
<%-- 		        	<a class="dropdown-item" href="Employee_detail_mini.em?idx=${param.idx }">내 정보 확인</a> --%>
		        </span>
		        
				<a class="dropdown-item" href="javascript:logout()">Logout</a>
	        
	        </div>
	        
	      </li>
		</c:otherwise>
	</c:choose>
       
      
      <li class="nav-item nav-logout d-none d-lg-block">
        <a class="nav-link" href="./">
          <i class="mdi mdi-home-circle"></i>
        </a>
      </li>
    </ul>
    <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
      <span class="mdi mdi-menu"></span>
    </button>
  </div>
</nav>