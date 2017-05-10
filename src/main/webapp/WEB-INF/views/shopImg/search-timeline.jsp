<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
html, body {
	height: 100%;
	overflow: hidden;
}

#visualization {
	height: calc(100% - 60px);
}

#preview {
	position: absolute;
	border: 1px solid #ccc;
	background: #333;
	padding: 5px;
	display: none;
	color: #fff;
	box-shadow: 2px rgba(103, 115, 130, 0.5);
	z-index: 1000;
}

#preview img {
	width: 600px;
	height: 400px;
}
</style>
<script src="resources/lib/vis/dist/vis.js"></script>
<link href="resources/lib/vis/dist/vis-timeline-graph2d.min.css" rel="stylesheet" type="text/css" />
<div id="visualization"></div>
<script src="resources/js/search-timeline.js"></script>
<script src="resources/js/imgpreview.js"></script>
