package kr.co.ccbrain.shopimg.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.ccbrain.shopimg.mapper.AuthMapper;

@Transactional
@Service
@SuppressWarnings("rawtypes")
public class AuthService {

	@Autowired
	private AuthMapper authMapper;

	public int join(Map<String, Object> request) throws Exception {
		int cnt = 0;
		if(authMapper.search(request) != null) {
			cnt = -1; // 아이디 중복
		} else {
			cnt = authMapper.join(request); // affected row count
		}
		return cnt;
	}

	public Map login(Map<String, Object> request) throws Exception {
		return authMapper.login(request);
	}
}
