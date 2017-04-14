$(document).ready(function() {

	/*
	 * Fullscreen background
	 */
	$.backstretch(ctxp + "/resources/img/background_shop.jpg");
	$('.backstretch').css({
		'filter' : 'brightness(0.5) grayscale(1) blur(2px)'
	})
	/*
	 * Form validation
	 */
	$('.login-form input[type="text"], .login-form input[type="password"], .login-form textarea').on('focus', function() {
		$(this).removeClass('input-error');
	});

	$('.login-form').on('submit', function(e) {

		$(this).find('input[type="text"], input[type="password"], textarea').each(function() {
			if ($(this).val() == "") {
				e.preventDefault();
				$(this).addClass('input-error');
			} else {
				$(this).removeClass('input-error');
			}
		});

	});

	$('#join').click(function() {
		location.href = ctxp + '/auth/join';
	});

	$('#do_join').click(function() {
		console.log($('#form_join').serialize());
		$.ajax({
			type : "POST",
			url : ctxp + "/auth/join",
			data : $('#form_join').serialize()
		}).done(function(data) {
			if(data.result == 'success') {
				alert('가입 되었습니다.');
				location.href = ctxp+'/settings';
			}
		}).fail(function(xhr, status, e) {
			console.log(xhr, status, e);
		});
	});

});
