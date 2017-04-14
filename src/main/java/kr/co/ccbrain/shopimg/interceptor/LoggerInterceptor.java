package kr.co.ccbrain.shopimg.interceptor;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//import static org.fusesource.jansi.Ansi.*;
//import static org.fusesource.jansi.Ansi.Color.*;
/**
 * 
 * shows pre and posthandle with time, remoteIP:port, requestURI in the debug log level.
 * If there is a need to monitor the whole resource flow
 * including css, js, etc, then remove the condition of indexOf from if clause.
 * 
 * @author srkim
 *
 */
public class LoggerInterceptor extends HandlerInterceptorAdapter {
	private final Logger logger = LoggerFactory.getLogger(getClass());
	private final SimpleDateFormat sf = new SimpleDateFormat("hh:mm:ss.sss");

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String uri = request.getRequestURI();
		if (logger.isDebugEnabled() && uri.indexOf("resources") == -1) {
			System.out.println("▶ Start " + sf.format(Calendar.getInstance().getTime()) + " " + request.getRemoteAddr() + ":" + request.getRemotePort() + " - " + uri);
		}
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		String uri = request.getRequestURI();
		if (logger.isDebugEnabled() && uri.indexOf("resources") == -1) {
			System.out.println("▶ End   " + sf.format(Calendar.getInstance().getTime()) + " " + request.getRemoteAddr() + ":" + request.getRemotePort() + " - " + uri + "\n");
		}
	}
}
