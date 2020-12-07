package com.shop.model.order;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shop.domain.OrderDetail;
import com.shop.exception.DMLException;

@Repository
public class OrderDetailDAO {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public void insert(OrderDetail orderDetail) throws DMLException{
		int result=sessionTemplate.insert("OrderDetail.insert", orderDetail);
		if(result==0) {
			throw new DMLException(orderDetail.getProduct().getName()+"이 등록되지 않았습니다");
		}
	}
	
	//상세 주문 정보 내역
	public List selectAll(int order_summary_idx) {
		return sessionTemplate.selectList("OrderDetail.selectAll", order_summary_idx);
	}
	
}








