package com.shop.model.category;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shop.domain.Category;
import com.shop.exception.DMLException;

@Repository
public class CategoryDAO {
   @Autowired
   private SqlSessionTemplate sessionTemplate;
   
   public void insert(Category category) throws RuntimeException{
      int result=sessionTemplate.insert("Category.insert", category);
      //result=0;
      if(result!=1) {
         throw new DMLException("등록 성공");
      }
   }
   
   public List selectAll() {
      List list=null;
      list=sessionTemplate.selectList("Category.selectAll");
      return list;
   }
   
   public void delete(int category_idx) throws DMLException{
      
      int result=sessionTemplate.delete("Category.delete", category_idx);
      
      if(result==0) {
         throw new DMLException("삭제 성공");
      }
      
   } 
   
}









