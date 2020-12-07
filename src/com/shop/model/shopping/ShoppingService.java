package com.shop.model.shopping;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.domain.Cart;
import com.shop.domain.OrderDetail;
import com.shop.domain.OrderSummary;
import com.shop.domain.Product;
import com.shop.exception.DMLException;
import com.shop.model.order.OrderDetailDAO;
import com.shop.model.order.OrderSummaryDAO;


@Service
public class ShoppingService {
	@Autowired
	private OrderSummaryDAO orderSummaryDAO;
	
	@Autowired
	private OrderDetailDAO orderDetailDAO;
	
	
	//배송자 정보 입력 후, pk을 가져와야 한다!
	public void insert(List<Cart> cartList , OrderSummary orderSummary){
		//주문정보 입력
		orderSummaryDAO.insert(orderSummary);
		System.out.println("방금 들어간 주문코드는 "+orderSummary.getOrder_summary_idx());
		
		//주문 상세 정보 입력!!
		for(int i=0;i<cartList.size();i++) {
			Cart cart = cartList.get(i);
			OrderDetail orderDetail=new OrderDetail();
			orderDetail.setOrderSummary(orderSummary);
			orderDetail.setProduct((Product)cart);
			orderDetail.setEa(cart.getEa());
			
			orderDetailDAO.insert(orderDetail);
		}
	}
	
}












