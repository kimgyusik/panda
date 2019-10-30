package com.kh.panda.seller.model.service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.inject.Inject;
import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.panda.common.PageInfo;
import com.kh.panda.member.model.dao.MemberDao;
import com.kh.panda.product.model.vo.Category;
import com.kh.panda.product.model.vo.Product;
import com.kh.panda.product.model.vo.ProductAttachment;
import com.kh.panda.product.model.vo.ProductOption;
import com.kh.panda.seller.model.dao.SellerDao;
import com.kh.panda.seller.model.vo.MailHandler;
import com.kh.panda.seller.model.vo.Seller;
import com.kh.panda.seller.model.vo.TempKey;

@Service("sService")
public class SellerServiceImpl implements SellerService{
	
	@Inject
    private JavaMailSender mailSender;
	
	@Autowired
	private SellerDao sDao;
	
	@Autowired
	private MemberDao mDao;

	@Override
	public int insertSeller(Seller s) {
		
		return sDao.insertSeller(s);
	}

	@Override
	public Seller loginSeller(Seller s) {
		
		return sDao.loginSeller(s);
	}

	@Override
	public int sIdCheck(String sId) {
		return sDao.sIdCheck(sId);
	}

	@Override
	public String findsId(String sEmail) {
		return sDao.findsId(sEmail);
	}

	@Override
	public int updateSeller(Seller s) {
		return sDao.updateSeller(s);
	}

	@Override
	public int getListCount(int sNo) {
		
		return sDao.getListCount(sNo);
	}

	@Override
	public ArrayList<ProductOption> selectList(PageInfo pi, int sNo) {
		return sDao.selectList(pi, sNo);
	}
	
	@Override
	public int deleteSeller(Seller s) {
		return sDao.deleteSeller(s);
	}

	@Override
	public ArrayList<Category> selectcList() {
		return sDao.selectcList();
	}

	/*
	 * @Transactional
	 * 
	 * @Override public void create(Seller s) throws Exception {
	 * sDao.insertSeller(s); // 회원가입 DAO
	 * 
	 * String key = new TempKey().getKey(50, false); // 인증키 생성
	 * 
	 * sDao.createAuthKey(s.getsEmail(), key); // 인증키 DB저장
	 * 
	 * MailHandler sendMail = new MailHandler(mailSender);
	 * sendMail.setSubject("[PANDA 서비스 이메일 인증]"); sendMail.setText( new
	 * StringBuffer().append("<h1>메일인증</h1>").
	 * append("<a href='http://localhost/user/emailConfirm?user_email=").append(s.
	 * getsEmail()).append("&key=").append(key).
	 * append("' target='_blenk'>이메일 인증 확인</a>").toString());
	 * sendMail.setFrom("호스트 이메일 아이디", "우루루까꿍"); sendMail.setTo(s.getsEmail());
	 * sendMail.send(); }
	 */
//
//	@Override
//	public void sellerAuth(String sEmail) throws Exception {
//		
//		sDao.sellerAuth(sEmail);
//		
//	}

	@Override
	public int emailConfirm(String sId) {
		
		return sDao.emailConfirm(sId);
		
	}

	@Override
	public int insertProduct(Product p, ArrayList<ProductAttachment> paList, ArrayList<ProductOption> poList) {
		int result1 = sDao.insertProduct(p);
		int result2 = 0;
		int result3 = 0;
		int result = 0;
		
		for(int i=0; i<paList.size(); i++) {
			result2 = sDao.insertPaList(paList.get(i));
			if(result2 <1) {
				break;
			}
		}
		
		for(int i=0; i<poList.size(); i++) {
			result3 = sDao.insertPoList(poList.get(i));
			if(result3<1) {
				break;
			}
		}
		
		if(result1 >0 && result2 > 0 && result3 > 0) {
			result = 1;
		}
		
		return result;
	}
	public Seller updateConfirm(Seller s) {
		return sDao.updateConfirm(s);
	}

	@Override
	public Product selectProduct(int pId) {
		return sDao.selectProduct(pId);
	}

	@Override
	public ArrayList<ProductAttachment> selectPa(Product p) {
		return sDao.selectPa(p);
	}

	@Override
	public ArrayList<ProductOption> selectPo(Product p) {
		return sDao.selectPo(p);
	}
	public int newPaasword(Seller s) {
		return sDao.newPassword(s);
		
	}

	@Override
	public int updateProduct(Product p, ArrayList<ProductAttachment> paList, ArrayList<ProductOption> poList) {
		int result1 = sDao.updateProduct(p);
		int result2 = 1;
		int result3 = 1;
		int result = 1;
		int result4 = 1;
		int result5 = 1;
				
		if(!paList.isEmpty()) {
			result5 = sDao.deletePa(p.getpId());
		}
		for(int i=0; i<paList.size(); i++) {
			result2 = sDao.insertPaList2(paList.get(i));
			if(result2 <1) {
				break;
			}
		}
		result4 = sDao.deleteOption(p.getpId());
		
		for(int i=0; i<poList.size(); i++) {
			
			result3 = sDao.insertPoList2(poList.get(i));
			if(result3<1) {
				break;
			}
		}
		
		if(result1 >0 && result2 > 0 && result3 > 0 && result4 > 0 && result5 > 0) {
			result = 1;
		}
		
		return result;
	}

	
		
		
		
		
		
	

	


	
	


}
