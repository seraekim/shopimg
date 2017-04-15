package kr.co.ccbrain.shopimg.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.ccbrain.shopimg.service.ShopImgService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/shopImg")
public class ShopImgController {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	ShopImgService shopImgService;

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public void search(Locale locale, Model model) {
		List list;
		try {
			list = shopImgService.hello();
			logger.debug(list.toString());
			model.addAttribute("list", list);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
	}

	@RequestMapping(value = "/settings", method = RequestMethod.GET)
	public void settings(@RequestParam Map<String, Object> request, Model model) {
		List list;
		try {
			list = shopImgService.hello();
			logger.debug(list.toString());
			model.addAttribute("list", list);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
	}
}
