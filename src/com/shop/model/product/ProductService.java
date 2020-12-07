package com.shop.model.product;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.shop.domain.Event;
import com.shop.domain.EventProduct;
import com.shop.domain.Product;
import com.shop.exception.DMLException;
import com.shop.exception.FileException;
import com.shop.model.common.file.FileManager;
import com.shop.model.event.EventDAO;
import com.shop.model.event.EventProductDAO;

@Service
public class ProductService {
   @Autowired
   private ProductDAO productDAO;
   
   @Autowired
   private FileManager fileManager;
   
   @Inject
   private EventProductDAO eventProductDAO;
   
   @Inject
   private EventDAO eventDAO;
   
   
   public void regist(Product product,MultipartFile myFile, String realPath) throws DMLException, FileException{
      String filename=FileManager.saveFile(myFile, realPath);
      product.setFilename(filename);
      productDAO.insert(product);
   }
   
   public List selectAll() {
      return productDAO.selectAll();
   }
   
   
   public List selectAllJoin() {
      return productDAO.selectAllJoin();
   }
   
   
   public Product select(int product_idx) {
      return productDAO.select(product_idx);
   }
   public void delete(int product_idx) throws DMLException{
      productDAO.delete(product_idx);
   }
   public void update(Product product,String realPath) throws DMLException, FileException{
      MultipartFile multi=product.getMyFile();
      System.out.println("multi is "+multi.isEmpty());
      
      if(multi.isEmpty()) {// 뾽濡쒕뱶瑜   븞 븷 寃쎌슦 뒗 DB留   뾽 뜲 씠 듃 
         productDAO.update(product);
      }else {// 뾽濡쒕뱶 븷 寃쎌슦 뿏 DB +  뙆 씪 룄 泥섎━
         //湲곗〈  뙆 씪    궘 젣 븯 옄!!
         FileManager.removeFile(realPath+product.getFilename());
         
         String filename=FileManager.saveFile(multi, realPath);
         product.setFilename(filename);
         productDAO.update(product);
         
      }
   }
   
 	
 	//이벤트 목록 
 	public List getEvenetList() {
 		return eventDAO.selectAll();
 	}
   

}

