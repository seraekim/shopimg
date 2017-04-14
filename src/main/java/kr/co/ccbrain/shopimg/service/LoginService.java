package kr.co.ccbrain.shopimg.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.ccbrain.shopimg.mapper.LoginMapper;

@Transactional
@Service
@SuppressWarnings("rawtypes")
public class LoginService {

	@Autowired
	private LoginMapper loginMapper;

	public int join(Map<String, Object> request) throws Exception {
		int cnt = 0;
		if(loginMapper.search(request) != null) {
			System.out.println("이미 유저 있다.");
			cnt = -1;
		} else {
			System.out.println("기존 유저 없다.");
			cnt = loginMapper.join(request);
		}
		return cnt;
	}

	public Map search(Map<String, Object> request) throws Exception {
		return loginMapper.search(request);
	}
}
