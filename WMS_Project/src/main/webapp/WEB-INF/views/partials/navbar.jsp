<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
  <div class="navbar-menu-wrapper d-flex align-items-stretch">
    <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
      <span class="mdi mdi-chevron-double-left"></span>
    </button>
    <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
      <a class="navbar-brand brand-logo-mini" href="./"><img src="${pageContext.request.contextPath }/resources/assets/images/logo-mini.svg" alt="logo" /></a>
    </div>
    
    <!-- 메뉴바 -->
    <ul class="navbar-nav">
      <li class="nav-item dropdown">
        <a class="nav-link" id="messageDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
          <h5>인사관리</h5>
        </a>
        <div class="dropdown-menu dropdown-menu-left navbar-dropdown preview-list" aria-labelledby="messageDropdown">
          <h6 class="p-3 mb-0 font-weight-semibold">인사관리</h6>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item preview-item" href="Regist.hr">
            <div class="preview-thumbnail">
            </div>
            <div class="preview-item-content d-flex align-items-start flex-column justify-content-center">
              <h6 class="preview-subject ellipsis mb-1 font-weight-normal">사원등록</h6>
            </div>
          </a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item preview-item" href="List.hr">
            <div class="preview-thumbnail">
            </div>
            <div class="preview-item-content d-flex align-items-start flex-column justify-content-center">
              <h6 class="preview-subject ellipsis mb-1 font-weight-normal">사원조회</h6>
            </div>
          </a>
          <div class="dropdown-divider"></div>
        </div>
        </li>
       
       <li class="nav-item dropdown">
        <a class="nav-link" id="messageDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
          <h5>재고관리</h5>
        </a>
        <div class="dropdown-menu dropdown-menu-left navbar-dropdown preview-list" aria-labelledby="messageDropdown">
          <h6 class="p-3 mb-0 font-weight-semibold">재고관리</h6>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item preview-item" href="#">
            <div class="preview-thumbnail">
            </div>
            <div class="preview-item-content d-flex align-items-start flex-column justify-content-center">
              <h6 class="preview-subject ellipsis mb-1 font-weight-normal">기본등록</h6>
            </div>
          </a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item preview-item" href="#">
            <div class="preview-thumbnail">
            </div>
            <div class="preview-item-content d-flex align-items-start flex-column justify-content-center">
              <h6 class="preview-subject ellipsis mb-1 font-weight-normal">WMS</h6>
            </div>
          </a>
          <div class="dropdown-divider"></div>
        </div>
      </li>
    <!-- 메뉴바 -->
      
    </ul>
    <ul class="navbar-nav navbar-nav-right">
      <li class="nav-item nav-logout d-none d-md-block mr-3"> <!-- 조건절 -->
        <a class="nav-link" href="login.me">login</a>
      </li>
      <li class="nav-item nav-logout d-none d-md-block mr-3"> 
        <a class="nav-link" href="#">logout</a>
      </li>
      
      <li class="nav-item nav-profile dropdown d-none d-md-block">
        <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
          <div class="nav-profile-text">세션아이디 님 </div>
        </a>
        <div class="dropdown-menu center navbar-dropdown" aria-labelledby="profileDropdown">
          <a class="dropdown-item" href="#">
            <i class="flag-icon flag-icon-bl mr-3"></i> French </a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">
            <i class="flag-icon flag-icon-cn mr-3"></i> Chinese </a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">
            <i class="flag-icon flag-icon-de mr-3"></i> German </a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">
            <i class="flag-icon flag-icon-ru mr-3"></i>Russian </a>
        </div>
      </li>
      <li class="nav-item nav-logout d-none d-lg-block">
        <a class="nav-link" href="./">
          <i class="mdi mdi-home-circle"></i>
        </a>
      </li>
    </ul>
    <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
      <span class="mdi mdi-menu"></span>
    </button>
  </div>
</nav>