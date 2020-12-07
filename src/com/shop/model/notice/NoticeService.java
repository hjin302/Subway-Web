package com.shop.model.notice;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.shop.domain.AddStore;
import com.shop.domain.Member;
import com.shop.domain.Notice;
import com.shop.domain.Product;
import com.shop.exception.DMLException;
import com.shop.exception.DataNotFoundException;
import com.shop.exception.FileException;
import com.shop.model.common.file.FileManager;
import com.shop.model.member.AddStoreDAO;
import com.shop.model.member.MemberDAO;

@Service
public class NoticeService {

   @Inject
   private NoticeDAO noticeDAO;
   
   public void noticeInsert(Notice notice) throws DMLException{   
      noticeDAO.insert(notice);
   }
   
   public List selectAll() {
      return noticeDAO.selectAll();
   }
   
   
   public Notice select(int notice_idx) {
      return noticeDAO.select(notice_idx);
   }
   
   public void delete(int notice_idx) throws DMLException{
      noticeDAO.delete(notice_idx);
   }
   
   public void update(Notice notice) {
	   noticeDAO.update(notice);
   }
	   
}
