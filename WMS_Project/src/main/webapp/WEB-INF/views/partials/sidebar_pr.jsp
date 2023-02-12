<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
  <ul class="nav">
  	<!-- 프로필 -->
    <li class="nav-item nav-profile border-bottom">
      <a href="#" class="nav-link flex-column">
       <div class="nav-profile-image">
       		<c:choose>
				<c:when test="${empty sessionScope.sId }">
        			<img src="${pageContext.request.contextPath }/resources/assets/images/user-Icon.png" alt="profile" /> <!-- 사진 있으면 뜨고 없으면 기본 이미지-->
				</c:when>
				<c:otherwise>
			        <img src="${pageContext.request.contextPath }/resources/upload/${sessionScope.photo}" alt="image" />
		        </c:otherwise>
	        </c:choose>
         <!--change to offline or busy as needed-->
       </div>
       <div class="nav-profile-text d-flex ml-0 mb-3 flex-column">
         <span class="font-weight-semibold mb-1 mt-2 text-center">
          <c:choose>
		<c:when test="${empty sessionScope.sId }">
			 Guest
		</c:when>
		<c:otherwise>
	          ${sessionScope.sId }
        </c:otherwise>
        </c:choose>
         </span>
       </div>
      </a>
    </li>
    <!-- 검색 및 회사이름 -->
    <li class="nav-item pt-3">
      <a class="nav-link d-block" href="./">
        <img class="sidebar-brand-logo" src="${pageContext.request.contextPath }/resources/assets/images/wms_logo.png" style="width: 148px; height: 26px;" />
        <img class="sidebar-brand-logomini" src="${pageContext.request.contextPath }/resources/assets/images/logo-mini.svg" alt="" />
        <div class="small font-weight-light pt-1">Warehouse management systems</div>
      </a>
      <form class="d-flex align-items-center" action="#">
        <div class="input-group">
          <div class="input-group-prepend">
            <i class="input-group-text border-0 mdi mdi-magnify"></i>
          </div>
          <input type="text" class="form-control border-0" placeholder="Search" />
        </div>
      </form>
    </li>
    <!-- 상단바 A 부분 -->
    <li class="pt-2 pb-1">
      <span class="nav-item-head">품목 관리</span>
    </li>
    <!-- 사이드바 품목관리 B 부분 -->
	<li class="nav-item">
		<a class="nav-link" href="ProductRegist.pr">
			<i class="mdi mdi-database menu-icon"></i>
			<span class="menu-title">품목 등록</span>
		</a>
	</li>
      
	<li class="nav-item">
		<a class="nav-link" href="ProductList.pr">
			<i class="mdi mdi-crosshairs-gps menu-icon"></i>
			<span class="menu-title">품목 조회</span>
		</a>
	</li>
	      
	<li class="nav-item">
		<a class="nav-link" href="GroupRegist.pr">
			<i class="mdi mdi-compass-outline menu-icon"></i>
			<span class="menu-title">품목 그룹 등록</span>
		</a>
	</li>
	    
	<li class="nav-item">
		<a class="nav-link" href="GroupList.pr">
			<i class="mdi mdi-menu menu-icon"></i>
			<span class="menu-title">품목 그룹 조회</span>
		</a>
	</li>
    
    
  
  </ul>
</nav>