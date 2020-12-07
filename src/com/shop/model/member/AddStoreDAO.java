package com.shop.model.member;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.shop.domain.AddStore;
import com.shop.domain.Member;
import com.shop.exception.DMLException;

@Repository
public class AddStoreDAO {
	@Inject
	private SqlSessionTemplate sessionTemplate;

	public void insert(AddStore addStore) throws DMLException {
		int result = sessionTemplate.insert("AddStore.insert", addStore);
		if (result == 0) {
			throw new DMLException("가맹점이 신청되지 않았습니다");
		}
	}

	public List selectAll() {
		return sessionTemplate.selectList("AddStore.selectAll");
	}
	

	public AddStore select(int add_store_idx) {
		return sessionTemplate.selectOne("AddStore.select", add_store_idx);
	}
	
	public void delete(int add_store_idx) throws DMLException{
		int result=sessionTemplate.delete("AddStore.delete",add_store_idx);
		if(result==0) {
			throw new DMLException("삭제처리 되지 않았습니다");
		}
	}

}
