package com.shop.model.order;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shop.domain.Member;
import com.shop.domain.OrderSummary;
import com.shop.exception.DMLException;

@Repository
public class OrderSummaryDAO {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	//주문정보 등록 
	public void insert(OrderSummary orderSummary) throws DMLException{
		int result=sessionTemplate.insert("OrderSummary.insert", orderSummary);
		if(result==0) {
			throw new DMLException("주문정보가 등록되지 않았습니다");
		}
	}
	
	//주문목록 가져오기 
	public List selectAll() {
		return sessionTemplate.selectList("OrderSummary.selectAll");
	}
	
	//주문정보 한건 가져오기 
	public OrderSummary select(int order_summary_idx) {
		return sessionTemplate.selectOne("OrderSummary.select",order_summary_idx);
		
	}
	
	   //주문정보 삭제하기
	   public void delete(int order_summary_idx) throws DMLException{
	         int result=sessionTemplate.delete("OrderSummary.delete",order_summary_idx);
	         if(result==0) {
	            throw new DMLException(" 湲  萸   뵠  沅   젫力μ꼶 봺  由뷴릯   釉  釉   뮸  빍  뼄");
	         }
	      }
	   

	
	//해당 회원의 모든 주문목록 가져오기
	public List selectAllByMember(Member member) {
		return sessionTemplate.selectList("OrderSummary.selectAllByMember", member);
	}
}
