<%@ page language="java" contentType="text/html; charset=UTF-8"
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
    
    <script src="${pageContext.request.contextPath }/resources/assets/js/jquery-3.6.3.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
	// 업태 종목버튼 클릭시 추가창
	$(document).ready(function() {
		
		$("#uptaeButton").click(function() {
	          $("#uptae").append("<input type='text' name ='uptae' class='form-control' required='required'/>"); // 태그 추가
		});
		
		$("#jongmokButton").click(function() {
	          $("#jongmok").append("<input type='text' name ='jongmok' class='form-control' required='required' />"); // 태그 추가
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
<!-- 			<h1>사원 등록</h1> -->
		
		<!-- 사원 등록 table -->	
        <div class="col-12 grid-margin">
          <div class="card">
            <div class="card-body">
              <h4 class="card-title">거래처 상세정보</h4>
              <form action="ClientModify.cl" class="form-sample" method="post">
              <input type="hidden" name = "pageNum" value="${param.pageNum }">
                <p class="card-description">${client.cust_name } Information<br></p>
                <div class="col-md-7">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">거래처 구분</label>
<!--                       <div class="col-sm-4"> -->
                        <div class="form-check">
                          <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="g_gubun" id="g_gubun" value="01" <c:if test="${client.g_gubun eq '01' }">checked</c:if> /> 사업자(국내) </label>
                        </div>
<!--                       </div> -->
<!--                       <div class="col-sm-5"> -->
                        &nbsp;&nbsp;<div class="form-check">
                          <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="g_gubun" id="membershipRadios2" value="02" <c:if test="${client.g_gubun eq '02' }">checked</c:if> /> 사업자(해외) </label>
                        </div>
<!--                       </div> -->
<!--                       <div class="col-sm-5"> -->
                        &nbsp;&nbsp;<div class="form-check">
                          <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="g_gubun" id="membershipRadios3" value="03" <c:if test="${client.g_gubun eq '03' }">checked</c:if> /> 비사업자(국내) </label>
<!--                         </div> -->
                      </div>
<!--                       <div class="col-sm-5"> -->
                        &nbsp;&nbsp;<div class="form-check">
                          <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="g_gubun" id="membershipRadios4" value="04" <c:if test="${client.g_gubun eq '04' }">checked</c:if>/> 비사업자(해외) </label>
                        </div>
<!--                       </div> -->
                  </div>
                  </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">거래처명 <br> (필수)</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" name = "cust_name" value="${client.cust_name }" />
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">거래처 코드 <br> (필수)</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" name = "business_no" value="${client.business_no }"/>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">대표자명 <br> (필수)</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" name = "boss_name" value="${client.boss_name }"/>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">대표전화번호 <br> (필수)</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" name = "tel" value="${client.tel }"/>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">이메일</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" name = "email" value="${client.email }"/>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">모바일</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" name = "mobile_no" value="${client.mobile_no }"/>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">업태 <br> (필수)</label>
                      <div class="col-sm-9" id="uptae">
                        <input type="text" class="form-control" name="uptae" id="uptae" value="${client.uptae }"/>
                     	<button class="btn btn-light" id = "uptaeButton" type="button">업태 추가</button>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">종목 <br> (필수)</label>
                      <div class="col-sm-9" id="jongmok">
                        <input type="text" class="form-control" name="jongmok" id="jongmok" value="${client.jongmok }"/>
                        <button class="btn btn-light" id = "jongmokButton" type="button">종목 추가</button>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">Fax</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" name = "fax" value="${client.fax }"/>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">홈페이지</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" name = "url_path" value="${client.url_path }"/>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">우편번호</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" name = "post_no" id ="postcode" value="${client.post_no }"/>
						<input type="button" class="btn btn-primary btn-rounded btn-fw" value="우편번호 찾기" onclick="postSearch()" />
                      </div>
                    </div>
                  </div>
                 </div>
                 <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">주소</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control"  name = "addr" id ="address" value="${client.addr }"/>
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
                      <div class="col-sm-9">
                        <input type="text" class="form-control" name = "man_name" value="${client.man_name }"/>
                      </div>
                    </div>
                  </div>
<!--                   <div class="col-md-6"> -->
<!--                     <div class="form-group row"> -->
<!--                       <label class="col-sm-3 col-form-label">담당자 전</label> -->
<!--                       <div class="col-sm-9"> -->
<!--                         <input type="text" class="form-control" /> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                   </div> -->
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">담당자 전화번호</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" name = "man_tel" value="${client.man_tel }"/>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">담당자 E-Mail</label>
                      <div class="col-sm-9">
                        <input type="text" class="form-control" name = "man_email" value="${client.man_email }"/>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">적요(비고)</label>
                      <div class="col-sm-9">
                        <textarea rows="15" cols="27" name ="remarks" class="form-control" value="${client.remarks }"></textarea>
<%--                         <input type="text" class="form-control" name = "remarks" value="${client.remarks }"/> --%>
                      </div>
                    </div>
                  </div>
                  </div>
                  <div class="template-demo" style="text-align: right;">
<!--                   <button type="submit" class="btn btn-primary mr-2"> 거래처 수정</button> -->
<!--                   <input type="button" class="btn btn-primary btn-rounded btn-fw" value="거래처 삭제" onclick="location.href='ClientDelete.cl'" /> -->
                  <input type="submit" class="btn btn-primary mr-2" value="거래처 수정" />
<!--                   <input type="submit" class="btn btn-primary mr-2" value="거래처 수정" onclick="location.href='ClientModify.cl'" /> -->
                  <input type="button" class="btn btn-primary mr-2" value="거래처 삭제" data-toggle="modal" data-target="#deleteModal">
				<!-- Modal -->
				<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="deleteModalLabel">거래처 삭제</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        <h6>정말 삭제하시겠습니까?</h6>
				      </div>
				      <div class="modal-footer">
				      	<button type="button" class="btn btn-primary mr-2" onclick="location.href='ClientDelete.cl?business_no=${client.business_no }&pageNum=${pageNum }&cust_name=${client.cust_name }'">삭제하기</button>
				       	<button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
				      </div>
				    </div>
				  </div>
				</div>
				
                  </div>
              </form>
                 </div>
                </div>
               </div>
<!--              </div> -->
<!--             </div> -->
<!--           </div> -->
        
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