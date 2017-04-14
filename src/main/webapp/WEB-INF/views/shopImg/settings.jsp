<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctxp" value="${pageContext.request.contextPath}" />
<!doctype html>
<html>

<head>
  <meta charset="UTF-8">
  <title>쇼핑몰 화면 보기</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <link href="${ctxp}/resources/lib/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
  <!--    <link href="${ctxp}/resources/bootstrap-3.3.7/dist/css/bootstrap-theme.min.css" rel="stylesheet">-->
  <link href="${ctxp}/resources/lib/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
  <link href="${ctxp}/resources/css/non-responsive.css" rel="stylesheet">
  <link href="${ctxp}/resources/lib/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet">
  <link href="${ctxp}/resources/css/style.css" rel="stylesheet">
  <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
  <nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
      <div class="navbar-header">
        <a class="navbar-brand">쇼핑몰 화면 보기</a>
      </div>
      <div id="navbar">
        <ul class="nav navbar-nav">
          <li class="active"><a href="#settings">설정</a></li>
          <li><a href="#search">조회</a></li>
        </ul>
      </div>
    </div>
  </nav>
  <div class="container">
    <div id="settings">
      <h3>설정하기</h3>
      <table>
        <colgroup>
          <col width="150px" />
          <col width="" />
        </colgroup>
        <tr>
          <td>조회기간</td>
          <td>
            <div>
              <div class="radio radio-danger">
                <input type="radio" name="radio_md" id="radio_mon" value="radio_mon" checked>
                <label for="radio_mon">월별조회</label>
                <select class="form-control" name="sel_mon" id="sel_mon"></select>
<!--                <span id="srch_period_txt" class="m_l_10">검색기간:</span>-->
              </div>
              <div class="radio radio-danger">
                <div class="hmny_col">
                  <input type="radio" name="radio_md" id="radio_day" value="radio_day">
                  <label for="radio_day">일별조회</label>
                </div>
                <div class="col-xs-3">
                  <div class="form-group">
                    <div class='input-group date' id='datetimepicker'>
                      <input type='text' class="form-control" />
                      <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                      </span>
                    </div>
                  </div>
                </div>
                <div class="hmny_col">~</div>
                <div class="col-xs-3">
                  <div class="form-group">
                    <div class='input-group date' id='datetimepicker2'>
                      <input type='text' class="form-control" />
                      <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                      </span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="clear"></div>
              <div style="margin-left:92px;display:inline">시작일자 후</div>
              <div class="button">1주일</div>
              <div class="button">15일</div>
              <div class="button">1개월</div>
              <!--<div class="m_t_10">
                <p> <span class="glyphicon glyphicon-exclamation-sign"></span> 숫자 8자리(특수문자입력불가)로 입력하셔야 조회가 가능합니다. 예) 20150101
                  <br> &nbsp;&nbsp;&nbsp;&nbsp;
                  <span style="color:#d9534f">최근 6개월 이내</span>의 기간 안에서의 조회가 가능합니다.
                </p>
              </div>-->
            </div>
          </td>
        </tr>
        <tr>
          <td>쇼핑몰</td>
          <td>
            <div class="checkbox">
              <input id="chk_shop_1" name="chk_shop" class="styled" type="checkbox" value="chk_shop_1">
              <label for="chk_shop_1">chk_shop_1</label>
            </div>
            <div class="checkbox">
              <input id="chk_shop_2" name="chk_shop" class="styled" type="checkbox" value="chk_shop_2">
              <label for="chk_shop_2">chk_shop_2</label>
            </div>
            <div class="checkbox">
              <input id="chk_shop_3" name="chk_shop" class="styled" type="checkbox" value="chk_shop_3">
              <label for="chk_shop_3">chk_shop_3</label>
            </div>
            <div class="checkbox">
              <input id="chk_shop_4" name="chk_shop" class="styled" type="checkbox" value="chk_shop_4">
              <label for="chk_shop_4">chk_shop_4</label>
            </div>
            <div class="checkbox">
              <input id="chk_shop_5" name="chk_shop" class="styled" type="checkbox" value="chk_shop_5">
              <label for="chk_shop_5">chk_shop_5</label>
            </div>
          </td>
        </tr>
      </table>
      <div class="m_t_10 text-center"><button type="button" class="btn btn-primary">확인</button></div>
    </div>
    <div id="search">
      <h3>조회하기</h3>
      <div class="hmny_col">
        조회범위
      </div>
      <div class="col-xs-3">
        <div class="form-group">
          <div class='input-group date' id='datetimepicker3'>
            <input type='text' class="form-control" />
            <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
            </span>
          </div>
        </div>
      </div>
      <div class="hmny_col">~</div>
      <div class="col-xs-3">
        <div class="form-group">
          <div class='input-group date' id='datetimepicker4'>
            <input type='text' class="form-control" />
            <span class="input-group-addon">
              <span class="glyphicon glyphicon-calendar"></span>
            </span>
          </div>
        </div>
      </div>
      <button type="button" class="btn btn-outline-primary">검색</button>
      <button type="button" class="btn btn-primary pull-right">쇼핑몰 설정</button>
      <table>
        <colgroup>
          <col width="150px" />
          <col width="" />
          <col width="" />
          <col width="" />
        </colgroup>
        <tr>
          <th>일자</th>
            <th>chk_shop_1</th>
            <th>chk_shop_2</th>
            <th>chk_shop_3</th>
        </tr>
        <tr>
          <td>2017-04-10</td>
          <td>
            <div class="col-xs-4 thum">
              <a href="#" class="thumbnail"> <img src="${ctxp}/resources/img/no_img.png" data-holder-rendered="true"> </a>
            </div>
            <div class="col-xs-4 thum">
              <a href="#" class="thumbnail"> <img src="${ctxp}/resources/img/no_img.png" data-holder-rendered="true"> </a>
            </div>
            <div class="col-xs-4 thum">
              <a href="#" class="thumbnail"> <img src="${ctxp}/resources/img/no_img.png" data-holder-rendered="true"> </a>
            </div>

          </td>
          <td>
            <div class="col-xs-4 thum">
              <a href="#" class="thumbnail"> <img src="${ctxp}/resources/img/no_img.png" data-holder-rendered="true"> </a>
            </div>
            <div class="col-xs-4 thum">
              <a href="#" class="thumbnail"> <img src="${ctxp}/resources/img/no_img.png" data-holder-rendered="true"> </a>
            </div>
            <div class="col-xs-4 thum">
              <a href="#" class="thumbnail"> <img src="${ctxp}/resources/img/no_img.png" data-holder-rendered="true"> </a>
            </div>
          </td>
          <td>
            <div class="col-xs-4 thum">
              <a href="#" class="thumbnail"> <img src="${ctxp}/resources/img/no_img.png" data-holder-rendered="true"> </a>
            </div>
            <div class="col-xs-4 thum">
              <a href="#" class="thumbnail"> <img src="${ctxp}/resources/img/no_img.png" data-holder-rendered="true"> </a>
            </div>
            <div class="col-xs-4 thum">
              <a href="#" class="thumbnail"> <img src="${ctxp}/resources/img/no_img.png" data-holder-rendered="true"> </a>
            </div>
          </td>
        </tr>


        <tr>
          <td>2017-04-11</td>
          <td>
            <div class="col-xs-4 thum">
              <a href="#" class="thumbnail"> <img src="${ctxp}/resources/img/no_img.png" data-holder-rendered="true"> </a>
            </div>
            <div class="col-xs-4 thum">
              <a href="#" class="thumbnail"> <img src="${ctxp}/resources/img/no_img.png" data-holder-rendered="true"> </a>
            </div>
            <div class="col-xs-4 thum">
              <a href="#" class="thumbnail"> <img src="${ctxp}/resources/img/no_img.png" data-holder-rendered="true"> </a>
            </div>

          </td>
          <td>
            <div class="col-xs-4 thum">
              <a href="#" class="thumbnail"> <img src="${ctxp}/resources/img/no_img.png" data-holder-rendered="true"> </a>
            </div>
            <div class="col-xs-4 thum">
              <a href="#" class="thumbnail"> <img src="${ctxp}/resources/img/no_img.png" data-holder-rendered="true"> </a>
            </div>
            <div class="col-xs-4 thum">
              <a href="#" class="thumbnail"> <img src="${ctxp}/resources/img/no_img.png" data-holder-rendered="true"> </a>
            </div>
          </td>
          <td>
            <div class="col-xs-4 thum">
              <a href="#" class="thumbnail"> <img src="${ctxp}/resources/img/no_img.png" data-holder-rendered="true"> </a>
            </div>
            <div class="col-xs-4 thum">
              <a href="#" class="thumbnail"> <img src="${ctxp}/resources/img/no_img.png" data-holder-rendered="true"> </a>
            </div>
            <div class="col-xs-4 thum">
              <a href="#" class="thumbnail"> <img src="${ctxp}/resources/img/no_img.png" data-holder-rendered="true"> </a>
            </div>
          </td>
        </tr>
      </table>
    </div>
  </div>
  <script src="${ctxp}/resources/lib/jquery.min.js"></script>
  <script src="${ctxp}/resources/lib/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
  <script src="${ctxp}/resources/lib/moment-with-locales.js"></script>
  <script src="${ctxp}/resources/lib/datetimepicker/bootstrap-datetimepicker.min.js"></script>
  <script src="${ctxp}/resources/js/my.js"></script>
</body>

</html>