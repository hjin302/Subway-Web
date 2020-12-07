package com.shop.domain;

import com.shop.domain.Member;
//import com.shop.domain.Receiver;

import lombok.Data;

@Data
public class OrderSummary {
   private int order_summary_idx;
   private Member member;
   private int total_pay;
   private String order_date;
   private String pay_method;
}