package kr.co.ccbrain.shopimg.cmn;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ServletContextCycle implements ServletContextListener {

	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Override
	public void contextDestroyed(ServletContextEvent evt) {
		
		logger.info("Context Destroyed!!!!!");
		
		/*try {
			
			logger.info("Context Destroyed!!!!!");
			
			if( evt != null && evt.getServletContext() != null ){
				SchedulerTrigger.getInstance().shutdown();
				Thread.sleep(1000);
			}
			
		} catch( Exception e ) {
			logger.fatal( e.toString() );
		}*/
		
	}

	@Override
	public void contextInitialized(ServletContextEvent evt) {
		logger.info("Context Initialized!!!!!");
//		logger.info(com.gpki.gpkiapi.Version.confirm());
//		logger.info(com.gpki.Version.getVersion());
	}

}
