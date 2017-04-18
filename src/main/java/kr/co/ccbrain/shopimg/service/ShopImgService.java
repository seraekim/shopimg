package kr.co.ccbrain.shopimg.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ccbrain.shopimg.mapper.ShopImgMapper;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
@SuppressWarnings("rawtypes")
public class ShopImgService {

	@Autowired
	private ShopImgMapper shopImgMapper;

	public int setConfig(Map mapReq) throws Exception {
		int result = 0;
		result = (shopImgMapper.updateDateConfig(mapReq) 
				+ shopImgMapper.deleteShopConfig(mapReq.get("id")) 
				+ shopImgMapper.insertShopConfig(mapReq));
		return result;
	}

	public Map getDateConfig(Object id) throws Exception {
		return shopImgMapper.selectDateConfig(id);
	}

	public Map getDateConfigForSearch(Map mapReq) throws Exception {
		return shopImgMapper.selectDateConfigForSearch(mapReq);
	}
	
	public List getShopConfig(Object id) throws Exception {
		return shopImgMapper.selectShopConfig(id);
	}
	
	public List getShop(Object id) throws Exception {
		return shopImgMapper.selectShop(id);
	}
	
	public List getShopImg(Map mapReq) throws Exception {
		return shopImgMapper.selectShopImg(mapReq);
	}
	
	public List getShopImgDates(Map mapReq) throws Exception {
		return shopImgMapper.selectShopImgDates(mapReq);
	}
}
