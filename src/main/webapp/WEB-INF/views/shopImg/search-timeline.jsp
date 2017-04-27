<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <style type="text/css">
    html, body {
      height: 100%;
      overflow: hidden;
    }
    #visualization {
      height: calc(100% - 60px);
    }
  </style>
  <script src="resources/lib/vis/dist/vis.js"></script>
  <link href="resources/lib/vis/dist/vis-timeline-graph2d.min.css" rel="stylesheet" type="text/css" />
  <div id="visualization"></div>
  <script src="resources/js/search-timeline.js"></script>
