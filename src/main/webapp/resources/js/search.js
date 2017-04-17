
// datetimepicker 초기화
$(function () {
  $('#datetimepicker').datetimepicker({
    dayViewHeaderFormat:'YYYY-MM',
    locale:'ko',
    format: 'YYYYMMDD'
  });
  $('#datetimepicker2').datetimepicker({
    dayViewHeaderFormat:'YYYY-MM',
    locale:'ko',
    format: 'YYYYMMDD',
    useCurrent: false
  });
  $("#datetimepicker").on("dp.change", function (e) {
    $('#datetimepicker2').data("DateTimePicker").minDate(e.date);
  });
  $("#datetimepicker2").on("dp.change", function (e) {
    $('#datetimepicker').data("DateTimePicker").maxDate(e.date);
  });
});

// 기간버튼 클릭 이벤트
$('.button').click(function () {
  if (!$(this).hasClass('active')) {
    $(this).siblings().removeClass('active');
    $(this).addClass('active');
  }
});
