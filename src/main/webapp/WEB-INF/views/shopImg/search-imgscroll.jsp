<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
  <link href="resources/css/search-imgscroll.css" rel="stylesheet">
  <link href="resources/css/hover.css" rel="stylesheet">
  <!-- <header class="cd-header">
    <h1>Content Filters</h1>
  </header> -->

  <div class="cd-main-content is-fixed">
    <div class="cd-tab-filter-wrapper">
      <div class="cd-tab-filter">
        <ul class="cd-filters">
          <li class="placeholder"><a data-type="all" href="#0" onclick="return false;" >All</a></li>
          <!-- <li class="filter"><a class="selected" href="#0" onclick="return false;" data-type="all">All</a></li>
          <li class="filter" data-filter=".20170410"><a href="#0" onclick="return false;" data-type="20170410">20170410</a></li>
          <li class="filter" data-filter=".color-2"><a href="#0" onclick="return false;" data-type="color-2">Color 2</a></li> -->
          <!-- <li><a href="#0" onclick="return false;">비교하기</a></li> -->
        </ul>
        <form id="form" method="POST">
          <a class="compare">비교하기</a>
          <input type="hidden" name="img1" value="">
          <input type="hidden" name="img2" value="">
        </form>
      
        <!-- cd-filters -->
      </div>
      <!-- cd-tab-filter -->
    </div>
    <!-- cd-tab-filter-wrapper -->

    <section class="cd-gallery">
      <div class="cd-fail-message" style="display: none;"></div>
      <ul></ul>
    </section>
    <!-- cd-gallery -->

    <div class="cd-filter">
      <form>
        <div class="cd-filter-block">
          <h4>Search</h4>

          <div class="cd-filter-content">
            <input type="search" placeholder="날짜/카테고리">
          </div>
        </div>

        <!-- <div class="cd-filter-block">
          <h4>날짜</h4>
          <ul class="cd-filter-content cd-filters list">
          </ul>
        </div> -->
        
        <div class="cd-filter-block">
          <h4>날짜</h4>
          <div class="cd-filter-content">
            <div class="cd-select cd-filters">
              <select class="filter" name="selectThis" id="selectThis">
                <option value="">날짜를 고르세요.</option>
              </select>
            </div>
          </div>
        </div>
        
        <div class="cd-filter-block">
          <h4>카테고리</h4>

          <div class="cd-filter-content">
            <div class="cd-select cd-filters">
              <select class="filter" name="selectThis" id="selectThis">
                <option value="">카테고리를 고르세요.</option>
              </select>
            </div>
          </div>
        </div>

        <!-- <div class="cd-filter-block">
          <h4>Radio buttons</h4>

          <ul class="cd-filter-content cd-filters list">
            <li>
              <input class="filter" data-filter="" type="radio" name="radioButton" id="radio1" checked>
              <label class="radio-label" for="radio1">All</label>
            </li>

            <li>
              <input class="filter" data-filter=".radio2" type="radio" name="radioButton" id="radio2">
              <label class="radio-label" for="radio2">Choice 2</label>
            </li>

            <li>
              <input class="filter" data-filter=".radio3" type="radio" name="radioButton" id="radio3">
              <label class="radio-label" for="radio3">Choice 3</label>
            </li>
          </ul>
        </div> -->
      </form>

      <a onclick="return false;" class="cd-close">Close</a>
    </div>

    <a onclick="return false;" class="cd-filter-trigger">Filters</a>
  </div>
  <script src="resources/lib/mixitup/jquery.mixitup.min.js"></script>
  <script src="resources/js/search-imgscroll.js"></script>
