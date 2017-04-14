/*

** 중요 : 꼭 체크해야 할 것 !! **
디비에서 제공되는 정보가 있다면 그것으로 초기화를 하고
없다면 현재날짜 등으로 초기화를 해야함.

그리고 디비에서 제공된 날짜가 6개월 이전 것이라면, 6개월전 데이터는 보여줄 수 없다는 경고창과 함께
다시 설정하라고 prompt 하기.
*/

// nav 클릭 이벤트
$('#navbar ul li').click(function () {
  var idx = $(this).index();
  if (!$(this).hasClass('active')) {
    $(this).siblings().removeClass('active');
    $(this).addClass('active');
    $('body > .container > div').hide();
    $('body > .container > div').eq(idx).fadeIn('slow');
  }
});

// 설정 > 월별조회 > select option 채우기
var now = moment();
now.add(1, 'months');
for (var i = 0; i < 6; i++) {
  $('#sel_mon').append('<option>' + now.add(-1, 'months').format('YYYY년 MM월') + '</option>');
}

// 검색기간 txt 영역 초기화
//$('#srch_period_txt').text('검색기간 : ' + $('#sel_mon option:selected').text());

// datetimepicker 초기화
$(function () {
  $('#datetimepicker').datetimepicker({
    dayViewHeaderFormat:'YYYY-MM',
    locale:'ko',
    format: 'YYYYMMDD',
    defaultDate: moment().add(-9, 'days')
  });
  $('#datetimepicker2').datetimepicker({
    dayViewHeaderFormat:'YYYY-MM',
    locale:'ko',
    format: 'YYYYMMDD',
    defaultDate: moment(),
    useCurrent: false //Important! See issue #1075
  });
  $("#datetimepicker").on("dp.change", function (e) {
    $('#datetimepicker2').data("DateTimePicker").minDate(e.date);
  });
  $("#datetimepicker2").on("dp.change", function (e) {
    $('#datetimepicker').data("DateTimePicker").maxDate(e.date);
  });

  $('#datetimepicker3').datetimepicker({
    dayViewHeaderFormat:'YYYY-MM',
    locale:'ko',
    format: 'YYYYMMDD',
    defaultDate: moment().add(-9, 'days')
  });
  $('#datetimepicker4').datetimepicker({
    dayViewHeaderFormat:'YYYY-MM',
    locale:'ko',
    format: 'YYYYMMDD',
    defaultDate: moment(),
    useCurrent: false //Important! See issue #1075
  });
  $("#datetimepicker3").on("dp.change", function (e) {
    $('#datetimepicker4').data("DateTimePicker").minDate(e.date);
  });
  $("#datetimepicker4").on("dp.change", function (e) {
    $('#datetimepicker3').data("DateTimePicker").maxDate(e.date);
  });
});

// 기간버튼 클릭 이벤트
$('.button').click(function () {
  if (!$(this).hasClass('active')) {
    $(this).siblings().removeClass('active');
    $(this).addClass('active');
  }
});

// 쇼핑몰 체크박스 개수 제한
var limit = 4;
$('input[name="chk_shop"]').click(function (evt) {
  if ($('input[name="chk_shop"]:checked').length >= limit) {
    this.checked = false;
    alert(limit + '개 이상 선택할 수 없습니다.');
  }
});