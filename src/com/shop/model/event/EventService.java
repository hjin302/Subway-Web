package com.shop.model.event;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shop.domain.EventProduct;
import com.shop.domain.Event;
import com.shop.exception.DMLException;

@Service
public class EventService {
	@Inject
	private EventDAO eventDAO;
	
	@Inject
	private EventProductDAO eventProductDAO;
	
	   public void regist(Event event) throws RuntimeException{
		   eventDAO.insert(event);
	   }
	   
	   public List selectAll() {
		   return eventDAO.selectAll();
	   }
	   public void delete(int event_idx) throws DMLException{
		   eventDAO.delete(event_idx);
	   }
	   
		//이벤트 상품등록 
		public void registEventProduct(EventProduct eventProduct) throws DMLException{
			eventProductDAO.insert(eventProduct);
		}
		
		public List selectJoinByEventId(int event_idx) {
			return eventProductDAO.selectJoinByEventId(event_idx);
		}
}
