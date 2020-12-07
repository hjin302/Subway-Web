package com.shop.model.notice;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.shop.domain.AddStore;
import com.shop.domain.Notice;
import com.shop.domain.Product;
import com.shop.exception.DMLException;

@Repository
public class NoticeDAO {
   @Inject
   private SqlSessionTemplate sessionTemplate;

   public void insert(Notice notice) throws DMLException {
      int result = sessionTemplate.insert("Notice.insert", notice);
      if (result == 0) {
         throw new DMLException("등록 실패");
      }
   }

   public List selectAll() {
      return sessionTemplate.selectList("Notice.selectAll");
   }
   

   public Notice select(int notice_idx) {
      return sessionTemplate.selectOne("Notice.select", notice_idx);
   }
   
   public void delete(int notice_idx) throws DMLException{
      int result=sessionTemplate.delete("Notice.delete",notice_idx);
      if(result==0) {
         throw new DMLException("삭제 실패");
      }
   }
   
   public void update(Notice notice) {
	   sessionTemplate.update("Notice.update", notice);
   }
}