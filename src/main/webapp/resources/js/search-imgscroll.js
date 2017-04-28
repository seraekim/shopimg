(function() {
  $.fn.srkimImgScroll = function(options) {

    console.log(options);

    var defaults = {
      width: 360,
      delay: 60,
      repeatShow: false
    };
    var config = $.extend({}, defaults, options);

    console.log(config);

    var ul = this;
    var show = function(li) {
      if ($(window).scrollTop() + $(window).height() > $(li).offset().top) {
        $(li).addClass('show');
      } else if ($(window).scrollTop() + $(window).height() < $(li).offset().top) {
        if (config.repeatShow) {
          $(li).removeClass('show');
        }
      }
    }
    var refresh = function() {
      if (ul.length <= 0) {
        return;
      }

      ul.css({"position": "relative"});

      var lis = $(ul).children("li");

      if (lis.length <= 0) {
        return;
      }

      var ul_width = $(ul).width();
      var ul_column = parseInt(ul_width / config.width);

      if (lis.length < ul_column) {
        ul_column = lis.length;
      }

      var li_left = (ul_width - ul_column * config.width) / 2;

      if (ul_column > 0) {
        $(ul).removeClass('min');

        lis.css({"position": "absolute", "width": config.width});

        var maxHeight = 0;
        var list = []
        var nlist = []

        for (var i = 0; i < lis.length; i++) {
          list.push({
            "index": i,
            "bottom": 0,
            "height": $(lis[i]).height()
          });
        }

        for (var i = 0; i < ul_column; i++) {
          nlist.push([]);
        }

        for (var i = 0; i < lis.length; i++) {
          if (i < ul_column) {
            list[i]["bottom"] = list[i]["height"];
            nlist[i].push(list[i]);
          } else {
            var b = 0;
            var l = 0;
            for (var j = 0; j < ul_column; j++) {
              var jh = nlist[j][nlist[j].length - 1]["bottom"] + list[i]["height"];
              if (b == 0 || jh < b) {
                b = jh;
                l = j;
              }
            }
            list[i]["bottom"] = b;
            nlist[l].push(list[i]);
          }
        }

        for (var i = 0; i < nlist.length; i++) {
          for (var j = 0; j < nlist[i].length; j++) {
            $(lis[nlist[i][j]["index"]]).css({
              "left": i * config.width + li_left,
              "top": nlist[i][j]["bottom"] - nlist[i][j]["height"]
            });
          }
        }

        for (var i = 0; i < nlist.length; i++) {
          var h = nlist[i][nlist[i].length - 1]["bottom"];
          if (maxHeight < h) {
            maxHeight = h;
          }
        }
        $(ul).css("height", maxHeight);
      } else {
        lis.attr("style", "");
        ul.attr("style", "");
        $(ul).addClass('min');
      }

      for (var i = 0; i < lis.length; i++) {
        show(lis[i]);
      }
    }

    refresh();
    setInterval(refresh, config.delay);
  }
})();


$(document).ready(function() {
	$('#imgscroll').srkimImgScroll({
		width : 360,
		delay : 200
	});
});

$('#imgscroll').on('click', 'li.show div', function() {
	var $src = $(this).children('img').attr('src');
	window.open($src, '_blank');
	console.log($(this).index(), $src);
});
/*
function random(min, max) {
	return min + Math.floor(Math.random() * (max - min + 1))
}

function pad(num, size) {
	return ('0000' + num).substr(-size);
}*/
var loading = false;
var dist = 500;
var num = 0;
var imgList = [];


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
	for (var i in res.img) {
		var o = res.img[i];
		imgList.push(o.img);
	}
	setInterval(function() {
		if ($(window).scrollTop() >= $(document).height() - $(window).height() - dist && !loading) {
			loading = true;
			$("#imgscroll").append('<li><div><img src="img/' + imgList[num] + '"></div></li>');
//			if (num == 14) {
//				num = 0;
//			} else {
				num++;
//			}
			loading = false;
		}
	}, 200);
}).fail(function(xhr, status, e) {
	console.log(xhr, status, e);
});
