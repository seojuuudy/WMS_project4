<%@ page language="Java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="kr">
  <head>
  <style type="text/css">
  	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	 	width: 20px;
	}
  </style>
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
$(document).ready(function() {
	$("#outBtn").click(function() {
		
// 		alert(this.$("#out_not_qty" + idx).text());
		var processArr = new Array();
		var processArr2 = new Array();
		var processArr3 = new Array();
		$(":checkbox").each(function(index, item) {
		if(item.checked){
			var not_qty = $(this).val().split("/")[2];
			var outqty = ($("#out_qty" + index).val());
// 			console.log("not_qty ????????? : " + not_qty );
// 			console.log("outqty ?????? : " + outqty );
// 			console.log(not_qty - outqty);
// 			console.log(not_qty > outqty);
			let result = not_qty - outqty;
			console.log(result);
			if(result < 0){
				alert("?????? ????????? ????????? ????????? ????????? ????????????");
				event.preventDefault();
				return false;
			} else {
				var list = new Array();
				list.out_schedule_cd = $("#out_schedule_cd" + index).text();
				list.product_cd = $(this).val().split("/")[1];
				list.outqty = outqty
// 					$("#product_cd" + index).text();
				console.log(list);
				processArr.push(list.out_schedule_cd);
				processArr2.push(list.product_cd);
				processArr3.push(list.outqty);
// 				alert("????????????");
				
			}
				let url = "OutProcess.out?out_schedule_cd=" + processArr + "&product_cd=" + processArr2 + "&outqty=" + processArr3;	
				let pop = window.open(url,'process','location=no,toolbar=no,width=700, height=700, left=0, top=0,resizable=yes,scrollbars=yes');
			console.log(processArr);
			console.log(processArr2);
		}
					
		});	
	});
});

   </script>
  </head>
  <body>
  
    <div class="container-scroller">
      <!-- ???????????? -->
      <jsp:include page="../partials/sidebar_WMS.jsp"></jsp:include>
      <!-- ???????????? -->
      
      <div class="container-fluid page-body-wrapper">
        <!-- ?????? ????????? ?????? -->
        <jsp:include page="../partials/settings-panel.jsp"></jsp:include>
        <!-- ?????? ????????? ?????? -->
        <!-- ?????? ????????? -->
      	<jsp:include page="../partials/navbar.jsp"></jsp:include>
        <!-- ?????? ?????????  -->
        
        <!-- ?????? ?????? -->
        <div class="main-panel">

		<!-- table ?????? -->
       <div class="col-lg-12 grid-margin stretch-card">
           <div class="card">
              	<div class="card-body">
                    <h4 class="card-title"><a href="OutScheduleList.out">?????? ?????? ??????</a></h4>
                    <p class="card-description">Out process list</p>
						<form action="OutScheduleProductList.out">
								<!-- ?????? ?????? ?????? -->
								<div class="form-group">
		                      		<div class="input-group">
		                        		<div class="input-group-prepend">
				                         	<select name="searchType" id="searchType" class="btn btn-sm btn-outline-primary dropdown-toggle"
				                         	 data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
												<option value="out_schedule_cd" <c:if test="${param.searchType eq 'out_schedule_cd'}">selected</c:if>>??????????????????</option>
												<option value="cust_name" <c:if test="${param.searchType eq 'cust_name'}">selected</c:if>>?????????</option>
												<option value="product_name" <c:if test="${param.searchType eq 'product_name'}">selected</c:if>>?????????</option>
					                        </select>
		                        		</div>
											<input type="text" class="form-control" name="keyword" value="${param.keyword }">
											<input type="submit" class="btn btn-light" value="??????"> &nbsp;&nbsp; 
		                       		 </div>
		                   		</div>
							</form>
                    <div class="table-responsive">
                      <table class="table table-striped" id="tableId">
                        <thead>
                          <tr>
                          	<th></th>
                            <th>??????????????????</th>
                            <th>????????????</th>
                            <th>?????????[??????]</th>
                            <th>?????????????????????</th>
                            <th>??????????????????</th>
                            <th>???????????????</th>
                            <th>??????????????????</th>
                            <th>??????</th>
                          </tr>
                        </thead>
                        <tbody>
                        
                        <c:forEach var="out" items="${outList }" varStatus="status">
                        	<input type="hidden" id="product_cd${status.index}" value="${out.product_cd}">
                       		<tr>
	                          	<td>
	                          		<input type="checkbox" name ="checkbox" id ="checkbox_${status.index }" class="selected" value="${out.out_schedule_cd }/${out.product_cd}/${out.out_not_qty }" > 
	                          	</td>
	                            <td>
	                            	<a href="OutModify.out?out_schedule_cd=${out.out_schedule_cd }&pageNum=${pageNum}&=_date=${out.out_date}&out_schedule_qty=${out.out_schedule_qty}&out_qty=${out.out_qty}&remarks=${out.remarks}&index=${status.index}&product_cd=${out.product_cd}" 
									onclick="window.open(this.href, '_blank', 'width=650, height=800'); return false;">
	                            <div id="out_schedule_cd${status.index }">${out.out_schedule_cd }</div>
	                            	</a>
	                            </td>
	<!-- 	                          	??????????????????(yyyy/mm/dd - nn) ?????? ??? ?????? ???????????? ??????????????????  -->
	                            <td>${out.cust_name }</td>
	                            <td>${out.product_name }</td>
	                            <td id="out_date${status.index}">${out.out_date }</td>
	                            <td id="out_schedule_qty${status.index}">${out.out_schedule_qty }</td>
	                            <td id ="out_not_qty${status.index }">${out.out_not_qty }</td>
	<%--                             <td><input type="number" value="${out.out_qty }" id ="out_qty${status.index }" > </td> --%>
	                            <td><input type="number" value="0" id ="out_qty${status.index }" > </td>
	                            <td id="remarks${status.index}">${out.remarks }</td>
   						  	</tr>
                        </c:forEach>
                         
                        </tbody>
                      </table>
                    </div>
			        <div class="template-demo" style="text-align: right;">
<!-- 	           			<button type="button" class="btn btn-primary btn-rounded btn-fw"  id = "outBtn" onclick="outProcess()">??????</button> -->
	           			<button type="button" class="btn btn-primary btn-rounded btn-fw"  id = "outBtn" >??????</button>
           			</div>
         
				         <section id="pageList" style="text-align: center; font-size: 0.5em;"> <!-- ????????? ?????? ?????? -->
				    
					     <!-- ??????, pageNum ??????????????? ???????????? ?????? pageNum ?????? ?????? ??? ????????? 1??? ?????? -->
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
								<input type="button" class="btn btn-sm btn-outline-primary" value="??????" onclick="location.href='OutScheduleProductList.out?pageNum=${pageNum - 1}'">
							</c:when>
							<c:otherwise>
								<input type="button" class="btn btn-sm btn-outline-primary" value="??????">
							</c:otherwise>
						</c:choose>
							
						<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
							<c:choose>
								<c:when test="${pageNum eq i}">
									${i }
								</c:when>
								<c:otherwise>
									<a href="OutScheduleProductList.out?pageNum=${i }">${i }</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
				
						<c:choose>
							<c:when test="${pageNum < pageInfo.maxPage}">
								<input type="button" class="btn btn-sm btn-outline-primary" value="??????" onclick="location.href='OutScheduleProductList.out?pageNum=${pageNum + 1}'">
							</c:when>
							<c:otherwise>
								<input type="button" class="btn btn-sm btn-outline-primary" value="??????">
							</c:otherwise>
						</c:choose>
					</section>
               	</div>
             </div>
          </div>
        <!-- table ?????? -->
        </div>
        <!-- ?????? ?????? --> 
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