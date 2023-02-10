<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(function() {
	//창고코드 유효성 검사
    $("#wh_cd").on("change", function() {
      
	      var code = $("#wh_cd").val();
	      var regex = /^[0-9]{10}$/;
	      var result2 = regex.exec(code);
	      
	      if(!result2) {
	         $("#checkCodeResult").html("코드 자리수를 확인하여주시기 바랍니다(10자)").css("color", "red");
	      } else { // 정규표현식 성립 한다면 디비 조회
	         $.ajax({
	            url:"CheckCode.wh",
	            data: {
	            	code
	            },
	            success: function(result){
	                  if(result == "true"){
	                      $("#checkCodeResult").html("이미 존재하는 코드").css("color","red");
	                  } else {
	                 	 $("#checkCodeResult").html("사용 가능한 코드").css("color", "blue");
	                 }
	                }
	         }); // ajax
	      } // if
	  });
	
	// 외부 선택시 주소창 표출
	$(document).ready(function() {
	  $('#selectBox').change(function() {
	    var result = $('#selectBox option:selected').val();
	    if (result == '1') {
	      $('.addr').show();
	    } else {
	      $('.addr').hide();
	    }
	  }); 
	}); 
});

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
//                 if(extraAddr !== ''){
//                     extraAddr = ' (' + extraAddr + ')';
//                 }
                // 조합된 참고항목을 해당 필드에 넣는다.
//                 document.getElementById("sample6_extraAddress").value = extraAddr;

            }
            
//             else {
//                 document.getElementById("sample6_extraAddress").value = '';
//             }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
//             document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            
            // 커서를 상세주소 필드로 이동한다.
//             document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}

//창고코드번호 최대길이 제한
function maxLengthCheck(object){
    if (object.value.length > object.maxLength){
      object.value = object.value.slice(0, object.maxLength);
    }    
}

// 창고코드 10자 이하일 시 return
function subCheck() {
	var wh_cd = modifyForm.wh_cd.value.length;
	if(wh_cd != 10){
		alert("창고코드번호를 다시 확인하여주시기 바랍니다.(최소 10자)")
		event.preventDefault();
		return;
	} else {
		return true;
	}
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
<!-- 			<h1>사원 등록</h1> -->
		
		<!-- 사원 등록 table -->	
        <div class="col-12 grid-margin">
          <div class="card">
            <div class="card-body">
              <h4 class="card-title">창고 수정</h4>
         	  <form action="WhUpdatePro.wh" method="post" class="form-sample" name="modifyForm" id="modifyForm" onsubmit="return subCheck()">
                <p class="card-description">${wh.wh_name } warehouse Modify<br></p>
                
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">창고 코드</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" value="${wh.wh_cd }" name="wh_cd" id="wh_cd" maxlength="10"/>
                        <span id="checkCodeResult" style="font-size: 0.4em;"></span>
                      </div>
                    </div>
                  </div>
                  
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">창고명</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" value="${wh.wh_name }" name="wh_name" id="wh_name"/>
                      </div>
                    </div>
                  </div>
                
                   <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">구분</label>
                      <div class="col-sm-9">
                        <select class="form-control" name="wh_gubun" id="wh_gubun">
                          <option value="1">창고</option>
                          <option value="2">공장</option>
                        </select>
                      </div>
                    </div>
                  </div>
                  
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">위치</label>
                      <div class="col-sm-9">
                      	<select id="selectBox" name="wh_location" id="wh_location" class="form-control">
						  <option value="1" selected="selected">외부</option>
						  <option value="2">내부</option>
						</select>
                      </div>
                    </div>
                  </div>
                
                <div class="addr">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">주소</label>
                      <div class="col-sm-9">
                      	<input type="text" name="wh_addr" class="form-control" id="sample6_address" value="${wh.wh_addr }" readonly="readonly"><br>
 						<input type="button" class="file-upload-browse btn btn-primary" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
                      </div>
                    </div>
                  </div>
                </div>
                
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">전화번호</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" value="${wh.wh_tel }" name="wh_tel" id="wh_tel"/>
                      </div>
                    </div>
                  </div>
                
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">관리자명</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" value="${wh.wh_man_name }" name="wh_man_name" id="wh_man_name"/>
                      </div>
                    </div>
                  </div>
                  
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">사용여부</label>
                      <div class="col-sm-9">
                        <select class="form-control" name="wh_use" id="wh_use">
                          <option value="1">사용</option>
                          <option value="2">미사용</option>
                        </select>
                      </div>
                    </div>
                  </div>
                
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">적요</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" value="${wh.remarks }" name="remarks" id="remarks"/>
                      </div>
                    </div>
                  
                  <div class="template-demo" style="text-align: right;">
	                  <input type="submit" class="btn btn-primary mr-2" value="수정하기"/>
	                  <button class="btn btn-light" onclick="history.back()">취소</button>
                  </div>
                  </div>
                  </form>
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