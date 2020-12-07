package com.shop.domain;

import java.util.List;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@NoArgsConstructor
@Setter
public class Member {
	private int member_idx;
	private String id;
	private String password;
	private String name;
	private String email_id;
	private String email_domain;
	private String phone;

	private List<AddStore> addStoreList;

}
