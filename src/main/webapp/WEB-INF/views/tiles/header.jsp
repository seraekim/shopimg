<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

  <nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
      <div class="navbar-header">
        <a class="navbar-brand">쇼핑몰 화면 보기</a>
      </div>
      <div id="navbar">
        <ul id="nav_menu" class="nav navbar-nav">
          <li id="nav_settings"><a href="shopImg/settings">설정</a></li>
          <li id="nav_search"><a href="shopImg/search">조회</a></li>
          <li id="nav_search-slider"><a href="shopImg/search-slider">슬라이더</a></li>
          <li id="nav_search-imgscroll"><a href="shopImg/search-imgscroll">스크롤링</a></li>
          <li id="nav_search-timeline"><a href="shopImg/search-timeline">타임라인</a></li>
          <li id="nav_search-compare"><a href="shopImg/settings">비교</a></li>
        </ul>
        <ul id="nav_session" class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-user"></span>
                        <strong>${sessionScope.id}</strong>
                        <span class="glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <div class="navbar-login">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <p class="text-center">
                                            <span class="glyphicon glyphicon-user icon-size"></span>
                                        </p>
                                    </div>
                                    <div class="col-lg-8">
                                        <p class="text-left"><strong>${sessionScope.id}</strong></p>
                                        <p class="text-left small">${sessionScope.id}@test.com</p>
                                        <!-- <p class="text-left">
                                            <a href="#" class="btn btn-primary btn-block btn-sm">Profile</a>
                                        </p> -->
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="divider navbar-login-session-bg"></li>
                         <!-- <li><a href="#">Account Settings <span class="glyphicon glyphicon-cog pull-right"></span></a></li>
            <li class="divider"></li>
            <li><a href="#">User stats <span class="glyphicon glyphicon-stats pull-right"></span></a></li>
            <li class="divider"></li>
            <li><a href="#">Messages <span class="badge pull-right"> 42 </span></a></li>
            <li class="divider"></li>
            <li><a href="#">Favourites Snippets <span class="glyphicon glyphicon-heart pull-right"></span></a></li>
            <li class="divider"></li> -->
            <li><a href="auth/logout">로그아웃 <span class="glyphicon glyphicon-log-out pull-right"></span></a></li>
                    </ul>
                </li>
            </ul>
      </div>
    </div>
  </nav>
<script>
  var pathArr = window.location.pathname.split( '/' );
  var navSel =  pathArr[pathArr.length - 1];
  $('#nav_' + navSel).addClass('active');
</script>