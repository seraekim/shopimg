package kr.co.ccbrain.shopimg.service;

import java.util.List;

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

	public List hello() throws Exception {
		return shopImgMapper.hello();
	}

}
