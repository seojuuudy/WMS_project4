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
	<!-- jquery -->
	<script type="text/javascript">
// 	여기가바로 출고예정목록에서 띄우는 팝업
// 		function setParentText(out_qty) {
// 			alert("확인1 : " + product_cd);
// 			opener.document.getElementById("out_qty").value= document.getElementById("out_qty").value
// 			opener.set_process(out_schedule_cd);
// 			window.close();
// 		}
	$(function() {
		let today = new Date();

		let year = today.getFullYear();
		let month = ('0' + (today.getMonth() + 1)).slice(-2);
		let day = ('0' + today.getDate()).slice(-2);

		let dateString = year + '-' + month  + '-' + day;
		
		$("#nowDate").val(dateString);
	});
	//출고 수량 합계 계산을 위한 제이쿼리 식
	$(function() {
		sum = 0;
		console.log("이거머게?" + $(".out_qty").length);
		console.log("이거머게?" +  $(".out_qty").eq(0).text());
		
		for(var i = 0; i < $(".out_qty").length; i++) {
			var qty = $(".out_qty").eq(i).text();
			sum += parseInt(qty);
		}
		console.log(sum);
		$("#sum_out_schedule_qty").text(sum);
	});	
	
	function stockpop(product_cd ){
		let url = "StockSearchList.out?product_cd=" + product_cd;
		let pop = window.open(url,'searchList','location=no,toolbar=no,width=700, height=700, left=0, top=0,resizable=yes,scrollbars=yes');
		}
	function set_st(stock_cd){
// 		let stockCdElements = document.getElementsByName("stock_cd");
// 		for (let i = 0; i < stockCdElements.length; i++) {
// 		  stockCdElements[i].value = stock_cd;
// 		}
// 		console.log(document.getElementsByName("stock_cd").length);
// 		for(var i = 0; i <document.getElementsByName("stock_cd").length; i++ ){
// 			document.getElementById("stock_cd")[i].value = stock_cd;
			
// 		}
		let stockCdElements = document.getElementsByName("stock_cd");
		for (let i = 0; i < stockCdElements.length; i++) {
			  let stockCdId = "stock_cd" + i;
			  let stockCdElement = document.getElementById(stockCdId);
			  if (stockCdElement) {
			    stockCdElement.value = stock_cd;
			  }
		}
// 		objWindow.close();
	}
    $(function (){


    });
	$(function() {
		// 거래처 코드 중복확인
	   $("#releaseBtn").on("click", function() {
	        $(".out_schedule_cd").length;
	        $(".out_qty").length;
	        $(".stock_cd").length;
			var out_schedule_cdArr = new Array();
			var out_qtyArr = new Array();
			var stock_cdArr = new Array();
			window.close();
	        for(let i=0; i<$(".out_schedule_cd").length; i++){
	        	var out_schedule_cd = $(".out_schedule_cd").eq(i).text();
	        	var out_qty = $(".out_qty").eq(i).text();
	        	var stock_cd = $(".stock_cd").eq(i).val();
// 				console.log("stock_cd값" + stock_cd);
// 	        	alert(stock_cd);
				out_schedule_cdArr.push({"out_schedule_cd":out_schedule_cd});
				out_schedule_cdArr.push({"out_qty":out_qty});
				out_schedule_cdArr.push({"stock_cd":stock_cd});
// 				+ "" + stock_cd);
// 				out_qtyArr.push(out_qty);
// 				stock_cdArr.push(stock_cd);
	        }
// 				console.log("r값" + out_schedule_cdArr);
// 				console.log("d값" + out_qtyArr);
// 				console.log("s값" + stock_cdArr);
		
// 		    JSONArray array = new JSONArray(input);
// 		    for (int i = 0; i < array.length(); i++) {
// 		        String item = array.getString(i);
		        // Do something with the item
// 	         $.ajax({
// 	        	type:"POST",
// 	            url:"ControlOutqty.out",
// 	            dataType: "text", // 응답 데이터 타입
// 				contentType: "application/json", // 요청 시 전송 데이터 타입
// 				data: JSON.stringify(out_schedule_cdArr), 
// 	            dataType: "text",
// 		          success: function(result){
// 	                if(result == "true"){
// 		            	alert("사용가넝");
// 						window.close();
// 	                } else {
// 		            	alert("이미 존재합니다");
// 	                }
// 	              }
// 	         }); // ajax
	 	  });
	   });
	</script>
	
  </head>
  <body>
  
    <div class="container-scroller">
      <div class="container-fluid page-body-wrapper">
        <!-- 상단 메뉴바 -->
<%--       	<jsp:include page="../partials/navbar.jsp"></jsp:include> --%>
        <!-- 상단 메뉴바  -->
        
        <!-- 본문 영역 -->
        <div class="main-panel">
		<!-- table 영역 -->
      	<div class="col-lg-12 grid-margin stretch-card">
           <div class="card">
				<form action="ControlOutqty.out" method="post" id ="form" >
              	<div class="card-body">
                    <h4 class="card-title">출고</h4>
                    <p class="card-description">일자
                 	   <input type="date" id="nowDate"> 
                    </p>
                    <div class="table-responsive">
                      <table class="table table-striped">
                        <thead>
                          <tr>
                            <th>출고예정번호</th>
                            <th>품목명[규격]</th>
                            <th>출고수량</th>
                            <th>출고할 재고번호</th>
<!--                          	<th>재고수량</th> -->
                          </tr>
                        </thead>
                        <tbody>
                          <!-- 반복문 들어갈 자리 -->
                        <c:forEach var="processList" items="${processList }" varStatus="status">
                          <tr>
                            <td class="out_schedule_cd" id = "out_schedule_cd${status.index }" >${processList.out_schedule_cd}</td>
                            <td>${processList.product_name}[${processList.size_des }]</td>
                            <td class ="out_qty" id="outqty${status.index }">
<%--                           <td  class ="out_qty" value="${param.outqty }">${processList.out_qty} --%>
                             </td>   
                             <td>
                                <input type="text" name="stock_cd" id ="stock_cd${status.index}" class="stock_cd" onclick="stockpop(${processList.product_cd})" />
                             </td>
<%--                              <td>${processList.stock_cd }</td> --%>
<%--                             <td>${processList.stock_qty }</td> --%>
                          </tr>
                        </c:forEach>
                        <script> 
                        	 let outqtyArr = new Array();
					         let outqty_before = "${param.outqty }"
					    	 outqtyArr = outqty_before.split(",");
					    	 outqtyArr.length
						     for(let i = 0; i < outqtyArr.length; i++){
						        document.getElementById("outqty"+i).innerHTML = outqtyArr[i];
						     }
					    </script>        
                         <tr>
                         	<td colspan="3" style="text-align: right;">총 출고수량 : </td>
                         	<td id ="sum_out_schedule_qty"></td>
                         </tr>
                        </tbody>
                      </table>
			        <div class="template-demo" style="text-align: right;">
<!-- 	           			<input type="submit" class="btn btn-primary btn-rounded btn-fw" value="출고"> -->
	           			<button type="button" id="releaseBtn" class="btn btn-primary btn-rounded btn-fw" >출고</button>
<!-- 	           			<button type="button" id="releaseBtn" class="btn btn-primary btn-rounded btn-fw" onclick="submitAndClose()">출고</button> -->
           			</div>
                    </div>
       	  </form> 
               	</div>
             </div>
          </div>
        <!-- table 영역 -->
        </div>
        <!-- 본문 영역 --> 
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    
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