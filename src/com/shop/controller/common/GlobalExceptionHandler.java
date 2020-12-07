package com.shop.controller.common;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.shop.exception.AdminAuthException;
import com.shop.exception.MemberAuthException;


@ControllerAdvice
public class GlobalExceptionHandler {
	
	@ExceptionHandler(MemberAuthException.class)
	public String handleException(MemberAuthException e, Model model) {
		System.out.println("발생한 예외의 메시지 : "+e.getMessage());
		
		model.addAttribute("url", "/member/login.jsp");
		model.addAttribute("msg", e.getMessage());
		
		return "view/message";
	}
	
	@ExceptionHandler(AdminAuthException.class)
	public String handleException(AdminAuthException e, Model model) {
		System.out.println("발생한 예외의 메시지 : "+e.getMessage());
		
		model.addAttribute("url", "/admin/login.jsp");
		model.addAttribute("msg", e.getMessage());
		
		return "view/message";
	}
}
