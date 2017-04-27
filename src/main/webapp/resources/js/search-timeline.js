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
	url : ctxp + "/shopImg/search-timeline",
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
		var imgUrl = o.img;
		var cId = o.cId;
		itemList.push({id: o.d+o.h+cId, content: sNm+o.h, start: start, group: cId, 'img': imgUrl});
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
		}
	};
	// Create a Timeline
	var timeline = new vis.Timeline(container, items, groups, options);
	/*function onClick(event) {
		var properties = timeline.getEventProperties(event);
		var selection = timeline.getSelection();
		var w = timeline.getWindow();
		var w = timeline.getWindow();
		// properties contains things like node id, group, x, y, time, etc.
		console.log('click',properties);
	}
	container.addEventListener('click', onMouseover);*/
	timeline.on('select', function(properties) {
		console.log('selected items: ', properties);
	});
}).fail(function(xhr, status, e) {
	console.log(xhr, status, e);
});

$(function() {
	$('.thumbnail').on('click', function() {
		$('.imagepreview').attr('src', $(this).find('img').attr('src'));
		$('#imagemodal').modal('show');   
	});		
});