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
                <h3>가입하기</h3>
                <p>가입할 아이디와 이름을 입력하세요.</p>
              </div>
              <div class="form-top-right">
                <i class="fa fa-key"></i>
              </div>
            </div>
            <div class="form-bottom">
              <form id="form_join" role="form" class="login-form">
                <div class="form-group">
                  <label class="sr-only" for="form-username">아이디</label>
                  <input type="text" name="id" placeholder="아이디" class="form-username form-control" id="form-username">
                </div>
                <div class="form-group">
                  <label class="sr-only" for="form-password">Password</label>
                  <input type="password" name="pw" placeholder="이름" class="form-password form-control" id="form-password">
                </div>
                <button type="button" class="btn" id="do_join">가입</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>