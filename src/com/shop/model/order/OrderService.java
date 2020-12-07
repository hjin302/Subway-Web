package com.shop.model.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.domain.Member;
import com.shop.domain.OrderSummary;
import com.shop.exception.DMLException;

@Service
public class OrderService {
	@Autowired
	private OrderSummaryDAO orderSummaryDAO;
	
	@Autowired
	private OrderDetailDAO orderDetailDAO;
	
	//紐⑤뱺 二쇰Ц紐⑸줉 媛��졇�삤湲� 
	public List selectAll() {
		return orderSummaryDAO.selectAll();
	}
	public OrderSummary select(int order_summary_idx) {
		return orderSummaryDAO.select(order_summary_idx);
	}
	
	 //해당 주문코드 삭제하기
    public void delete(int order_summary_idx) throws DMLException{
         orderSummaryDAO.delete(order_summary_idx);
     }

	
	//�빐�떦 二쇰Ц肄붾뱶�뿉 �냼�냽�맂 二쇰Ц �긽�꽭 �궡�뿭媛��졇�삤湲�
	public List getOrderDetail(int order_summary_idx) {
		return orderDetailDAO.selectAll(order_summary_idx);
	}
	//�빐�떦 �쉶�썝�쓽 紐⑤뱺 二쇰Ц�궡�뿭 媛��졇�삤湲겹뀖 
	public List selectAllByMember(Member member) {
		return orderSummaryDAO.selectAllByMember(member);
	}
}





