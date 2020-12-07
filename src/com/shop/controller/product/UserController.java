package com.shop.controller.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shop.controller.common.Pager;
import com.shop.domain.Category;
import com.shop.model.category.CategoryService;
import com.shop.model.product.ProductService;


//유저페이지 상품 컨트롤러
@Controller
public class UserController {
   @Autowired
   private ProductService productService;
   
     @Autowired
   private Pager pager;

 	@RequestMapping(value="/member/product/list", method=RequestMethod.GET)
	   public ModelAndView selectAll(HttpServletRequest request) {
	      ModelAndView mav = new ModelAndView();
	      
	      List productList = productService.selectAll();
	      pager.init(productList, request);
	      mav.addObject("productList", productList);
	      mav.addObject("pager", pager);
	      
	      mav.setViewName("member/product/index");
	      return mav;
	   }
   
   @RequestMapping(value="/", method=RequestMethod.GET)
   public String mainSelectAll(HttpServletRequest request,Model model) {
      
	   List productList = productService.selectAll();
	   model.addAttribute("productList", productList);

      return "main";
   }

}