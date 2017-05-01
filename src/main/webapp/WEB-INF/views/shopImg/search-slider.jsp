<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="resources/lib/flexslider/flexslider.css" rel="stylesheet" />
<style>
.slider { margin: 20px 0 10px!important;}
.carouseler li {margin-right: 5px;}
.carouseler img {display: block; opacity: .5; cursor: pointer;}
.carouseler img:hover {opacity: 1;}
.carouseler .flex-active-slide img {opacity: 1; cursor: default;}

#sliderWrap {
width: 1000px;
margin: 0 auto;
}
</style>
<div id="sliderWrap" style="visible:hidden;">
      <section class="slider">
        <div class="mysliders flexslider">
          <ul class="slides">
          </ul>
        </div>
        <div class="carouseler flexslider">
          <ul class="slides">
          </ul>
        </div>
      </section>
      </div>
<script src="resources/lib/flexslider/jquery.flexslider.js"></script>
<script>
	$(document).ready(function() {

		$.ajax({
			type : "POST",
			url : ctxp + "/shopImg/search-timeline",
			dataType : 'json',
			data : $('#form_search').serialize()
		}).done(function(res) {
			console.log(res);

			var itemList = [];
			/*for ( var i in res.img) {
				var o = res.img[i];
				var start = o.d.substring(0, 4) + '-' + o.d.substring(4, 6) + '-' + o.d.substring(6, 8) + ' ' + o.h + ':00:00';
				var content = o.sId;
				var sNm = o.sNm;
				var imgUrl = o.img;
				var cId = o.cId;
				itemList.push({
					id : o.d + o.h + cId,
					content : sNm + o.h,
					start : start,
					group : cId,
					'img' : imgUrl
				});
			}*/
			for ( var i in res.img) {
				var o = res.img[i];
				var winImg = o.img + '.win.jpg';
				$('.mysliders.flexslider ul').append('<li><img src="img/'+winImg+'" /></li>');
				$('.carouseler.flexslider ul').append('<li><img src="img/'+winImg+'" /></li>');
			}

			
	    	for(var i=0;i<$('.mysliders').length;i++){
	    		$('.mysliders').eq(i).attr('id', 'big'+i);
	    		$('.carouseler').eq(i).attr('id', 'small'+i);
	    		
	    		$('#small'+i).flexslider({
	    	        animation: "slide",
	    	        controlNav: false,
	    	        animationLoop: true, //false
	    	        slideshow: true, //false
	    	        itemWidth: 150,
	    	        itemMargin: 5,
	    	        asNavFor: '#big'+i
	    	      });

	    	      $('#big'+i).flexslider({
	    	        animation: "slide",
	    	        controlNav: false,
	    	        animationLoop: true, //false
	    	        slideshow: true, //false
	    	        sync: "#small"+i,
	    	        start: function(slider){
	    	          $('#sliderWrap').fadeIn(250);
	    	        },
	    	      slideshowSpeed: 2000,
	              pausePlay: true,
	      pauseText: 'Pause',
	      playText: 'Play'
	    	      });
	    	}
	    	$('.flex-direction-nav a').css('height','47px');
	    	$('.mysliders img').css('width','1000px');
	    	//$('.mysliders img').css('height','410px');
	    	$('.carouseler img').css('width','150px');
	    	$('.carouseler img').css('height','100px');
			
			
			
			
			
			
			
			/* $('.flexslider').flexslider({
				animation : "slide",
				controlNav : "thumbnails",
				start : function(slider) {
				}
			}); */
		}).fail(function(xhr, status, e) {
			console.log(xhr, status, e);
		});

	});
</script>

