package com.shop.model.event;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shop.domain.Event;
import com.shop.domain.EventProduct;
import com.shop.exception.DMLException;
@Repository
public class EventProductDAO {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public List selectAll() {
		return sessionTemplate.selectList("EventProduct.selectAll");
	}
	
	//이벤트에 소속된 상품 가져오기!
	public List selectJoinByEventId(int event_idx) {
		return sessionTemplate.selectList("EventProduct.selectJoinByEventId", event_idx);
	}
	
	public void insert(EventProduct eventProduct) throws DMLException{
		int result = sessionTemplate.insert("EventProduct.insert", eventProduct);
		if(result ==0) {
			throw new com.shop.exception.DMLException("이벤트 상품 등록에 실패하였습니다");
		}
	}
}




