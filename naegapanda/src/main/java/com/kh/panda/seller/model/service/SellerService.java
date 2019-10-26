package com.kh.panda.seller.model.service;

import java.util.ArrayList;

import com.kh.panda.common.PageInfo;
import com.kh.panda.product.model.vo.Category;
import com.kh.panda.product.model.vo.Product;
import com.kh.panda.product.model.vo.ProductAttachment;
import com.kh.panda.product.model.vo.ProductOption;
import com.kh.panda.seller.model.vo.Seller;

public interface SellerService {
	
	// 1. 판매자 회원가입 
	int insertSeller(Seller s);

	// 2. 판매자 로그인
	Seller loginSeller(Seller s);
	
	// 3. 아이디 중복체크
	int sIdCheck(String sId);

	// 4. 아이디찾기
	String findsId(String sEmail);

	// 5. 회원정보변경
	int updateSeller(Seller s);

	int getListCount(int sNo);

	ArrayList<ProductOption> selectList(PageInfo pi, int sNo);
	// 6. 회원탈퇴
	int deleteSeller(Seller s);

	// 7.
	ArrayList<Category> selectcList();
	
	
	// 이메일도전
	int emailConfirm(String sId);
	
	// 정보수정 전 재로그인
	Seller updateConfirm(Seller s);

	int insertProduct(Product p, ArrayList<ProductAttachment> paList, ArrayList<ProductOption> poList);

	Product selectProduct(int getpId);

	ArrayList<ProductAttachment> selectPa(Product p);

	ArrayList<ProductOption> selectPo(Product p);

	
	
	
	
	
	

}
