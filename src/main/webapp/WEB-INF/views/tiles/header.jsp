<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<ul id="srkim-menu" class="srkim-menu-main">
		<li class="srkim-trigger"><a class="srkim-icon srkim-icon-menu"><span>Menu</span></a>
			<nav class="srkim-menu-wrapper">
				<div class="srkim-scroller">
					<ul class="srkim-menu">
						<li><a href="shopImg/search-slider" class="srkim-icon" title="슬라이더"><i class="mi">view_carousel</i>슬라이더</a></li>
						<li><a href="shopImg/search-imgscroll" class="srkim-icon" title="갤러리"><i class="mi">view_comfy</i>갤러리</a></li>
						<li><a href="shopImg/search-timeline" class="srkim-icon" title="타임라인"><i class="mi">timeline</i>타임라인</a></li>
						<li><a href="shopImg/search-compare" class="srkim-icon" title="비교"><i class="mi">compare</i>비교</a></li>
						<li><a class="srkim-icon" title="조회" data-toggle="modal" data-target="#myModal"><i class="mi">search</i>조회</a></li>
						<!-- <li><a class="srkim-icon" title="필터"><i class="fa fa-filter fa-lg" aria-hidden="true"></i></a></li> -->
						<!-- <li><a class="srkim-icon" title="정보"><i class="mi">info</i>정보</a></li> -->
					</ul>
				</div>
				<!-- /srkim-scroller -->
			</nav></li>
		<li><a class="header_logo"><span class="hide">sitescraper</span></a></li>
		<li class="right"><a href="auth/logout" class="icon"><i class="mi">person</i><span>test</span></a></li>
	</ul>
</div>
<div id="spinner">
	<i class="fa fa-spinner fa-pulse fa-5x fa-fw"></i> <span class="sr-only">Loading...</span>
</div>
<script src="resources/js/srkim-menu.js"></script>


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h3 class="modal-title" id="exampleModalLabel" style="display: inline;">조회하기</h3>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="form_settings" style="margin-left: 20px">
					<div class="radio radio-danger">
						<input type="radio" name="kind" id="radio_mon" value="M" <c:if test="${dateOpt.kind == 'M'}">checked</c:if>>
						<label for="radio_mon">월별조회</label> <select data-size="6" class="selectpicker col-xs-4" name="m" id="sel_mon"></select>
						<!--                <span id="srch_period_txt" class="m_l_10">검색기간:</span>-->
					</div>
					<div class="radio radio-danger">
						<div class="hmny_col">
							<input type="radio" name="kind" id="radio_day" value="D" <c:if test="${dateOpt.kind == 'D'}">checked</c:if>>
							<label for="radio_day">일별조회</label>
						</div>
						<div class="col-xs-4" style="margin-left: 4px;">
							<div class="form-group">
								<div class='input-group date' id='datetimepicker'>
									<input id="sd" name="sd" type='text' class="form-control" /> <span class="input-group-addon"> <span
										class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
							</div>
						</div>
						<div class="hmny_col">~</div>
						<div class="col-xs-4">
							<div class="form-group">
								<div class='input-group date' id='datetimepicker2'>
									<input id="ed" name="ed" type='text' class="form-control" /> <span class="input-group-addon"> <span
										class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
							</div>
						</div>
					</div>
					<div class="clear"></div>
					<div id="ed_btn_wrap">
						<div style="margin-left: 92px; display: inline">시작일자 후</div>
						<div class="button">1주일</div>
						<div class="button">15일</div>
						<div class="button">1개월</div>
					</div>
					<c:forEach items="${shopOpt}" var="shop">
						<div class="radio srkim-grid">
							<input id="${shop.sId}" name="chkShop" type="radio" value="${shop.sId}"
								<c:if test="${!empty shop.mId}">checked</c:if>> <label for="${shop.sId}">${shop.sNm}</label>
						</div>
					</c:forEach>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<button id="do_settings" type="button" data-dismiss="modal" class="btn btn-primary">확인</button>
			</div>
		</div>
	</div>
</div>

<script>
	var pathArr = window.location.pathname.split('/');
	var navSel = pathArr[pathArr.length - 1];
	$('#nav_' + navSel).addClass('active');
	$(document).ajaxStart(function() {
		$('#spinner').show();
	}).ajaxStop(function() {
		$('#spinner').hide();
	});
	
	var m = '${dateOpt.m}';
	var sd = '${dateOpt.sd}';
	var ed = '${dateOpt.ed}';
	
</script>
<script src="resources/js/settings.js"></script>
