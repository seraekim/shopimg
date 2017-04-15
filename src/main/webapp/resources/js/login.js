$(document).ready(function() {

	/*
	 * Fullscreen background
	 */
	$.backstretch(ctxp + "/resources/img/background_shop.jpg");
	$('.backstretch').css({
		'filter' : 'brightness(0.5) grayscale(1) blur(2px)'
	});
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
			dataType : 'text',
			data : $('#form_join').serialize()
		}).done(function(res) {
			console.log(res);
			if (res == 1) {
				alert('가입 되었습니다. 로그인 해주세요.');
				location.href = ctxp + '/auth/login';
			} else if (res == -1) {
				alert('아이디가 중복됩니다.');
			} else {
				alert('가입이 불가능합니다. 관리자에게 문의하세요.');
			}
		}).fail(function(xhr, status, e) {
			console.log(xhr, status, e);
		});
	});
	
//	$('#do_login').click(function() {
//		console.log($('#form_login').serialize());
//		
//	})

});
