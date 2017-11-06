package kr.co.ccbrain.shopimg.listener;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 
 * @author srkim
 *
 */
public class SessionLifeCycle implements HttpSessionListener {
	
	private final Logger logger = LoggerFactory.getLogger(getClass());

	@Override
	public void sessionCreated(HttpSessionEvent evt) {
		logger.info("create jsessionId : " + evt.getSession().getId());
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent evt) {
		HttpSession session = evt.getSession();
		String sessionId = session.getId();
		logger.info("destroy jsessionId : " + sessionId );
	}
}
