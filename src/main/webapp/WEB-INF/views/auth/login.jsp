<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <div class="header">
        <h1 class="logo"><span class="hide">sitescraper</span></h1>
    </div>
    
    <div class="main">
        <div class="login_box">
            <div class="log_box_hd">
                <div class="logo_big"><img src="resources/img/login/logo_big.png" alt="sitescraper"></div>
                <p class="site_desc">SITESCRAPER는 원하는 사이트에서 일련의 정보를 가져올 수 있는 프로그램입니다.</p>                
            </div>
            <div class="log_box_main">
                <div class="log_boxes log_left_box">
                <form id="form_login" method="POST">
                    <div class="login_id">
                        <label class="login_label" for="">아이디</label>
                        <input type="text" class="login_input" name="id">                        
                    </div>
                     <div class="login_password">
                        <label class="login_label" for="">패스워드</label>
                        <input type="password" class="login_input" name="pw">                        
                    </div>   
                    
                    <div class="login_button">
                        <input type="button" id="do_login" class="login_btn gray_btn">로그인
                        <input type="button" class="login_btn blue_btn">가입하기                       
                    </div>
                </form>                     
                </div>
                <div class="log_boxes log_right_box">
                    <div class="log_right_title">소셜로그인</div>     
                    <button class="sns_login_btn facebook_btn"><i class="fa fa-facebook" aria-hidden="true"></i> Facebook</button>
                    <button class="sns_login_btn twitter_btn"><i class="fa fa-twitter" aria-hidden="true"></i> Twitter</button>
                    <button class="sns_login_btn google_btn"><i class="fa fa-google-plus" aria-hidden="true"></i> Google Plus</button>        
                </div>                
            </div>            
        </div>                                        
    </div>
<script src="resources/js/login.js"></script>
    