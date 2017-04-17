package kr.co.ccbrain.shopimg.mapper;

import java.util.List;
import java.util.Map;

@SuppressWarnings("rawtypes")
public interface ShopImgMapper {
	int updateDateConfig(Map mapReq);
	int insertShopConfig(Map mapReq);
	int deleteShopConfig(Object id);
	List<Map> selectShopConfig(Object id);
	List<Map> selectShop(Object id);
	List<Map> selectShopImg(Object id);
	List<String> selectShopImgDates(Object id);
	Map selectDateConfig(Object id);
}
