package com.shop.domain;

import lombok.Data;

@Data
public class EventProduct {
	private int event_product_idx;
	private Product product;
	private Event event;
}
