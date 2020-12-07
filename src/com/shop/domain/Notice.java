package com.shop.domain;

import lombok.Data;

@Data
public class Notice {
	private int notice_idx;
	private String title;
	private String content;
	private String regdate;
	
}
