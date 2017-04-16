package kr.co.ccbrain.shopimg.mapper;

import java.util.List;
import java.util.Map;

@SuppressWarnings("rawtypes")
public interface ShopImgMapper {
	int updateDateConfig(Map mapReq);
	int insertShopConfig(Map mapReq);
	int deleteShopConfig(Object id);
	List<Map> selectShopConfig(Object id);
	Map selectDateConfig(Object id);
}
