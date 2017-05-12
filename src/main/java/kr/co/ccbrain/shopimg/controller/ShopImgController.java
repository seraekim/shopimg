package kr.co.ccbrain.shopimg.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
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

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/shopImg")
@SuppressWarnings("rawtypes")
public class ShopImgController {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private ShopImgService shopImgService;

	@RequestMapping(value = "/search-compare")
	public void searchCompare(@RequestParam Map<String, Object> mapReq, Model model) {
		String img1 = (String) mapReq.get("img1");
		String img2 = (String) mapReq.get("img2");
		
		if(StringUtils.isEmpty(img1)||StringUtils.isEmpty(img2)) {
			model.addAttribute("img1", "img/2017041015/shp11st0010100000100.2017041015.win.jpg");
			model.addAttribute("img2", "img/2017041015/shp11st0010100000117.2017041015.win.jpg");
		} else {
			
		}
		logger.info(img1+" "+img2);
		model.addAllAttributes(mapReq);
	}
	
	@RequestMapping(value = "/search-slider", method = RequestMethod.GET)
	public void searchSlider(@RequestParam Map<String, Object> mapReq, HttpSession session, Model model) {}
	
	@RequestMapping(value = "/search-imgscroll", method = RequestMethod.GET)
	public void searchImgScroll(@RequestParam Map<String, Object> mapReq, HttpSession session, Model model) {}
	
	@RequestMapping(value = "/search-timeline", method = RequestMethod.GET)
	public void searchTimeLine(@RequestParam Map<String, Object> mapReq, HttpSession session, Model model) {}
	
	@RequestMapping(value = "/search-timeline", method = RequestMethod.POST)
	public @ResponseBody Map doSearchTimeLine(@RequestParam Map<String, Object> mapReq, HttpSession session, Model model) {
		Object id = session.getAttribute("id");
		mapReq.put("id", id);
		mapReq.put("sId", "shp11st00101");
		try {
			mapReq.put("dateConfig", shopImgService.getDateConfigForSearch(mapReq));
			mapReq.put("date", shopImgService.getShopImgDates(mapReq));
			mapReq.put("shop", shopImgService.getShop(id));
			mapReq.put("img", shopImgService.getShopImg(mapReq));
			mapReq.put("cate", shopImgService.getCateInfo(mapReq));
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return mapReq;
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public void search(@RequestParam Map<String, Object> mapReq, HttpSession session, Model model) {
		Object id = session.getAttribute("id");
		mapReq.put("id", id);
		try {
			model.addAttribute("dateConfig", shopImgService.getDateConfigForSearch(mapReq));
			model.addAttribute("date", shopImgService.getShopImgDates(mapReq));
			model.addAttribute("shop", shopImgService.getShop(id));
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
	}

	@RequestMapping(value = "/imgSearch", method = RequestMethod.GET)
	public @ResponseBody Map doImgSearch(@RequestParam Map<String, Object> mapReq, HttpSession session) {
		Object id = session.getAttribute("id");
		mapReq.put("id", id);
		try {
			mapReq.put("img", shopImgService.getShopImg(mapReq));
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return mapReq;
	}
	
	@RequestMapping(value = "/settings", method = RequestMethod.GET)
	public void settings(HttpSession session, Model model) {
		Object id = session.getAttribute("id");
		try {
			model.addAttribute("dateConfig", shopImgService.getDateConfig(id));
			model.addAttribute("shopConfig", shopImgService.getShopConfig(id));
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
	}

	@RequestMapping(value = "/settings", method = RequestMethod.POST)
	public @ResponseBody int doSettings(@RequestParam("chkShop") String[] chkShop, @RequestParam Map<String, Object> mapReq, HttpSession session, Model model) {
		Object id = session.getAttribute("id");
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
