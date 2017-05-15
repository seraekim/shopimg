// 설정 > 월별조회 > select option 채우기
var now = moment();
now.add(1, 'months');
for (var i = 0; i < 24; i++) {
	$('#sel_mon').append('<option>' + now.add(-1, 'months').format('YYYYMM') + '</option>');
}
if (m) {
	$('#sel_mon').val(m);
}
$('#sel_mon').change(function(){
	$('#radio_mon').prop('checked',true);
});
// 검색기간 txt 영역 초기화
// $('#srch_period_txt').text('검색기간 : ' + $('#sel_mon option:selected').text());

// datetimepicker 초기화
$(function() {
	var sdd = ''; // start default date
	var edd = ''; // end default date
	if (sd && ed) {
		sdd = moment(sd, 'YYYYMMDD');
		edd = moment(ed, 'YYYYMMDD');
	}
	console.log(sdd, edd);
	$('#datetimepicker').datetimepicker({
		dayViewHeaderFormat : 'YYYY-MM',
		locale : 'ko',
		format : 'YYYYMMDD',
		defaultDate : sdd
	});
	$('#datetimepicker2').datetimepicker({
		dayViewHeaderFormat : 'YYYY-MM',
		locale : 'ko',
		format : 'YYYYMMDD',
		defaultDate : edd,
		useCurrent : false
	});

	if (sd && ed) {
		$('#datetimepicker2').data("DateTimePicker").minDate(sdd);
		$('#datetimepicker').data("DateTimePicker").maxDate(edd);

		setBtn(sdd, edd, 'init');
	}

	$("#datetimepicker").on("dp.change", function(e) {
		var d = (e.date)? e.date.startOf('day'):e.date;
		$('#datetimepicker2').data("DateTimePicker").minDate(d);
		setBtn(d, edd);
		sdd = d;
	});
	$("#datetimepicker2").on("dp.change", function(e) {
		var d = (e.date)? e.date.startOf('day'):e.date;
		$('#datetimepicker').data("DateTimePicker").maxDate(e.date);
		setBtn(sdd, d);
		edd = d;
	});

	function setBtn(sdd, edd, init) {
		$('#ed_btn_wrap .button').removeClass('active');
		if(!sdd || !edd) {
			return;
		}
		if(!init) {
			$('#radio_day').prop('checked',true);
		}
		var daysGap = moment.duration(edd.diff(sdd)).asDays();
		if (daysGap == 6) {
			$('#ed_btn_wrap .button').eq(0).addClass('active');
		} else if (daysGap == 14) {
			$('#ed_btn_wrap .button').eq(1).addClass('active');
		} else if (daysGap == 29) {
			$('#ed_btn_wrap .button').eq(2).addClass('active');
		}
	}
});

// 시작일자 후 기간버튼 클릭 이벤트
$('#ed_btn_wrap .button').click(function() {
	if (!$(this).hasClass('active')) {
		var sd = $('#sd').val();
		if (sd) {
			var idx = $(this).index();
			var sdMm = moment(sd, 'YYYYMMDD');
			$(this).siblings().removeClass('active');
			$(this).addClass('active');
			$('#radio_day').prop('checked',true);
			if (idx == 1) {
				$('#ed').val(sdMm.add(6, 'days').format('YYYYMMDD'));
			} else if (idx == 2) {
				$('#ed').val(sdMm.add(14, 'days').format('YYYYMMDD'));
			} else if (idx == 3) {
				$('#ed').val(sdMm.add(29, 'days').format('YYYYMMDD'));
			}
		} else {
			alert('시작일자를 먼저 선택해주세요.');
		}
	}
});

// 쇼핑몰 체크박스 개수 제한
var limit = 4;
$('input[name="chk_shop"]').click(function(evt) {
	if ($('input[name="chk_shop"]:checked').length >= limit) {
		this.checked = false;
		alert(limit + '개 이상 선택할 수 없습니다.');
	}
});

$('#do_settings').click(function() {
	var kind = $('input[name="kind"]:checked').val();
	console.log(kind, $('#sd').val(), $('#ed').val());
	if (kind == 'D') {
		if (!$('#sd').val() || !$('#ed').val()) {
			alert('일별조회를 선택한 경우 시작일과 끝일을 선택해주세요.');
			return;
		}
	}
	//alert('before ajax');
	$.ajax({
		type : "POST",
		url : ctxp + "/shopImg/settings",
		dataType : 'text',
		data : $('#form_settings').serialize()
	}).done(function(res) {
		console.log(res);
		if (res == 0) {
			alert('설정이 실패했습니다. 관리자에게 문의하세요.');
		} else {
			//alert('refresh');
			location.reload();
			//alert('reloaded');
			//location.href = ctxp + 'shopImg/search';
		}
	}).fail(function(xhr, status, e) {
		console.log(xhr, status, e);
	});

})
