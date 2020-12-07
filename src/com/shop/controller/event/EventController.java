package com.shop.controller.event;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shop.domain.EventProduct;
import com.shop.domain.Product;
import com.shop.exception.FileException;
import com.shop.domain.Event;
import com.shop.exception.DMLException;
import com.shop.model.event.EventService;
import com.shop.model.product.ProductService;

@Controller
public class EventController {
   @Autowired
   private EventService eventService;
   @Inject
   private ProductService productService;
   
   @RequestMapping(value="/event/regist", method=RequestMethod.POST)
   @ResponseBody
   public String regist(Event event) {
    
	   eventService.regist(event);
     
      return "1";
   }
   
   @RequestMapping(value="/admin/event/list", method=RequestMethod.GET, produces="text/html;charset=utf8")
   @ResponseBody
   public String selectAll() {
      List<Event> eventList = eventService.selectAll();
      StringBuilder sb = new StringBuilder();
      sb.append("{");
      sb.append("\"eventList\":[");
      for(int i=0; i<eventList.size();i++) {
         Event event = eventList.get(i);
         sb.append("{");
         sb.append("\"event_idx\":"+event.getEvent_idx()+",");
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
   
   @RequestMapping(value="/event/del", method=RequestMethod.GET)
   @ResponseBody
   public String delete(@RequestParam("event_idx") int event_idx) {
      eventService.delete(event_idx);
      return "1";
   }
   
	//기존 상품을 기획상품으로 등록요청 처리 
	@RequestMapping(value="admin/eventproduct/regist", method=RequestMethod.POST)
	public ModelAndView registEventProduct(EventProduct eventProduct, int[] product_idx) {
		System.out.println(eventProduct.getEvent().getEvent_idx());
		for(int i=0;i<product_idx.length;i++) {
			
			Product product = new Product();
			product.setProduct_idx(product_idx[i]);
			eventProduct.setProduct(product);
			eventService.registEventProduct(eventProduct);
		}
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("url", "/admin/product/list");
		mav.addObject("msg", "이벤트 상품 등록 성공");
		mav.setViewName("view/message");
		
		return mav;
	}
	
	/* 기획상품 관련 */
	@RequestMapping(value="/event/list", method=RequestMethod.GET)
	public String getEventList(HttpServletRequest request, Model model) {
		//어떤 기획이벤트가 있는 목록 가져오자
		
		List<Event> eventList = productService.getEvenetList();
		
		Map<String, List> listMap = new HashMap<String, List>();
		Map<String, String> titleMap = new HashMap<String, String>();
		
		for(int i=0;i<eventList.size();i++) {
			Event event=eventList.get(i);
			System.out.println(event.getTitle()+":"+event.getEvent_idx());
			
			//현재 이벤트에 등록된 상품목록 가져오기!!
			List eventProductList=eventService.selectJoinByEventId(event.getEvent_idx());
			listMap.put("eventProductList"+i, eventProductList);
			titleMap.put("title"+i, event.getTitle());
		}
		model.addAttribute("listMap", listMap);
		model.addAttribute("titleMap", titleMap);
		
		return "event/list";
	}
	
	/* 기획상품 관리 */
	@RequestMapping(value="/admin/event/eplist", method=RequestMethod.GET)
	public String getEventListAdmin() {
		
		return "admin/event/eplist";
	}
   
	@ExceptionHandler({FileException.class, DMLException.class})
	public ModelAndView handle(FileException e, DMLException e2) {
		ModelAndView mav = new ModelAndView();
		
		//파일 업로드 에러인 경우
		if(e !=null) {
			mav.addObject("e", e);//에러 객체 자체를 담는다!!
			mav.addObject("msg", e.getMessage());//에러 객체 자체를 담는다!!
		}else if(e2 !=null) {
			mav.addObject("e", e2);//에러 객체 자체를 담는다!!
			mav.addObject("msg", e2.getMessage());//에러 객체 자체를 담는다!!
		}
		//입력 에러엔 경우 
		mav.setViewName("view/error");
		return mav;
	}
}