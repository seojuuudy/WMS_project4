<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
  <ul class="nav">
  	<!-- 프로필 -->
    <li class="nav-item nav-profile border-bottom">
      <a href="#" class="nav-link flex-column">
       <div class="nav-profile-image">
         <img src="${pageContext.request.contextPath }/resources/assets/images/user-Icon.png" alt="profile" /> <!-- 사진 있으면 뜨고 없으면 기본 이미지-->
         <!--change to offline or busy as needed-->
       </div>
       <div class="nav-profile-text d-flex ml-0 mb-3 flex-column">
         <span class="font-weight-semibold mb-1 mt-2 text-center">Session</span>
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
      <span class="nav-item-head">재고 관리</span>
    </li>
    <!-- 사이드바 인사관리 B 부분 -->
    <li class="nav-item">
      <a class="nav-link" href="Wh.wms">
        <i class="mdi mdi-compass-outline menu-icon"></i>
        <span class="menu-title">창고 관리</span>
      </a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
        <i class="mdi mdi-crosshairs-gps menu-icon"></i>
        <span class="menu-title">입고 관리</span>
        <i class="menu-arrow"></i>
      </a>
      <div class="collapse" id="ui-basic">
        <ul class="nav flex-column sub-menu">
          <li class="nav-item">
            <a class="nav-link" href="#">입고 예정</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">입고 처리</a>
          </li>
        </ul>
      </div>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="collapse" href="#ui-basic2" aria-expanded="false" aria-controls="ui-basic2">
        <i class="mdi mdi-crosshairs-gps menu-icon"></i>
        <span class="menu-title">출고 관리</span>
        <i class="menu-arrow"></i>
      </a>
      <div class="collapse" id="ui-basic2">
        <ul class="nav flex-column sub-menu">
          <li class="nav-item">
            <a class="nav-link" href="#">출고 예정</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">출고 처리</a>
          </li>
        </ul>
      </div>
    </li>
    <!-- 추후 인사관리 B 추가 및 삭제하게되면 수정 -->
    <li class="nav-item">
      <a class="nav-link" href="pages/forms/basic_elements.html">
        <i class="mdi mdi-format-list-bulleted menu-icon"></i>
        <span class="menu-title">재고 조정</span>
      </a>
    </li>

  </ul>
</nav>