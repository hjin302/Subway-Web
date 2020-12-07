package com.shop.domain;

import lombok.Data;

@Data
public class AddStore {
	private int add_store_idx;
	private String title;
	private String content;
	private String regdate;
	private Member member;
	
}
