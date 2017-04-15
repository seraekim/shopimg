<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="ko">
<head>

<!-- script & css START! -->
<tiles:insertAttribute name="resources" />
<!-- script & css END! -->
</head>

<body id="wrap">

	<div id="container_main">

		<!-- contents START! -->
		<tiles:insertAttribute name="content" />
		<!-- contents END! -->

		<!-- footer START! -->
		<tiles:insertAttribute name="footer" />
		<!-- footer END! -->

	</div>


</body>
</html>
