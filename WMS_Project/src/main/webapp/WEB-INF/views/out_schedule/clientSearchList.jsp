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
 	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery-3.6.3.js"></script>
  	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		function setParentText(cust_name, business_no){
// 			let business_val = opener.$("#business_no").val();
// 			let business_val = document.getElementById("business_no").value; 
// 			window.opener.document.getElementById("business_no").value = business_val;
			opener.set_cl(cust_name, business_no);
			
			window.close();
// 			$("#business_no").val(business_val);
// 			opener.document.getElementById("pInput").value = document.getElementById("cInput").value
	    }
	
	</script>
  </head>
  <body>
  
    <div class="container-scroller">
      
      <div class="container-fluid page-body-wrapper">
        <!-- ?????? ????????? ?????? -->
        <jsp:include page="../partials/settings-panel.jsp"></jsp:include>
        <!-- ?????? ????????? ?????? -->
        
        <!-- ?????? ?????? -->
        <div class="main-panel">
<!-- 			<h1>?????? ??????</h1> -->
			
		<!-- table ?????? -->
       <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">????????? ??????</h4>
<!-- 						<section id="buttonArea"> -->
					<p class="card-description">client list</p>
					 <form action="ClientSearchList.cl" >
						<!-- ?????? ?????? ?????? -->
						<div class="form-group">
                      	<div class="input-group">
                        <div class="input-group-prepend">
                          <select name="searchType" id="searchType" class="btn btn-sm btn-outline-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<option value="business_no" <c:if test="${param.searchType eq 'business_no'}">selected</c:if>>????????? ??????</option>
							<option value="cust_name" <c:if test="${param.searchType eq 'cust_name'}">selected</c:if>>????????????</option>
							<option value="uptae_jongmok" <c:if test="${param.searchType eq 'uptae_jongmok'}">selected</c:if>>??????&??????</option>
                          </select>
                        </div>
<%-- 							<input type="text" id="business_no" class="form-control" name="business_no" value="${param.keyword }"> --%>
							<input type="text" id="business_no" class="form-control" name="business_no" >
<!-- 							<input type="button" value="?????????" class="form-control" onclick="window.close()"> -->
<!-- 							<input type="button" value="?????????" class="form-control" onclick="window.close()"> -->
							<input type="submit" class="btn btn-sm btn-outline-primary" value="??????"> &nbsp;&nbsp; 
                        </div>
                   		</div>
					</form>
<!-- 						</section> -->
                    <div class="table-responsive">
                      <table class="table table-striped">
                        <thead>
                          <tr>
                            <th>???????????????</th>
                            <th>????????????</th>
                            <th>????????????</th>
                            <th>??????</th>
                            <th>??????</th>
                          </tr>
                        </thead>
                        <tbody>
                        <!-- JSTL ??? EL ???????????? ????????? ?????? ?????? ?????? -->
						<c:forEach var="client" items="${clientList }">
							<tr>
								<!-- ??????, pageNum ??????????????? ???????????? ?????? pageNum ?????? ?????? ??? ????????? 1??? ?????? -->
								<c:choose>
									<c:when test="${empty param.pageNum }">
										<c:set var="pageNum" value="1" />
									</c:when>
									<c:otherwise>
										<c:set var="pageNum" value="${param.pageNum }" />
									</c:otherwise>
								</c:choose>
								<td id="business_no">
									<a href="javascript:setParentText('${client.cust_name }', '${client.business_no }')">
										${client.business_no }
									</a>
								</td>
								<td id="cust_name">
								<a href="javascript:setParentText('${client.cust_name }', '${client.business_no }')">${client.cust_name }</a>
								</td>
								
<%-- 									<a href="ClientDetail.cl?cust_name=${client.cust_name }&pageNum=${pageNum }"> --%>
<%-- 									<a href="ClientDetail.cl?business_no=${client.business_no }&pageNum=${pageNum }&cust_name=${client.cust_name }"> --%>
<%-- 										${client.cust_name } --%>
<!-- 									</a> -->
								<td>${client.boss_name }</td>
								<td>${client.uptae }</td>
								<td>${client.jongmok }</td>
							</tr>
						</c:forEach>
                        </tbody>
                      </table>
                    </div>
			        <div class="template-demo" style="text-align: center;">
<!-- 	           			<button type="button" class="btn btn-primary btn-rounded btn-fw" onclick="location.href='Detail.hr'">?????? ??????????????????</button> -->
<!-- 	           			<button type="button" class="btn btn-primary btn-rounded btn-fw" onclick="location.href='Regist.hr'">???????????? ??????</button> -->
        <!-- table ?????? -->
		<section id="pageList">
		<!-- 
		?????? ????????? ??????(pageNum)??? 1?????? ??? ???????????? [??????] ?????? ??????
		=> ?????? ??? BoardList.bo ????????? ?????? ??????????????? 
		   ?????? ????????? ??????(pageNum) - 1 ?????? page ??????????????? ??????
		-->
		<c:choose>
			<c:when test="${pageNum > 1}">
				<input type="button"  class="btn btn-light" value="??????" onclick="location.href='ClientSearchList.cl?pageNum=${pageNum - 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" class="btn btn-light" value="??????">
			</c:otherwise>
		</c:choose>
			
		<!-- ????????? ?????? ????????? ?????? ?????????(startPage)?????? ??? ?????????(endPage) ?????? ?????? -->
		
		
		<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
			<!-- ???, ?????? ????????? ????????? ?????? ?????? ?????? -->
			<c:choose>
				<c:when test="${pageNum eq i}">
					${i }
				</c:when>
				<c:otherwise>
					<a href="ClientSearchList.cl?pageNum=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<!-- ?????? ????????? ??????(pageNum)??? ??? ????????? ????????? ?????? ?????? [??????] ?????? ?????? -->
		<c:choose>
			<c:when test="${pageNum < pageInfo.maxPage}">
				<input type="button" class="btn btn-light" value="??????" onclick="location.href='ClientSearchList.cl?pageNum=${pageNum + 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" class="btn btn-light" value="??????">
			</c:otherwise>
		</c:choose>
		
	</section>	
	 </div>
            </div>
               		</div>
             
		<footer class="footer">
          	<jsp:include page="../partials/footer.jsp"></jsp:include>
          </footer>
        </div>
        <!-- ?????? ?????? --> 
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <!-- End custom js for this page -->
  </body>
</html>