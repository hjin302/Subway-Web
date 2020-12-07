package com.shop.controller.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.domain.Category;
import com.shop.exception.DMLException;
import com.shop.model.category.CategoryService;

@Controller
public class CategoryController {
   @Autowired
   private CategoryService categoryService;
   
   @RequestMapping(value="/category/regist", method=RequestMethod.POST)
   @ResponseBody
   public String regist(Category category) {
      System.out.println("입력한 내용은? : "+ category.getName());
      
      categoryService.regist(category);
      
      return "1";
   }
   
   @RequestMapping(value="/category/list", method=RequestMethod.GET, produces="text/html;charset=utf8")
   @ResponseBody
   public String selectAll() {
      List<Category> categoryList = categoryService.selectAll();
      StringBuilder sb = new StringBuilder();
      sb.append("{");
      sb.append("\"categoryList\":[");
      for(int i=0; i<categoryList.size();i++) {
         Category category = categoryList.get(i);
         sb.append("{");
         sb.append("\"category_idx\":"+category.getCategory_idx()+",");
         sb.append("\"name\":\""+category.getName()+"\"");
         if(i<categoryList.size()-1) {
            sb.append("},");
         }else {
            sb.append("}");
         }
      }
      sb.append("]");
      sb.append("}");
      return sb.toString();
   }
   
   @RequestMapping(value="/category/del", method=RequestMethod.GET)
   @ResponseBody
   public String delete(@RequestParam("category_idx") int category_idx) {
      categoryService.delete(category_idx);
      return "1";
   }
   
   @ExceptionHandler(DMLException.class)
   @ResponseBody
   public String handle(DMLException e) {
      System.out.println("?뿉?윭 諛쒓껄");
      return "0";
   }
}