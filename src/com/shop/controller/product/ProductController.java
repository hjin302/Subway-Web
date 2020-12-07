package com.shop.controller.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shop.controller.common.Pager;
import com.shop.domain.Event;
import com.shop.domain.Product;
import com.shop.exception.DMLException;
import com.shop.exception.FileException;
import com.shop.model.common.file.FileManager;
import com.shop.model.product.ProductService;

@Controller
public class ProductController {
   @Autowired
   private ProductService productService;
   
   @Autowired
   private Pager pager;
   
   @RequestMapping(value="/admin/product/regist", method=RequestMethod.POST)
   public ModelAndView regist(Product product, HttpServletRequest request) {
      productService.regist(product, product.getMyFile(), request.getServletContext().getRealPath("/data/"));   
      
      ModelAndView mav = new ModelAndView();
      mav.addObject("url", "/admin/product/list");
      mav.addObject("msg", "등록 성공");
      mav.setViewName("view/message");
      
      return mav;
   }
   
   @RequestMapping(value="/admin/product/list", method=RequestMethod.GET)
   public ModelAndView selectAll(HttpServletRequest request) {
      ModelAndView mav = new ModelAndView();
      
      HttpSession session = request.getSession();
      
      List productList = productService.selectAll();
      pager.init(productList, request);
      mav.addObject("productList", productList);
      mav.addObject("pager", pager);
      
      mav.setViewName("admin/product/index");
      return mav;
   }
   
   @RequestMapping(value="/admin/product/detail", method=RequestMethod.GET)
      public String select(Model model,@RequestParam int product_idx, HttpServletRequest request) {
         System.out.println("product_idx : "+product_idx);
         Product product=productService.select(product_idx);
         model.addAttribute("product", product);
         return "admin/product/detail";
      }
   
   @RequestMapping(value="/admin/product/delete", method= {RequestMethod.GET, RequestMethod.POST})
   public String delete(HttpServletRequest request, Model model,@RequestParam int product_idx,@RequestParam String filename) {
      //  솁  뵬 猷   沅   젫!!
      String realPath=request.getServletContext().getRealPath("/data/"+filename);
      
      FileManager.removeFile(realPath);
      productService.delete(product_idx);
      
      model.addAttribute("url", "/admin/product/list");
      model.addAttribute("msg", "삭제 성공");
      return "view/message";
   }
   
   
   @RequestMapping(value="/admin/product/edit", method= RequestMethod.POST)
   public String update(Model model,Product product, HttpServletRequest request) {
      productService.update(product, request.getServletContext().getRealPath("/data/"));
      
      model.addAttribute("url", "/admin/product/list");
      model.addAttribute("msg", "수정 성공");
      return "view/message";

   }

   /* 疫꿸퀬 돴 湲  萸   꽴   졃 
   @RequestMapping(value="/member/event/list", method=RequestMethod.GET)
   public String getEventList(HttpServletRequest request, Model model) {
      // 堉  堉  疫꿸퀬 돴  뵠甕겹끋 뱜揶     뿳  뮉 榮먥뫖以  揶   議   궎  쁽
      List<Event> eventList = productService.getEvenetList();
      
      Map<String, List> listMap = new HashMap<String, List>();
      Map<String, String> titleMap = new HashMap<String, String>();
      
      for(int i=0;i<eventList.size();i++) {
         Event event=eventList.get(i);
         System.out.println(event.getTitle()+":"+event.getEvent_idx());
         
         
      }
      model.addAttribute("listMap", listMap);
      model.addAttribute("titleMap", titleMap);
      
      return "event/list";
   }
   */
   
   /* 疫꿸퀬 돴 湲  萸   꽴  뵳  
   @RequestMapping(value="/member/event/list", method=RequestMethod.GET)
   public String getEventListAdmin() {
      
      return "member/event/list";
   }
   
   @RequestMapping(value="/member/event/regist", method=RequestMethod.POST)
   @ResponseBody
   public String registEvent(Event event) {
      String result=null;
      try {
         productService.registEvent(event);
         result="ok";
      } catch (DMLException e) {
         e.printStackTrace();
         result="fail";
      }
      return result;
   }
   */

   /*
   @RequestMapping(value="/member/event/selectall",method=RequestMethod.GET,produces="text/html;charset=utf8")
   @ResponseBody
   public String selectAll() {
      List<Event> eventList=productService.getEvenetList();
      
      StringBuilder sb = new StringBuilder();
      sb.append("{");
      sb.append("\"eventList\":[");
      for(int i=0;i<eventList.size();i++) {
         Event event = eventList.get(i);
         sb.append("{");
         sb.append("\"event_id\":"+event.getEvent_idx()+",");
         sb.append("\"title\":\""+event.getTitle()+"\"");
         if(i<eventList.size()-1) {
            sb.append("},");
         }else {
            sb.append("}");
         }
      }
      sb.append("]");
      sb.append("}");
      
      return sb.toString();
   }   
   */
   
   @ExceptionHandler({FileException.class, DMLException.class})
   public ModelAndView handle(FileException e, DMLException e2) {
      ModelAndView mav = new ModelAndView();
      
      //  솁  뵬  毓썸에 뮆諭   肉   쑎  뵥 野껋럩 뒭
      if(e !=null) {
         mav.addObject("e", e);// 肉   쑎 揶쏆빘猿    쁽力λ      뼖  뮉  뼄!!
         mav.addObject("msg", e.getMessage());// 肉   쑎 揶쏆빘猿    쁽力λ      뼖  뮉  뼄!!
      }else if(e2 !=null) {
         mav.addObject("e", e2);// 肉   쑎 揶쏆빘猿    쁽力λ      뼖  뮉  뼄!!
         mav.addObject("msg", e2.getMessage());// 肉   쑎 揶쏆빘猿    쁽力λ      뼖  뮉  뼄!!
      }
      //  뿯  젾  肉   쑎 肉  野껋럩 뒭 
      mav.setViewName("view/error");
      return mav;
   }
   
}













