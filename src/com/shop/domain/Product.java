package com.shop.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;


@Data
public class Product {
	private int product_idx;
	private Category category;
	private String name;
	private int price;
	private String filename;
	private MultipartFile myFile;
	
}

