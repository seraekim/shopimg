<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
  <link href="resources/css/search-imgscroll.css" rel="stylesheet">
  <header class="cd-header">
    <h1>Content Filters</h1>
  </header>

  <div class="cd-main-content">
    <div class="cd-tab-filter-wrapper">
      <div class="cd-tab-filter">
        <ul class="cd-filters">
          <li class="placeholder">
            <a data-type="all" href="#0" onclick="return false;" >All</a>
            <!-- selected option on mobile -->
          </li>
          <li class="filter"><a class="selected" href="#0" onclick="return false;" data-type="all">All</a></li>
          <li class="filter" data-filter=".20170410"><a href="#0" onclick="return false;" data-type="20170410">20170410</a></li>
          <li class="filter" data-filter=".color-2"><a href="#0" onclick="return false;" data-type="color-2">Color 2</a></li>
        </ul>
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
            <input type="search" placeholder="Try color-1...">
          </div>
          <!-- cd-filter-content -->
        </div>
        <!-- cd-filter-block -->

        <div class="cd-filter-block">
          <h4>Check boxes</h4>

          <ul class="cd-filter-content cd-filters list">
          </ul>
          <!-- cd-filter-content -->
        </div>
        <!-- cd-filter-block -->

        <div class="cd-filter-block">
          <h4>Select</h4>

          <div class="cd-filter-content">
            <div class="cd-select cd-filters">
              <select class="filter" name="selectThis" id="selectThis">
                <option value="">Choose an option</option>
                <option value=".option1">Option 1</option>
                <option value=".option2">Option 2</option>
                <option value=".option3">Option 3</option>
                <option value=".option4">Option 4</option>
              </select>
            </div>
            <!-- cd-select -->
          </div>
          <!-- cd-filter-content -->
        </div>
        <!-- cd-filter-block -->

        <div class="cd-filter-block">
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
          <!-- cd-filter-content -->
        </div>
        <!-- cd-filter-block -->
      </form>

      <a href="#0" onclick="return false;" class="cd-close">Close</a>
    </div>
    <!-- cd-filter -->

    <a href="#0" onclick="return false;" class="cd-filter-trigger">Filters</a>
  </div>
  <script src="resources/lib/mixitup/jquery.mixitup.min.js"></script>
  <script src="resources/js/search-imgscroll.js"></script>
