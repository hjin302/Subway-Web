package com.shop.controller.notice;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.shop.controller.common.Pager;
import com.shop.domain.Member;
import com.shop.domain.Notice;
import com.shop.model.notice.NoticeService;

@Controller
public class UserNoticeController {
   @Inject
   private NoticeService noticeService;
   
   @Inject
   private Pager pager;
   
   @RequestMapping(value="/notice/list", method=RequestMethod.GET)
   public ModelAndView selectAll(HttpServletRequest request) {
      
	  ModelAndView mav = new ModelAndView();
      
      List noticeList = noticeService.selectAll();
      
      //����¡ ó�� ��ü 
      pager.init(noticeList, request);
      mav.addObject("noticeList", noticeList);
      mav.addObject("pager", pager);
      
      mav.setViewName("/notice/index");
      return mav;
   }
   
     @RequestMapping(value="/notice/userdetail", method=RequestMethod.GET)
      public String select(Model model,@RequestParam int notice_idx, HttpServletRequest request) {
         Notice notice=noticeService.select(notice_idx);
         model.addAttribute("notice", notice);
         return "notice/userdetail";
      }
}