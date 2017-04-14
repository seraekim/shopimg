<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctxp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>로그인 :: 쇼핑몰조회하기</title>

  <!-- CSS -->
  <link href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500" rel="stylesheet">
  <link href="${ctxp}/resources/lib/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="${ctxp}/resources/lib/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
  <link href="${ctxp}/resources/css/form-elements.css" rel="stylesheet" >
  <link href="${ctxp}/resources/css/login.css" rel="stylesheet" >

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

</head>

<body>

  <!-- Top content -->
  <div class="top-content">

    <div class="inner-bg">
      <div class="container">
        <div class="row">
          <div class="col-sm-8 col-sm-offset-2 text">
            <h1><strong>쇼핑몰 조회하기</strong></h1>
            <div class="description">
              <p>
                환영합니다!
              </p>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6 col-sm-offset-3 form-box">
            <div class="form-top">
              <div class="form-top-left">
                <h3>로그인하기</h3>
                <p>가입한 아이디와 이름을 입력하세요.</p>
              </div>
              <div class="form-top-right">
                <i class="fa fa-key"></i>
              </div>
            </div>
            <div class="form-bottom">
              <form role="form" action="" method="post" class="login-form">
                <div class="form-group">
                  <label class="sr-only" for="form-username">Username</label>
                  <input type="text" name="form-username" placeholder="아이디" class="form-username form-control" id="form-username">
                </div>
                <div class="form-group">
                  <label class="sr-only" for="form-password">Password</label>
                  <input type="password" name="form-password" placeholder="이름" class="form-password form-control" id="form-password">
                </div>
                <button type="button" class="btn" id="login">로그인</button>
                <button type="button" class="btn" id="join">가입하기</button>
              </form>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-sm-6 col-sm-offset-3 social-login">
            <h3>...or login with:</h3>
            <div class="social-login-buttons">
              <a class="btn btn-link-1 btn-link-1-facebook" href="#">
                <i class="fa fa-facebook"></i> Facebook
              </a>
              <a class="btn btn-link-1 btn-link-1-twitter" href="#">
                <i class="fa fa-twitter"></i> Twitter
              </a>
              <a class="btn btn-link-1 btn-link-1-google-plus" href="#">
                <i class="fa fa-google-plus"></i> Google Plus
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>


  <!-- Javascript -->
  <script>var ctxp = '${ctxp}';</script>
  <script src="${ctxp}/resources/lib/jquery.min.js"></script>
  <script src="${ctxp}/resources/lib/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
  <script src="${ctxp}/resources/lib/jquery.backstretch.min.js"></script>
  <script src="${ctxp}/resources/js/login.js"></script>

  <!--[if lt IE 10]>
            <script src="${ctxp}/resources/lib/placeholder.js"></script>
        <![endif]-->

</body>

</html>