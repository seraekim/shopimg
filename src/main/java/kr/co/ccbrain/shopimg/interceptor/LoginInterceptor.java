package kr.co.ccbrain.shopimg.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		boolean isSuccess = false;
		HttpSession session = request.getSession();

		if (!StringUtils.isEmpty((String) session.getAttribute("id"))) {
			logger.debug("로그인된 사용자.");
			isSuccess = true;
		} else {
			// ajax 통신인 경우 403 에러 발생시킴
			if (request.getHeader("AJAX") != null && request.getHeader("AJAX").equals("true")) {
				logger.debug("세션은 없고 ajax 통신.");
				response.sendError(403);
			} else {
				logger.debug("로그인 안된 사용자.");
				response.sendRedirect(request.getContextPath() + "/login");
			}
		}
		// 일단 무조건 true
		return true;
	}
}
