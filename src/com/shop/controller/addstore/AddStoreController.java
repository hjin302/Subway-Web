package com.shop.controller.addstore;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.shop.domain.AddStore;
import com.shop.domain.Member;
import com.shop.model.member.MemberService;

@Controller
public class AddStoreController {
	 @Inject
	  private JavaMailSender mailSender;
	 
	 @Inject
	 private MemberService memberService;
	 
	  // 메일 전송
	  @RequestMapping(value = "/mail/mailSending")
	  public String mailSending(Model model, HttpServletRequest request) {
	    //, @RequestParam(value = "add_store_idx", required = false) Integer add_store_idx
	    String setfrom = "enro302@naver.com";         
	    String tomail  = request.getParameter("tomail");     // 받는 사람 이메일
	    String totitle   = request.getParameter("totitle");      // 제목
	    String tocontent = request.getParameter("tocontent");    // 내용
	   
	    try {
	    	MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
					true, "UTF-8");
	 
	      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
	      messageHelper.setTo(tomail);     // 받는사람 이메일
	      messageHelper.setSubject(totitle); // 메일제목은 생략이 가능하다
	      messageHelper.setText(tocontent);  // 메일 내용
	     
	      mailSender.send(message);
	    } catch(Exception e){
	      System.out.println(e);
	    }
	   
	    
		model.addAttribute("url", "/admin/addStore/list");
		model.addAttribute("msg", "메일 전송 성공");
		return "view/message";
	   
	  }
	  
	  
	  
	  @RequestMapping(value= "/addStore/list", method=RequestMethod.GET)
		public String adminMain(HttpServletRequest request) {
			return "member/addStore/index";
		}
		
		@RequestMapping(value="/addStore/regist", method=RequestMethod.POST)
		public ModelAndView regist(Model model, HttpServletRequest request, AddStore addStore) {
		
			HttpSession session=request.getSession();

			Member member = (Member)session.getAttribute("member");
			addStore.setMember(member);
				
			memberService.addStoreInsert(addStore, member);	
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("url", "/");
			mav.addObject("msg", "등록 성공");
			mav.setViewName("view/message");
			
			return mav;
		}
}
