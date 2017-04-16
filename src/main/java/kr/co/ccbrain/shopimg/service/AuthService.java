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

	public int join(Map mapReq) throws Exception {
		int cnt = 0;
		if (authMapper.search(mapReq) != null) {
			cnt = -1; // 아이디 중복
		} else {
			cnt = authMapper.join(mapReq); // affected row count
			if (cnt == 1) {
				authMapper.initDateConfig(mapReq);
			}
		}
		return cnt;
	}

	public Map login(Map mapReq) throws Exception {
		return authMapper.login(mapReq);
	}
}
