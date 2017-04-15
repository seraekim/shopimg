package kr.co.ccbrain.shopimg.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ccbrain.shopimg.service.AuthService;

@Controller
@RequestMapping("/auth")
public class AuthController {

	private final Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private AuthService authService;

	// 가입뷰
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void join(Model model) {
	}

	// 가입요청
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public @ResponseBody int doJoin(@RequestParam Map<String, Object> request, Model model) {
		int result = 0;
		try {
			result = authService.join(request);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return result;
	}

	// 로그인뷰
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void login(Model model) {
	}

	// 로그인요청
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String doLogin(@RequestParam Map<String, Object> request, HttpServletRequest req) {
		String view = "auth/login";
		HttpSession ss = req.getSession();
		try {
			if (authService.login(request) != null) {
				String id = (String) request.get("id");
				ss.setAttribute("id", id);
				view = "shopImg/settings";
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return view;
	}

}
