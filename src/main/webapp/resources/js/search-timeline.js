// datetimepicker 초기화
$(function() {
	/*$('#datetimepicker').datetimepicker({
		dayViewHeaderFormat : 'YYYY-MM',
		locale : 'ko',
		format : 'YYYYMMDD'
	});
	$('#datetimepicker2').datetimepicker({
		dayViewHeaderFormat : 'YYYY-MM',
		locale : 'ko',
		format : 'YYYYMMDD',
		useCurrent : false
	});
	$("#datetimepicker").on("dp.change", function(e) {
		$('#datetimepicker2').data("DateTimePicker").minDate(e.date);
	});
	$("#datetimepicker2").on("dp.change", function(e) {
		$('#datetimepicker').data("DateTimePicker").maxDate(e.date);
	});*/
});

//DOM element where the Timeline will be attached
var container = document.getElementById('visualization');


$.ajax({
	type : "POST",
	url : ctxp + "/shopImg/search",
	dataType : 'json',
	data : $('#form_search').serialize()
}).done(function(res) {
	console.log(res);

	var itemList = [];
	for (var i in res.img) {
		var o = res.img[i];
		var start = o.d.substring(0,4)+'-'+o.d.substring(4,6)+'-'+o.d.substring(6,8) + ' ' + o.h +':00:00';
		var content = o.sId;
		var sNm = o.sNm;
		var imgUrl = '/img'+o.img+'.win.jpg';
		var cId = o.cId;
		itemList.push({id: o.d+o.h+cId, content: sNm+o.h, start: start, group: cId, 'img': imgUrl, className: 'preview'});
	}
	
	var groups = [];
	for (var i in res.cate) {
		var g = res.cate[i];
		groups.push({id: g, content: g});
	}
	var items = new vis.DataSet(itemList);

	// Configuration for the Timeline
	var options = {
		height : '100%',
		zoomMin : 1000 * 60 * 60,
		zoomMax : 1000 * 60 * 60 * 24 * 365,
		dataAttributes : ['img'],
		format : {
			minorLabels : {
				millisecond : 'SSS',
				second : 's',
				minute : 'HH:mm',
				hour : 'HH:mm',
				weekday : 'D(ddd)',
				day : 'D',
				month : 'MMM',
				year : 'YYYY'
			},
			majorLabels : {
				millisecond : 'HH:mm:ss',
				second : 'MM-DD(ddd) HH:mm',
				minute : 'YYYY-MM-DD(ddd)',
				hour : 'YYYY-MM-DD(ddd)',
				weekday : 'YYYY-MM',
				day : 'YYYY-MM',
				month : 'YYYY',
				year : ''
			}
		},
		groupOrder: function (a, b) {
			if ( a.id < b.id )
				return 1;
			if ( a.id > b.id )
				return -1;
			return 0;
		},
		verticalScroll: true,
		zoomKey: 'ctrlKey'
	};
	// Create a Timeline
	var timeline = new vis.Timeline(container, items, groups, options);
	/*setTimeout(function () {
		  //alert('Now everything is loaded!');
		imagePreview('.vis-item.vis-box.preview', 'body');
	}, 1000);*/
	/*function onMousemove(event) {
		var properties = timeline.getEventProperties(event);
		var selection = timeline.getSelection();
		var w = timeline.getWindow();
		// properties contains things like node id, group, x, y, time, etc.
		console.log(properties);
	}
	container.addEventListener('mousemove', onClick);*/
	/*timeline.on('select', function(properties) {
		console.log('selected items: ', $('#'+properties.items[0]), $(properties.event.target).parent());
	});*/
    timeline.on('rangechanged', function (properties) {
		//console.log('rangechanged: ', properties);
		imagePreview('.vis-item.vis-box.preview', 'body');
    });
}).fail(function(xhr, status, e) {
	console.log(xhr, status, e);
});
