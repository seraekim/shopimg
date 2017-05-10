<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="resources/lib/juxtapose/juxtapose.css">
<%-- <div class="juxtapose" data-startingposition="50%" data-animate="true">
	<img src="${img1}" data-credit="${img1}" data-label="${img1}" /> 
	<img src="${img2}" data-credit="${img2}" data-label="${img2}" />
</div> --%>
<div style="width:80%;margin:0 auto;">
<div><input type="radio" name="mode" id="horizontal" checked> 가로방향 <input type="radio" name="mode" id="vertical">세로방향</div>
<div id="foo" style=""></div>
</div>
<script src="resources/lib/juxtapose/juxtapose.js"></script>
<script>
	var imgs = [ {
		src : '${img1}',
		label : '${img1}',
		credit : 'Image Credit'
	}, {
		src : '${img2}',
		label : '${img2}',
		credit : "Image Credit"
	} ],
	opts = {
		animate : true,
		showLabels : true,
		showCredits : true,
		startingPosition : "50%"
		/* ,
		makeResponsive : true */
	},
	slider = createJuxtapose();
	
	function createJuxtapose() {
		$('#foo').empty();
		slider = new juxtapose.JXSlider('#foo', imgs, opts)
	}
	
	$('input[name="mode"]').on('change', function(){
		opts.mode = $(this).attr('id');
		createJuxtapose();
	});
</script>
