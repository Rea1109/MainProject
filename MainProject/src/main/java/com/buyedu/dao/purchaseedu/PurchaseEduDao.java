package com.buyedu.dao.purchaseedu;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.buyedu.domain.PurchaseEdu;
import com.buyedu.domain.Search;

@Mapper
public interface PurchaseEduDao {
	
	int addPurchaseEdu(PurchaseEdu purchase) throws Exception;
	
	PurchaseEdu getPurchaseEdu(String purchaseUid) throws Exception;
	
	int updatePurchaseEdu(PurchaseEdu purchaseEdu) throws Exception;
	
	List<PurchaseEdu> getPurchaseEduList(Search search);
	
	List<PurchaseEdu> getPurchaseAcademyList(Search search);

	int getPurchaseEduTotalCount(Search search);
	
	int getPurchaseAcademyTotalCount(Search search);
	
	int getPayNo(int userNo);
	
	int deletePurchaseEdu(PurchaseEdu purchaseEdu);
	
}