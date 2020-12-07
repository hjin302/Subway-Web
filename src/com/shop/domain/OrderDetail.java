package com.shop.domain;

import com.shop.domain.OrderSummary;
import com.shop.domain.Product;

import lombok.Data;

@Data
public class OrderDetail {
	private int order_detail_idx;
	private OrderSummary orderSummary;//has a 
	private Product product;//has a 
	private int ea;
}
