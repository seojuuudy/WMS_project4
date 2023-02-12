<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>WMS</title>
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
     <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/insert_list_page.css" />
 <script type="text/javascript">
    function showClock()
    {
        var currentDate=new Date();
        var divClock=document.getElementById("divClock");
        var apm=currentDate.getHours();
        if(apm<12)
        {
            apm="오젼 ";
        }
        else
        {
            apm="오후 ";
        }
        
        var msg = apm +(currentDate.getHours()-12)+"시 ";
        msg += currentDate.getMinutes() + "분 ";
        msg += currentDate.getSeconds() + "초";
        
        divClock.innerText=msg;
        
        setTimeout(showClock,1000);
    }
    // 달력
    var today = new Date(); // 오늘 날짜
    var date = new Date();
 
    function beforem() //이전 달을 today에 값을 저장
    { 
        today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
        build(); //만들기
    }
    
    function nextm()  //다음 달을 today에 저장
    {
        today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
        build();
    }
    
    function build()
    {
        var nMonth = new Date(today.getFullYear(), today.getMonth(), 1); //현재달의 첫째 날
        var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0); //현재 달의 마지막 날
        var tbcal = document.getElementById("calendar"); // 테이블 달력을 만들 테이블
        var yearmonth = document.getElementById("yearmonth"); //  년도와 월 출력할곳
        yearmonth.innerHTML = today.getFullYear() + "년 "+ (today.getMonth() + 1) + "월"; //년도와 월 출력
        
        if(today.getMonth()+1==12) //  눌렀을 때 월이 넘어가는 곳
        {
            before.innerHTML=(today.getMonth())+"월";
            next.innerHTML="1월";
        }
        else if(today.getMonth()+1==1) //  1월 일 때
        {
        before.innerHTML="12월";
        next.innerHTML=(today.getMonth()+2)+"월";
        }
        else //   12월 일 때
        {
            before.innerHTML=(today.getMonth())+"월";
            next.innerHTML=(today.getMonth()+2)+"월";
        }
        
       
        // 남은 테이블 줄 삭제
        while (tbcal.rows.length > 2) 
        {
            tbcal.deleteRow(tbcal.rows.length - 1);
        }
        var row = null;
        row = tbcal.insertRow();
        var cnt = 0;
 
        // 1일 시작칸 찾기
        for (i = 0; i < nMonth.getDay(); i++) 
        {
            cell = row.insertCell();
            cnt = cnt + 1;
        }
 
        // 달력 출력
        for (i = 1; i <= lastDate.getDate(); i++) // 1일부터 마지막 일까지
        { 
            cell = row.insertCell();
            cell.innerHTML = i;
            cnt = cnt + 1;
            if (cnt % 7 == 1) {//일요일 계산
                cell.innerHTML = "<font color=#FF9090>" + i//일요일에 색
            }
            if (cnt % 7 == 0) { // 1주일이 7일 이므로 토요일 계산
                cell.innerHTML = "<font color=#7ED5E4>" + i//토요일에 색
                row = calendar.insertRow();// 줄 추가
            }
            if(today.getFullYear()==date.getFullYear()&&today.getMonth()==date.getMonth()&&i==date.getDate()) 
            {
                cell.bgColor = "#99ccff"; //오늘날짜배경색
            }
        }
 
    }   
    
    
</script>    
     
     
  </head>
  <body onload="build(); showClock()">
    <div class="container-scroller">
      <!-- 사이드바 -->
      <jsp:include page="partials/sidebar.jsp"></jsp:include>
      <!-- 사이드바 -->
      
      <div class="container-fluid page-body-wrapper">
        <!-- 색상 커스텀 설정 -->
        <jsp:include page="partials/settings-panel.jsp"></jsp:include>
        <!-- 색상 커스텀 설정 -->
        
        <!-- 상단 메뉴바 -->
      	<jsp:include page="partials/navbar.jsp"></jsp:include>
        <!-- 상단 메뉴바  -->
        
               <div class="main-panel"><!-- div 3 시작 -->
          <div class="content-wrapper"><!-- div 4 시작 -->
            <div class="page-header"><!-- div 5 시작 -->
              <h3 class="page-title"></h3>
              <nav aria-label="breadcrumb">
<!--                 <ol class="breadcrumb"> -->
<!--                   <li class="breadcrumb-item active" aria-current="page"> 기본등록 </li> -->
<!--                   <li class="breadcrumb-item"><a href="MainWMSList"> WMS </a></li> -->
<!--                 </ol> -->
              </nav>
            </div><!-- div 5 끝 -->
            
<!--               <div class="col-md-4 grid-margin stretch-card"> -->
<!--                 <div class="card"> -->
<!--                   <div class="card-body"> -->
<!--                     <h4 class="card-title">거래처 등록</h4> -->
<!--                     <div class="media"> -->
<!--                       <i class=" mdi mdi-account-multiple icon-md text-info d-flex align-self-start mr-3"></i> -->
<!--                       <div class="media-body"> -->
<!--                         <p class="card-text">gogo</p> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--    달력 -->
 
   
<!--    시계 -->
   <div id="divClock" class="clock"  style="
   	text-align: right;
   
   
   
   "></div>

<!--  흰색 바탕, 회색 border -->
<div id="boxArea">
	<div style="display: inline-block; 
	background-color: #fff;
	">
    
    <table align="center" id="calendar" style="
        text-align:center;
        width:300px;
	height: 200px; 
	border: 1px solid #d9d9d9; 
        ">
        <tr>
            <td><font size=1%; color="#B3B6B3"><label onclick="beforem()" id="before" ></label></font></td>
            <td colspan="5" align="center" id="yearmonth"></td>
            <td><font size=1%; color="#B3B6B3"><label onclick="nextm()" id="next"></label></font></td>
        </tr>
        <tr>
            <td align="center"> <font color="#FF9090">일</font></td>
            <td align="center"> 월 </td>
            <td align="center"> 화 </td>
            <td align="center"> 수 </td>
            <td align="center"> 목 </td>
            <td align="center"> 금 </td>
            <td align="center"><font color=#7ED5E4>토</font></td>
        </tr>
    </table>
    </div>
		
	<div id="InsertPageArea"  style="
		
	">
		 <a href="List.hr" >
			 <i class="mdi mdi-account-multiple"></i>
			인사관리
		 </a>
	</div>
	
	<div id="InsertPageArea" style="
	
	">
		 			
		 <a href="MainWMSList" >
			 <i class="mdi mdi-houzz"></i>
			재고관리
		 </a>
	</div>
	
	
</div>
<!--  흰색 바탕, 회색 border -->

          <!-- content-wrapper ends -->
        <!-- 본문 영역 --> 
        </div><!-- div 4 끝 -->
        <!-- main-panel ends -->
      </div><!-- div 3 끝 -->
        
        
        
        
        
        

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