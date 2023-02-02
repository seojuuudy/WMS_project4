<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery-3.6.3.js"></script>
  	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		// 주소 Api
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
// 	                    if(extraAddr !== ''){
// 	                        extraAddr = ' (' + extraAddr + ')';
// 	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
// 	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	
	                }
	                
// 	                else {
// 	                    document.getElementById("sample6_extraAddress").value = '';
// 	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
		
// 		// 아이디 중복체크
// 		$(function() {
// 			$("#emp_email").on("change", function() {
				
// 				let email = $("#emp_email").val();
// 				alert(email);
// 				$.ajax({
// 					url: "checkEmail.hr?emp_email=" + email,
// 					type: "GET",
// 					success: function(result) {
// 							if(result == "1") {
// 								$("#resultArea").html("이미 존재하는 이메일입니다.").css("color", "red");
// 								alert("OK");
// 							} else {
// 								$("#resultArea").html("등록 가능한 이메일입니다.").css("color", "blue");
// 								alert("NO!");
// 							}
// 						}
// 				}); //
// 			});
// 		});

		// 아이디 중복체크
		$(function() {
			$("#emp_email2").on("change", function() {
				
				let email1 = $("#emp_email1").val();
				let email2 = $("#emp_email2").val();
// 				alert(email1 + "@" + email2);
				$.ajax({
					url: "checkEmail.hr?emp_email=" + email1 + "@" + email2,
					type: "GET",
					success: function(result) {
							if(result == "1") {
								$("#resultArea").html("이미 존재하는 이메일입니다.").css("color", "red");
							} else {
								$("#resultArea").html("등록 가능한 이메일입니다.").css("color", "blue");
							}
						}
				}); //
			});
		});
	</script>
  </head>
  <body>
    <div class="container-scroller">
      <!-- 사이드바 -->
      <jsp:include page="../partials/sidebar_hr.jsp"></jsp:include>
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
<!-- 			<h1>사원 등록</h1> -->
		
		<!-- 사원 등록 table -->	
        <div class="col-12 grid-margin">
          <div class="card">
            <div class="card-body">
              <h4 class="card-title">사원 등록</h4>
              <form action="RegistPro.hr" method="post" enctype="multipart/form-data" class="form-sample">
                <p class="card-description">employee regist</p>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                     <label class="col-sm-3 col-form-label">사원명</label>
                      <div class="col-sm-9">
                        <input type="text" name="emp_name" class="form-control" required="required"/>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">부서코드</label>
                      <div class="col-sm-9">
                        <select required="required" name="dept_cd" class="form-control">
                        	<option value="" disabled selected>부서선택</option>
                        	<option value="01">인사</option>
                        	<option value="02">회계</option>
                        	<option value="03">개발</option>
                        	<option value="04">기획</option>
                        	<option value="05">총무</option>
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">직급코드</label>
                      <div class="col-sm-9">
                        <select required="required" name="grade_cd" class="form-control">
                        	<option value="" disabled selected>직급선택</option>
                        	<option value="01">사원</option>
                        	<option value="02">대리</option>
                        	<option value="03">과장</option>
                        	<option value="04">부장</option>
                        	<option value="05">이사</option>
                        	<option value="05">대표</option>
                        </select>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">연락처<br>(개인)</label>
                      <div class="col-sm-9">
                        <input type="text" name="emp_tel" class="form-control" required="required" />
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">연락처<br>(사무실)</label>
                      <div class="col-sm-9">
                        <input type="text" name="emp_dtel" class="form-control" required="required" />
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">이메일</label>
                      <div class="col-sm-9">
                      	<span class="input-group-append">
<!-- 	                        <input type="text" name="emp_email" id="emp_email" class="form-control" /> -->
	                        <input type="text" name="emp_email1" id="emp_email1" class="form-control" />@
	                        	<select required="required" name="emp_email2" id="emp_email2" class="form-control">
		                          	<option value="wms4.com">wms4.com</option>
		                        	<option value="naver.com">naver.com</option>
		                        	<option value="gmail.com">gmail.com</option>
                        		</select>
                     	</span>
                        <span class="input-group-append_msg" id="resultArea"></span>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">우편번호</label>
                      <div class="col-sm-9">
                    	<span class="input-group-append">
                       		<input type="text" name="emp_post_no" class="form-control file-upload-info" id="sample6_postcode" placeholder="우편번호">
							<input type="button" class="file-upload-browse btn btn-primary" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                        </span>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- 주소, 상세주소를 따로 입력받기 위해 속성명을 emp_addr1, emp_addr2로 나눔-->    
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label" for="click_postCode">주소</label>
                      <div class="col-sm-9">
						<input type="text" name="emp_addr1" class="form-control" id="sample6_address" placeholder="주소" readonly="readonly"><br>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label" for="click_postCode">상세주소</label>
                      <div class="col-sm-9">
						<input type="text" name="emp_addr2" class="form-control" id="sample6_detailAddress" placeholder="상세주소">
<!--                       	<input type="text" class="form-control" name="emp_addr2" id="sample6_extraAddress" placeholder="참고항목"> -->
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">입사일</label>
                      <div class="col-sm-9">
                        <input type="date" name="hire_date" class="form-control"/>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">재직여부</label>
                      <!-- 재직 코드 컬럼에서 연결, 목록에서 재직(1), 휴직(2), 퇴사(3) 선택 -->
                      <div class="col-sm-9">
                        <select required="required" name="work_cd" class="form-control">
                          	<option value="" disabled selected>재직여부</option>
                        	<option value="01">재직</option>
                        	<option value="02">휴직</option>
                        	<option value="03">퇴사</option>
                        </select>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">권한</label>
                      	<div class="col-sm-9">
                      		<div class="form-control">
		                      	<label class="form-check-label"><input type="checkbox" value="16" name="priv_cd" id="priv_cd">기본등록</label>
		                      	<label class="form-check-label"><input type="checkbox" value="8" name="priv_cd" id="priv_cd">사원조회</label>
		                      	<label class="form-check-label"><input type="checkbox" value="4" name="priv_cd" id="priv_cd">사원관리</label>
		                      	<label class="form-check-label"><input type="checkbox" value="2" name="priv_cd" id="priv_cd">재고조회</label>
		                      	<label class="form-check-label"><input type="checkbox" value="1" name="priv_cd" id="priv_cd">재고관리</label>
                      		</div>
                     	</div>
                      </div>
                    </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                     <label for="photo" class="col-sm-3 col-form-label">사진 업로드</label>
                      <div class="col-sm-9">
                        <span class="input-group-append">
	                        <input type="file" name="file" id="file" class="form-control file-upload-info" placeholder="Upload Image" />
	                        <button onclick="jQuery('#file').click()" class="file-upload-browse btn btn-primary" type="button">Upload</button>
                        </span>
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
           </div>
          </div>
        
		<!-- 사원 등록 table -->	
			
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