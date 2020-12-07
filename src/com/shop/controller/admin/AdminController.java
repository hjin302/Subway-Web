package com.shop.controller.admin;

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
import com.shop.domain.AddStore;
import com.shop.domain.Admin;
import com.shop.model.admin.AdminService;
import com.shop.model.member.MemberService;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private MemberService memberService;
	
	@Inject Pager pager;
	
	//관리자모드 메인 페이지를 요청하면...
	@RequestMapping(value= "/admin", method=RequestMethod.GET)
	public String adminMain(HttpServletRequest request) {
		return "admin/main";
	}
	
	@RequestMapping(value="/admin/login", method=RequestMethod.POST)
	public ModelAndView loginCheck(Admin admin, HttpServletRequest request) {
		Admin result=adminService.loginCheck(admin);
		
		//로그인 인증을 성공한 사람은, 브라우저를 닫을때까지 데이터를 유지할 수 있는
		//효과를 부여해줘야 한다...HttpSession 내장객체는 session
		ModelAndView mav = new ModelAndView();
		if(result!=null) {
			System.out.println("결과 id : "+result.getId());
			HttpSession session=request.getSession();
			session.setAttribute("admin", result);//회원 정보 저장!!!
			//관리자 모드 메인 페이지 보여줌
			mav.setViewName("admin/main");
		}else {
			//욕 페이지 보여줌
			mav.setViewName("view/error");
			mav.addObject("msg", "로그인 정보가 올바르지 않습니다");
		}
		
		return mav;
	}
	
	@RequestMapping(value="/admin/addStore/list", method=RequestMethod.GET)
	public ModelAndView selectAll(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		List storeList = memberService.selectAll();
		
		//페이징 처리 객체 
		pager.init(storeList, request);
		mav.addObject("storeList", storeList);
		mav.addObject("pager", pager);
		
		mav.setViewName("admin/addStore/index");
		return mav;
	}
	
	//상세보기 요청 
	@RequestMapping(value="/admin/addStore/detail", method=RequestMethod.GET)
	public String select(Model model,@RequestParam int add_store_idx, HttpServletRequest request) {
		AddStore addStore=memberService.select(add_store_idx);
		model.addAttribute("addStore", addStore);
		return "admin/addStore/detail";
	}
	
	//상세보기 요청 
		@RequestMapping(value="/admin/addStore/reply", method=RequestMethod.GET)
		public String reply(Model model,@RequestParam int add_store_idx, HttpServletRequest request) {
			AddStore addStore=memberService.select(add_store_idx);
			model.addAttribute("addStore", addStore);
			return "admin/addStore/reply";
		}
	
	//삭제 요청
	@RequestMapping(value="/admin/addStore/delete", method= {RequestMethod.GET, RequestMethod.POST})
	public String delete(Model model,@RequestParam int add_store_idx, HttpServletRequest request) {
		System.out.println("이거 출력 되나...? " + add_store_idx);
		memberService.delete(add_store_idx);
		
		model.addAttribute("url", "/admin/addStore/list");
		model.addAttribute("msg", "삭제 성공");
		return "view/message";
	}
	
	
}










