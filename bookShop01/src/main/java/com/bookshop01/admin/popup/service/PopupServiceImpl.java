package com.bookshop01.admin.popup.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bookshop01.admin.popup.dao.PopupDao;
import com.bookshop01.admin.popup.vo.PopupBean;



@Service("PopupService")
@Transactional(propagation=Propagation.REQUIRED)
public class PopupServiceImpl  implements PopupService {
	@Autowired
	PopupDao popupDao;
	
	public void addPopup(PopupBean popupBean) throws Exception {
	popupDao.addPopup(popupBean);
	

			
		}
	//v팝업 관련 정보를 조회하는 메서드
	public ArrayList listPopupGoods(HashMap condMap) throws Exception{
			ArrayList popupList=popupDao.listPopupGoods(condMap);
			
			return popupList;
	
	}
	
	public void deletePopup(String goods_id) throws Exception{
		
		popupDao.deletePopup(goods_id);
	}
	
	
}
