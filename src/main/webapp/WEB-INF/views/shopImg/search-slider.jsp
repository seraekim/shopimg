<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="resources/lib/flexslider/flexslider.css" rel="stylesheet" />
<link href="resources/lib/noUiSlider.9.2.0/nouislider.css" rel="stylesheet" />
<link href="resources/css/hover.css" rel="stylesheet">
<style>
.slider {
	margin: 20px 0 10px !important;
}

.carouseler li {
	margin-right: 5px;
}

.carouseler img {
	display: block;
	opacity: .5;
	cursor: pointer;
}

.carouseler img:hover {
	opacity: 1;
}

.carouseler .flex-active-slide img {
	opacity: 1;
	cursor: default;
}

#sliderWrap {
	width: 925px;
	margin: 0 auto;
	position: relative;
	left: -99999px;
}
#sliderWrap.load {
	left: 0;
}
.flex-direction-nav a {
	height: 47px;
}

.mysliders img {
	width: 925px;
}

.carouseler img {
	width: 150px;
	height: 100px;
}
.flex-caption {
  width: 96%;
  padding: 2%;
  left: 0;
  bottom: 0;
  background: rgba(0,0,0,.5);
  color: #fff;
  text-shadow: 0 -1px 0 rgba(0,0,0,.3);
  font-size: 14px;
  line-height: 18px;
}
.grid figure figcaption {
    padding: 10px;
    background: rgba(0, 0, 0, 0.65);
    width: auto;
    height: auto;
}
</style>
<div id="sliderWrap">

</div>
<script src="resources/lib/flexslider/jquery.flexslider.js"></script>
<script src="resources/js/wNumb.js"></script>
<script src="resources/lib/noUiSlider.9.2.0/nouislider.js"></script>
<script>
	function timestamp(str) {
		return new Date(toDateConstructFormat(str)).getTime();
	}
	function midTimestamp(d1, d2) {
		var date1 = new Date(toDateConstructFormat(d1)).getTime();
		var date2 = new Date(toDateConstructFormat(d2)).getTime();
		return date1 + (date2 - date1) / 2;
	}
	function toDateConstructFormat(date) {
		if (date.constructor == Date) {
			return date.getFullYear() + '-' + ('0' + (date.getMonth() + 1)).slice(-2) + '-' + ('0' + date.getDate()).slice(-2);
		} else if (date.constructor == String) {
			return date.substring(0, 4) + '-' + date.substring(4, 6) + '-' + date.substring(6, 8);
		}
	}
	function toFormat(v) {
		return toDateConstructFormat(new Date(v)).replace(/-/g, '');
	}

	$(document).ready(function() {
		$.ajax({
			type : "POST",
			url : ctxp + "/shopImg/search",
			dataType : 'json'
			//,data : $('#form_search').serialize()
		}).done(function(res) {
			console.log(res);
			$('#sliderWrap').removeClass('load')
			$('#sliderWrap').html('<section class="slider">'+
					'<div id="big" class="mysliders flexslider">'+
					'<ul class="slides">'+
					'</ul>'+
				'</div>'+
				'<div id="small" class="carouseler flexslider">'+
					'<ul class="slides">'+
					'</ul>'+
				'</div>'+
			'</section>'+
			'<div id="date-range"></div>');
			if(res.date.length && res.img.length) {
				
			var itemList = [];
			var dateRange = document.getElementById('date-range');
			//var date2NumArr = res.date.map(Number);
			noUiSlider.create(dateRange, {
				behaviour : 'drag',
				start : timestamp(res.date[0]),
				step : 1 * 24 * 60 * 60 * 1000,
				tooltips : true,
				format : {
					to : toFormat,
					from : Number
				},
				range : {
					min : timestamp(res.date[0]),
					max : timestamp(res.date[res.date.length - 1])
				},//customRange,
				pips : {
					mode : 'values',
					values : [ timestamp(res.date[0]), midTimestamp(res.date[0], res.date[res.date.length - 1]), timestamp(res.date[res.date.length - 1]) ],
					format : {
						to : toFormat,
						from : Number
					},
					stepped : true
				}
			});

			var rangeState = 0;
			var currentSlideDate;
			dateRange.noUiSlider.on('start', function(a, b, c, d) {
				rangeState = 1;
			});
			
			dateRange.noUiSlider.on('end', function(a, b, c, d) {
				rangeState = 0;
				if(currentSlideDate != a) {
					//$('#big').flexslider('pause');
					$('.carouseler.flexslider ul li[data-date="d'+a+'"]').eq(1).trigger('click');
					$('.carouseler.flexslider ul li[data-date="d'+a+'"]').eq(0).trigger('click');
				}
				//$('#big').data("flexslider").flexAnimate(0, true, true);
				//$('#big').flexslider(0);
			});

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
				$('.mysliders.flexslider ul').append('<li data-date=d'+o.d+'><div class="grid"><figure class=""><img src="img/'+winImg+'" /><figcaption>'+
						o.sNm+' '+o.cId+'<br>'+o.d+' '+o.h+'시'+'</figcaption></figure></div></li>');
// 				$('.carouseler.flexslider ul').append('<li data-date=d'+o.d+'><div class="grid"><figure class="effect-inact-info"><img src="img/'+winImg+'" /><figcaption>'+
// 		        		'dfdfdfdf'+'</figcaption></figure></div></li>');
				$('.carouseler.flexslider ul').append('<li data-date=d'+o.d+'><img src="img/'+winImg+'" /></li>');
			}

			$('#small').flexslider({
				animation : "slide",
				controlNav : false,
				animationLoop : false, //false
				slideshow : false, //false
				itemWidth : 150,
				itemMargin : 5,
				asNavFor : '#big'
			});

			$('#big').flexslider({
				animation : "slide",
				controlNav : false,
				animationLoop : false, //false
				slideshow : false, //false
				sync : "#small",
				start : function(slider) {
					currentSlideDate = $('#big .flex-active-slide').data('date').substring(1);
				},
				slideshowSpeed : 3000,
				pausePlay : true,
				pauseText : 'Pause',
				playText : 'Play',
				after : function() {
					if(rangeState == 0) {
						var a = $('#big .flex-active-slide').data('date').substring(1);
						if(currentSlideDate != a) {
							currentSlideDate = a;
							console.log(currentSlideDate);
							dateRange.noUiSlider.set(timestamp(currentSlideDate));
						}
					}
				}
			});

			//$('.flex-pause').trigger('click');
			//$('.flex-play').trigger('click');
			$('#big').flexslider('pause');
			$('#big').flexslider('play');
			/* $('.flexslider').flexslider({
				animation : "slide",
				controlNav : "thumbnails",
				start : function(slider) {
				}
			}); */
			setTimeout(function(){$('#sliderWrap').addClass('load');}, 100);
			
			} else {
				alert('검색결과가 없습니다.');
			}
		}).fail(function(xhr, status, e) {
			console.log(xhr, status, e);
		});

	});
</script>

