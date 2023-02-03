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
  
 	<script src="${pageContext.request.contextPath }/resources/assets/js/jquery-3.6.3.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
	$(function() {
		// 거래처 코드 중복확인
	   $("#business_no").on("change", function() {
	      
	      var business_no = $("#business_no").val();
	      var cust_name = $("#cust_name").val();
	      
	         $.ajax({
	        	type:"GET",
	            url:"CheckBusinessNo.cl?business_no=" + business_no + "&cust_name=" + cust_name,
		          success: function(result){
	                if(result == "true"){
// 		            	alert("사용가넝");
	                } else {
		            	alert("이미 존재합니다");
	               }
	              }
	         }); // ajax
	 	  });
	   });
	
	// placeholder값 변경
	$(document).ready(function() {
		$("input:radio[name=g_gubun]").change(function(){
			var test = $('input:radio[name=g_gubun]:checked').val();
			if(test == '01') {
				var holder = $('#business_no').attr("placeholder" ,"사업자번호 - 제외하고 작성해주세요");
			} else if(test == '02'){
				var holder = $('#business_no').attr("placeholder", "해외사업자번호 - 제외하고 작성해주세요");
			} else if(test == '03'){
				var holder = $('#business_no').attr("placeholder", "주민등록번호 - 제외하고 작성해주세요");
			} else {
				$('#business_no').attr("placeholder", "외국인등록번호 - 제외하고 작성해주세요");
			}
		});
		
		$("#uptaeButton").click(function() {
	          $("#uptae").append("<input type='text' name ='uptae' class='form-control''/>"); // 태그 추가
		});
		
		$("#jongmokButton").click(function() {
	          $("#jongmok").append("<input type='text' name ='jongmok' class='form-control' />"); // 태그 추가
		});
	});	
	
		function postSearch() {
			
		// 	주소 api
		    new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
		        	var addr = ''; // 주소 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("detailAddress").focus();
	            }
		    }).open();
		}
		function checkForm() {
			var Bnlength = fr.business_no.value.length;
			var radioCheck = $('input:radio[name=g_gubun]:checked').val();
			if((radioCheck == '02' || radioCheck == '01') && Bnlength != 10){
				alert("사업자 번호 10자리를 '-'없이 정확히 입력해주세요")
				fr.business_no.focus();
				event.preventDefault();
				return;
			} if((radioCheck == '03' || radioCheck == '04') && Bnlength != 13){
				alert("주민등록 번호 13자리를 '-'없이 정확히 입력해주세요")
				fr.business_no.focus();
				event.preventDefault();
				return;
			} else if(fr.cust_name.value == ''){
				fr.cust_name.focus();
				event.preventDefault();
				return;
			} else if(fr.boss_name.value == ''){
				fr.boss_name.focus();
				event.preventDefault();
				return;
			} else if(fr.tel.value == ''){
				fr.tel.focus();
				event.preventDefault();
				return;
			} else if(fr.uptae.value == ''){
				fr.uptae.focus();
				event.preventDefault();
				return;
			} else if(fr.jongmok.value == ''){
				fr.jongmok.focus();
				event.preventDefault();
				return;
			} else if(fr.address.value == ''){
				fr.address.focus();
				event.preventDefault();
				return;
			} else {
				return false;
			}
			
		}	
	</script>
  </head>
  <body>
  
    <div class="container-scroller">
      <!-- 사이드바 -->
      <jsp:include page="../partials/sidebar_client.jsp"></jsp:include>
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
		
        <div class="col-11 grid-margin">
          <div class="card">
            <div class="card-body">
              <h4 class="card-title">거래처 등록</h4>
              <form action="ClientRegistPro.cl" class="form-sample" name = "fr" onsubmit="checkForm()">
                <p class="card-description">client regist</p>
                  <div class="col-md-7">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">거래처 구분</label>
<!--                       <div class="col-sm-4"> -->
                        <div class="form-check">
                          <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="g_gubun" id="g_gubun" value="01" checked /> 사업자(국내) </label>
                        </div>
<!--                       </div> -->
<!--                       <div class="col-sm-5"> -->
                        &nbsp;&nbsp;<div class="form-check">
                          <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="g_gubun" id="membershipRadios2" value="02" /> 사업자(해외) </label>
                        </div>
<!--                       </div> -->
<!--                       <div class="col-sm-5"> -->
                        &nbsp;&nbsp;<div class="form-check">
                          <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="g_gubun" id="membershipRadios3" value="03" /> 비사업자(국내) </label>
<!--                         </div> -->
                      </div>
<!--                       <div class="col-sm-5"> -->
                        &nbsp;&nbsp;<div class="form-check">
                          <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="g_gubun" id="membershipRadios4" value="04" /> 비사업자(해외) </label>
                        </div>
<!--                       </div> -->
                  </div>
                  </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">거래처명 <br> (필수)</label>
                      <div class="col-sm-9">
                        <input type="text" name = "cust_name" id="cust_name" class="form-control" />
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">거래처 코드 <br> (필수)</label>
                      <span id="checkBusinessNo"></span><br>
                      <div class="col-sm-9">
                        <input type="text" name = "business_no" id="business_no" class="form-control" placeholder="사업자번호 10자리 - 제외하고 작성해주세요" required="required"/>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">대표자명 <br> (필수)</label>
                      <div class="col-sm-9">
                        <input type="text" name="boss_name" id="boss_name" class="form-control" />
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">대표전화번호 <br> (필수)</label>
                      <div class="col-sm-9">
                        <input type="text" name = "tel" id = "tel" class="form-control"/>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">이메일</label>
                      <div class="col-sm-9">
                        <input type="text" name="email" class="form-control" />
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">모바일</label>
                      <div class="col-sm-9">
                        <input type="text" name="mobile_no" class="form-control" />
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">업태 <br> (필수)</label>
                      <div class="col-sm-9" id ="uptae">
	                      <input type="text" name ="uptae" id="uptae" class="form-control" />
	                      <button class="btn btn-light" id = "uptaeButton" type="button">업태 추가</button>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">종목 <br> (필수)</label>
                      <div class="col-sm-9" id = "jongmok">
                        <input type="text" name="jongmok" id="jongmok" class="form-control" />
	                    <button class="btn btn-light" id = "jongmokButton" type="button">종목 추가</button>
                      </div>
                    </div>
                  </div>
                </div>
<!--                 <div class="row"> -->
<!--                   <div class="col-md-6"> -->
<!--                     <div class="form-group row"> -->
<!--                       <label class="col-sm-3 col-form-label">Category</label> -->
<!--                       <div class="col-sm-9"> -->
<!--                         <select class="form-control"> -->
<!--                           <option>Category1</option> -->
<!--                           <option>Category2</option> -->
<!--                           <option>Category3</option> -->
<!--                           <option>Category4</option> -->
<!--                         </select> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                 </div> -->
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">Fax</label>
                      <div class="col-sm-9">
                        <input type="text" name="fax" class="form-control" />
                      </div>
                    </div>
                  </div>
                  	<div class="col-md-6">
	                    <div class="form-group row">
	                      <label class="col-sm-3 col-form-label">홈페이지</label>
	                      <div class="col-sm-9">
	                        <input type="text" name="url_path" class="form-control" />
	                      </div>
	                    </div>
                  	</div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">우편번호</label>
                      <div class="col-sm-9">
                        <input type="text" name = "post_no" class="form-control" id="postcode" />
            			<input type="button" class="btn btn-primary btn-rounded btn-fw" value="우편번호 찾기" onclick="postSearch()" />
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">주소 <br> (필수)</label>
                      <div class="col-sm-9">
                        <input type="text" name="addr" class="form-control" id="address" >
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">상세주소</label>
                      <div class="col-sm-9">
                        <input type="text" name="addr" class="form-control" id="detailAddress"/>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">담당자</label>
                      <!-- 재직 코드 컬럼에서 연결, 목록에서 재직(1), 휴직(2), 퇴사(3) 선택 -->
                      <div class="col-sm-9">
                      	<input type="text" name="man_name" class="form-control" />
<!--                         <select class="form-control"> -->
<!--                           <option>재직</option> -->
<!--                           <option>휴직</option> -->
<!--                           <option>퇴사</option> -->
<!--                         </select> -->
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">담당자 전화번호</label>
                      <div class="col-sm-9">
                        <input type="text" name="man_tel" class="form-control" />
                      </div>
                    </div>
                  </div>
                  </div>
                   <div class="row">
                   <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">담당자 E-Mail</label>
                      <div class="col-sm-9">
                        <input type="text" name="man_email" class="form-control" />
                      </div>
                    </div>
                  </div>
                  </div>
                  <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">적요(비고)</label>
                      <div class="col-sm-9">
                      	<textarea rows="15" cols="27" name ="remarks" class="form-control"></textarea>
<!--                         <input type="text" name ="remarks" class="form-control" /> -->
                      </div>
                    </div>
                  </div>
                  </div>
                  <div class="template-demo" style="text-align: right;">
                  <button type="submit" class="btn btn-primary mr-2" id="btn">등록</button>
                  <button class="btn btn-light">취소</button>
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