package com.shop.controller.member;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shop.controller.common.Pager;
import com.shop.domain.AddStore;
import com.shop.domain.Member;
import com.shop.exception.DMLException;
import com.shop.exception.DataNotFoundException;
import com.shop.model.member.MemberService;
import com.shop.model.order.OrderService;

@Controller
public class MemberController {
	@Inject
	private MemberService memberService;
	
	@Inject
	private OrderService orderService;
	
	@Inject Pager pager;

	
	
	
	@RequestMapping(value = "/member/regist", method = RequestMethod.POST)
	public String regist(Model model, Member member, HttpServletRequest request) {

		memberService.memberInsert(member);
		model.addAttribute("msg", "회원가입 성공!");
		model.addAttribute("url", "/");

		return "view/message";
	}

	@RequestMapping(value = "/member/login", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Member loginCheck(Member member, HttpSession session, HttpServletRequest request) {
		Member obj = memberService.loginCheck(member);
		// 로그인 성공시 세션에 멤버정보를 담자
		session.setAttribute("member", obj);

		return obj;
	}
	
	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logout(Model model, HttpSession session, HttpServletRequest httpServletRequest) {
		//세션을 소멸시켜 버린다
		session.invalidate(); //현재 클라이언트와 관련된 세션을 무효화시킴!
		//주의) 객체를소멸하는 건 아니다. 자바에서는 객체를 죽일 수는 없으니깐
		model.addAttribute("msg", "로그아웃 처리되었습니다.");
		model.addAttribute("url", "/");
		return "view/message";
	}
	
	
	@RequestMapping(value="/member/edit", method= RequestMethod.POST)
	   public String update(Model model,Member member, HttpServletRequest request) {
	      memberService.update(member);
	      
	      
	      model.addAttribute("url", "/member/logout");
	      model.addAttribute("msg", "변경 성공, 다시 로그인 해주세요");
	      return "view/message";

	   }
	
	
	@ExceptionHandler(DataNotFoundException.class)
	@ResponseBody
	public String handle(DataNotFoundException e) {
		System.out.println("로그인 실패 메서드 수행");
		StringBuilder msg = new StringBuilder();
		msg.append("{");
		msg.append("\"code\":0,");
		msg.append("\"msg\":\""+e.getMessage()+"\"");
		msg.append("}");
		return msg.toString();
	}
	

	@ExceptionHandler({DMLException.class})
	public ModelAndView handle(DMLException e) {
		ModelAndView mav = new ModelAndView();

		// 파일 업로드 에러인 경우
		if (e != null) {
			mav.addObject("e", e);// 에러 객체 자체를 담는다!!
			mav.addObject("msg", e.getMessage());// 에러 객체 자체를 담는다!!
		}
		// 입력 에러엔 경우
		mav.setViewName("view/error");
		return mav;
	}

}