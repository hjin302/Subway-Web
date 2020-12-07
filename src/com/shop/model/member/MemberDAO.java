package com.shop.model.member;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shop.domain.AddStore;
import com.shop.domain.Member;
import com.shop.exception.DMLException;
import com.shop.exception.DataNotFoundException;


@Repository
public class MemberDAO {
   @Inject
   private SqlSessionTemplate sessionTemplate;
   
   public void insert(Member member) throws DMLException{
      int result = sessionTemplate.insert("Member.insert", member);
      if(result==0) {
         throw new DMLException("회원가입에 실패하였습니다. 관리자에게 문의하세요");
      }
      
   }
   
   public Member loginCheck(Member member) throws DataNotFoundException{
      Member obj = sessionTemplate.selectOne("Member.loginCheck", member);
      if(obj == null) {//회원이 없을 경우, 비즈니스적 에러상황으로 보자!!
         throw new DataNotFoundException("로그인 정보가 올바르지 않습니다.");
         
      }
      
      return obj;
   }
   
   public void update(Member member) {
	     sessionTemplate.update("Member.update", member);
   }
   
}