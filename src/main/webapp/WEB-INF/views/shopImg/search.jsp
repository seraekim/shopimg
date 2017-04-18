<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <div class="container">
    <div id="search">
      <h3>조회하기</h3>
      <div class="hmny_col">
        조회범위
      </div>
      <form id="form_search" method="GET" action="shopImg/search">
      <div class="col-xs-3">
        <div class="form-group">
          <div class='input-group date' id='datetimepicker'>
            <input name="sd" type='text' class="form-control" value="${dateConfig.sd}"/>
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
            <input name="ed" type='text' class="form-control" value="${dateConfig.ed}"/>
            <span class="input-group-addon">
              <span class="glyphicon glyphicon-calendar"></span>
            </span>
          </div>
        </div>
      </div>
      <button type="submit" class="btn btn-outline-primary">검색</button>
      <a href="shopImg/settings" type="button" class="btn btn-primary pull-right">쇼핑몰 설정</a>
      </form>
      <table id="tb_shop_img">
        <colgroup>
          <col width="150px" />
          <c:forEach items="${shop}" var="s">
            <col width="" />
          </c:forEach>
        </colgroup>
        <tr>
          <th>일자</th>
          <c:forEach items="${shop}" var="s">
            <th>${s.sNm}</th>
          </c:forEach>
        </tr>
        <c:forEach items="${date}" var="d">
        <tr>
          <td>${d}</td>
          <td>
          <div id="d_${d}" class="td_h_scroll">
          </div>
          </td>
        <tr>
        </c:forEach>
      </table>
    </div>
  </div>
  <script>
    var m = '${dateConfig.m}';
    var sd = '${dateConfig.sd}';
    var ed = '${dateConfig.ed}';
  </script>
  <script src="resources/js/search.js"></script>
