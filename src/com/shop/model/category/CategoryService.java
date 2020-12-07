package com.shop.model.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.domain.Category;
import com.shop.exception.DMLException;

@Service
public class CategoryService {
   @Autowired
   private CategoryDAO categoryDAO;
   
   public void regist(Category category) throws RuntimeException{
      categoryDAO.insert(category);
   }
   public List selectAll() {
      return categoryDAO.selectAll();
   }
   public void delete(int category_idx) throws DMLException{
      categoryDAO.delete(category_idx);
   }
}







