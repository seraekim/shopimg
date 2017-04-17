<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <div class="container">
    <div id="search">
      <h3>조회하기</h3>
      <div class="hmny_col">
        조회범위
      </div>
      <div class="col-xs-3">
        <div class="form-group">
          <div class='input-group date' id='datetimepicker'>
            <input type='text' class="form-control" value="${dateConfig.sd}"/>
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
            <input type='text' class="form-control" value="${dateConfig.ed}"/>
            <span class="input-group-addon">
              <span class="glyphicon glyphicon-calendar"></span>
            </span>
          </div>
        </div>
      </div>
      <button type="button" class="btn btn-outline-primary">검색</button>
      <a href="shopImg/settings" type="button" class="btn btn-primary pull-right">쇼핑몰 설정</a>
      <table>
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
          <c:forEach items="${img}" var="i">
            <div class="col-xs-4 thum">
              <a href="#" class="thumbnail"> <img src="img/${i.img}" data-holder-rendered="true"> </a>
            </div>
          </c:forEach>
          </td>
        <tr>
        </c:forEach>
        <!-- <tr>
          <td>2017-04-11</td>
          <td>
            <div class="col-xs-4 thum">
              <a href="#" class="thumbnail"> <img src="resources/img/no_img.png" data-holder-rendered="true"> </a>
            </div>
            <div class="col-xs-4 thum">
              <a href="#" class="thumbnail"> <img src="resources/img/no_img.png" data-holder-rendered="true"> </a>
            </div>
            <div class="col-xs-4 thum">
              <a href="#" class="thumbnail"> <img src="resources/img/no_img.png" data-holder-rendered="true"> </a>
            </div>

          </td>
          <td>
            <div class="col-xs-4 thum">
              <a href="#" class="thumbnail"> <img src="resources/img/no_img.png" data-holder-rendered="true"> </a>
            </div>
            <div class="col-xs-4 thum">
              <a href="#" class="thumbnail"> <img src="resources/img/no_img.png" data-holder-rendered="true"> </a>
            </div>
            <div class="col-xs-4 thum">
              <a href="#" class="thumbnail"> <img src="resources/img/no_img.png" data-holder-rendered="true"> </a>
            </div>
          </td>
          <td>
            <div class="col-xs-4 thum">
              <a href="#" class="thumbnail"> <img src="resources/img/no_img.png" data-holder-rendered="true"> </a>
            </div>
            <div class="col-xs-4 thum">
              <a href="#" class="thumbnail"> <img src="resources/img/no_img.png" data-holder-rendered="true"> </a>
            </div>
            <div class="col-xs-4 thum">
              <a href="#" class="thumbnail"> <img src="resources/img/no_img.png" data-holder-rendered="true"> </a>
            </div>
          </td>
        </tr> -->
      </table>
    </div>
  </div>
  <script>
    var m = '${dateConfig.m}';
    var sd = '${dateConfig.sd}';
    var ed = '${dateConfig.ed}';
  </script>
  <script src="resources/js/search.js"></script>
