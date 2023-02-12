<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
 <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>WMS Login</title>
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
	<!-- 로그인 화면 전용 css 연결 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/login.css" />
    <!-- End layout styles -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/images/favicon.png" />
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.3.js"></script>
    <script type="text/javascript">
    	$(function() {
			$(submit).click(function() {
// 				var remember_me = $('.form-check-input').is(':checked');
			});
		});
    
    </script>
    <style type="text/css">
    .selfCard {
  position: relative;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -ms-flex-direction: column;
  flex-direction: column;
  min-width: 0;
  word-wrap: break-word;
  background-color: #fff;
  background-clip: border-box;
  border: 1px solid rgba(0, 0, 0, 0.125);
  border-radius: 3px; 
  padding: 1.25rem; 
  }
  
  .wrapper {
  background: #f8f9fb;
  padding-left: 25px;
  padding-right: 25px;
  padding-top: 25px;
  padding-bottom: 0;
  width: 100%;
  -webkit-box-flex: 1;
  -ms-flex-positive: 1;
  flex-grow: 1; }
  
/*   .scard-body { */
/*   -webkit-box-flex: 1; */
/*   -ms-flex: 1 1 auto; */
/*   flex: 1 1 auto; */
/*   min-height: 1px; */
/*   } */
    </style>
  </head>
<body>
	   
        
        <!-- 본문 영역 -->
        <!-- 쿠키값이 비어있지 않을 때 remember me에 checked 속성을 줌 -->
        <c:if test="${not empty cookie.remembered_email}">
			<c:set value="checked" var="checked"/>
		</c:if>
		
<!-- 		login 글자부분 -->
        <div class="main-panel" style="
/*          border: 1px solid black;   */
        padding-top: 0; padding-bottom: 0;
      
        
        " >
          
          <div class="wrapper" style="
/*          border: 1px solid blue;   */
          margin-top: 0; 
          padding-left: 20%;
          padding-right: 20%;
          
          
          ">
           
<!--             <div class="page-header"> -->
<!--               <h3 class="page-title">Login</h3> -->
<!--             </div> -->

           <div style="
/*            border: 1px solid green;  */
           height: 30%; text-align: center; margin-bottom: 0; position: relative;"> <!-- 그림영역 -->
	           <img class="sidebar-brand-logo" src="${pageContext.request.contextPath }/resources/assets/images/wms_logo.png" 
	           style="width: 350px; 
	           height: 64px; 
	           position: absolute; 
	           top: 70%; right: 20%; left: 30%;
	           "/>
           </div>
           
            
<!--             <div class="row" style="border: 1px solid red;"> -->
<!--               <div class="col-md-6 grid-margin stretch-card" style="border: 1px dashed black;"> -->
                <div class="selfCard" style="
/*              border: 1px solid red;  */
                margin-bottom: 0; margin-top: 1%;
                padding-left: 5%;
                padding-right: 5%;
                
                ">
<!--                   <div class="scard-body" style="border: 1px dashed red; "> -->
                    <h4 class="card-title">로그인</h4>
                    
                    <form class="forms-sample" action="LoginPro.em" style="
/*                     border: 1px dashed black;   */
                    padding: 1.25rem; text-align: center;">
                      <div class="form-group" style="
/*                       border: 1px dashed blue;  */
                      display: inline-block; width: 45%; text-align: left;">
		                  <br>
                        <label for="exampleInputUsername1">Email</label> <!-- text align left -->
                        <input type="text" class="form-control" id="exampleInputUsername1" name="emp_email" value="${cookie.remembered_email.value }" placeholder="이메일을 입력해주세요." />
                      </div>
                      
                      <div class="form-group" style="
/*                       border: 1px dashed blue;  */
                      display: inline-block; width: 45%; text-align: left;">
                        <label for="exampleInputPassword1">Password</label><!-- text align left -->
                        <input type="password" class="form-control" id="exampleInputPassword1" name="emp_passwd" placeholder="패스워드를 입력해주세요" />
                      </div>
                      
                      <div class="form-check form-check-flat form-check-primary" style="text-align: left;">
                        <label class="form-check-label">
                          <input type="checkbox" class="form-check-input" name="rememberEmail" ${checked} value="true"/> Remember me </label>
                      </div>
                      <button type="submit" class="btn btn-primary mr-2"> Submit </button>
                      <button type="reset" class="btn btn-light">Cancel</button>
                    </form>
                  
<!--                   </div> -->
                </div>
<!--               </div> -->
              
<!--             </div> -->
          </div>
          <!-- content-wrapper ends -->
          <!-- partial:../../partials/_footer.html -->
           <!-- 하단 footer -->
          <footer class="footer">
          <jsp:include page="partials/footer.jsp"></jsp:include>
          </footer>
          <!-- 하단 footer -->
          <!-- partial -->
        </div><!-- main-panel ends -->
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