package kr.co.ccbrain.shopimg.mapper;

import java.util.Map;

public interface LoginMapper {
	int join(Map<String, Object> request);
	Map<String, Object> search(Map<String, Object> request);
}
