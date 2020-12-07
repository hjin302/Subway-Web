package com.shop.controller.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.controller.common.Pager;
import com.shop.domain.Cart;
import com.shop.domain.OrderSummary;
import com.shop.model.order.OrderService;

//�������� �ֹ� ó�� 
@Controller
@RequestMapping("/admin/order")
public class OrderController {
   @Autowired
   private OrderService orderService;
   
   @Autowired
   private Pager pager;
   
   //��Ϻ���
   @RequestMapping(value="/list", method=RequestMethod.GET)
   public String selectAll(Model model, HttpServletRequest request) {
//      System.out.println("�ֹ� ����� �ñ���");
      List orderList = orderService.selectAll();
      pager.init(orderList, request);
      model.addAttribute("orderList", orderList);
      model.addAttribute("pager", pager);
      
      return "admin/order/list";
   }
   
   //�ֹ��󼼺��� ��û ó�� 
   @RequestMapping(value="/detail", method=RequestMethod.GET)
   public String select(Model model, @RequestParam int order_summary_idx) {
      OrderSummary orderSummary=orderService.select(order_summary_idx);
      
      System.out.println("orderSumamry " + orderSummary);
      
      List detailList=orderService.getOrderDetail(order_summary_idx);

      model.addAttribute("detailList", detailList);
      model.addAttribute("orderSummary", orderSummary);
      
      return "admin/order/detail";
   }
   
   //�ֹ����� 
   @RequestMapping(value="/admin/order/detail/del", method=RequestMethod.GET)
   public String removeOne(Model model,@RequestParam int order_summary_idx, HttpSession session) {
      session.removeAttribute("order_summary_idx");
      
      model.addAttribute("url", "/admin/order/list");
      
      return "view/message";
   }
   
   //삭제 요청
   @RequestMapping(value="/delete", method= {RequestMethod.GET, RequestMethod.POST})
   public String delete(HttpServletRequest request, Model model,@RequestParam int order_summary_idx) {
      orderService.delete(order_summary_idx);
      
      model.addAttribute("url", "/admin/order/list");
      model.addAttribute("msg", "삭제 성공 ");
      return "view/message";
   }

   
   //�ֹ����
   @RequestMapping(value="/regist", method=RequestMethod.POST)
   public String regist() {
      return null;
   }
   
}