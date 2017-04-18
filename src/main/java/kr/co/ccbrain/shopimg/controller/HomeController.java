package kr.co.ccbrain.shopimg.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Model model) {
		logger.info("root redirection test");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		if(id == null) {
			return "redirect:/auth/login";
		} else {
			return "redirect:/shopImg/settings";
		}
	}
	
}
