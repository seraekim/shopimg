<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctxp" value="${pageContext.request.contextPath}" />

  <title>쇼핑몰조회하기</title>
  
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <link href="${ctxp}/resources/lib/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="${ctxp}/resources/lib/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
  <link href="${ctxp}/resources/css/non-responsive.css" rel="stylesheet">
  <link href="${ctxp}/resources/lib/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet">
  <link href="${ctxp}/resources/css/style.css" rel="stylesheet">
  <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
  <script src="${ctxp}/resources/lib/jquery.min.js"></script>
  <script src="${ctxp}/resources/lib/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
  <script src="${ctxp}/resources/lib/moment-with-locales.js"></script>
  <script src="${ctxp}/resources/lib/datetimepicker/bootstrap-datetimepicker.min.js"></script>
  <script>var ctxp = '${ctxp}'; //'${sessionScope.id}'</script>