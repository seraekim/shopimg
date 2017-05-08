var failCnt = 0;

(function () {
  $.fn.srkimImgScroll = function (options) {

    console.log(options);

    var defaults = {
      width: 360,
      delay: 60,
      repeatShow: false
    };
    var config = $.extend({}, defaults, options);

    console.log(config);

    var ul = this;
    var show = function (li) {
      if ($(window).scrollTop() + $(window).height() > $(li).offset().top) {
        //$(li).addClass('show2');
      } else if ($(window).scrollTop() + $(window).height() < $(li).offset().top) {
        if (config.repeatShow) {
          //$(li).removeClass('show2');
        }
      }
    }
    var refresh = function () {
      if (ul.length <= 0) {
        return;
      }

      ul.css({
        "position": "relative"
      });

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

        lis.css({
          "position": "absolute",
          "width": config.width
        });

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

$(document).ready(function () {
  /*$('.cd-gallery ul').srkimImgScroll({
    width: 360,
    delay: 200
  });*/
  
  var loading = false;
  var dist = 200;
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
  		var time = o.img.split('.')[1].substring(0,8);
  		var time2 = o.d.substring(0,4)+'-'+o.d.substring(4,6)+'-'+o.d.substring(6,8)+' '+o.h+'시';
  		imgList.push({img:o.img+'.win.jpg',snm:o.sNm, cid:o.cId, t: time, t2: time2});
  		//var imgStrArr = o.img.split('.');
  	}
  	
  	for(var i in res.date) {
  		$('.cd-filter-block ul').append('<li><input class="filter" data-filter=".d'+res.date[i]+'" type="checkbox" id="checkbox'+i+'">'+
  				'<label class="checkbox-label" for="checkbox'+i+'">'+res.date[i]+'</label></li>');
  	}
  	
    setInterval(function () {
      //console.log(res.img.length, $('li > .grid > figure > img').length);
      if ((res.img.length > 0 && $('li > .grid > figure > img').length == 0)||(failCnt == 0 || $('.cd-fail-message').css('display') == 'none') && $(window).scrollTop() >= $(document).height() - $(window).height() - dist 
    		  && !loading && num < res.img.length) {
        loading = true;
        $(".cd-gallery ul").append('<li class="mix d'+imgList[num].t+'"><div class="grid">'+
        		'<figure class="effect-zoe"><img src="img/' + imgList[num].img + '"><figcaption>'+
        		imgList[num].snm+'<br>'+imgList[num].cid+'<br>'+imgList[num].t2+'</figcaption></figure></div></li>');
//        if (num == 9) {
//          num = 1;
//        } else {
          num++;
//        }
        loading = false;
        $('.filter .selected').trigger('click');
      }
    }, 200);
    
    setTimeout(function(){
      lazyLoading();
    }, 1000);
  }).fail(function(xhr, status, e) {
  	console.log(xhr, status, e);
  });
  
});

var lazyLoading = function () {
  $('.cd-fail-message').text('No results found');
  
  //open/close lateral filter
  $('.cd-filter-trigger').on('click', function () {
    triggerFilter(true);
  });
  $('.cd-filter .cd-close').on('click', function () {
    triggerFilter(false);
  });

  function triggerFilter($bool) {
    console.log($bool);
    var elementsToTrigger = $([$('.cd-filter-trigger'), $('.cd-filter'), $('.cd-tab-filter'), $('.cd-gallery')]);
    elementsToTrigger.each(function () {
      $(this).toggleClass('filter-is-visible', $bool);
    });
  }

  //mobile version - detect click event on filters tab
  var filter_tab_placeholder = $('.cd-tab-filter .placeholder a'),
    filter_tab_placeholder_default_value = 'Select',
    filter_tab_placeholder_text = filter_tab_placeholder.text();
  
  var selected_filter;
  $('.cd-tab-filter li').on('click', function (event) {
    //detect which tab filter item was selected
    var imsi = $(event.target).data('type');
    if(selected_filter == imsi && $('html').css('overflow') == 'hidden') {
      return;
    } else {
      selected_filter = imsi;
    }
    console.log(selected_filter);
    //check if user has clicked the placeholder item
    if ($(event.target).is(filter_tab_placeholder)) {
      (filter_tab_placeholder_default_value == filter_tab_placeholder.text()) ? filter_tab_placeholder.text(filter_tab_placeholder_text): filter_tab_placeholder.text(filter_tab_placeholder_default_value);
      $('.cd-tab-filter').toggleClass('is-open');

      //check if user has clicked a filter already selected 
    } else if (filter_tab_placeholder.data('type') == selected_filter) {
      filter_tab_placeholder.text($(event.target).text());
      $('.cd-tab-filter').removeClass('is-open');

    } else {
      //close the dropdown and change placeholder text/data-type value
      $('.cd-tab-filter').removeClass('is-open');
      filter_tab_placeholder.text($(event.target).text()).data('type', selected_filter);
      filter_tab_placeholder_text = $(event.target).text();

      //add class selected to the selected filter item
      $('.cd-tab-filter .selected').removeClass('selected');
      $(event.target).addClass('selected');
    }
  });

  //close filter dropdown inside lateral .cd-filter 
  $('.cd-filter-block h4').on('click', function () {
    $(this).toggleClass('closed').siblings('.cd-filter-content').slideToggle(300);
  })

  //fix lateral filter and gallery on scrolling
  $(window).on('scroll', function () {
    (!window.requestAnimationFrame) ? fixGallery(): window.requestAnimationFrame(fixGallery);
  });

  function fixGallery() {
    var offsetTop = $('.cd-main-content').offset().top,
      scrollTop = $(window).scrollTop();
    (scrollTop >= offsetTop) ? $('.cd-main-content').addClass('is-fixed'): $('.cd-main-content').removeClass('is-fixed');
  }

  /************************************
  	MitItUp filter settings
  	More details: 
  	https://mixitup.kunkalabs.com/
  	or:
  	http://codepen.io/patrickkunka/
  *************************************/

  buttonFilter.init();
  $('.cd-gallery ul').mixItUp({
    controls: {
      enable: false
    },
    callbacks: {
      onMixStart: function () {
//        $('.cd-fail-message').fadeOut(200);
        $('.cd-fail-message').hide();
        $('html').attr('style','overflow:""');
      },
      onMixFail: function () {
//        $('.cd-fail-message').fadeIn(200);
        $('.cd-fail-message').show();
        $('html').attr('style','overflow:hidden');
        failCnt++;
      }
    }
  });

  //search filtering
  //credits http://codepen.io/edprats/pen/pzAdg
  var inputText;
  var $matching = $();

  var delay = (function () {
    var timer = 0;
    return function (callback, ms) {
      clearTimeout(timer);
      timer = setTimeout(callback, ms);
    };
  })();

  $(".cd-filter-content input[type='search']").keyup(function () {
    // Delay function invoked to make sure user stopped typing
    delay(function () {
      inputText = $(".cd-filter-content input[type='search']").val().toLowerCase();
      // Check to see if input field is empty
      if ((inputText.length) > 0) {
        $('.mix').each(function () {
          var $this = $(this);

          // add item to be filtered out if input text matches items inside the title   
          if ($this.attr('class').toLowerCase().match(inputText)) {
            $matching = $matching.add(this);
          } else {
            // removes any previously matched item
            $matching = $matching.not(this);
          }
        });
        $('.cd-gallery ul').mixItUp('filter', $matching);
      } else {
        // resets the filter to show all item if input is empty
        $('.cd-gallery ul').mixItUp('filter', 'all');
      }
    }, 200);
  });
}
/*****************************************************
	MixItUp - Define a single object literal 
	to contain all filter custom functionality
*****************************************************/
var buttonFilter = {
  // Declare any variables we will need as properties of the object
  $filters: null,
  groups: [],
  outputArray: [],
  outputString: '',

  // The "init" method will run on document ready and cache any jQuery objects we will need.
  init: function () {
    var self = this; // As a best practice, in each method we will asign "this" to the variable "self" so that it remains scope-agnostic. We will use it to refer to the parent "buttonFilter" object so that we can share methods and properties between all parts of the object.

    self.$filters = $('.cd-main-content');
    self.$container = $('.cd-gallery ul');

    self.$filters.find('.cd-filters').each(function () {
      var $this = $(this);

      self.groups.push({
        $inputs: $this.find('.filter'),
        active: '',
        tracker: false
      });
    });

    self.bindHandlers();
  },

  // The "bindHandlers" method will listen for whenever a button is clicked. 
  bindHandlers: function () {
    var self = this;

    self.$filters.on('click', 'a', function (e) {
      self.parseFilters();
    });
    self.$filters.on('change', function () {
      self.parseFilters();
    });
  },

  parseFilters: function () {
    var self = this;

    // loop through each filter group and grap the active filter from each one.
    for (var i = 0, group; group = self.groups[i]; i++) {
      group.active = [];
      group.$inputs.each(function () {
        var $this = $(this);
        if ($this.is('input[type="radio"]') || $this.is('input[type="checkbox"]')) {
          if ($this.is(':checked')) {
            group.active.push($this.attr('data-filter'));
          }
        } else if ($this.is('select')) {
          group.active.push($this.val());
        } else if ($this.find('.selected').length > 0) {
          group.active.push($this.attr('data-filter'));
        }
      });
    }
    self.concatenate();
  },

  concatenate: function () {
    var self = this;

    self.outputString = ''; // Reset output string

    for (var i = 0, group; group = self.groups[i]; i++) {
      self.outputString += group.active;
    }

    // If the output string is empty, show all rather than none:    
    !self.outputString.length && (self.outputString = 'all');

    // Send the output string to MixItUp via the 'filter' method:    
    if (self.$container.mixItUp('isLoaded')) {
      self.$container.mixItUp('filter', self.outputString);
    }
  }
};