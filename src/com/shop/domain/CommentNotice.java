package com.shop.domain;

import lombok.Data;

@Data
public class CommentNotice {
	private int comment_notice_idx;
	private Member member;
	private String title;
	private String content;
	private String regdate;
	private int team;
	private int rank;
	private int depth;
	
}
