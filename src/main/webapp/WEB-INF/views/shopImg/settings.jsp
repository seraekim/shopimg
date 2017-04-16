<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

  <div class="container">
    <div id="settings">
      <h3>설정하기</h3>
      <form id="form_settings">
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
                
                <input type="radio" name="kind" id="radio_mon" value="M" <c:if test="${dateConfig.kind == 'M'}">checked</c:if>>
                <label for="radio_mon">월별조회</label>
                <select class="form-control" name="m" id="sel_mon"></select>
<!--                <span id="srch_period_txt" class="m_l_10">검색기간:</span>-->
              </div>
              <div class="radio radio-danger">
                <div class="hmny_col">
                  <input type="radio" name="kind" id="radio_day" value="D" <c:if test="${dateConfig.kind == 'D'}">checked</c:if>>
                  <label for="radio_day">일별조회</label>
                </div>
                <div class="col-xs-3">
                  <div class="form-group">
                    <div class='input-group date' id='datetimepicker'>
                      <input id="sd" name="sd" type='text' class="form-control" />
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
                      <input id="ed" name="ed" type='text' class="form-control" />
                      <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                      </span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="clear"></div>
              <div id="ed_btn_wrap">
              <div style="margin-left:92px;display:inline">시작일자 후</div>
              <div class="button">1주일</div>
              <div class="button">15일</div>
              <div class="button">1개월</div>
              </div>
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
            <c:forEach items="${shopConfig}" var="shop">
            <div class="checkbox">
              <input id="${shop.sId}" name="chkShop" class="styled" type="checkbox" value="${shop.sId}" <c:if test="${!empty shop.mId}">checked</c:if>>
              <label for="${shop.sId}">${shop.sNm}</label>
            </div>
            </c:forEach>
          </td>
        </tr>
      </table>
      <div class="m_t_10 text-center"><button id="do_settings" type="button" class="btn btn-primary">확인</button></div>
      </form>
    </div>
  </div>
  <script>
    var m = '${dateConfig.m}';
    var sd = '${dateConfig.sd}';
    var ed = '${dateConfig.ed}';
  </script>
  <script src="resources/js/settings.js"></script>
