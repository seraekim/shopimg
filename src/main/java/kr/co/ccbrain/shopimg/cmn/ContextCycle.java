package kr.co.ccbrain.shopimg.cmn;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**  
 * <pre>
 * ShutdownHook class
 * </pre>
 *
 * @author		Admin
 * @since 		2015. 10. 20. 오후 2:18:53
 * @version 	    1.0
 * @see
 * <pre>
 *  ==========  개정이력( Modification Information )  ==========  
 * 
 *     수정일             수정자                         수정내용
 *  ------------    ------------     -------------------------------
 *   2015.10.20.      Admin				        최초생성
 *
 *</pre>
 */
public class ContextCycle implements ServletContextListener {

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
//		logger.info(com.gpki.gpkiapi.Version.confirm());
//		logger.info(com.gpki.Version.getVersion());
	}

}
