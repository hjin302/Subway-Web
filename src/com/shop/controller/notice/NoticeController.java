package com.shop.controller.notice;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.shop.controller.common.Pager;
import com.shop.domain.AddStore;
import com.shop.domain.Member;
import com.shop.domain.Notice;
import com.shop.domain.Product;
import com.shop.model.common.file.FileManager;
import com.shop.model.member.MemberService;
import com.shop.model.notice.NoticeService;

@Controller
public class NoticeController {
   
   @Inject
   private NoticeService noticeService;
   
   @Inject Pager pager;
   
   
   @RequestMapping(value="/admin/notice/list", method=RequestMethod.GET)
   public ModelAndView selectAll(HttpServletRequest request) {
      ModelAndView mav = new ModelAndView();
      
      List noticeList = noticeService.selectAll();
      //페이징 처리 객체 
      pager.init(noticeList, request);
      mav.addObject("noticeList", noticeList);
      mav.addObject("pager", pager);
      
      mav.setViewName("admin/notice/list");
      return mav;
   }
   
   @RequestMapping(value = "/admin/notice/registForm", method = RequestMethod.GET)
   public String registForm() {

      return "admin/notice/registForm";
   }
   
   @RequestMapping(value="/notice/regist", method=RequestMethod.POST)
   public ModelAndView regist(Model model, HttpServletRequest request, Notice notice) {
         
      noticeService.noticeInsert(notice);   
      
      ModelAndView mav = new ModelAndView();
      mav.addObject("url", "/admin/notice/list");
      mav.addObject("msg", "등록 성공");
      mav.setViewName("view/message");
      
      return mav;
   }
   
   
   @RequestMapping(value="/admin/notice/detail", method=RequestMethod.GET)
      public String select(Model model,@RequestParam int notice_idx) {
         Notice notice=noticeService.select(notice_idx);
         model.addAttribute("notice", notice);
         return "admin/notice/detail";
      }
   
   @RequestMapping(value="/admin/notice/delete", method= {RequestMethod.GET, RequestMethod.POST})
   public String delete(HttpServletRequest request, Model model,@RequestParam int notice_idx) {
      
      noticeService.delete(notice_idx);
      
      model.addAttribute("url", "/admin/notice/list");
      model.addAttribute("msg", "삭제 성공");
      return "view/message";
   }
   
   @RequestMapping(value="/admin/notice/edit", method= RequestMethod.POST)
   public String update(Model model,Notice notice, HttpServletRequest request) {
      noticeService.update(notice);
      
      model.addAttribute("url", "/admin/notice/list");
      model.addAttribute("msg", "수정 성공");
      return "view/message";

   }
   
}