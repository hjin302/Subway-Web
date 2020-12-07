package com.shop.controller.event;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.controller.common.Pager;
import com.shop.domain.Product;
import com.shop.model.product.ProductService;

@Controller
public class EventProductController {
	@Inject
	private ProductService productService;
	
	@Inject
	private Pager pager;
	
	@RequestMapping(value="/event/eventDetail", method=RequestMethod.GET)
	public String select(Model model,@RequestParam int product_idx) {
	    Product product=productService.select(product_idx);
	    model.addAttribute("product", product);
	    return "event/eventDetail";
	}
}
