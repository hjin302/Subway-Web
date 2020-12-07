package com.shop.model.event;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shop.domain.Event;
import com.shop.exception.DMLException;

@Repository
public class EventDAO {
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	// 이벤트상품 등록
	public void insert(Event event) throws DMLException {
		int result = sessionTemplate.insert("Event.insert", event);
		if (result != 1) {
			throw new DMLException("등록 성공");
		}
	}

	// 이벤트상품 목록 가져오기
	public List selectAll() {
		List list = sessionTemplate.selectList("Event.selectAll");
		return list;
	}
	
	//이벤트 상품 삭제
	public void delete(int event_idx) throws DMLException {

		int result = sessionTemplate.delete("Event.delete", event_idx);

		if (result == 0) {
			throw new DMLException("삭제 성공");
		}

	}
}
