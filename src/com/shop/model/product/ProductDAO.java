package com.shop.model.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shop.domain.Product;
import com.shop.exception.DMLException;

@Repository
public class ProductDAO {
   @Autowired
   private SqlSessionTemplate sessionTemplate;
   
   public void insert(Product product) throws DMLException{
      int result=sessionTemplate.insert("Product.insert", product);
      if(result==0) {
         throw new DMLException(" 긽 뭹 씠  벑濡앸릺吏   븡 븯 뒿 땲 떎");
      }
   }
   

   public List selectAll() {
      return sessionTemplate.selectList("Product.All");
   }
   
   
   public List selectAllJoin() {
      return sessionTemplate.selectList("EventProduct.selectJoin");
   }
   
   
   public Product select(int product_idx) {
      return sessionTemplate.selectOne("Product.byId", product_idx);
   }
   
   public void delete(int product_idx) throws DMLException{
      int result=sessionTemplate.delete("Product.delete",product_idx);
      if(result==0) {
         throw new DMLException(" 긽 뭹 씠  궘 젣泥섎━  릺吏   븡 븯 뒿 땲 떎");
      }
   }
   public void update(Product product) {
      int result=sessionTemplate.update("Product.update", product);
      if(result==0) {
         throw new DMLException(" 닔 젙 릺吏   븡 븯 뒿 땲 떎");
      }
   }

}














