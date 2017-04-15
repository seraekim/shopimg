<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
                <p>아이디와 비밀번호를 입력하세요.</p>
              </div>
              <div class="form-top-right">
                <i class="fa fa-key"></i>
              </div>
            </div>
            <div class="form-bottom">
              <form role="form" action="/auth/login" method="post" class="login-form">
                <div class="form-group">
                  <label class="sr-only" for="form-username">아이디</label>
                  <input type="text" name="id" placeholder="아이디" class="form-username form-control" id="form-username">
                </div>
                <div class="form-group">
                  <label class="sr-only" for="form-password">비밀번호</label>
                  <input type="password" name="pw" placeholder="비밀번호" class="form-password form-control" id="form-password">
                </div>
                <button type="submit" class="btn" id="do_login">로그인</button>
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