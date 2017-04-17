package kr.co.ccbrain.shopimg.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ccbrain.shopimg.service.ShopImgService;
import kr.co.ccbrain.shopimg.util.Util;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/shopImg")
public class ShopImgController {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private ShopImgService shopImgService;

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public void search(HttpServletRequest httpReq, Model model) {
		Object id = httpReq.getSession().getAttribute("id");
		try {
			model.addAttribute("date", shopImgService.getShopImgDates(id));
			model.addAttribute("shop", shopImgService.getShop(id));
			model.addAttribute("img", shopImgService.getShopImg(id));
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
	}

	@RequestMapping(value = "/settings", method = RequestMethod.GET)
	public void settings(HttpServletRequest httpReq, Model model) {
		Object id = httpReq.getSession().getAttribute("id");
		try {
			model.addAttribute("dateConfig", shopImgService.getDateConfig(id));
			model.addAttribute("shopConfig", shopImgService.getShopConfig(id));
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
	}

	@RequestMapping(value = "/settings", method = RequestMethod.POST)
	public @ResponseBody int doSettings(@RequestParam("chkShop") String[] chkShop, @RequestParam Map<String, Object> mapReq, HttpServletRequest httpReq, Model model) {
		Object id = httpReq.getSession().getAttribute("id");
		mapReq.put("id", id);
		mapReq.put("chkShop", chkShop);
		int result = 0;
		try {
			result = shopImgService.setConfig(mapReq);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return result;
	}
}
