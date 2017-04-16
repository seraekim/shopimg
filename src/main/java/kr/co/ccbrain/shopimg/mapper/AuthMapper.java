package kr.co.ccbrain.shopimg.mapper;

import java.util.Map;

@SuppressWarnings("rawtypes")
public interface AuthMapper {
	int join(Map mapReq);
	int initDateConfig(Map mapReq);
	Map search(Map mapReq);
	Map login(Map mapReq);
}
