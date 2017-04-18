package kr.co.ccbrain.shopimg.util;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class Util {
	public static void printHttpReq(HttpServletRequest httpReq) {
		Map<String, String[]> ps = httpReq.getParameterMap();
		for (String parameter : ps.keySet()) {
			System.out.println("k : " + parameter);
			String[] v = ps.get(parameter);
			for (String s : v) {
				System.out.println("v : " + s);
			}
		}
	}
}
