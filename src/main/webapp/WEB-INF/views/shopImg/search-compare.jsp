<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <link rel="stylesheet" href="resources/lib/juxtapose/juxtapose.css">
<div style="width:80%;margin:0 auto;">
<div><input type="radio" name="mode" id="horizontal" checked> 가로방향 <input type="radio" name="mode" id="vertical">세로방향</div>
<a href="#">${pageContext.request.requestURI}</a><br>
<a href="#">${pageContext.request.requestURL}</a><br>
<a href="#">${requestScope['javax.servlet.forward.request_uri']}</a><br>
<a href="#">${pageContext.request.requestURI}</a><br>
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
		startingPosition : "50%",
		makeResponsive : true
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
</script> --%>
<style>
.tiles {
	position: absolute;
	/* top: 10%; */
	left: 5%;
	width: 90%;
	/* height: 80%; */
}

.tile {
	position: relative;
	float: left;
	width: 50%;
	/* height: 66%; */
	overflow: hidden;
}

.photo {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	transition: transform .5s ease-out;
}

.txt {
	position: absolute;
	z-index: 2;
	right: 0;
	bottom: 10%;
	left: 0;
	font-family: 'Roboto Slab', serif;
	font-size: 9px;
	line-height: 12px;
	text-align: center;
	cursor: default;
}

.x {
	font-size: 32px;
	line-height: 32px;
}

#hello {
	width: 90%;
	margin: 0 auto;
}

:-webkit-full-screen :not(.tiles *){display:none}
:-moz-full-screen :not(.tiles *){display:none}

</style>
<div id="hello">sdfasdfasdf</div>
<div id="tiles" class="tiles">
	<div class="tile" data-scale="0" data-image="${img1}"></div>
	<div class="tile" data-scale="0" data-image="${img2}"></div>
</div>
<script>

$(document).ready(function(){
	updateTiles();
});

$(window).resize(function(){
	updateTiles();
});


$('.tile').on('click', function(){
	toggleFullScreen();
});

function updateTiles() {
	var w = $('.tile').width();
	var ratio = (1920 / w).toFixed(1);
	
	$('.tile').attr('data-scale',ratio);
	$('.tiles, .tile').css('height',w * 0.5625 +'px');
	$('.tile')
	.on('mouseover', function () {
	    $('.tile').children('.photo').css({
	        'transform': 'scale(' + $(this).attr('data-scale') + ')'
	    });
	})
	.on('mouseout', function () {
	    $('.tile').children('.photo').css({
	        'transform': 'scale(1)'
	    });
	})
	.on('mousemove', function (e) {
	    $('.tile').children('.photo').css({
	        'transform-origin': ((e.pageX - $(this).offset().left) / $(this).width()) * 100 + '% ' + ((e.pageY - $(this).offset().top) / $(this).height()) * 100 + '%'
	    });
	})
	.each(function () {
	    $(this).empty()
	        .append('<div class="photo"></div>')
	        .append('<div class="txt"><div class="x">' + $(this).attr('data-scale') + 'x</div>ZOOM ON<br>HOVER</div>')
	        .children('.photo').css({
	            'background-image': 'url(' + $(this).attr('data-image') + ')'
	        });
	});
}
function toggleFullScreen() {
var elem = document.getElementById("tiles");
if (elem.requestFullscreen) {
  elem.requestFullscreen();
} else if (elem.msRequestFullscreen) {
  elem.msRequestFullscreen();
} else if (elem.mozRequestFullScreen) {
  elem.mozRequestFullScreen();
} else if (elem.webkitRequestFullscreen) {
  elem.webkitRequestFullscreen();
}
}
</script>