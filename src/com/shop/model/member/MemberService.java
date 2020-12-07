package com.shop.model.member;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.domain.AddStore;
import com.shop.domain.Member;
import com.shop.exception.DMLException;
import com.shop.exception.DataNotFoundException;

@Service
public class MemberService {

	@Inject
	private AddStoreDAO addStoreDAO;

	@Inject
	private MemberDAO memberDAO;
	
   
   public void memberInsert(Member member) throws DMLException{   
	   memberDAO.insert(member);
   }
   
   public void addStoreInsert(AddStore addStore, Member member) throws DMLException{
	   addStore.setMember(member);
	   
	   addStoreDAO.insert(addStore);
	}
   
   public Member loginCheck(Member member) throws DataNotFoundException{
      Member obj = memberDAO.loginCheck(member);
      return obj;
   }
   
	public List selectAll() {
		return addStoreDAO.selectAll();
	}
	
	public AddStore select(int add_store_idx) {
		return addStoreDAO.select(add_store_idx);
	}
	
	public void update(Member member) {
		memberDAO.update(member);
	}
	
	public void delete(int add_store_idx) throws DMLException{
		addStoreDAO.delete(add_store_idx);
	}
   
}