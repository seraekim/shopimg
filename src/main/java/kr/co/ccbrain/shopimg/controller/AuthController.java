package kr.co.ccbrain.shopimg.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	public @ResponseBody int doJoin(@RequestParam Map<String, Object> mapReq, Model model) {
		int result = 0;
		try {
			result = authService.join(mapReq);
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
	public @ResponseBody int doLogin(@RequestParam Map<String, Object> mapReq, HttpServletRequest httpReq) {
		HttpSession ss = httpReq.getSession();
		//httpRes.setContentType("text/plain");
	    //response.setCharacterEncoding("UTF-8");
		int result = 0;
		try {
			if (authService.login(mapReq) != null) {
				String id = (String) mapReq.get("id");
				ss.setAttribute("id", id);
				result = 1;
			}
		} catch (Exception e) {
			result = -1;
			logger.error(e.getMessage(), e);
		}
		return result;
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String doLogout(HttpServletRequest httpReq) {
		HttpSession ss = httpReq.getSession();
		ss.invalidate();
		return "auth/login";
	}
}
