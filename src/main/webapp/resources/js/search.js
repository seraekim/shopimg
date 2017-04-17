// datetimepicker 초기화
$(function() {
	$('#datetimepicker').datetimepicker({
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
	});
});

// 기간버튼 클릭 이벤트
//$('.button').click(function() {
//	if (!$(this).hasClass('active')) {
//		$(this).siblings().removeClass('active');
//		$(this).addClass('active');
//	}
//});

$.ajax({
	type : "POST",
	url : ctxp + "/shopImg/search",
	dataType : 'json'
}).done(function(res) {
	var $tb = $('#tb_shop_img');
	var tdWidth = 790 / ($tb.find('colgroup col').length-1);
	$tb.find('td:gt(0)').css('width', tdWidth+'px');
	console.log(res);
	for(var i in res.img) {
		$('#d_'+res.img[i].d).append('<div class="thum"><a href="img/'+res.img[i].img
				+'" target="_blank" class="thumbnail"> <img src="img/'
				+res.img[i].img+'" onerror="this.src = \'resources/img/no_img.png\'"> </a></div>');
	}
}).fail(function(xhr, status, e) {
	console.log(xhr, status, e);
});

$(function() {
	$('.thumbnail').on('click', function() {
		$('.imagepreview').attr('src', $(this).find('img').attr('src'));
		$('#imagemodal').modal('show');   
	});		
});