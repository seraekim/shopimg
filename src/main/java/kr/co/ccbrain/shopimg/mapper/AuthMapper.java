package kr.co.ccbrain.shopimg.mapper;

import java.util.Map;

public interface AuthMapper {
	int join(Map<String, Object> request);
	Map<String, Object> search(Map<String, Object> request);
	Map<String, Object> login(Map<String, Object> request);
}
