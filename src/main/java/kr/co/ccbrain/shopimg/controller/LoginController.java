package kr.co.ccbrain.shopimg.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ccbrain.shopimg.service.LoginService;

@Controller
public class LoginController {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	LoginService loginService;

	// 가입뷰
	@RequestMapping(value = "/auth/join", method = RequestMethod.GET)
	public void join(Model model) {
	}

	// 가입요청
	@RequestMapping(value = "/auth/join", method = RequestMethod.POST, produces="application/json; charset=utf-8")
	public @ResponseBody Map<String, Object> doJoin(@RequestParam Map<String, Object> request, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			
			if(loginService.join(request) == 1) {
				map.put("result", "success");
				return map;
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		map.put("result", "fail");
		return map;
	}

	// 로그인뷰
	@RequestMapping(value = "/auth/login", method = RequestMethod.GET)
	public void login(Model model) {
	}

	// 로그인요청
	@RequestMapping(value = "/auth/login", method = RequestMethod.POST)
	public void doLogin(Model model) {
		// model.addAttribute("serverTime", formattedDate );
	}

}
